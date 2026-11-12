package app.spicetify.extension.spotify.settings;

import android.app.Activity;
import android.app.Dialog;
import android.content.ComponentName;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Switch;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowDialog;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class SpicetifySettingsScreenTest {
    private final Runnable terminate = SpotifyRestart.terminate;

    @Implements(value = InstalledPatches.class, isInAndroidSdk = false)
    public static class PremiumTab {
        @Implementation public static boolean hidePremiumTab() { return true; }
    }

    @After public void restoreTerminate() {
        SpotifyRestart.terminate = terminate;
    }

    // A root mount install keeps the stock manifest, so starting an added Activity throws there.
    @Test public void opensWithoutStartingAnActivity() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            SpicetifySettingsScreen.open(controller.get());
            assertNull(Shadows.shadowOf(controller.get()).getNextStartedActivity());
            assertTrue(ShadowDialog.getLatestDialog().isShowing());
        }
    }

    @Test public void backClosesOnePageAtATime() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            SpicetifySettingsScreen.open(controller.get());
            Dialog root = ShadowDialog.getLatestDialog();
            SpicetifySettingsScreen.open(controller.get(), SpicetifySettingsScreen.PAGE_SHARING);
            Dialog sharing = ShadowDialog.getLatestDialog();
            sharing.onBackPressed();
            assertFalse(sharing.isShowing());
            assertTrue(root.isShowing());
            root.onBackPressed();
            assertFalse(root.isShowing());
        }
    }

    @Test public void headerBackButtonClosesItsPage() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            SpicetifySettingsScreen.open(controller.get());
            Dialog root = ShadowDialog.getLatestDialog();
            described(root.getWindow().getDecorView(), "Back").performClick();
            assertFalse(root.isShowing());
        }
    }

    @Test public void pagesReturnWhenSpotifyRecreatesItsActivity() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            SpicetifySettingsScreen.open(controller.get());
            SpicetifySettingsScreen.open(controller.get(), SpicetifySettingsScreen.PAGE_SHARING);
            List<Dialog> before = showing();
            controller.recreate();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            for (Dialog page : before) assertFalse(page.isShowing());
            List<String> titles = new ArrayList<>();
            for (Dialog page : showing()) titles.add(page.getWindow().getAttributes().getTitle().toString());
            assertEquals(List.of("Spicetify", "Sharing"), titles);
        }
    }

    @Test public void ignoresAFinishingActivity() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        activity.finish();
        SpicetifySettingsScreen.open(activity);
        assertNull(ShadowDialog.getLatestDialog());
    }

    @Test
    @Config(shadows = PremiumTab.class)
    public void restartBarFollowsChangesAcrossPagesAndRestartsSpotify() {
        var application = RuntimeEnvironment.getApplication();
        application.deleteSharedPreferences("spicetify_patch_settings");
        PatchSettings.initialize(application);
        ComponentName main = new ComponentName(application, "com.spotify.music.MainActivity");
        var packages = Shadows.shadowOf(application.getPackageManager());
        packages.addActivityIfNotPresent(main);
        IntentFilter launcher = new IntentFilter(Intent.ACTION_MAIN);
        launcher.addCategory(Intent.CATEGORY_LAUNCHER);
        packages.addIntentFilterForActivity(main, launcher);
        AtomicBoolean exited = new AtomicBoolean();
        SpotifyRestart.terminate = () -> exited.set(true);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            SpicetifySettingsScreen.open(controller.get());
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            described(root, "Home and navigation, Premium tab").performClick();
            Dialog home = ShadowDialog.getLatestDialog();
            assertEquals(View.GONE, restartBar(root).getVisibility());
            ((Switch) described(home.getWindow().getDecorView(),
                    "Hide Premium tab. Hide the Premium tab in navigation. Your subscription and other ads are unchanged."))
                    .performClick();
            assertEquals(View.VISIBLE, restartBar(home.getWindow().getDecorView()).getVisibility());
            home.onBackPressed();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(View.VISIBLE, restartBar(root).getVisibility());
            restartButton(root).performClick();
            Intent next = Shadows.shadowOf(controller.get()).getNextStartedActivity();
            assertEquals(main, next.getComponent());
            assertTrue((next.getFlags() & Intent.FLAG_ACTIVITY_CLEAR_TASK) != 0);
            assertTrue(exited.get());
        }
    }

    private static List<Dialog> showing() {
        List<Dialog> showing = new ArrayList<>();
        for (Dialog dialog : ShadowDialog.getShownDialogs()) if (dialog.isShowing()) showing.add(dialog);
        return showing;
    }

    private static View restartBar(View page) {
        return (View) restartButton(page).getParent().getParent();
    }

    private static Button restartButton(View view) {
        if (view instanceof Button && "Restart".contentEquals(((Button) view).getText())) return (Button) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                Button found = restartButton(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static View described(View view, String description) {
        if (description.contentEquals(view.getContentDescription() == null ? "" : view.getContentDescription())) return view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = described(group.getChildAt(i), description);
                if (found != null) return found;
            }
        }
        return null;
    }
}
