package app.yydarlinker.deepseekcaptions;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * Small OpenAI-compatible translation client retained for settings tests and compatibility callers.
 *
 * <p>Runtime subtitle segmentation no longer lives here. Final subtitle pages are planned by
 * the anchored request client; this client only preserves the older one-input/one-output helper
 * contract for code that still needs a plain translation request.</p>
 */
final class DeepSeekApiClient {
    private static final int MAX_RESPONSE_BYTES = 8 * 1024 * 1024;
    private static final int MAX_OUTPUT_TOKENS = 4_096;
    private static final int CONNECT_TIMEOUT_MS = 3_500;
    private static final int READ_TIMEOUT_MS = 15_000;
    private static final long PRIORITY_TIMEOUT_MS = 12_000L;
    private static final long BACKGROUND_TIMEOUT_MS = 18_000L;
    private static final long TEST_TIMEOUT_MS = 20_000L;

    private DeepSeekApiClient() {}

    interface RequestControl {
        boolean isCancelled();
        void onConnection(HttpURLConnection connection);

        /**
         * Called after writing the full request body locally. The provider may already have
         * started work; receipt and billing are not proven. Avoid speculative duplicate POSTs.
         */
        default void onRequestBodySent() {}
        default void onQualityEvidence(JSONObject source, String response, String metadata) {}

    }

    static List<String> translateWindow(
            List<String> source,
            DeepSeekConfig.Snapshot config,
            RequestControl control
    ) throws Exception {
        return translateWindow(
                source,
                Collections.emptyList(),
                Collections.emptyList(),
                config,
                TargetLanguage.SIMPLIFIED_CHINESE,
                control,
                true
        );
    }

    static List<String> translateWindow(
            List<String> source,
            List<String> contextBefore,
            List<String> contextAfter,
            DeepSeekConfig.Snapshot config,
            TargetLanguage targetLanguage,
            RequestControl control
    ) throws Exception {
        return translateWindow(
                source,
                contextBefore,
                contextAfter,
                config,
                targetLanguage,
                control,
                true
        );
    }

    static List<String> translateWindow(
            List<String> source,
            List<String> contextBefore,
            List<String> contextAfter,
            DeepSeekConfig.Snapshot config,
            TargetLanguage targetLanguage,
            RequestControl control,
            boolean priority
    ) throws Exception {
        if (source == null || source.isEmpty()) return new ArrayList<>();
        if (!config.ready()) throw new IllegalStateException("AI 字幕翻译尚未启用或没有 API Key");
        return translateDirect(
                source,
                contextBefore,
                contextAfter,
                config,
                targetLanguage,
                deadlineAfter(priority ? PRIORITY_TIMEOUT_MS : BACKGROUND_TIMEOUT_MS),
                control
        );
    }

    static String test(DeepSeekConfig.Snapshot config) throws Exception {
        List<String> source = Collections.singletonList("This is a connection test for subtitle translation.");
        List<String> result = translateDirect(
                source,
                Collections.emptyList(),
                Collections.emptyList(),
                config,
                TargetLanguage.SIMPLIFIED_CHINESE,
                deadlineAfter(TEST_TIMEOUT_MS),
                null
        );
        return result.isEmpty() ? "" : result.get(0).trim();
    }

    private static List<String> translateDirect(
            List<String> lines,
            List<String> contextBefore,
            List<String> contextAfter,
            DeepSeekConfig.Snapshot config,
            TargetLanguage targetLanguage,
            long deadline,
            RequestControl control
    ) throws Exception {
        TargetLanguage target = targetLanguage == null
                ? TargetLanguage.SIMPLIFIED_CHINESE
                : targetLanguage;
        JSONArray captions = new JSONArray();
        int sourceChars = 0;
        for (String line : lines) {
            String clean = line == null ? "" : line;
            captions.put(clean);
            sourceChars += clean.length();
        }

        JSONObject payload = new JSONObject()
                .put("target_language", target.code)
                .put("captions", captions);
        if (contextBefore != null && !contextBefore.isEmpty()) {
            payload.put("context_before", new JSONArray(contextBefore));
        }
        if (contextAfter != null && !contextAfter.isEmpty()) {
            payload.put("context_after", new JSONArray(contextAfter));
        }

        String systemPrompt =
                "你是专业的 YouTube 字幕翻译器。请结合前后文，把 captions 逐项翻译成自然、准确的" +
                target.promptLabel() + "。不要删减、概括或加入源文没有的内容。" +
                "context_before/context_after 只用于理解，不要作为返回项。" +
                "严格保持 captions 的项目数量与顺序一一对应。翻译要求：" + config.prompt +
                " 只返回合法 JSON：{\"translations\":[\"第一条译文\",\"第二条译文\"]}。" +
                "不要输出 Markdown、编号、注释或额外说明。";

        int outputTokens = Math.max(768, Math.min(
                MAX_OUTPUT_TOKENS,
                sourceChars * 2 + lines.size() * 96 + 320
        ));
        JSONObject request = new JSONObject()
                .put("model", config.model)
                .put("stream", false)
                .put("temperature", 0.1)
                .put("max_tokens", outputTokens)
                .put("response_format", new JSONObject().put("type", "json_object"))
                .put("messages", new JSONArray()
                        .put(new JSONObject().put("role", "system").put("content", systemPrompt))
                        .put(new JSONObject().put("role", "user").put("content", payload.toString())));
        if (isDeepSeekModel(config.model)) {
            request.put("thinking", new JSONObject().put("type", "disabled"));
        }

        boolean thinkingFallback = request.has("thinking");
        Exception last = null;
        for (int attempt = 0; attempt < 2; attempt++) {
            ensureActive(deadline, control);
            try {
                String content = post(config, request, deadline, control);
                return parseTranslations(content, lines.size());
            } catch (IllegalStateException rejected) {
                if (thinkingFallback && unsupportedThinking(rejected)) {
                    thinkingFallback = false;
                    request.remove("thinking");
                    attempt--;
                    continue;
                }
                throw rejected;
            } catch (RetryableException | ResponseAlignmentException retryable) {
                last = retryable;
                if (attempt + 1 < 2 && remainingMillis(deadline) > 700L) Thread.sleep(300L);
            }
        }
        throw last == null ? new IllegalStateException("翻译失败") : last;
    }

    private static List<String> parseTranslations(String content, int count) throws Exception {
        String json = content == null ? "" : content.trim();
        if (json.startsWith("```")) {
            int firstNewline = json.indexOf('\n');
            int lastFence = json.lastIndexOf("```");
            if (firstNewline >= 0 && lastFence > firstNewline) {
                json = json.substring(firstNewline + 1, lastFence).trim();
            }
        }
        final JSONArray values;
        try {
            values = new JSONObject(json).getJSONArray("translations");
        } catch (Throwable malformed) {
            throw new ResponseAlignmentException("API 返回 JSON 无法解析", malformed);
        }
        if (values.length() != count) {
            throw new ResponseAlignmentException("API 返回条数不一致: " + values.length() + "/" + count);
        }
        List<String> result = new ArrayList<>(count);
        for (int i = 0; i < values.length(); i++) {
            Object value = values.get(i);
            String text = value instanceof String
                    ? ((String) value).trim()
                    : value instanceof JSONObject
                    ? ((JSONObject) value).optString("text", "").trim()
                    : "";
            if (text.isEmpty()) throw new ResponseAlignmentException("API 返回了空字幕项: " + i);
            result.add(text);
        }
        return result;
    }

    private static String post(
            DeepSeekConfig.Snapshot config,
            JSONObject request,
            long deadline,
            RequestControl control
    ) throws Exception {
        HttpURLConnection connection = null;
        boolean consumed = false;
        try {
            ensureActive(deadline, control);
            connection = (HttpURLConnection) new URL(completionUrl(config.baseUrl)).openConnection();
            if (control != null) control.onConnection(connection);
            connection.setRequestMethod("POST");
            connection.setConnectTimeout(boundedTimeout(deadline, CONNECT_TIMEOUT_MS));
            connection.setReadTimeout(boundedTimeout(deadline, READ_TIMEOUT_MS));
            connection.setDoOutput(true);
            connection.setUseCaches(false);
            ProviderEndpoint.authenticate(connection,config.baseUrl,config.apiKey);
            connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            connection.setRequestProperty("Accept", "application/json");
            connection.setRequestProperty("Connection", "keep-alive");

            byte[] body = request.toString().getBytes(StandardCharsets.UTF_8);
            connection.setFixedLengthStreamingMode(body.length);
            try (OutputStream output = connection.getOutputStream()) {
                output.write(body);
            }

            ensureActive(deadline, control);
            int status = connection.getResponseCode();
            InputStream stream = status >= 400 ? connection.getErrorStream() : connection.getInputStream();
            String response = stream == null ? "" : new String(
                    readFully(stream, MAX_RESPONSE_BYTES), StandardCharsets.UTF_8
            );
            consumed = true;
            if (status == 408 || status == 409 || status == 425 || status == 429 || status >= 500) {
                throw new RetryableException("API HTTP " + status + ": " + abbreviate(response));
            }
            if (status < 200 || status >= 300) {
                throw new IllegalStateException("API HTTP " + status + ": " + abbreviate(response));
            }

            JSONObject root = new JSONObject(response);
            JSONArray choices = root.optJSONArray("choices");
            if (choices == null || choices.length() == 0) throw new RetryableException("API 返回中没有 choices");
            JSONObject choice = choices.optJSONObject(0);
            String finish = choice == null ? "" : choice.optString("finish_reason", "");
            if ("length".equals(finish)) throw new ResponseAlignmentException("API 输出达到 max_tokens，JSON 被截断");
            if ("insufficient_system_resource".equals(finish)) throw new RetryableException("API 资源不足");
            if ("content_filter".equals(finish)) throw new IllegalStateException("API 内容过滤中止了翻译");
            JSONObject message = choice == null ? null : choice.optJSONObject("message");
            String content = message == null ? "" : message.optString("content", "").trim();
            if (content.isEmpty()) throw new RetryableException("API 返回了空 content");
            return content;
        } catch (SocketTimeoutException timeout) {
            ensureActive(deadline, control);
            throw new RetryableException("API 网络超时", timeout);
        } catch (IOException network) {
            ensureActive(deadline, control);
            throw new RetryableException("API 网络错误: " + abbreviate(network.getMessage()), network);
        } finally {
            if (connection != null && !consumed) connection.disconnect();
            if (control != null) control.onConnection(null);
        }
    }

    static byte[] readFully(InputStream stream, int maxBytes) throws Exception {
        try (InputStream input = stream; ByteArrayOutputStream output = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            int read;
            while ((read = input.read(buffer)) != -1) {
                if (Thread.currentThread().isInterrupted()) throw new InterruptedException();
                if (output.size() + read > maxBytes) throw new IllegalStateException("网络响应过大");
                output.write(buffer, 0, read);
            }
            return output.toByteArray();
        }
    }

    private static long deadlineAfter(long timeoutMs) {
        return System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(timeoutMs);
    }

    private static long remainingMillis(long deadline) {
        long remaining = deadline - System.nanoTime();
        if (remaining <= 0L) return 0L;
        return Math.max(1L, TimeUnit.NANOSECONDS.toMillis(remaining));
    }

    private static int boundedTimeout(long deadline, int max) throws TranslationTimeoutException {
        long remaining = remainingMillis(deadline);
        if (remaining <= 0L) throw new TranslationTimeoutException();
        return (int) Math.max(1L, Math.min((long) max, remaining));
    }

    private static void ensureActive(long deadline, RequestControl control) throws Exception {
        if (Thread.currentThread().isInterrupted()) throw new InterruptedException("字幕翻译已取消");
        if (control != null && control.isCancelled()) throw new InterruptedException("字幕翻译已重新调度");
        if (remainingMillis(deadline) <= 0L) throw new TranslationTimeoutException();
    }

    private static String completionUrl(String configured) {
        return ProviderEndpoint.chat(configured);
    }

    private static boolean isDeepSeekModel(String model) {
        String value = model == null ? "" : model.trim().toLowerCase(java.util.Locale.ROOT);
        return value.contains("deepseek");
    }

    private static boolean unsupportedThinking(Throwable error) {
        String message = error == null || error.getMessage() == null
                ? "" : error.getMessage().toLowerCase(java.util.Locale.ROOT);
        return message.contains("thinking") && (
                message.contains("unknown") || message.contains("unsupported") ||
                message.contains("unrecognized") || message.contains("not permitted") ||
                message.contains("invalid parameter") || message.contains("不支持") ||
                message.contains("未知")
        );
    }

    private static String abbreviate(String value) {
        if (value == null) return "";
        String one = value.replace('\n', ' ').replace('\r', ' ').trim();
        return one.length() <= 300 ? one : one.substring(0, 300);
    }

    private static final class RetryableException extends Exception {
        private static final long serialVersionUID = 1L;
        RetryableException(String message) { super(message); }
        RetryableException(String message, Throwable cause) { super(message, cause); }
    }

    private static final class ResponseAlignmentException extends Exception {
        private static final long serialVersionUID = 1L;
        ResponseAlignmentException(String message) { super(message); }
        ResponseAlignmentException(String message, Throwable cause) { super(message, cause); }
    }

    private static final class TranslationTimeoutException extends Exception {
        private static final long serialVersionUID = 1L;
        TranslationTimeoutException() { super("AI 字幕请求超时"); }
    }
}
