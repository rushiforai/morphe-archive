package app.morphe.extension.syncforreddit.translate;

import android.content.Context;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Translating through Google Cloud Translation, with a key of one's own.
 *
 * <p>Asked the same way as DeepL is: every run of words in a post in one request, since the
 * service takes an array and answers in the same order.
 *
 * <p>What it is given is declared to be text. The service takes it as HTML unless told
 * otherwise, and a post written by hand is full of the characters HTML is made of.
 */
final class GoogleTranslator {
    private static final String WHERE = "https://translation.googleapis.com/language/translate/v2";

    private static final int TIMEOUT_MS = 20_000;

    /** As many runs in one request as the service will take. */
    private static final int AT_ONCE = 128;

    private GoogleTranslator() {}

    /** @return The text translated, with everything that was not words left as it was. */
    static String translateMarkdown(Context context, String markdown, String from, String into)
            throws Exception {
        Set<String> runs = new LinkedHashSet<>();
        Markdown.translated(markdown, run -> {
            runs.add(run);
            return run;
        });

        Map<String, String> answered = ask(context, new ArrayList<>(runs), from, into);
        return Markdown.translated(markdown, answered::get);
    }

    /** @return One piece of text translated. */
    static String translate(Context context, String text, String from, String into)
            throws Exception {
        String said = ask(context, Collections.singletonList(text), from, into).get(text);
        if (said == null) {
            throw new IllegalStateException("Nothing came back");
        }
        return said;
    }

    /** @return What each run was translated to, by the run it came from. */
    private static Map<String, String> ask(Context context, List<String> runs, String from,
                                           String into) throws Exception {
        String key = TranslationSettings.text(context, TranslationSettings.GOOGLE_KEY, "").trim();
        if (key.isEmpty()) {
            throw new IllegalStateException("No Google Cloud key set");
        }

        Map<String, String> answered = new HashMap<>();
        for (int at = 0; at < runs.size(); at += AT_ONCE) {
            List<String> some = runs.subList(at, Math.min(at + AT_ONCE, runs.size()));

            JSONObject asking = new JSONObject();
            asking.put("q", new JSONArray(some));
            asking.put("target", baseOf(into));
            asking.put("format", "text");

            String source = baseOf(from);
            if (source != null && !source.isEmpty()
                    && !OnDeviceTranslator.UNKNOWN.equals(source)) {
                asking.put("source", source);
            }

            JSONObject said = new JSONObject(post(key, asking.toString()));
            JSONArray translations = said.optJSONObject("data") == null
                    ? null : said.getJSONObject("data").optJSONArray("translations");
            if (translations == null) {
                throw new IllegalStateException("Google Cloud answered with no translations");
            }

            for (int each = 0; each < some.size() && each < translations.length(); each++) {
                answered.put(some.get(each),
                        translations.getJSONObject(each).optString("translatedText", null));
            }
        }
        return answered;
    }

    /** @return The language on its own, which is how this service names them. */
    private static String baseOf(String tag) {
        if (tag == null) {
            return null;
        }
        int ends = tag.indexOf('-');
        if (ends < 0) {
            ends = tag.indexOf('_');
        }
        return (ends < 0 ? tag : tag.substring(0, ends)).toLowerCase(Locale.ROOT);
    }

    /** @return What came back, or what went wrong said plainly enough to act on. */
    private static String post(String key, String asking) throws Exception {
        URL where = new URL(WHERE + "?key=" + URLEncoder.encode(key, "UTF-8"));
        HttpURLConnection asked = (HttpURLConnection) where.openConnection();
        try {
            asked.setRequestMethod("POST");
            asked.setConnectTimeout(TIMEOUT_MS);
            asked.setReadTimeout(TIMEOUT_MS);
            asked.setDoOutput(true);
            asked.setRequestProperty("Content-Type", "application/json; charset=utf-8");

            try (OutputStream sending = asked.getOutputStream()) {
                sending.write(asking.getBytes(StandardCharsets.UTF_8));
            }

            int said = asked.getResponseCode();
            if (said == HttpURLConnection.HTTP_OK) {
                return read(asked.getInputStream());
            }
            throw new IllegalStateException(whatThatMeans(said, read(asked.getErrorStream())));
        } finally {
            asked.disconnect();
        }
    }

    /** @return What a refusal means, in words worth showing someone. */
    private static String whatThatMeans(int said, String body) {
        String because = because(body);
        switch (said) {
            case 400:
                return "Google Cloud would not take the request: " + because;
            case 403:
                return "Google Cloud refused the key: " + because;
            case 429:
                return "The Google Cloud allowance for this key is used up";
            default:
                return "Google Cloud answered " + said + ": " + because;
        }
    }

    /** @return What the service said was wrong, which it writes inside its answer. */
    private static String because(String body) {
        if (body == null || body.isEmpty()) {
            return "nothing said";
        }
        try {
            JSONObject said = new JSONObject(body);
            JSONObject wrong = said.optJSONObject("error");
            if (wrong != null) {
                String message = wrong.optString("message", "");
                if (!message.isEmpty()) {
                    return message;
                }
            }
        } catch (Exception ex) {
            // Not what was expected, so what came back is said as it is.
        }
        return body.length() <= 200 ? body : body.substring(0, 200);
    }

    private static String read(InputStream from) throws Exception {
        if (from == null) {
            return "";
        }
        try (InputStream reading = from) {
            ByteArrayOutputStream into = new ByteArrayOutputStream();
            byte[] block = new byte[4096];
            int read;
            while ((read = reading.read(block)) > 0) {
                into.write(block, 0, read);
            }
            return into.toString(StandardCharsets.UTF_8.name());
        }
    }
}
