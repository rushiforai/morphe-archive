package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import java.util.*;
import org.json.JSONArray;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** D3 policy behavior; an accepted translation is not a certificate of its meaning. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
public class D3QualityPolicyTest {
    private static final CaptionLanguageContext ZH = CaptionLanguageContext.explicit("en", "zh-Hans");

    private RebuildProtocol.Plan parse(String sourceText, String text) throws Exception {
        RebuildSource source = RebuildContractTest.source(sourceText, 500);
        RebuildPlanner.Block block = RebuildContractTest.block(source);
        return RebuildProtocol.parseBound(RebuildContractTest.reply(block, new JSONArray().put(
                RebuildR26Test.quoted(source, 0, source.words.size() - 1, text))), source, block, ZH);
    }

    @Test public void retiredCaseRulesNoLongerCreateRepairOrPreferencePenalty() throws Exception {
        String[][] samples = {
            {"the size of a country's tank fleet", "一个国家坦克舰队的规模", "possible_equipment_term"},
            {"licensed or unlicensed vehicles", "合法或非法的车辆", "possible_authorization_expansion"},
            {"revenue is a product of higher sales", "收入是销售额的乘积", "possible_arithmetic_misread"},
            {"growth that would follow deng reduced the share", "增长之后邓减少了份额", "possible_subject_attachment"},
            {"about 50 20 aircraft", "大约50架飞机", "possible_number_loss"},
            {"about 50 20 aircraft", "大约50至20架飞机", "possible_number_range_invention"}
        };
        for (String[] sample : samples) {
            RebuildProtocol.Plan p = parse(sample[0], sample[1]);
            assertFalse(sample[2], p.issues.stream().anyMatch(x -> x.code.equals(sample[2])));
            assertEquals(sample[2], 0, RebuildReview.score(p.issues));
            assertFalse(sample[2], RebuildReview.hasSemanticRepairRisk(p));
            assertFalse(sample[2], RebuildReview.shouldRepair(p, 1, 0, 0, 10000));
            RebuildProtocol.Plan equal = new RebuildProtocol.Plan(p.events, "other", p.issues);
            assertSame("equal risk preserves the existing plan", p, RebuildReview.prefer(p, equal));
        }
    }

    @Test public void exactLiteralTransferIsRejectedForEveryTargetLanguage() throws Exception {
        RebuildSource source = RebuildContractTest.source("A-12 opened B-34 closed", 500);
        RebuildPlanner.Block block = RebuildContractTest.block(source);
        String[][] targets = {{"zh-Hans", "装置 B-34 启动", "装置 B-34 关闭"},
                              {"ja", "装置 B-34 起動", "装置 B-34 停止"},
                              {"fr", "appareil B-34 ouvert", "appareil B-34 fermé"}};
        for (String[] target : targets) {
            JSONArray events = new JSONArray().put(RebuildR26Test.quoted(source, 0, 1, target[1]))
                    .put(RebuildR26Test.quoted(source, 2, 3, target[2]));
            try {
                RebuildProtocol.parseBound(RebuildContractTest.reply(block, events), source, block,
                        CaptionLanguageContext.explicit("en", target[0]));
                fail("literal B-34 belonged to the other source event: " + target[0]);
            } catch (RebuildProtocol.Invalid expected) {
                assertEquals("semantic_anchor_leak", expected.code);
                assertTrue(expected.detail.contains("model=B-34"));
            }
        }
    }

    @Test public void literalCasePluralAndUnicodeBoundariesAreNotInferred() throws Exception {
        RebuildSource source = RebuildContractTest.source("A-12 opened B-34 closed", 500);
        RebuildPlanner.Block block = RebuildContractTest.block(source);
        for (String translation : Arrays.asList("装置 b-34 启动", "装置 B-34s 启动", "装置B-34启动")) {
            JSONArray events = new JSONArray().put(RebuildR26Test.quoted(source, 0, 1, translation))
                    .put(RebuildR26Test.quoted(source, 2, 3, "装置 B-34 关闭"));
            RebuildProtocol.Plan p = RebuildProtocol.parseBound(
                    RebuildContractTest.reply(block, events), source, block, ZH);
            assertEquals(2, p.events.size());
            assertEquals(translation, p.events.get(0).text);
        }
    }

    @Test public void incompleteChineseTailDoesNotCreateTheRetiredCaseSpecificIssue() {
        RebuildSource source = RebuildContractTest.source("our influence extends toward distant places", 500);
        RebuildPlanner.Block block = RebuildContractTest.block(source);
        RebuildProtocol.Event first = new RebuildProtocol.Event(0, 2, 0, 1500, "我们的影响延伸至");
        RebuildProtocol.Event second = new RebuildProtocol.Event(3, 5, 1500, 3000, "遥远的地方");
        List<RebuildReview.Issue> issues = RebuildReview.inspect(source, block, Arrays.asList(first, second), ZH);
        assertFalse(issues.stream().anyMatch(x -> x.code.equals("open_complement")));
        assertFalse(RebuildReview.repair(issues).contains("open_complement"));
    }

    @Test public void adjacentNumbersRemainUncertainAndValueObservationsRemainThreeState() throws Exception {
        RebuildProtocol.Plan p = parse("about 50 20 aircraft", "约50至20架飞机");
        assertTrue(p.issues.stream().anyMatch(x -> x.code.equals("source_number_ambiguity") && !x.repair));
        assertEquals(RebuildNumbers.Result.UNKNOWN, RebuildNumbers.compare("50 20", "五十至二十", ZH));
        assertEquals(RebuildNumbers.Result.EQUIVALENT, RebuildNumbers.compare("4 and a half", "4.5", ZH));
        assertEquals(RebuildNumbers.Result.EQUIVALENT, RebuildNumbers.compare("1,000", "1000", ZH));
        assertEquals(RebuildNumbers.Result.CONTRADICTED, RebuildNumbers.compare("24 ships", "25艘", ZH));
        assertFalse(RebuildReview.shouldRepair(p, 1, 0, 0, 10000));
    }

    @Test public void retainedNegationUsesItsOriginalBoundedRepairAndLanguageGate() throws Exception {
        RebuildProtocol.Plan risky = parse("They aren't always happy with this decision", "他们通常不喜欢这个决定");
        assertTrue(risky.issues.stream().anyMatch(x -> x.code.equals("possible_polarity_change") && x.repair));
        assertTrue(RebuildReview.shouldRepair(risky, 1, 0, 0, 10000));
        assertTrue(RebuildReview.shouldRepair(risky, 2, 1, 0, 10000));
        assertFalse(RebuildReview.shouldRepair(risky, 3, 2, 0, 10000));
        assertFalse(RebuildReview.shouldRepair(risky, 1, RebuildReview.MAX_SESSION_REPAIRS, 0, 10000));
        RebuildProtocol.Plan faithful = parse("They aren't always happy with this decision", "他们并非总是喜欢这个决定");
        assertFalse(faithful.issues.stream().anyMatch(x -> x.code.equals("possible_polarity_change")));
        RebuildSource source = RebuildContractTest.source("They aren't always happy with this decision", 500);
        RebuildProtocol.Event event = new RebuildProtocol.Event(0, source.words.size()-1, 0, 4000, "They are usually unhappy");
        assertFalse(RebuildReview.inspect(source, RebuildContractTest.block(source), Collections.singletonList(event),
                CaptionLanguageContext.explicit("en", "en")).stream().anyMatch(x -> x.code.equals("possible_polarity_change")));
    }
}
