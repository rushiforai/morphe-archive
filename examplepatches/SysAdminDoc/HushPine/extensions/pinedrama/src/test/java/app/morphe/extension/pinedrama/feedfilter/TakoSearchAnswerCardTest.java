package app.morphe.extension.pinedrama.feedfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.SettingsPagesTest.PageActivity;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/**
 * The AI answer card at the top of a search's Top tab ("TikTok Tako · AI summary from", 47.4.3).
 * Its view holder is handed over with the card protocol's class name, and only an AI answer
 * protocol's row goes, with Hide Tako AI on.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class TakoSearchAnswerCardTest {
    private static final String AI_ANSWER =
            "com.ss.android.ugc.aweme.search.pages.result.ainative.protocol.Top1AnswerAINativeCardProtocol";
    private static final String VIDEO_CARD = "com.ss.android.ugc.aweme.search.pages.result.video.SearchVideoCardProtocol";

    @Before public void setup() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        HookStatus.clear();
        Settings.HIDE_TAKO_AI.save(false);
    }

    @After public void tearDown() {
        Settings.HIDE_TAKO_AI.resetToDefault();
        HookStatus.clear();
    }

    private static View row(int height) {
        View row = new FrameLayout(RuntimeEnvironment.getApplication());
        row.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
        return row;
    }

    /** The report counts each line once: cards read, then the answer card left. */
    @Test public void theAnswerRowIsLeftWithTheSwitchOff() {
        TakoAiFilter.hideSearchAnswerCard(row(300), VIDEO_CARD);
        String report = HookStatus.report().toString();
        assertTrue(report, report.contains("tako AI: 1 found"));

        View answer = row(300);
        TakoAiFilter.hideSearchAnswerCard(answer, AI_ANSWER);
        assertEquals(View.VISIBLE, answer.getVisibility());
        assertEquals(300, answer.getLayoutParams().height);
        report = HookStatus.report().toString();
        assertTrue(report, report.contains("tako AI: 2 found"));
    }

    @Test public void onlyTheAnswerRowGoesWithTheSwitchOn() {
        Settings.HIDE_TAKO_AI.save(true);
        View video = row(300);
        TakoAiFilter.hideSearchAnswerCard(video, VIDEO_CARD);
        assertEquals("another card's row was hidden", View.VISIBLE, video.getVisibility());
        assertEquals(300, video.getLayoutParams().height);

        View answer = row(300);
        TakoAiFilter.hideSearchAnswerCard(answer, AI_ANSWER);
        assertEquals(View.GONE, answer.getVisibility());
        assertEquals(0, answer.getLayoutParams().height);

        TakoAiFilter.hideSearchAnswerCard(null, AI_ANSWER);
        TakoAiFilter.hideSearchAnswerCard(row(300), (Object) null);
    }

    /** A row built without a parent gets zero-height params, or the list would measure the card. */
    @Test public void aRowWithoutLayoutParamsGetsZeroHeightOnes() {
        Settings.HIDE_TAKO_AI.save(true);
        View answer = new FrameLayout(RuntimeEnvironment.getApplication());
        TakoAiFilter.hideSearchAnswerCard(answer, AI_ANSWER);
        assertEquals(0, answer.getLayoutParams().height);
        assertEquals(View.GONE, answer.getVisibility());
    }

    /** A bind that shows the row again is undone when the row is attached. */
    @Test public void theRowIsCollapsedAgainWhenItIsAttached() {
        Settings.HIDE_TAKO_AI.save(true);
        View answer = row(300);
        TakoAiFilter.hideSearchAnswerCard(answer, AI_ANSWER);
        answer.setVisibility(View.VISIBLE);
        answer.getLayoutParams().height = 300;

        try (var owner = Robolectric.buildActivity(PageActivity.class).setup().visible()) {
            FrameLayout list = new FrameLayout(owner.get());
            owner.get().setContentView(list);
            list.addView(answer);
            assertEquals(View.GONE, answer.getVisibility());
            assertEquals(0, answer.getLayoutParams().height);
        }
    }

    /** Each name in the set is a real protocol name, under the search result pages. */
    @Test public void theProtocolNamesAreFullClassNames() {
        for (String name : TakoAiFilter.SEARCH_ANSWER_PROTOCOLS) {
            assertTrue(name, name.startsWith("com.ss.android.ugc.aweme.search.pages.result.") && name.endsWith("Protocol"));
        }
    }
}
