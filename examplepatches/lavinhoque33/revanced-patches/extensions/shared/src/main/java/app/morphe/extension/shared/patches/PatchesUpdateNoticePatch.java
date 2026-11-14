/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4178
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-12
 */

package app.morphe.extension.shared.patches;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.net.Uri;
import android.view.Gravity;
import android.widget.LinearLayout;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.shared.settings.SharedYouTubeSettings;
import app.morphe.extension.shared.ui.CustomDialog;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Morphe's startup notice adapted to this fork's public patches feeds, never APK distribution. */
@SuppressWarnings("unused")
public final class PatchesUpdateNoticePatch {
    private static final String FEED_ROOT =
            "https://raw.githubusercontent.com/lavinhoque33/revanced-patches/";
    private static final String RELEASE_ROOT = "https://github.com/lavinhoque33/revanced-patches/releases/tag/v";
    // Release and debug application IDs from Morphe Manager's app/build.gradle.kts.
    private static final String[] MANAGER_PACKAGES = {"app.morphe.manager", "app.morphe.manager.debug"};
    private static final long CHECK_INTERVAL_MS = 24 * 60 * 60 * 1000L;
    private static final int MAX_FEED_BYTES = 256 * 1024;
    private static final AtomicBoolean CHECKING = new AtomicBoolean();

    private PatchesUpdateNoticePatch() {
    }

    /** Main activity onCreate injection point. */
    public static void showNoticeIfNeeded(Activity activity) {
        check(activity, false);
    }

    public static void checkNow(Activity activity) {
        check(activity, true);
    }

    private static synchronized void check(Activity activity, boolean manual) {
        try {
            String channel = SharedYouTubeSettings.PATCHES_UPDATE_NOTICE.get();
            if ("OFF".equals(channel)) {
                if (!manual) return;
                channel = PatchesUpdateData.defaultChannel(PatchStatus.PatchVersion());
            }

            long now = System.currentTimeMillis();
            long lastCheck = SharedYouTubeSettings.PATCHES_UPDATE_LAST_CHECK.get();
            if (!manual && now >= lastCheck && now - lastCheck < CHECK_INTERVAL_MS) return;
            if (!CHECKING.compareAndSet(false, true)) {
                if (manual) Utils.showToastShort(str("revanced_patches_update_checking"));
                return;
            }

            SharedYouTubeSettings.PATCHES_UPDATE_LAST_CHECK.save(now);
            WeakReference<Activity> owner = new WeakReference<>(activity);
            String selectedChannel = channel;
            Utils.runOnBackgroundThread(() -> fetchAndShow(owner, selectedChannel, manual));
        } catch (Exception exception) {
            CHECKING.set(false);
            reportFailure(manual, exception);
        }
    }

    private static void fetchAndShow(WeakReference<Activity> owner, String channel, boolean manual) {
        try {
            String installed = PatchStatus.PatchVersion();
            if (PatchesUpdateData.compareVersions(installed, installed) == null) {
                throw new IOException("Unknown installed patches version");
            }

            JSONObject stable = fetchFeed("rvx-latest");
            JSONObject development = "DEV".equals(channel) ? fetchFeed("rvx-dev") : null;
            String stableVersion = stable.optString("version", "");
            String developmentVersion = development == null ? "" : development.optString("version", "");
            String latest = PatchesUpdateData.selectVersion(installed, channel, stableVersion, developmentVersion);
            if (latest == null) {
                if (manual) Utils.showToastShort(str("revanced_patches_update_current"));
                return;
            }

            JSONObject selected = latest.equals(stableVersion) ? stable : development;
            String notes = PatchesUpdateData.releaseNotes(selected.optString("description", ""));
            Utils.runOnMainThread(() -> {
                Activity activity = owner.get();
                if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
                if (!manual && !channel.equals(SharedYouTubeSettings.PATCHES_UPDATE_NOTICE.get())) return;
                if (!manual && isSkipped(latest)) return;

                try {
                    showDialog(activity, installed, latest, notes);
                } catch (Exception exception) {
                    reportFailure(manual, exception);
                }
            });
        } catch (Exception exception) {
            reportFailure(manual, exception);
        } finally {
            CHECKING.set(false);
        }
    }

    private static JSONObject fetchFeed(String branch) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(FEED_ROOT + branch + "/patches-bundle.json")
                .openConnection();
        try {
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(10000);
            connection.setUseCaches(false);
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                throw new IOException("Patches feed HTTP " + connection.getResponseCode());
            }

            try (InputStream input = connection.getInputStream();
                 ByteArrayOutputStream output = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[4096];
                int count;
                while ((count = input.read(buffer)) != -1) {
                    if (output.size() + count > MAX_FEED_BYTES) throw new IOException("Patches feed too large");
                    output.write(buffer, 0, count);
                }
                JSONObject feed = new JSONObject(output.toString(StandardCharsets.UTF_8.name()));
                String version = feed.optString("version", "");
                if (PatchesUpdateData.compareVersions(version, version) == null) {
                    throw new IOException("Invalid patches feed version");
                }
                return feed;
            }
        } finally {
            connection.disconnect();
        }
    }

    private static void reportFailure(boolean manual, Exception exception) {
        Logger.printDebug(() -> "Patches update check failed: " + exception);
        if (manual) Utils.showToastShort(str("revanced_patches_update_error"));
    }

    private static boolean isSkipped(String version) {
        return SharedYouTubeSettings.PATCHES_UPDATE_SKIPPED_VERSIONS.get().contains("\n" + version + "\n");
    }

    private static void skipVersion(String version) {
        if (!isSkipped(version)) {
            SharedYouTubeSettings.PATCHES_UPDATE_SKIPPED_VERSIONS.save(
                    SharedYouTubeSettings.PATCHES_UPDATE_SKIPPED_VERSIONS.get() + "\n" + version + "\n");
        }
    }

    private static void showDialog(Activity activity, String installed, String latest, String notes) {
        String message = str("revanced_patches_update_message", installed, latest);
        if (!notes.isEmpty()) message += "\n\n" + notes;

        var pair = CustomDialog.create(activity, str("revanced_patches_update_title"), message,
                null, null, null, null, null, null, true);
        Dialog dialog = pair.first;
        LinearLayout layout = pair.second;
        LinearLayout buttons = (LinearLayout) layout.getChildAt(layout.getChildCount() - 1);
        buttons.setOrientation(LinearLayout.VERTICAL);
        buttons.setGravity(Gravity.END);
        addButton(buttons, dialog, str("revanced_patches_update_manager"),
                () -> openManager(activity, latest), true);
        addButton(buttons, dialog, str("revanced_patches_update_later"), null, false);
        addButton(buttons, dialog, str("revanced_patches_update_skip"), () -> skipVersion(latest), false);
        dialog.setOnDismissListener(ignored ->
                SharedYouTubeSettings.PATCHES_UPDATE_LAST_CHECK.save(System.currentTimeMillis()));
        dialog.show();
    }

    private static void addButton(LinearLayout buttons, Dialog dialog, String label, Runnable action,
                                  boolean primary) {
        var button = CustomDialog.createButton(buttons.getContext(), dialog, label, action, primary, true);
        var parameters = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, Utils.dipToPixels(36));
        parameters.topMargin = Utils.dipToPixels(8);
        buttons.addView(button, parameters);
    }

    private static void openManager(Activity activity, String version) {
        for (String managerPackage : MANAGER_PACKAGES) {
            try {
                Intent intent = activity.getPackageManager().getLaunchIntentForPackage(managerPackage);
                if (intent != null) {
                    activity.startActivity(intent);
                    return;
                }
            } catch (Exception exception) {
                Logger.printDebug(() -> "Could not open Morphe Manager: " + exception);
            }
        }
        try {
            activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(RELEASE_ROOT + version)));
        } catch (Exception exception) {
            reportFailure(true, exception);
        }
    }
}
