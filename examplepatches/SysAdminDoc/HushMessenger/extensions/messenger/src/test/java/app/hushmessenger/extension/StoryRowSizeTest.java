package app.hushmessenger.extension;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.Context;
import android.os.Looper;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import androidx.recyclerview.widget.RecyclerView;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;

/** #240: the stories row above the chats drawn smaller, laid out wider so it still spans the screen. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36, qualifiers = "w360dp-h640dp-mdpi")
public class StoryRowSizeTest {
    private static final int TILE = 100, ROW = 120, EDGE = 12;

    /** The chat list, which can be scrolled away from its top. */
    static final class Chats extends RecyclerView {
        boolean scrolledDown;

        Chats(Context context) {
            super(context);
        }

        @Override public boolean canScrollVertically(int direction) {
            return direction < 0 && scrolledDown;
        }
    }

    /** The stories row's list: its tiles sit side by side, one TILE wide each. */
    static final class Tray extends RecyclerView {
        final List<Integer> taps = new ArrayList<>();

        Tray(Context context) {
            super(context);
            for (int i = 0; i < 6; i++) {
                View tile = new View(context);
                int index = i;
                tile.setOnClickListener(view -> taps.add(index));
                addView(tile, new ViewGroup.LayoutParams(TILE, TILE));
            }
        }

        @Override protected void onMeasure(int widthSpec, int heightSpec) {
            for (int i = 0; i < getChildCount(); i++) {
                getChildAt(i).measure(MeasureSpec.makeMeasureSpec(TILE, MeasureSpec.EXACTLY), MeasureSpec.makeMeasureSpec(TILE, MeasureSpec.EXACTLY));
            }
            setMeasuredDimension(MeasureSpec.getSize(widthSpec), MeasureSpec.getSize(heightSpec));
        }

        @Override protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
            for (int i = 0; i < getChildCount(); i++) getChildAt(i).layout(i * TILE, 0, (i + 1) * TILE, TILE);
        }
    }

    /** A holder that lays its list out at its own width less its first padding, whatever its padding says now. */
    static final class Stubborn extends FrameLayout {
        Stubborn(Context context) {
            super(context);
        }

        @Override protected void onMeasure(int widthSpec, int heightSpec) {
            int width = MeasureSpec.getSize(widthSpec), height = MeasureSpec.getSize(heightSpec);
            for (int i = 0; i < getChildCount(); i++) {
                getChildAt(i).measure(MeasureSpec.makeMeasureSpec(width - 2 * EDGE, MeasureSpec.EXACTLY), MeasureSpec.makeMeasureSpec(height, MeasureSpec.EXACTLY));
            }
            setMeasuredDimension(width, height);
        }

        @Override protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
            for (int i = 0; i < getChildCount(); i++) {
                View child = getChildAt(i);
                child.layout(EDGE, 0, EDGE + child.getMeasuredWidth(), child.getMeasuredHeight());
            }
        }
    }

    /** A chat's message box, by the name Messenger gives it. */
    public static final class ComposerBarLeftPrimaryButtonsView extends LinearLayout {
        public ComposerBarLeftPrimaryButtonsView(Context context) {
            super(context);
        }
    }

    private Activity activity;
    private Chats chats;
    private FrameLayout trayRow;
    private FrameLayout holder;
    private Tray tray;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        StoryRowSize.resetForTests();
    }

    @After public void forget() {
        StoryRowSize.resetForTests();
    }

    private void open(FrameLayout rowHolder) {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        FrameLayout screen = new FrameLayout(activity);
        chats = new Chats(activity);
        chats.addView(new View(activity), new ViewGroup.LayoutParams(-1, 40));
        trayRow = new FrameLayout(activity);
        holder = rowHolder == null ? new FrameLayout(activity) : rowHolder;
        holder.setPadding(EDGE, 0, EDGE, 0);
        tray = new Tray(activity);
        holder.addView(tray, new FrameLayout.LayoutParams(-1, ROW));
        trayRow.addView(holder, new FrameLayout.LayoutParams(-1, ROW));
        chats.addView(trayRow, new ViewGroup.LayoutParams(-1, ROW));
        for (int i = 0; i < 5; i++) chats.addView(new View(activity), new ViewGroup.LayoutParams(-1, 70));
        screen.addView(chats, new FrameLayout.LayoutParams(-1, -1));
        activity.setContentView(screen);
        settle();
    }

    private void open() {
        open(null);
    }

    private void on() {
        Settings.preferences.edit().putBoolean(StoryRowSize.KEY, true).commit();
    }

    private void level(String level) {
        Settings.preferences.edit().putString(StoryRowSize.LEVEL, level).commit();
    }

    private static void settle() {
        for (int i = 0; i < 4; i++) shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(20));
    }

    private View screen() {
        return activity.getWindow().getDecorView();
    }

    private int room() {
        return holder.getWidth() - 2 * EDGE;
    }

    private void assertStock() {
        assertEquals(1f, tray.getScaleX(), 0f);
        assertEquals(1f, tray.getScaleY(), 0f);
        assertEquals(EDGE, holder.getPaddingRight());
        assertEquals(room(), tray.getWidth());
    }

    private void assertSized(String level) {
        float scale = Integer.parseInt(level) / 100f;
        assertEquals(scale, tray.getScaleX(), 0f);
        assertEquals(scale, tray.getScaleY(), 0f);
        assertEquals(0f, tray.getPivotX(), 0f);
        assertEquals(ROW / 2f, tray.getPivotY(), 0f);
        int wide = Math.round(room() / scale);
        assertEquals("laid out wider by the size it's drawn smaller", wide, tray.getWidth());
        assertEquals(EDGE - (wide - room()), holder.getPaddingRight());
        assertEquals("still ends at the holder's padding", room(), tray.getWidth() * scale, 1f);
    }

    @Test public void offTheRowIsMessengers() {
        open();
        StoryRowSize.resumed(activity);
        settle();
        assertStock();
        assertTrue(Settings.activeAt.isEmpty());
    }

    @Test public void onTheRowIsDrawnSmallerAndLaidOutWider() {
        on();
        open();
        StoryRowSize.resumed(activity);
        settle();
        assertSized(StoryRowSize.STANDARD);
        assertTrue(Settings.activeAt.containsKey(StoryRowSize.KEY));
        assertTrue(Settings.hookErrors.toString(), Settings.hookErrors.isEmpty());
    }

    @Test public void aTapLandsOnTheTileDrawnUnderTheFinger() {
        on();
        open();
        StoryRowSize.resumed(activity);
        settle();
        int[] at = new int[2];
        holder.getLocationInWindow(at);
        // 280 past the padding is the third tile at Messenger's size and the fourth at 90%.
        float x = at[0] + EDGE + 280, y = at[1] + 50;
        long now = SystemClock.uptimeMillis();
        MotionEvent down = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, x, y, 0);
        MotionEvent up = MotionEvent.obtain(now, now + 50, MotionEvent.ACTION_UP, x, y, 0);
        screen().dispatchTouchEvent(down);
        screen().dispatchTouchEvent(up);
        down.recycle();
        up.recycle();
        settle();
        assertEquals(List.of(3), tray.taps);
    }

    @Test public void eachLevelSizesTheRowAndChangingItIsNeverMistakenForTheHolderDroppingIt() {
        on();
        open();
        StoryRowSize.resumed(activity);
        settle();
        // Well past RETRIES picks, back and forth.
        for (int round = 0; round < 2; round++) {
            for (String level : StoryRowSize.LEVELS) {
                level(level);
                StoryRowSize.look(screen());
                settle();
                assertSized(level);
            }
        }
        assertFalse(StoryRowSize.refused);
        assertTrue(Settings.hookErrors.toString(), Settings.hookErrors.isEmpty());
    }

    @Test public void turnedOffTheRowGoesBack() {
        on();
        open();
        StoryRowSize.resumed(activity);
        settle();
        assertSized(StoryRowSize.STANDARD);
        Settings.preferences.edit().putBoolean(StoryRowSize.KEY, false).commit();
        StoryRowSize.look(screen());
        settle();
        assertStock();
    }

    @Test public void leavingTheScreenPutsTheViewsBackForWhoeverGetsThemNext() {
        on();
        open();
        StoryRowSize.resumed(activity);
        settle();
        chats.removeView(trayRow);
        assertEquals(1f, tray.getScaleX(), 0f);
        assertEquals(EDGE, holder.getPaddingRight());
    }

    @Test public void theRowFoundBeforeIsFoundAgainOffTheTop() {
        on();
        open();
        StoryRowSize.resumed(activity);
        settle();
        chats.scrolledDown = true;
        chats.removeView(trayRow);
        chats.addView(trayRow, 0, new ViewGroup.LayoutParams(-1, ROW));
        settle();
        assertSized(StoryRowSize.STANDARD);
    }

    @Test public void offTheTopASidewaysListIsntTakenForTheRow() {
        on();
        open();
        chats.scrolledDown = true;
        StoryRowSize.resumed(activity);
        settle();
        assertStock();
    }

    @Test public void aChatOnScreenIsLeftAlone() {
        on();
        open();
        ((ViewGroup) chats.getParent()).addView(new ComposerBarLeftPrimaryButtonsView(activity), new FrameLayout.LayoutParams(300, 56));
        StoryRowSize.resumed(activity);
        settle();
        assertStock();
    }

    @Test public void withStoriesHiddenThereIsNoRowToSize() {
        on();
        Settings.preferences.edit().putBoolean("stories", true).commit();
        open();
        StoryRowSize.resumed(activity);
        settle();
        assertStock();
    }

    @Test public void aHolderThatWontLayItOutWiderGetsEverythingBackAndIsLeftAlone() {
        on();
        open(new Stubborn(RuntimeEnvironment.getApplication()));
        StoryRowSize.resumed(activity);
        settle();
        assertTrue(StoryRowSize.refused);
        assertStock();
        assertTrue(Settings.hookErrors.containsKey(StoryRowSize.KEY));
        // Nothing more is tried this run.
        StoryRowSize.look(screen());
        settle();
        assertStock();
    }

    @Test public void theSizeDefaultsToNinetyPercent() {
        assertEquals("90", StoryRowSize.picked());
        level("80");
        assertEquals("80", StoryRowSize.picked());
        level("50");
        assertEquals("a size this build doesn't offer", "90", StoryRowSize.picked());
        assertEquals(0.75f, StoryRowSize.scale("75"), 0f);
    }

    @Test public void theSizesSitUnderTheSwitchAndATapSavesOne() {
        String[] spec = null;
        for (String[] control : SettingsActivity.CONTROLS) if (StoryRowSize.KEY.equals(control[0])) spec = control;
        assertNotNull(spec);
        assertEquals("theme", spec[3]);
        try (var page = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = page.get().getWindow().getDecorView();
            RadioGroup group = root.findViewWithTag("story_row_size_choices");
            assertNotNull(group);
            View row = root.findViewWithTag(StoryRowSize.KEY);
            assertSame("inside the switch's block", ((View) row.getParent()).getParent(), group.getParent());
            assertEquals(StoryRowSize.LEVELS.length, group.getChildCount());
            RadioButton standard = root.findViewWithTag(StoryRowSize.LEVEL + "_90");
            assertTrue("90% shows until one is picked", standard.isChecked());
            RadioButton smaller = root.findViewWithTag(StoryRowSize.LEVEL + "_80");
            assertEquals("80%", smaller.getText().toString());
            smaller.performClick();
            assertEquals("80", Settings.preferences.getString(StoryRowSize.LEVEL, null));
            assertTrue(smaller.isChecked());
            assertFalse(standard.isChecked());
            assertEquals("The stories row shows at 80%", ShadowToast.getTextOfLatestToast());
        }
    }

    @Test public void aBackupCarriesTheSizeOnlyWithTheSwitch() {
        Settings.preferences.edit().putBoolean(StoryRowSize.KEY, true).putString(StoryRowSize.LEVEL, "85").commit();
        String backup = ChoiceCodec.encode(Settings.preferences, Set.of(StoryRowSize.KEY));
        assertEquals(Map.of("paused", false, StoryRowSize.KEY, true, StoryRowSize.LEVEL, "85"), ChoiceCodec.parse(backup));
        assertFalse(ChoiceCodec.encode(Settings.preferences, Set.of("stories")).contains(StoryRowSize.LEVEL));
    }
}
