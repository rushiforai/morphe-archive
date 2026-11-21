/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.youtube.patches.video;

import static app.morphe.extension.youtube.patches.video.VideoQualityPatch.AUTOMATIC_VIDEO_QUALITY_VALUE;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.net.ConnectivityManager;
import android.net.NetworkInfo.DetailedState;
import android.view.View;
import android.widget.ListView;

import org.junit.Before;
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
import org.robolectric.shadows.ShadowNetworkInfo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.utils.PatchStatus;
import app.morphe.extension.youtube.patches.video.VideoQualityPatch.AutomaticVideoQualityMenu;
import app.morphe.extension.youtube.patches.video.VideoQualityPatch.VideoQualityInterface;
import app.morphe.extension.youtube.patches.video.VideoQualityPatch.VideoQualityMenuInterface;
import app.morphe.extension.youtube.shared.VideoInformation;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.utils.VideoUtils;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34, shadows = OverlayVideoQualityTest.PatchedVideoPlayback.class)
public class OverlayVideoQualityTest {
    private final VideoQualityInterface auto = new Quality("Auto", AUTOMATIC_VIDEO_QUALITY_VALUE);
    private final VideoQualityInterface hd = new Quality("1080p", 1080);
    private final VideoQualityInterface sd = new Quality("480p", 480);
    private final VideoQualityInterface[] qualities = {auto, hd, sd};
    private final List<VideoQualityInterface> nativeSelections = new ArrayList<>();
    private final RecordingMenu nativeMenu = new RecordingMenu();

    @Before
    public void bindPlayer() {
        Context app = RuntimeEnvironment.getApplication();
        PackageInfo info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.versionName = "21.45.90";
        info.applicationInfo = app.getApplicationInfo();
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        Utils.setContext(app);
        VideoQualityPatch.newVideoStarted();
        VideoInformation.setVideoId("first-video");
        VideoQualityPatch.setVideoQuality(qualities, nativeMenu, 1);
        Settings.DEFAULT_VIDEO_QUALITY_WIFI.save(1080);
        Settings.DEFAULT_VIDEO_QUALITY_MOBILE.save(720);
        Settings.REMEMBER_VIDEO_QUALITY_LAST_SELECTED.save(false);
        Settings.REMEMBER_VIDEO_QUALITY_LAST_SELECTED_TOAST.save(false);
        setNetwork(ConnectivityManager.TYPE_WIFI);
    }

    @Test
    public void manualAndAutoDispatchDifferentNativeActionsWithoutChangingEffectiveQuality() {
        assertTrue(VideoQualityPatch.applyOverlayQuality("first-video", qualities, nativeMenu, 2));
        assertEquals(List.of(sd), nativeSelections);
        assertSame(sd, VideoQualityPatch.getOverlayQualityChoice());
        assertSame(hd, VideoQualityPatch.getEffectiveQuality());
        assertTrue(VideoQualityPatch.useAdvancedVideoQualitySetting("first-video"));

        assertTrue(VideoQualityPatch.applyOverlayQuality("first-video", qualities, nativeMenu, 0));
        assertEquals(List.of(sd), nativeSelections);
        assertEquals(1, nativeMenu.autoCalls);
        assertFalse(nativeMenu.usedAdvancedPolicyDuringAuto);
        assertFalse(VideoQualityPatch.useAdvancedVideoQualitySetting("first-video"));
        assertTrue(VideoQualityPatch.useAdvancedVideoQualitySetting("unrelated-video"));
        assertSame(auto, VideoQualityPatch.getOverlayQualityChoice());
        assertEquals(1080, Settings.DEFAULT_VIDEO_QUALITY_WIFI.get().intValue());
        assertEquals(720, Settings.DEFAULT_VIDEO_QUALITY_MOBILE.get().intValue());

        VideoQualityPatch.setVideoQuality(qualities, nativeMenu, 2);
        assertSame(sd, VideoQualityPatch.getEffectiveQuality());
        assertSame(auto, VideoQualityPatch.getOverlayQualityChoice());

        VideoQualityPatch.onVideoIntentLoaded(Map.of(), "next-video");
        VideoInformation.setVideoId("next-video");
        assertNull(VideoQualityPatch.getOverlayQualityChoice());
        assertTrue(VideoQualityPatch.useAdvancedVideoQualitySetting("next-video"));
    }

    @Test
    public void rememberAutoAndManualOnlyOnTheActiveNetwork() {
        setNetwork(ConnectivityManager.TYPE_MOBILE);
        Settings.REMEMBER_VIDEO_QUALITY_LAST_SELECTED.save(true);

        assertTrue(VideoQualityPatch.applyOverlayQuality("first-video", qualities, nativeMenu, 2));
        assertEquals(480, Settings.DEFAULT_VIDEO_QUALITY_MOBILE.get().intValue());

        assertTrue(VideoQualityPatch.applyOverlayQuality("first-video", qualities, nativeMenu, 0));
        assertEquals(AUTOMATIC_VIDEO_QUALITY_VALUE, Settings.DEFAULT_VIDEO_QUALITY_MOBILE.get().intValue());
        assertEquals(1080, Settings.DEFAULT_VIDEO_QUALITY_WIFI.get().intValue());
    }

    @Test
    public void nativeReturnWithoutPresetDispatchKeepsPriorSelectionAndDefault() {
        assertTrue(VideoQualityPatch.applyOverlayQuality("first-video", qualities, nativeMenu, 2));
        nativeMenu.dispatchAuto = false;
        Settings.REMEMBER_VIDEO_QUALITY_LAST_SELECTED.save(true);

        assertFalse(VideoQualityPatch.applyOverlayQuality("first-video", qualities, nativeMenu, 0));
        assertEquals(1, nativeMenu.autoCalls);
        assertSame(sd, VideoQualityPatch.getOverlayQualityChoice());
        assertTrue(VideoQualityPatch.useAdvancedVideoQualitySetting("first-video"));
        assertEquals(1080, Settings.DEFAULT_VIDEO_QUALITY_WIFI.get().intValue());
    }

    @Test
    public void reopenedPickerExposesAutoAsCheckedInsteadOfTheEffectiveResolution() {
        assertTrue(VideoQualityPatch.applyOverlayQuality("first-video", qualities, nativeMenu, 0));
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        VideoUtils.showOverlayVideoQualityDialog(activity);

        Dialog dialog = ShadowDialog.getLatestDialog();
        assertNotNull(dialog);
        ListView list = dialog.findViewById(android.R.id.list);
        assertNotNull(list);
        assertEquals(0, list.getCheckedItemPosition());
        int width = View.MeasureSpec.makeMeasureSpec(600, View.MeasureSpec.EXACTLY);
        int height = View.MeasureSpec.makeMeasureSpec(600, View.MeasureSpec.EXACTLY);
        list.measure(width, height);
        list.layout(0, 0, 600, 600);
        View autoRow = list.getChildAt(0);
        assertTrue(autoRow.createAccessibilityNodeInfo().isCheckable());
        assertTrue(autoRow.createAccessibilityNodeInfo().isChecked());
        assertFalse(list.getChildAt(1).createAccessibilityNodeInfo().isChecked());
        assertSame(hd, VideoQualityPatch.getEffectiveQuality());
        dialog.dismiss();
    }

    @Test
    public void noAdaptiveBridgeLeavesOnlyUsableManualRows() {
        VideoQualityMenuInterface manualOnlyMenu = nativeSelections::add;
        VideoQualityPatch.setVideoQuality(qualities, manualOnlyMenu, 1);
        assertFalse(VideoQualityPatch.applyOverlayQuality("first-video", qualities, manualOnlyMenu, 0));

        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        VideoUtils.showOverlayVideoQualityDialog(activity);
        Dialog dialog = ShadowDialog.getLatestDialog();
        assertNotNull(dialog);
        ListView list = dialog.findViewById(android.R.id.list);
        assertEquals(2, list.getCount());
        assertEquals("1080p", list.getItemAtPosition(0));
        list.performItemClick(null, 1, list.getItemIdAtPosition(1));
        assertEquals(List.of(sd), nativeSelections);
        assertSame(sd, VideoQualityPatch.getOverlayQualityChoice());
    }

    @Test
    public void openedDialogCannotChangeAReplacementVideoOrController() {
        VideoInformation.setVideoId("next-video");
        assertFalse(VideoQualityPatch.applyOverlayQuality("first-video", qualities, nativeMenu, 0));
        assertEquals(0, nativeMenu.autoCalls);
        assertTrue(nativeSelections.isEmpty());

        List<VideoQualityInterface> nextSelections = new ArrayList<>();
        VideoQualityMenuInterface nextMenu = nextSelections::add;
        VideoQualityPatch.setVideoQuality(qualities, nextMenu, 1);
        assertFalse(VideoQualityPatch.applyOverlayQuality("next-video", qualities, nativeMenu, 0));
        assertEquals(0, nativeMenu.autoCalls);
        assertTrue(nativeSelections.isEmpty());
        assertTrue(nextSelections.isEmpty());

        VideoQualityPatch.applyOverlayQuality("next-video", qualities, nextMenu, 2);
        assertEquals(List.of(sd), nextSelections);
    }

    @Test
    public void aReplacedQualityListInvalidatesTheOldIndex() {
        VideoQualityInterface[] replacement = {auto, hd, new Quality("360p", 360)};
        VideoQualityPatch.setVideoQuality(replacement, nativeMenu, 1);
        assertFalse(VideoQualityPatch.applyOverlayQuality("first-video", qualities, nativeMenu, 0));
        assertFalse(VideoQualityPatch.applyOverlayQuality("first-video", qualities, nativeMenu, 2));
        assertEquals(0, nativeMenu.autoCalls);
        assertTrue(nativeSelections.isEmpty());
    }

    @Test
    public void resettingPlayerStateInvalidatesThePreviousDialog() {
        VideoQualityPatch.newVideoStarted();
        assertFalse(VideoQualityPatch.applyOverlayQuality("first-video", qualities, nativeMenu, 2));
        assertTrue(nativeSelections.isEmpty());
    }

    private static void setNetwork(int type) {
        Context context = RuntimeEnvironment.getApplication();
        ConnectivityManager connectivity = context.getSystemService(ConnectivityManager.class);
        Shadows.shadowOf(connectivity).setActiveNetworkInfo(
                ShadowNetworkInfo.newInstance(DetailedState.CONNECTED, type, 0, true, true));
    }

    private final class RecordingMenu implements AutomaticVideoQualityMenu {
        private boolean dispatchAuto = true;
        private int autoCalls;
        private boolean usedAdvancedPolicyDuringAuto;

        @Override
        public void patch_setQuality(VideoQualityInterface quality) {
            nativeSelections.add(quality);
        }

        @Override
        public void patch_setAutomaticQuality() {
            autoCalls++;
            usedAdvancedPolicyDuringAuto = VideoQualityPatch.useAdvancedVideoQualitySetting("first-video");
            if (dispatchAuto) VideoQualityPatch.onAutomaticQualityDispatched();
        }
    }

    @Implements(value = PatchStatus.class, isInAndroidSdk = false)
    public static class PatchedVideoPlayback {
        @Implementation
        protected static boolean VideoPlayback() {
            return true;
        }
    }

    private record Quality(String patch_getQualityName, int patch_getResolution) implements VideoQualityInterface {}
}
