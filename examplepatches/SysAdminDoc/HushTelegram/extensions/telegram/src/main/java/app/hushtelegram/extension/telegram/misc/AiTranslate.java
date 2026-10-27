/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.concurrent.ScheduledFuture;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import app.hushtelegram.extension.shared.L10n;

/**
 * An AI service with the person's own key, in place of Google's web translate. Any service that
 * takes OpenAI's chat completions format works: OpenAI, OpenRouter, DeepSeek, Groq, Google's
 * Gemini through its OpenAI address, or a model server running on the phone.
 *
 * <p>The address, model, key and the person's own instructions are kept by {@link OutsideTranslate} in its own preferences file,
 * beside the chats that are on, so they never reach a settings file, the diagnostic report or a
 * log. A failure carries only the service's HTTP status, because a service's error text can repeat
 * part of the key.
 *
 * <p>The fetch blocks, so it runs on a worker thread only.
 */
public final class AiTranslate {
    private AiTranslate() {}

    static final String DEFAULT_ADDRESS = "https://api.openai.com/v1";
    static final String DEFAULT_MODEL = "gpt-4o-mini";
    /** What the model answers for a message already in the target language. */
    static final String SAME = "[[SAME]]";
    static final int MAX_FIELD = 512;
    /** The most the person's own instructions may hold. */
    static final int MAX_STYLE = 1000;
    static final int CONNECT_MS = 8000;
    /** A model takes longer than Google to answer, more so on a long message. */
    static final int READ_MS = 45000;
    /** The most a whole request may take, past which its connection is closed. Tests shorten it. */
    static long totalMs = 90_000L;
    private static final int MAX_ANSWER = 512 * 1024;
    private static final Pattern THINKING = Pattern.compile("(?s)^\\s*<think>.*?</think>\\s*");

    /** The service as saved. An empty key means Google's web translate is used instead. */
    public static final class Service {
        static final Service GOOGLE = new Service(DEFAULT_ADDRESS, DEFAULT_MODEL, "", "");

        public final String address;
        public final String model;
        /** Shown only in the editor's masked field. */
        public final String key;
        /** The person's own words on how to translate, sent after ours. Empty for none. */
        public final String style;

        Service(String address, String model, String key) {
            this(address, model, key, "");
        }

        Service(String address, String model, String key, String style) {
            this.address = address;
            this.model = model;
            this.key = key;
            this.style = style == null ? "" : style;
        }

        public boolean enabled() {
            return !key.isEmpty();
        }

        /** The service's host name, for the settings row. Never the key. */
        public String host() {
            try {
                String host = new URI(address).getHost();
                return host != null ? host : address;
            } catch (URISyntaxException unreadable) {
                return address;
            }
        }
    }

    /** The service turned the key down (401 or 403), so the toast can say that instead of "not available". */
    static final class KeyRefused extends IOException {
        KeyRefused(int code) {
            super("AI service refused the key: " + code);
        }
    }

    /**
     * Why a typed service can't be saved, or null when it can. The key and the model can't hold
     * spaces, and a key only travels over https, apart from a model server on the phone itself.
     */
    @Nullable
    public static String refusal(String address, String model, String key) {
        Validation failure = validate(address, model, key);
        return failure == null ? null : failure.message;
    }

    /** A validation error points the editor to the field that needs attention. */
    public static final class Validation {
        public final int field;
        public final String message;
        private Validation(int field, String message) { this.field = field; this.message = message; }
    }

    public static Validation validate(String address, String model, String key) {
        return validate(address, model, key, "");
    }

    /** As above, with the person's own instructions as the fourth field. They may hold spaces and lines. */
    public static Validation validate(String address, String model, String key, String style) {
        String a = address.trim(), m = model.trim(), k = key.trim();
        if (k.isEmpty()) return new Validation(2, L10n.t("Type your API key, or tap Use Google."));
        if (m.isEmpty()) return new Validation(1, L10n.t("Type a model name."));
        String[] values = {a, m, k};
        for (int field = 0; field < values.length; field++) {
            if (values[field].length() > MAX_FIELD) {
                return new Validation(field, L10n.f("This field is too long. Use %1$d characters or fewer.", MAX_FIELD));
            }
            if (hasSpace(values[field])) {
                return new Validation(field, L10n.t("Take the spaces out of the address, model and key."));
            }
        }
        URI uri;
        try {
            uri = new URI(a);
        } catch (URISyntaxException unreadable) {
            return new Validation(0, L10n.t("The address has to start with https://."));
        }
        String scheme = uri.getScheme() == null ? "" : uri.getScheme().toLowerCase(Locale.ROOT);
        String host = uri.getHost() == null ? "" : uri.getHost().toLowerCase(Locale.ROOT);
        boolean onPhone = host.equals("localhost") || host.equals("127.0.0.1");
        if (host.isEmpty() || !(scheme.equals("https") || (scheme.equals("http") && onPhone))) {
            return new Validation(0, L10n.t("The address has to start with https://."));
        }
        if (style != null && style.trim().length() > MAX_STYLE) {
            return new Validation(3, L10n.f("This field is too long. Use %1$d characters or fewer.", MAX_STYLE));
        }
        return null;
    }

    private static boolean hasSpace(String value) {
        for (int i = 0; i < value.length(); i++) if (Character.isWhitespace(value.charAt(i))) return true;
        return false;
    }

    /** The chat completions address: the service's base address, or the full one if that's what was typed. */
    static String endpoint(String address) {
        String base = address.trim();
        while (base.endsWith("/")) base = base.substring(0, base.length() - 1);
        return base.endsWith("/chat/completions") ? base : base + "/chat/completions";
    }

    /** The target language in words, with its code, since a model reads "German (de)" better than "de". */
    static String languageName(String tag) {
        String name = Locale.forLanguageTag(tag).getDisplayLanguage(Locale.ENGLISH);
        // Google's name stands in for one the phone doesn't know, like Krio or Mizo.
        if (name.isEmpty() || name.equalsIgnoreCase(tag)) name = TranslateTarget.englishName(tag);
        return name == null ? tag : name + " (" + tag + ")";
    }

    static String instructions(String target) {
        return "You translate Telegram messages. Translate the user's message into " + languageName(target)
                + ". Keep its meaning, tone, line breaks, emoji, links, @mentions and #hashtags. Answer with the "
                + "translation only, with no notes, quotes or explanation. If the message is already in that "
                + "language, answer with " + SAME + " and nothing else.";
    }

    /**
     * Ours, then the person's own words on how to translate (a tone, a glossary, slang left as it
     * is). Theirs come last so they can shape the translation, and the answer still has to be only
     * the translation, which is all the reader shows.
     */
    static String instructions(String target, String style) {
        String theirs = style == null ? "" : style.trim();
        if (theirs.isEmpty()) return instructions(target);
        return instructions(target) + "\n\nThe person reading asked for this too. Follow it, and still answer with "
                + "the translation only:\n" + theirs;
    }

    static String body(String model, String target, String text) throws JSONException {
        return body(model, target, text, "");
    }

    static String body(String model, String target, String text, String style) throws JSONException {
        JSONArray messages = new JSONArray()
                .put(new JSONObject().put("role", "system").put("content", instructions(target, style)))
                .put(new JSONObject().put("role", "user").put("content", text));
        return new JSONObject()
                .put("model", model)
                .put("temperature", 0)
                .put("messages", messages)
                .toString();
    }

    /**
     * Reads the answer. A message already in the target language comes back as the original, marked
     * as in that language, so it shows untouched. A reasoning model's leading think block is dropped.
     */
    static GoogleTranslate.Result parse(String json, String target, String original) throws JSONException {
        JSONObject message = new JSONObject(json).getJSONArray("choices").getJSONObject(0).getJSONObject("message");
        String text = message.isNull("content") ? "" : message.getString("content");
        text = THINKING.matcher(text).replaceFirst("").trim();
        if (text.isEmpty()) throw new JSONException("no translated text");
        if (text.equals(SAME) || text.equals(original.trim())) return new GoogleTranslate.Result(original, target);
        return new GoogleTranslate.Result(text, "");
    }

    static GoogleTranslate.Result fetch(Service service, String target, String text) throws IOException, JSONException {
        long deadline = GoogleTranslate.deadline(totalMs);
        HttpURLConnection connection = (HttpURLConnection) new URL(endpoint(service.address)).openConnection();
        ScheduledFuture<?> watchdog = GoogleTranslate.closeAt(connection, deadline);
        try {
            connection.setConnectTimeout(CONNECT_MS);
            connection.setReadTimeout(READ_MS);
            // The key and the text go to the address the person typed and nowhere else.
            connection.setInstanceFollowRedirects(false);
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            connection.setRequestProperty("Authorization", "Bearer " + service.key);
            connection.setRequestProperty("User-Agent", "HushTelegram");
            try (OutputStream out = connection.getOutputStream()) {
                out.write(body(service.model, target, text, service.style).getBytes(StandardCharsets.UTF_8));
            }
            int code = connection.getResponseCode();
            if (code == HttpURLConnection.HTTP_UNAUTHORIZED || code == HttpURLConnection.HTTP_FORBIDDEN) throw new KeyRefused(code);
            if (code != HttpURLConnection.HTTP_OK) throw new IOException("AI service answered " + code);
            return parse(GoogleTranslate.read(connection.getInputStream(), MAX_ANSWER, "AI service answer too large", deadline),
                    target, text);
        } finally {
            watchdog.cancel(false);
            connection.disconnect();
        }
    }
}
