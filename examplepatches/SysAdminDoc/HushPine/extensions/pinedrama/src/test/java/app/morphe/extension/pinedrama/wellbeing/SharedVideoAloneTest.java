package app.morphe.extension.pinedrama.wellbeing;

import static org.junit.Assert.assertFalse;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Looper;
import android.preference.PreferenceScreen;
import android.view.View;
import android.view.ViewGroup;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.blockauthor.FeedVisibility;
import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.preference.categories.ScreenTimePreferenceCategory;

import com.ss.android.ugc.aweme.common.widget.VerticalViewPager;

import java.lang.ref.WeakReference;
import java.util.concurrent.atomic.AtomicLong;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

/**
 * Open shared videos alone: a link to one video plays that video by itself. The feed lock's link
 * entry finds the video, cold and warm, and the main feed's pager turns its swipe down while that
 * video is the one playing. Another video, or a return after a long time away, ends it.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, qualifiers = "en")
@SuppressWarnings("deprecation")
public class SharedVideoAloneTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private final AtomicLong now = new AtomicLong(1_000L);

    /** PineDrama's main activity as the start page's hook sees it: something with an intent. */
    public static class LinkHost extends Activity {
        void start(Intent intent) {
            setIntent(intent);
        }
    }

    /** A preference fragment only so the framework will hand out a PreferenceScreen. */
    public static class HostFragment extends android.preference.PreferenceFragment {
    }

    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        FeedLock.setClockForTests(now::get);
    }

    @After public void tearDown() {
        seedHomeTab(null);
        PausedProcess.set(false);
    }

    @Test public void theFeedLocksOwnLinkEntryIsNotASharedVideoPlayedAlone() {
        // The lock holds the feed's swipe itself; the link entry it records is not a shared
        // video played alone unless that switch is on, so Auto-advance and the rest see no change.
        Settings.FEED_LOCK.save(true);
        FeedLock.onNewIntent(link("https://www.tiktok.com/@a/video/1"));
        report("linked");
        assertFalse(FeedLock.linkVideoAlone());
    }

    private static Intent link(String url) {
        return new Intent(Intent.ACTION_VIEW, Uri.parse(url));
    }

    private static void report(String awemeId) {
        SessionPlaybackHold.onPlayerProgress(new Object(), awemeId);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    private static View standOnTheFeed(Activity activity) {
        ViewGroup root = activity.findViewById(android.R.id.content);
        View home = new View(activity);
        root.addView(home, new android.widget.FrameLayout.LayoutParams(96, 100,
                android.view.Gravity.BOTTOM));
        home.setSelected(true);
        seedHomeTab(home);
        return home;
    }

    private static void seedHomeTab(View homeTab) {
        ReflectionHelpers.setStaticField(FeedVisibility.class, "homeTabReference",
                new WeakReference<>(homeTab));
    }

    /** A layout pass, so the pagers have the size being on screen is judged by. */
    private static void layOut(Activity activity) {
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        View root = activity.getWindow().getDecorView();
        root.measure(View.MeasureSpec.makeMeasureSpec(400, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(800, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, 400, 800);
    }

    private static View pagerIn(Activity activity) {
        VerticalViewPager pager = new VerticalViewPager(activity);
        ((ViewGroup) activity.findViewById(android.R.id.content)).addView(pager);
        return pager;
    }

    private static View overlay() {
        WeakReference<View> reference =
                ReflectionHelpers.getStaticField(SessionLockOverlay.class, "overlayReference");
        return reference.get();
    }

    private static PreferenceScreen screenTimeRows() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        HostFragment fragment = new HostFragment();
        activity.getFragmentManager().beginTransaction()
                .replace(android.R.id.content, fragment).commit();
        activity.getFragmentManager().executePendingTransactions();
        PreferenceScreen screen = fragment.getPreferenceManager().createPreferenceScreen(activity);
        fragment.setPreferenceScreen(screen);
        new ScreenTimePreferenceCategory(activity, screen);
        return screen;
    }
}
