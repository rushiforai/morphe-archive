package app.hushtelegram.extension.shared.diagnostics;

import app.hushtelegram.extension.shared.fuzz.BoundedJsonGrammar;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.junit.Test;

/** Grammar mutations keep each canary visible in the input and every unrelated subtree intact. */
public class DiagnosticRedactorPropertyTest {
    public static final String[][] GRAMMAR_CORPUS = grammarCorpus();
    public static final String[][] ESCAPED_NAME_CORPUS = escapedNameCorpus();
    private static final String CONTROLS = "version=12.10.6 counter=8 timestamp=1790000000000"
            + " sha256=abcdef0123456789abcdef0123456789";

    @Test(timeout = 20_000) public void fixedGrammarCasesRemoveSecretsPreserveControlsAndAreIdempotent() {
        long started = System.nanoTime();
        for (int i = 0; i < GRAMMAR_CORPUS.length; i++) {
            String[] row = GRAMMAR_CORPUS[i];
            BoundedJsonGrammar.requireSize(row[0]);
            if (!hasInputControls(row, row[0])) throw new AssertionError("Missing input canary/control in case " + i);
            if (!passes(row, row[0])) {
                String minimized = BoundedJsonGrammar.minimize(row[0], input -> hasInputControls(row, input) && !passes(row, input));
                throw new AssertionError("Fixed seed case " + i + " failed. Minimal input: " + minimized);
            }
            BoundedJsonGrammar.requireTime(started);
        }
    }

    @Test(timeout = 20_000) public void decodedNamesKeepLiteralBackslashesAndInvalidEscapesDistinct() {
        long started = System.nanoTime();
        for (String[] row : ESCAPED_NAME_CORPUS) {
            String actual = DiagnosticRedactor.redact(row[0]);
            if (!row[1].equals(actual)) throw new AssertionError("Escaped-name regression: " + row[0] + " => " + actual);
            if (!actual.equals(DiagnosticRedactor.redact(actual))) throw new AssertionError("Escaped-name redaction changed twice");
            BoundedJsonGrammar.requireTime(started);
        }
    }

    private static boolean hasInputControls(String[] row, String input) {
        for (int i = 1; i < row.length; i++) if (!input.contains(row[i])) return false;
        return true;
    }

    private static boolean passes(String[] row, String input) {
        String actual = DiagnosticRedactor.redact(input);
        if (actual.contains(row[1]) || !actual.equals(DiagnosticRedactor.redact(actual))) return false;
        for (int i = 2; i < row.length; i++) if (!actual.contains(row[i])) return false;
        return true;
    }

    private static String[][] grammarCorpus() {
        String[] names = {"api_id", "apiHash", "API_HASH", "APP_ID", "app_hash", "token", "sessionid",
                "Authorization", "password", "user_id", "chat_id", "phone", "pa\u00dfword", "to\u212aen", "\u017fecret"};
        String[] edges = {"\u00e9", "\u044f", "\u732b", "\u00a0"};
        List<String[]> rows = new ArrayList<>();
        for (long seed : BoundedJsonGrammar.seeds()) {
            Random random = new Random(seed);
            for (int sample = 0; sample < BoundedJsonGrammar.SAMPLES; sample++) {
                int index = rows.size();
                String name = names[sample % names.length];
                String secret = sample % 4 == 0 ? Integer.toString(82540000 + index) : "grammarCanary" + index + "Q9";
                String value = sample % 4 == 0 ? secret : "\"} [ \\\" \\\\ " + secret + "\"";
                for (int depth = 0; depth < sample % 5; depth++) {
                    value = random.nextBoolean() ? "[" + value + "]" : "{\"field\":" + value + "}";
                }
                Map<String, Object> neighbor = new LinkedHashMap<>();
                neighbor.put("name", "ordinary");
                neighbor.put("value", 82549998);
                neighbor.put("note", "} [ \\\" caf\u00e9\u00a0\u732b\uD83D\uDE42");
                neighbor.put("counter", sample);
                String nested = "\"ordinary\":" + BoundedJsonGrammar.render(neighbor, random);
                String before = "\"beforeControl\":\"beforeQ" + index + "\"";
                String after = "\"afterControl\":\"afterQ" + index + "\"";
                List<String> fields = new ArrayList<>();
                fields.add(before);
                fields.add(after);
                fields.add(nested);
                if (sample % 6 == 0) {
                    fields.add(BoundedJsonGrammar.escapedName(name, random) + BoundedJsonGrammar.space(random)
                            + ":" + BoundedJsonGrammar.space(random) + value);
                } else {
                    fields.add(BoundedJsonGrammar.escapedName("name", random) + ":"
                            + BoundedJsonGrammar.escapedName(name, random));
                    fields.add(BoundedJsonGrammar.escapedName("value", random) + BoundedJsonGrammar.space(random)
                            + ":" + BoundedJsonGrammar.space(random) + value);
                }
                Collections.shuffle(fields, random);
                String body = "{" + String.join("," + BoundedJsonGrammar.space(random), fields) + "}";
                int layers = sample % 3;
                for (int layer = 0; layer < layers; layer++) {
                    body = BoundedJsonGrammar.embedded(body);
                    before = innerEncoding(before);
                    after = innerEncoding(after);
                    nested = innerEncoding(nested);
                }
                String text = "grammar_case_" + index + "\n" + body + "\n" + CONTROLS;
                rows.add(new String[]{text, secret, before, after, nested, CONTROLS});
                // The Unicode edge and separator mutate ordinary text credentials independently of JSON.
                String separator = new String[]{"=", ":", "=>", "->"}[sample % 4];
                String ordinary = "grammar_text_" + index + "\n" + edges[sample % edges.length] + name
                        + separator + "'" + secret + "'\n" + CONTROLS;
                rows.add(new String[]{ordinary, secret, "grammar_text_" + index, CONTROLS});
            }
        }
        for (String[] row : rows) BoundedJsonGrammar.requireSize(row[0]);
        return rows.toArray(new String[0][]);
    }

    private static String innerEncoding(String text) {
        return text.replace("\\", "\\\\").replace("\"", "\\\"").replace("\r", "\\r")
                .replace("\n", "\\n").replace("\t", "\\t");
    }

    private static String[][] escapedNameCorpus() {
        List<String[]> rows = new ArrayList<>();
        String direct = "{\"\\u0061pi_id\":\"canaryQ9\",\"counter\":8}";
        String pair = "{\"name\":\"\\u0061pi_id\",\"value\":\"canaryQ9\",\"counter\":8}";
        String keys = "{\"\\u006eame\":\"\\u0041pP_\\u0048aSh\",\"\\u0076alue\":\"canaryQ9\",\"counter\":8}";
        String folded = "{\"name\":\"pa\\u00dfword\",\"value\":\"canaryQ9\",\"counter\":8}";
        String reversed = "{\"value\":82531234,\n\"name\":\"api\\u005fid\",\"counter\":8}";
        for (String input : new String[]{direct, pair, keys, folded, reversed}) {
            String expected = input.replace("\"canaryQ9\"", "[omitted]").replace("82531234", "[omitted]");
            for (int layer = 0; layer < 3; layer++) {
                rows.add(new String[]{input, expected});
                input = BoundedJsonGrammar.embedded(input);
                expected = BoundedJsonGrammar.embedded(expected);
            }
        }
        for (String name : new String[]{"\\\\u0061pi_id", "\\u0061pi_id_count", "other_\\u0061pi_id",
                "\\u006gpi_id", "\\u006", "\\u００６１pi_id", "\\qapi_id", "\\u005c\\u00750061pi_id"}) {
            String input = "{\"" + name + "\":\"ordinaryQ9\",\"counter\":8}";
            String pairControl = "{\"name\":\"" + name + "\",\"value\":\"ordinaryQ9\",\"counter\":8}";
            for (int layer = 0; layer < 3; layer++) {
                rows.add(new String[]{input, input});
                rows.add(new String[]{pairControl, pairControl});
                input = BoundedJsonGrammar.embedded(input);
                pairControl = BoundedJsonGrammar.embedded(pairControl);
            }
        }
        for (String input : new String[]{"{\"\\\\u006eame\":\"api_id\",\"value\":82549998,\"counter\":8}",
                "{\"name\":\"api_id\",\"\\\\u0076alue\":82549998,\"counter\":8}"}) {
            rows.add(new String[]{input, input});
        }
        return rows.toArray(new String[0][]);
    }
}
