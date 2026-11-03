package app.morphe.extension.pinedrama.interaction;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.graphics.Rect;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.pinedrama.SettingsContextRule;

import com.ss.android.ugc.aweme.common.widget.VerticalViewPager;
import com.ss.android.ugc.aweme.feed.assem.ability.IVideoCommentAbility;
import com.ss.android.ugc.feed.platform.cell.ability.VideoDiggAssemAbility;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

/**
 * How a double tap set to comments presses the comment button.
 *
 * <p>On the S22 with 46.2.3 the registered view answered {@code performClick()} with true and
 * opened nothing: PineDrama leaves a click listener with no body on the button and handles the
 * real press as a touch. The assem that owns the view implements {@code IVideoCommentAbility},
 * whose one no-argument method is the icon press with PineDrama's own gating in front of it. These
 * pin that the press goes through that method when it is there, that it is chosen by shape
 * rather than by name, and that a build without it falls back to the click and says so.
 *
 * <p>Like the video (#136) presses the heart in the cell of the button the comments would press,
 * through the heart's ability in the same way, and the tests at the end pin that too.
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

    /** The heart's assem: PineDrama's long press like, and the click that toggles. */
    public static final class HeartAssem implements VideoDiggAssemAbility {
        int likes;
        int clicks;

        @Override public Long CI0() { return 0L; }
        @Override public void Dw0(String enterMethod) { clicks++; }
        @Override public void MG0() { likes++; }
        @Override public Rect Oq1() { return new Rect(); }
        @Override public boolean nY2() { return false; }
        @Override public boolean vp0(float x, float y) { return false; }
    }

    public static final class Params {
        public final GestureActionsTest.Clip aweme;
        Params(String id) { aweme = new GestureActionsTest.Clip(id); }
        Params(GestureActionsTest.Clip clip) { aweme = clip; }
    }

    private android.app.Activity activity;
    private FrameLayout root;
    /** Native cells own their assems and bound models while the views are alive. */
    private final List<Object> cellBindings = new ArrayList<>();

    @Before public void setUp() {
        var controller = Robolectric.buildActivity(android.app.Activity.class).setup().visible();
        activity = controller.get();
        Utils.setContext(activity);
        // The window in front decides whose feed a gesture belongs to. Resumed again now that
        // Utils follows this test's application, so no earlier test's window counts as in front.
        controller.pause().resume();
        root = new FrameLayout(activity);
        activity.setContentView(root);
        HookStatus.clear();
    }

    @After public void tearDown() {
        GestureActions.forgetDoubleTaps();
        HookStatus.clear();
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

    private static final int PAGE_WIDTH = 200;
    private static final int PAGE_HEIGHT = 300;

    /**
     * PineDrama's pager with a cell a page for each video, laid out the way the feed and a detail
     * page lay them out: the cell at the pager's scroll on screen, the others a page away and
     * clipped. Each cell has its rail with the comment button at the bottom right.
     */
    private VerticalViewPager feed(ViewGroup parent, String... ids) {
        VerticalViewPager pager = new VerticalViewPager(parent.getContext());
        parent.addView(pager, new FrameLayout.LayoutParams(PAGE_WIDTH, PAGE_HEIGHT));
        for (int i = 0; i < ids.length; i++) {
            FrameLayout cell = new FrameLayout(parent.getContext());
            FrameLayout.LayoutParams place = new FrameLayout.LayoutParams(PAGE_WIDTH, PAGE_HEIGHT);
            place.topMargin = i * PAGE_HEIGHT;
            pager.addView(cell, place);
            FrameLayout rail = new FrameLayout(parent.getContext());
            cell.addView(rail, new FrameLayout.LayoutParams(40, 120, Gravity.END | Gravity.BOTTOM));
            View button = new View(parent.getContext());
            rail.addView(button, new FrameLayout.LayoutParams(40, 40));
        }
        return pager;
    }

    private float middle() {
        return activity.getResources().getDisplayMetrics().widthPixels / 2f;
    }

    private static GestureActionsTest.Clip linked(String id) {
        return new GestureActionsTest.Clip(id, "https://www.tiktok.com/@someone/video/" + id, null);
    }

    private String clipboardText() {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
        ClipData clip = clipboard.getPrimaryClip();
        return clip == null ? null : String.valueOf(clip.getItemAt(0).getText());
    }

    private static ViewGroup rail(VerticalViewPager pager, int index) {
        return (ViewGroup) ((ViewGroup) pager.getChildAt(index)).getChildAt(0);
    }

    private static void layOut(View anyView) {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        View decor = anyView.getRootView();
        decor.measure(View.MeasureSpec.makeMeasureSpec(400, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(800, View.MeasureSpec.EXACTLY));
        decor.layout(0, 0, 400, 800);
    }

    private static boolean likeBound() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(GestureActions.LIKE_FAMILY + ": 1 found, 0 missing")) return true;
        }
        return false;
    }

    @Test public void theLikeIsChosenByShapeAndIsNotTheHeartsClick() {
        java.lang.reflect.Method like = GestureActions.likePress(new HeartAssem());

        assertNotNull(like);
        // Six methods on the ability. The click takes a String and the like takes nothing; the
        // names are this build's and the next build renames them.
        assertEquals("MG0", like.getName());
        assertEquals(0, like.getParameterTypes().length);
        assertEquals(void.class, like.getReturnType());
    }

    @Test public void theHeartsClickIsChosenByShape() {
        java.lang.reflect.Method click = GestureActions.heartClick(new HeartAssem());

        assertNotNull(click);
        assertEquals("Dw0", click.getName());
        assertNull(GestureActions.heartClick(new BareAssem()));
    }

    /** A list of PineDrama's that isn't its feed pager, the way a feed on another surface might lay out its cells. */
    public static final class RecyclerView extends FrameLayout {
        public RecyclerView(Context context) { super(context); }
    }

}
