/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package app.liquidmusic.preview;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.PixelCopy;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import eightbitlab.com.blurview.BlurTarget;
import eightbitlab.com.blurview.BlurView;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import java.io.File;
import java.io.FileOutputStream;

/**
 * The scene of the previews: the floating tab bar and the mini player of Apple Music 7.0 over album
 * covers, with stand-ins for Apple's views, and the helpers that draw it and touch it.
 * <p>
 * Compose binds its main dispatcher to the Choreographer of the first test that uses it, and
 * Robolectric gives every test a new one: the tests that use the liquid tab bar each live in a
 * class of their own, and Gradle runs each class in a new JVM.
 */
@RunWith(RobolectricTestRunner.class)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@Config(sdk = 35, qualifiers = "w411dp-h891dp-night-xxhdpi")
public abstract class PreviewScene {

    protected Activity activity;
    protected BlurView tabBarGlass;
    protected BlurView miniPlayerGlass;
    protected StandInBottomNavigationView tabBar;
    protected FrameLayout miniPlayer;

    @Before
    public void setUp() {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
    }

    @After
    public void reset() {
        BlurView.patched = true;
        app.liquidmusic.extension.LiquidSettings.INSTANCE.reset();
    }

    // region Scene

    protected int dp(float value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, activity.getResources().getDisplayMetrics()));
    }

    protected void buildScene(View behind) throws Exception {
        activity.getWindow().setBackgroundDrawable(new ColorDrawable(Color.BLACK));

        FrameLayout root = new FrameLayout(activity);
        BlurTarget target = new BlurTarget(activity);
        target.setId(R.id.blur_target);
        target.addView(behind, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        root.addView(target, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        miniPlayerGlass = glass(R.id.mini_player_blur);
        miniPlayer = material(R.id.mini_player_content);
        TextView song = label("Glass Hearts   ▶  ▶▶", Color.WHITE, 15);
        song.setPadding(dp(20), 0, dp(20), 0);
        song.setGravity(Gravity.CENTER_VERTICAL);
        miniPlayer.addView(song, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        root.addView(miniPlayerGlass, pill(56, 323));
        root.addView(miniPlayer, pill(56, 323));

        tabBarGlass = glass(R.id.bottom_nav_blur);
        tabBar = new StandInBottomNavigationView(activity);
        tabBar.setId(R.id.bottom_nav_view);
        tabBar.setBackgroundResource(R.drawable.bg_apple_material);
        int[] ids = {R.id.action_listen_now_deprecated, R.id.action_browse_deprecated,
                R.id.action_multiply_radio_deprecated, R.id.action_library_deprecated, R.id.search_fragment_deprecated};
        String[] titles = {"Home", "New", "Radio", "Library", "Search"};
        int[] icons = {R.drawable.tab_home, R.drawable.tab_new, R.drawable.tab_radio, R.drawable.tab_library, R.drawable.tab_search};
        LinearLayout items = new LinearLayout(activity);
        for (int i = 0; i < ids.length; i++) {
            tabBar.getMenu().add(0, ids[i], i, titles[i]).setIcon(icons[i]);
            TextView tab = label(titles[i], i == 0 ? 0xFFFA2D48 : Color.WHITE, 11);
            tab.setGravity(Gravity.CENTER);
            items.addView(tab, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1f));
        }
        tabBar.setSelectedItemId(ids[0]);
        tabBar.selections.clear();
        tabBar.addView(items, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        root.addView(tabBarGlass, pill(64, 247));
        root.addView(tabBar, pill(64, 247));

        activity.setContentView(root);
        ColorDrawable windowBackground = (ColorDrawable) activity.getWindow().getDecorView().getBackground();
        tabBarGlass.setupWith(target, windowBackground);
        miniPlayerGlass.setupWith(target, windowBackground);
        shadowOf(Looper.getMainLooper()).idle();
        // Robolectric draws only for screenshots. A first one lets the glass set the liquid tab bar
        // up, as the first frame does on a phone.
        render(null);
    }

    protected View content() {
        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setPadding(dp(16), dp(440), 0, 0);
        column.addView(label("Recently Played", Color.WHITE, 26));
        column.addView(covers(new int[][]{{0xFFFF2D55, 0xFFFF9F0A}, {0xFF5E5CE6, 0xFF0A84FF}, {0xFF30D158, 0xFFFFD60A}}));
        TextView title = label("New Releases", Color.WHITE, 30);
        title.setPadding(0, dp(24), 0, 0);
        column.addView(title);
        column.addView(covers(new int[][]{{0xFFBF5AF2, 0xFFFF375F}, {0xFFFFD60A, 0xFFFF453A}, {0xFF64D2FF, 0xFF5E5CE6}}));
        return column;
    }

    protected View covers(int[][] gradients) {
        LinearLayout row = new LinearLayout(activity);
        for (int[] colors : gradients) {
            View cover = new View(activity);
            GradientDrawable artwork = new GradientDrawable(GradientDrawable.Orientation.TL_BR, colors);
            artwork.setCornerRadius(dp(10));
            cover.setBackground(artwork);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(dp(150), dp(150));
            params.setMargins(0, dp(12), dp(12), 0);
            row.addView(cover, params);
        }
        return row;
    }

    protected TextView label(String text, int color, float sizeSp) {
        TextView label = new TextView(activity);
        label.setText(text);
        label.setTextColor(color);
        label.setTextSize(sizeSp);
        label.setTypeface(Typeface.DEFAULT_BOLD);
        label.setMaxLines(1);
        return label;
    }

    /** A BlurView as in fragment_music_content.xml. */
    protected BlurView glass(int id) {
        BlurView view = new BlurView(activity);
        view.setId(id);
        view.setBackgroundResource(R.drawable.bg_corner_radius_pill);
        view.setClipToOutline(true);
        return view;
    }

    /** The view drawn over the BlurView, with Apple's translucent material. */
    protected FrameLayout material(int id) {
        FrameLayout view = new FrameLayout(activity);
        view.setId(id);
        view.setBackgroundResource(R.drawable.bg_apple_material);
        return view;
    }

    protected FrameLayout.LayoutParams pill(int heightDp, int bottomDp) {
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(heightDp), Gravity.BOTTOM);
        params.setMargins(dp(16), 0, dp(16), dp(bottomDp));
        return params;
    }

    // endregion

    protected Bitmap render(String name) throws Exception {
        advance(400);
        View decor = activity.getWindow().getDecorView();
        Bitmap bitmap = Bitmap.createBitmap(decor.getWidth(), decor.getHeight(), Bitmap.Config.ARGB_8888);
        int[] result = {-1};
        PixelCopy.request(activity.getWindow(), bitmap, copy -> result[0] = copy, new Handler(Looper.getMainLooper()));
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(PixelCopy.SUCCESS, result[0]);

        if (name == null) return bitmap;
        File directory = new File(System.getProperty("preview.out"));
        assertTrue(directory.isDirectory() || directory.mkdirs());
        try (FileOutputStream out = new FileOutputStream(new File(directory, name + ".png"))) {
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, out);
        }
        return bitmap;
    }

    /**
     * Lets time pass, frame by frame, so Compose and the animations run. Compose hands state
     * changes made outside a composition to its compositions through a manager it starts once per
     * process, on the main thread of the first test: the tests hand them over themselves.
     */
    protected void advance(long millis) {
        for (long t = 0; t < millis; t += 16) {
            androidx.compose.runtime.snapshots.Snapshot.Companion.sendApplyNotifications();
            shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(16));
        }
    }

    /** Center of a tab of the liquid tab bar, in window coordinates (LiquidBottomTabs layout). */
    protected float[] tabCenter(int index) {
        int[] location = new int[2];
        tabBar.getLocationInWindow(location);
        float tabWidth = (tabBar.getWidth() - dp(8)) / 5f;
        return new float[]{location[0] + dp(4) + (index + 0.5f) * tabWidth, location[1] + tabBar.getHeight() / 2f};
    }

    protected void tap(float[] point) {
        View decor = activity.getWindow().getDecorView();
        long time = android.os.SystemClock.uptimeMillis();
        android.view.MotionEvent down = android.view.MotionEvent.obtain(time, time, android.view.MotionEvent.ACTION_DOWN, point[0], point[1], 0);
        decor.dispatchTouchEvent(down);
        advance(48);
        android.view.MotionEvent up = android.view.MotionEvent.obtain(time, time + 48, android.view.MotionEvent.ACTION_UP, point[0], point[1], 0);
        decor.dispatchTouchEvent(up);
        down.recycle();
        up.recycle();
    }

    protected static int countComposeViews(View view) {
        if (view instanceof androidx.compose.ui.platform.ComposeView) return 1;
        int count = 0;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) count += countComposeViews(group.getChildAt(i));
        }
        return count;
    }

    protected static View findComposeView(View view) {
        if (view instanceof androidx.compose.ui.platform.ComposeView) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findComposeView(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    protected static int luminance(int color) {
        return (Color.red(color) * 299 + Color.green(color) * 587 + Color.blue(color) * 114) / 1000;
    }
}
