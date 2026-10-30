package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * The all-language display contract: a faithful translation must never be rejected, and one bad
 * event must not withhold the rest of its block.
 *
 * <p>This is the executable form of `docs/N44-ALL-LANGUAGES-DESIGN-20261019.md` section 8. It uses
 * the production parser and validators; the corpus is deliberately a class matrix (designations,
 * unit scales, signs, Arabic separators, Unicode normalization, bidi), not a video transcript.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
public class LanguageConformanceTest {
    private static final String DESIGNATION = "four T-14 tanks arrived";
    private static final String SCALE = "a 200 megapixel camera";
    private static final String SIGN = "the temperature fell 5 degrees below zero";

    private static final class Case {
        final String kind, language, source, target, quote;

        Case(String kind, String language, String source, String target) {
            this(kind, language, source, target, source);
        }

        Case(String kind, String language, String source, String target, String quote) {
            this.kind = kind;
            this.language = language;
            this.source = source;
            this.target = target;
            this.quote = quote;
        }
    }

    private static RebuildSource source(String text) {
        List<RebuildSource.Word> words = new ArrayList<>();
        int i = 0;
        for (String token : RebuildSource.tokens(text)) {
            words.add(
                    new RebuildSource.Word(
                            token, i * 400L, (i + 1) * 400L, i / 6, RebuildSource.Precision.NATIVE));
            i++;
        }
        return new RebuildSource(words);
    }

    private static RebuildProtocol.Plan parse(Case c) throws Exception {
        RebuildSource s = source(c.source);
        RebuildPlanner.Block b = new RebuildPlanner.Block(0, 0, s.words.size() - 1, s);
        JSONArray events =
                new JSONArray()
                        .put(
                                new JSONObject()
                                        .put("from", 0)
                                        .put("to", s.words.size() - 1)
                                        .put("source", c.quote)
                                        .put("text", c.target));
        String reply = new JSONObject().put("block", b.id()).put("events", events).toString();
        return RebuildProtocol.parseBestEffort(
                reply, s, b, CaptionLanguageContext.explicit("en", c.language));
    }

    private static boolean hasPages(Case c) {
        CaptionLanguageProfile profile = CaptionLanguageProfile.fromCode(c.language);
        CaptionRenderSpec spec = new CaptionRenderSpec(c.language, profile, false);
        TranslationBudget budget = new TranslationBudget(1121, 44.0f, 48.7f, spec);
        return !CaptionLanguagePager.plan(c.target, 0, 4000, budget, spec).isEmpty();
    }

    @Test
    public void faithfulTranslationsAreNeverRejectedInAnyLanguage() {
        List<Case> cases = new ArrayList<>();
        String[][] designations = {
            {"ru", "прибыли четыре танка Т-14"},
            {"uk", "прибули чотири танки Т-14"},
            {"el", "έφτασαν τέσσερα άρματα Τ-14"},
            {"ar", "وصلت أربع دبابات ت-14"},
            {"he", "הגיעו ארבעה טנקים ט-14"},
            {"fa", "چهار تانک ت-14 رسیدند"},
            {"hi", "चार टी-14 टैंक आए"},
            {"bn", "চারটি টি-14 ট্যাংক এসেছে"},
            {"th", "รถถัง ที-14 สี่คันมาถึง"},
            {"ko", "티-14 전차 네 대가 도착했습니다"},
            {"ja", "T-14戦車が到着した"},
            {"zh-Hans", "四辆T-14坦克抵达"},
            {"zh-Hant", "四輛T-14戰車抵達"},
            {"de", "vier T-14 Panzer kamen an"},
            {"es", "llegaron cuatro tanques T-14"},
            {"vi", "bốn xe tăng T-14 đã đến"},
        };
        for (String[] row : designations)
            cases.add(new Case("designation", row[0], DESIGNATION, row[1]));

        String[][] scales = {
            {"zh-Hans", "2亿像素相机"},
            {"zh-Hant", "2億像素相機"},
            {"ja", "2億画素のカメラ"},
            {"ko", "2억 화소 카메라"},
            {"hi", "20 करोड़ पिक्सेल कैमरा"},
            {"id", "kamera 200 megapiksel"},
            {"es", "cámara de 200 megapíxeles"},
            {"ru", "камера на 200 мегапикселей"},
        };
        for (String[] row : scales) cases.add(new Case("scale", row[0], SCALE, row[1]));

        for (String[] row :
                new String[][] {
                    {"en", "the temperature fell to -5 degrees"},
                    {"zh-Hans", "气温降到-5度"},
                    {"ru", "температура упала до -5 градусов"},
                    {"de", "die Temperatur fiel auf -5 Grad"},
                })
            cases.add(new Case("sign", row[0], SIGN, row[1]));

        cases.add(new Case("arabic-sep", "ar", "1234 tanks arrived", "وصلت ١٬٢٣٤ دبابة"));
        cases.add(
                new Case(
                        "nfd-quote",
                        "fr",
                        "café opens at nine",
                        "le café ouvre à neuf",
                        "cafe\u0301 opens at nine"));
        cases.add(
                new Case(
                        "bidi-quote", "he", "שלום עולם", "שלום לעולם", "שלום\u200F עולם"));

        List<String> failures = new ArrayList<>();
        for (Case c : cases) {
            try {
                RebuildProtocol.Plan plan = parse(c);
                if (plan.events.isEmpty()) failures.add(c.kind + "/" + c.language + ": no events");
                else if (!hasPages(c))
                    failures.add(c.kind + "/" + c.language + ": no display page");
            } catch (Exception rejected) {
                failures.add(
                        c.kind
                                + "/"
                                + c.language
                                + ": "
                                + (rejected instanceof RebuildProtocol.Invalid
                                        ? ((RebuildProtocol.Invalid) rejected).code
                                        : rejected.getClass().getSimpleName()));
            }
        }
        assertTrue("faithful translations were rejected: " + failures, failures.isEmpty());
    }

    @Test
    public void oneBadEventStillPublishesTheOtherThree() throws Exception {
        String text = "the budget phone costs 300 dollars and the flagship costs 1300 dollars";
        RebuildSource s = source(text);
        RebuildPlanner.Block b = new RebuildPlanner.Block(0, 0, s.words.size() - 1, s);
        int n = s.words.size();
        String[] targets = {
            "бюджетный телефон стоит 300 долларов",
            "флагман стоит 1300 долларов",
            "and this is the flagship", // English echo: unusable as a Russian translation
            "и ещё один флагман"
        };
        int[] to = {3, 7, n - 3, n - 1};
        JSONArray events = new JSONArray();
        for (int i = 0; i < 4; i++) {
            int from = i == 0 ? 0 : to[i - 1] + 1;
            events.put(
                    new JSONObject()
                            .put("from", from)
                            .put("to", to[i])
                            .put("source", s.text(from, to[i]))
                            .put("text", targets[i]));
        }
        String reply = new JSONObject().put("block", b.id()).put("events", events).toString();
        RebuildProtocol.Plan plan =
                RebuildProtocol.parseBestEffort(
                        reply, s, b, CaptionLanguageContext.explicit("en", "ru"));
        assertTrue("a salvaged plan is partial", plan.partial);
        assertEquals("the other three events are published", 3, plan.events.size());
        assertEquals("the bad event is an explicit hole", 1, plan.holes.size());
        assertTrue(
                "the bad event is reported as an observation",
                plan.issues.stream().anyMatch(i -> i.code.equals("numeric_observation")));
    }

    @Test
    public void anUntranslatedEchoIsStillDropped() throws Exception {
        Case echo =
                new Case(
                        "echo",
                        "zh-Hans",
                        "the budget phone costs three hundred dollars",
                        "the budget phone costs three hundred dollars");
        // N52: an unusable reply is not published, but it is also not a permanent block failure:
        // every token becomes an explicit hole so the display holds the last page and repairs the
        // current page instead of retrying the whole block.
        RebuildProtocol.Plan plan = parse(echo);
        assertTrue("the English echo is never published as Chinese", plan.events.isEmpty());
        assertTrue("the block is a salvaged plan", plan.partial);
        assertEquals("the whole block is one explicit hole", 1, plan.holes.size());
    }

    @Test
    public void koreanKeepsInterWordSpaces() {
        assertFalse("Korean is space-delimited", CaptionScript.compact(Locale.KOREAN));
        assertTrue(CaptionScript.requiresSpace('를', '시'));
        assertTrue("Han is compact", CaptionScript.compact(Locale.SIMPLIFIED_CHINESE));
    }

    @Test
    public void bareChineseAndRtlTargetsGetTheirProfile() {
        assertEquals("zh-Hans", CaptionLanguageProfile.fromCode("zh").id);
        assertEquals(
                CaptionLanguageProfile.Direction.RTL,
                CaptionLanguageProfile.fromCode("he").direction);
        assertEquals(
                CaptionLanguageProfile.Direction.RTL,
                CaptionLanguageProfile.fromCode("fa").direction);
        assertEquals(
                CaptionLanguageProfile.Direction.RTL,
                CaptionLanguageProfile.fromCode("ur").direction);
        assertEquals("generic-cjk", CaptionLanguageProfile.fromCode("yue").id);
        assertEquals("generic-devanagari", CaptionLanguageProfile.fromCode("mr").id);
        assertEquals("generic-devanagari", CaptionLanguageProfile.fromCode("ne").id);
    }

    @Test
    public void scriptPunctuationEndsASentenceAndAClause() {
        assertTrue(RebuildSource.terminal("نهاية؟"));
        assertTrue(RebuildSource.terminal("समाप्त।"));
        assertTrue(RebuildSource.terminal("סוף׃"));
        assertFalse(RebuildSource.terminal("نهاية"));
    }

    @Test
    public void aHoleFillingRetryMergesWithoutReplacingShownText() {
        RebuildSource s = source("one two three four five");
        RebuildPlanner.Block b = new RebuildPlanner.Block(0, 0, s.words.size() - 1, s);
        RebuildProtocol.Event first =
                new RebuildProtocol.Event(
                        0, 0, s.words.get(0).start, s.words.get(0).end, "eins");
        RebuildProtocol.Event second =
                new RebuildProtocol.Event(
                        1, 1, s.words.get(1).start, s.words.get(1).end, "zwei");
        RebuildProtocol.Event fourth =
                new RebuildProtocol.Event(
                        3, 3, s.words.get(3).start, s.words.get(3).end, "vier");
        RebuildProtocol.Plan shown =
                new RebuildProtocol.Plan(
                        Arrays.asList(first),
                        "",
                        Collections.emptyList(),
                        0,
                        true,
                        Arrays.asList(new int[] {1, 4}));
        RebuildProtocol.Plan retry =
                new RebuildProtocol.Plan(
                        Arrays.asList(second, fourth),
                        "",
                        Collections.emptyList(),
                        0,
                        true,
                        Arrays.asList(new int[] {0, 0}, new int[] {2, 2}, new int[] {4, 4}));
        RebuildProtocol.Plan merged =
                RebuildReview.accept(
                        shown, retry, b);
        assertEquals("all three accepted events survive", 3, merged.events.size());
        assertEquals("only token 2 and 4 remain holes", 2, merged.holes.size());
        assertTrue(merged.partial);
    }

    @Test
    public void arabicThousandsSeparatorIsNotADecimalPoint() {
        assertEquals(
                RebuildNumbers.Result.EQUIVALENT,
                RebuildNumbers.compare(
                        "1234 tanks", "١٬٢٣٤ دبابة",
                        CaptionLanguageContext.explicit("en", "ar")));
    }
}
