package app.morphe.extension.tiktok.interaction;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.graphics.Rect;
import android.view.View;
import android.widget.FrameLayout;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.SettingsContextRule;

import com.ss.android.ugc.aweme.feed.assem.ability.IVideoCommentAbility;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * How a double tap set to comments presses the comment button.
 *
 * <p>On the S22 with 46.2.3 the registered view answered {@code performClick()} with true and
 * opened nothing: TikTok leaves a click listener with no body on the button and handles the
 * real press as a touch. The assem that owns the view implements {@code IVideoCommentAbility},
 * whose one no-argument method is the icon press with TikTok's own gating in front of it. These
 * pin that the press goes through that method when it is there, that it is chosen by shape
 * rather than by name, and that a build without it falls back to the click and says so.
 */
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class DoubleTapCommentsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** The comment assem as the extension sees it: the ability plus whatever else it does. */
    public static final class CommentAssem implements IVideoCommentAbility {
        int presses;
        int jumps;

        @Override public void Id0() { presses++; }
        @Override public void XZ1(String enterMethod) { }
        @Override public boolean c00(float x, float y) { return false; }
        @Override public void jo2(int jumpType) { jumps++; }
        @Override public Rect nw2() { return new Rect(); }
        @Override public void qg1(CharSequence text, String source) { }
    }

    /** The same assem on a build that dropped the ability. */
    public static final class BareAssem { }

    public static final class Params {
        public final GestureActionsTest.Clip aweme;
        Params(String id) { aweme = new GestureActionsTest.Clip(id); }
    }

    private android.app.Activity activity;
    private FrameLayout root;

    @Before public void setUp() {
        activity = Robolectric.buildActivity(android.app.Activity.class).setup().visible().get();
        Utils.setContext(activity);
        root = new FrameLayout(activity);
        activity.setContentView(root);
        HookStatus.clear();
    }

    @After public void tearDown() {
        HookStatus.clear();
    }

    private View registeredView(Object owner, String videoId, int[] clicks) {
        View view = new View(activity);
        view.setOnClickListener(v -> clicks[0]++);
        root.addView(view);
        GestureActions.registerCommentView(owner, view);
        GestureActions.bindCommentView(owner, new Params(videoId));
        return view;
    }

    @Test public void thePressGoesThroughTheAbilityAndNotThePlaceholderClick() {
        CommentAssem assem = new CommentAssem();
        int[] clicks = {0};
        registeredView(assem, "one", clicks);

        assertTrue(GestureActions.openComments("one"));

        assertEquals("The ability's press must be what opens the sheet", 1, assem.presses);
        assertEquals("The panel opener with a jump type is not the press", 0, assem.jumps);
        assertEquals("performClick fires a listener that does nothing on the real app", 0, clicks[0]);
        List<String> report = HookStatus.report();
        assertEquals("Expected the family to report as bound, got " + report, 1, report.size());
        assertTrue(report.get(0), report.get(0).startsWith(GestureActions.FAMILY + ": 1 found, 0 missing"));
    }

    @Test public void thePressIsChosenByShapeNotByName() {
        java.lang.reflect.Method press = GestureActions.commentPress(new CommentAssem());

        assertNotNull(press);
        // Six methods on the ability, one of them takes nothing and returns nothing. Its name is
        // an accident of this build and the next build renames it.
        assertEquals("Id0", press.getName());
        assertEquals(0, press.getParameterTypes().length);
        assertEquals(void.class, press.getReturnType());
    }

    @Test public void aBuildWithoutTheAbilityFallsBackToTheClickAndSaysSo() {
        BareAssem assem = new BareAssem();
        int[] clicks = {0};
        registeredView(assem, "two", clicks);

        assertTrue(GestureActions.openComments("two"));

        assertEquals("With no ability the click is all there is", 1, clicks[0]);
        assertNull(GestureActions.commentPress(assem));
        List<String> missing = HookStatus.missing(GestureActions.FAMILY);
        assertEquals("Expected one miss naming the ability, got " + missing, 1, missing.size());
        assertTrue(missing.get(0), missing.get(0).contains("IVideoCommentAbility"));
    }

    @Test public void aHiddenControlIsStillPressedThroughTheAbility() {
        // Clear display hides the action rail; the assem behind it still works.
        CommentAssem assem = new CommentAssem();
        int[] clicks = {0};
        View view = registeredView(assem, "three", clicks);
        view.setVisibility(View.INVISIBLE);

        assertTrue(GestureActions.openComments("three"));
        assertEquals(1, assem.presses);
        assertEquals(0, clicks[0]);
        assertFalse(HookStatus.anyMissing());
    }
}
