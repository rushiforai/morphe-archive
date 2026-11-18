package app.medium.extension;

import android.util.Log;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MediumTranslator {
    private static final String TAG = "MediumTranslator";
    private static final String GOOGLE_TRANSLATE_API = 
        "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=%s&dt=t&q=%s";

    private static final Map<String, String> cache = new ConcurrentHashMap<>();
    private static final ExecutorService executor = Executors.newFixedThreadPool(4);

    private static String defaultTargetLanguage = "ru";

    public static void setTargetLanguage(String lang) {
        if (lang != null && !lang.trim().isEmpty()) {
            defaultTargetLanguage = lang;
        }
    }

    public static String getTargetLanguage() {
        return defaultTargetLanguage;
    }

    public interface TranslationCallback {
        void onSuccess(String translatedText);
        void onError(Exception e);
    }

    public static String translateText(String text, String targetLang) {
        if (text == null || text.trim().isEmpty()) {
            return text;
        }

        if (targetLang == null) {
            targetLang = defaultTargetLanguage;
        }

        if (text.length() > 1500) {
            StringBuilder result = new StringBuilder();
            String[] paragraphs = text.split("\n");
            StringBuilder chunk = new StringBuilder();

            for (String p : paragraphs) {
                if (chunk.length() + p.length() > 1500) {
                    result.append(translateChunk(chunk.toString(), targetLang)).append("\n");
                    chunk = new StringBuilder();
                }
                chunk.append(p).append("\n");
            }
            if (chunk.length() > 0) {
                result.append(translateChunk(chunk.toString(), targetLang));
            }
            return result.toString();
        }

        return translateChunk(text, targetLang);
    }

    private static String translateChunk(String text, String targetLang) {
        String cacheKey = targetLang + ":" + text;
        if (cache.containsKey(cacheKey)) {
            return cache.get(cacheKey);
        }

        try {
            String encodedText = URLEncoder.encode(text, StandardCharsets.UTF_8.name());
            String apiUrl = String.format(GOOGLE_TRANSLATE_API, targetLang, encodedText);

            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(8000);
            conn.setReadTimeout(8000);
            conn.setRequestProperty("User-Agent", 
                "Mozilla/5.0 (Android; Mobile; rv:120.0) Gecko/120.0 Firefox/120.0");

            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {
                BufferedReader reader = new BufferedReader(
                    new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
                reader.close();

                String translated = parseGoogleTranslateJson(response.toString());
                if (translated != null && !translated.isEmpty()) {
                    cache.put(cacheKey, translated);
                    return translated;
                }
            } else {
                Log.e(TAG, "Translation HTTP error: " + responseCode);
            }
        } catch (Exception e) {
            Log.e(TAG, "Failed to translate chunk", e);
        }

        return text;
    }

    public static void translateTextAsync(final String text, final String targetLang, final TranslationCallback callback) {
        executor.execute(() -> {
            try {
                String result = translateText(text, targetLang);
                if (callback != null) {
                    callback.onSuccess(result);
                }
            } catch (Exception e) {
                if (callback != null) {
                    callback.onError(e);
                }
            }
        });
    }

    private static String parseGoogleTranslateJson(String jsonStr) {
        try {
            StringBuilder result = new StringBuilder();
            Pattern pattern = Pattern.compile("\\[\\[\"(.*?)\",\"(.*?)\"");
            Matcher matcher = pattern.matcher(jsonStr);

            while (matcher.find()) {
                String translatedSegment = matcher.group(1);
                translatedSegment = unescapeJson(translatedSegment);
                result.append(translatedSegment);
            }

            return result.length() > 0 ? result.toString() : null;
        } catch (Exception e) {
            Log.e(TAG, "Error parsing translation JSON", e);
            return null;
        }
    }

    private static String unescapeJson(String input) {
        if (input == null) return "";
        return input.replace("\\\"", "\"")
                    .replace("\\\\", "\\")
                    .replace("\\n", "\n")
                    .replace("\\r", "\r")
                    .replace("\\t", "\t")
                    .replace("\\/", "/");
    }
}