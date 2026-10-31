package app.morphe.extension.syncforreddit.translate;

import android.content.Context;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.shared.Logger;

/**
 * Translating through DeepL, with a key of one's own.
 *
 * <p>Every run of words in a post goes in one request rather than one each: the service takes an
 * array and answers in the same order, and a post is a great many short runs once the links and
 * the code have been held out of it.
 *
 * <p>The markers those are held out with are sent as they are. DeepL can be asked to treat them
 * as XML tags instead, which is what its own guide suggests, but that means every angle bracket
 * and ampersand a post was written with has to be escaped on the way out and unescaped on the
 * way back — and Reddit text is full of both. The markers are carried across as plain words
 * perfectly well, and where one is not, the same check that covers the device library covers
 * this: the line is translated again in pieces.
 */
final class DeepLTranslator {
    /** A key given away free ends this way, and is answered by a different host. */
    private static final String FREE_KEY_ENDS = ":fx";

    private static final String PAID = "https://api.deepl.com/v2/translate";
    private static final String FREE = "https://api-free.deepl.com/v2/translate";

    private static final int TIMEOUT_MS = 20_000;

    /** Said where a key was not accepted, and what a second host is tried on. */
    private static final String REFUSED_THE_KEY = "DeepL refused the key";

    /** How many runs go in one request. */
    private static final int AT_ONCE = 50;

    /** What the service allows itself to be told, and how much of it. */
    private static final int INSTRUCTIONS_AT_MOST = 10;
    private static final int AN_INSTRUCTION_AT_MOST = 300;

    /** Instructions are only taken where the translation is into one of these. */
    private static final Set<String> TAKES_INSTRUCTIONS = new HashSet<>(
            Arrays.asList("de", "en", "es", "fr", "it", "ja", "ko", "zh"));

    private DeepLTranslator() {}

    /** @return The text translated, with everything that was not words left as it was. */
    static String translateMarkdown(Context context, String markdown, String from, String into,
                                    String about) throws Exception {
        // Twice through: once to find every run of words, and once to put back what came of
        // them. The same text gives the same runs both times.
        Set<String> runs = new LinkedHashSet<>();
        Markdown.translated(markdown, run -> {
            runs.add(run);
            return run;
        });

        Map<String, String> answered = ask(context, new ArrayList<>(runs), from, into, about);
        return Markdown.translated(markdown, answered::get);
    }

    /** @return One piece of text translated. */
    static String translate(Context context, String text, String from, String into, String about)
            throws Exception {
        Map<String, String> answered =
                ask(context, new ArrayList<>(java.util.Collections.singletonList(text)),
                        from, into, about);
        String said = answered.get(text);
        if (said == null) {
            throw new IllegalStateException("Nothing came back");
        }
        return said;
    }

    /** @return What each run was translated to, by the run it came from. */
    private static Map<String, String> ask(Context context, List<String> runs, String from,
                                           String into, String about) throws Exception {
        String key = TranslationSettings.text(context, TranslationSettings.DEEPL_KEY, "").trim();
        if (key.isEmpty()) {
            throw new IllegalStateException("No DeepL key set");
        }

        Map<String, String> answered = new HashMap<>();
        for (int at = 0; at < runs.size(); at += AT_ONCE) {
            List<String> some = runs.subList(at, Math.min(at + AT_ONCE, runs.size()));
            JSONArray said = translated(context, key, some, from, into, about);

            for (int each = 0; each < some.size() && each < said.length(); each++) {
                answered.put(some.get(each), said.getJSONObject(each).optString("text", null));
            }
        }
        return answered;
    }

    /** @return What the service answered, in the order it was asked. */
    private static JSONArray translated(Context context, String key, List<String> runs,
                                        String from, String into, String about)
            throws Exception {
        JSONObject asking = new JSONObject();
        asking.put("text", new JSONArray(runs));
        asking.put("target_lang", asDeepLWantsATarget(into));

        String source = asDeepLWantsASource(from);
        if (source != null) {
            asking.put("source_lang", source);
        }

        if (about != null && !about.isEmpty()) {
            // Translated against, never translated.
            asking.put("context", about);
        }

        JSONArray told = whatToTellIt(context, into);
        if (told != null) {
            asking.put("custom_instructions", told);
        }

        JSONObject answered = new JSONObject(asked(key, asking.toString()));
        JSONArray translations = answered.optJSONArray("translations");
        if (translations == null) {
            throw new IllegalStateException("DeepL answered with no translations");
        }
        return translations;
    }

    /**
     * @return What the service is to be told about how to translate, or null where it is not to
     *         be told anything. It only takes this for some languages, and refuses the request
     *         outright rather than ignoring it where the language is not one of them.
     */
    private static JSONArray whatToTellIt(Context context, String into) {
        if (!TranslationSettings.bool(context, TranslationSettings.DEEPL_INSTRUCTIONS_ON, false)) {
            return null;
        }
        if (!TAKES_INSTRUCTIONS.contains(baseOf(into))) {
            Logger.printInfo(() -> "DeepL takes no instructions for " + into);
            return null;
        }

        String written =
                TranslationSettings.text(context, TranslationSettings.DEEPL_INSTRUCTIONS, "");
        JSONArray told = new JSONArray();
        for (String line : written.split("\n")) {
            String one = line.trim();
            if (one.isEmpty()) {
                continue;
            }
            told.put(one.length() > AN_INSTRUCTION_AT_MOST
                    ? one.substring(0, AN_INSTRUCTION_AT_MOST) : one);
            if (told.length() == INSTRUCTIONS_AT_MOST) {
                break;
            }
        }
        return told.length() == 0 ? null : told;
    }

    /**
     * @return What the service answered. Which host answers a key is told from the key itself,
     *         which is how the service says to tell them apart. Where that is refused the other
     *         is tried once, since a key sent to the wrong one is refused exactly as a key that
     *         is not a key would be, and the difference is worth not making someone guess at.
     */
    private static String asked(String key, String asking) throws Exception {
        boolean free = key.endsWith(FREE_KEY_ENDS);
        try {
            return post(free ? FREE : PAID, key, asking);
        } catch (Exception ex) {
            if (!(ex instanceof IllegalStateException) || !String.valueOf(ex.getMessage())
                    .contains(REFUSED_THE_KEY)) {
                throw ex;
            }
            Logger.printInfo(() -> "DeepL refused that key, trying the other host");
            return post(free ? PAID : FREE, key, asking);
        }
    }

    /** @return A target as the service writes them, which keeps the country where there is one. */
    private static String asDeepLWantsATarget(String into) {
        return into == null ? null : into.toUpperCase(Locale.ROOT);
    }

    /**
     * @return A source as the service writes them, which is the language alone, or null where it
     *         is not known and the service is to work it out.
     */
    private static String asDeepLWantsASource(String from) {
        String language = baseOf(from);
        return language == null || language.isEmpty() || OnDeviceTranslator.UNKNOWN.equals(language)
                ? null : language.toUpperCase(Locale.ROOT);
    }

    /** @return The language on its own, without the country that may be written after it. */
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
    private static String post(String where, String key, String asking) throws Exception {
        HttpURLConnection asked = (HttpURLConnection) new URL(where).openConnection();
        try {
            asked.setRequestMethod("POST");
            asked.setConnectTimeout(TIMEOUT_MS);
            asked.setReadTimeout(TIMEOUT_MS);
            asked.setDoOutput(true);
            asked.setRequestProperty("Authorization", "DeepL-Auth-Key " + key);
            asked.setRequestProperty("Content-Type", "application/json");
            asked.setRequestProperty("Accept", "application/json");

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
        switch (said) {
            case 403:
                return REFUSED_THE_KEY;
            case 429:
                return "DeepL is being asked too often";
            case 456:
                return "The DeepL allowance for this key is used up";
            case 400:
                return "DeepL would not take the request: " + shortened(body);
            default:
                return "DeepL answered " + said + ": " + shortened(body);
        }
    }

    private static String shortened(String body) {
        if (body == null || body.isEmpty()) {
            return "nothing said";
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
