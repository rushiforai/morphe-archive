/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.profile;

import android.app.Activity;
import android.content.Context;

import java.util.function.BooleanSupplier;

import app.morphe.extension.hushthreads.download.MediaSave;
import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.hushthreads.settings.SettingsEntry;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.Setting;

/**
 * A profile picture opened on a profile, shown full size.
 *
 * <p>Tapping the picture on a profile makes Threads draw it again as a bigger circle over the
 * profile, in one Compose function that takes the profile's user id and the callback that puts the
 * circle away. The patch asks {@link #open} first thing in that function. With the switch on, the
 * picture's largest size is looked up the way Threads' own circle looks it up, a full screen
 * {@link PictureViewer} opens with it, and Threads draws nothing. Closing the viewer runs Threads'
 * callback, so the profile is left exactly as Threads leaves it after its own circle.
 *
 * <p>Off, paused, before the settings are ready, a user Threads hasn't loaded, a picture whose
 * address isn't Meta's, no screen to show over, or a failure in here, and Threads draws its own
 * circle as before. The switch applies the next time a picture opens, with no restart.
 */
public final class ProfilePicture {
    static final String OPENED = "opened a profile picture full size";
    /** Counted while the viewer is up: Threads asks again whenever it redraws, and the viewer covers it. */
    static final String COVERED = "the viewer covered Threads' circle";
    /** Prefix for a refusal's count label; one label per fixed reason. */
    static final String LEFT_TO_THREADS = "left the profile picture to Threads: ";

    /** What a profile's picture is, as {@link Source} reads it. */
    static final class Profile {
        final String hd;
        final String regular;
        final String username;

        Profile(String hd, String regular, String username) {
            this.hd = hd;
            this.regular = regular;
            this.username = username;
        }
    }

    /** Everything the viewer reads from Threads, the screen and the network. Tests put their own in. */
    interface Source {
        /** [userId]'s picture as Threads holds it for the screen drawn with [composer], or null. */
        Profile profile(Object composer, String userId);

        /** The Threads screen in front, or null. */
        Activity front();

        /** The bytes at [url], or null. Blocks. */
        byte[] fetch(Context context, String url, BooleanSupplier cancelled);

        /** Runs Threads' [callback] that puts its enlarged picture away. */
        void dismiss(Object callback);
    }

    /** Threads' own model, through the stubs the patch writes. */
    static final Source THREADS = new Source() {
        @Override
        public Profile profile(Object composer, String userId) {
            Object user = ProfileModel.cachedUser(ProfileModel.userCache(ProfileModel.session(composer)), userId);
            if (user == null) return null;
            return new Profile(ProfileModel.hdUrl(ProfileModel.hdPicture(user)),
                ProfileModel.pictureUrl(ProfileModel.picture(user)), ProfileModel.username(user));
        }

        @Override
        public Activity front() {
            return SettingsEntry.frontActivity();
        }

        @Override
        public byte[] fetch(Context context, String url, BooleanSupplier cancelled) {
            return MediaSave.fetchPicture(context, url, cancelled);
        }

        @Override
        public void dismiss(Object callback) {
            ProfileModel.dismiss(callback);
        }
    };

    static volatile Source source = THREADS;

    /** The viewer up now, or being put up, or null. */
    static volatile PictureViewer current;
    /**
     * Set once Threads' own callback failed to put its circle away. The viewer can't hand the
     * profile back cleanly after that, so every picture is left to Threads until the app restarts.
     */
    static volatile boolean handBack;

    private ProfilePicture() { }

    /**
     * First thing in Threads' enlarged profile picture, with the Compose [composer] it was called
     * with, the profile's [userId] and Threads' [dismiss] callback. Answers true when the viewer
     * shows the picture instead, and Threads then draws nothing. Never throws.
     */
    public static boolean open(Object composer, String userId, Object dismiss) {
        try {
            HookStatus.invoked(FamilyNames.FULL_SIZE_PROFILE_PICTURES);
            String off = offBecause();
            if (off == null) {
                PictureViewer up = current;
                if (up != null && up.isUp()) {
                    HookStatus.counted(FamilyNames.FULL_SIZE_PROFILE_PICTURES, COVERED);
                    return true;
                }
                current = null;
                off = openViewer(composer, userId, dismiss);
            }
            if (off != null) {
                HookStatus.counted(FamilyNames.FULL_SIZE_PROFILE_PICTURES, LEFT_TO_THREADS + off);
                return false;
            }
            HookStatus.counted(FamilyNames.FULL_SIZE_PROFILE_PICTURES, OPENED);
            return true;
        } catch (Throwable failure) {
            current = null;
            HookStatus.threw(FamilyNames.FULL_SIZE_PROFILE_PICTURES, "enlarged profile picture", failure);
            return false;
        }
    }

    /** Puts the viewer up for [userId]'s picture, or answers why it didn't. */
    private static String openViewer(Object composer, String userId, Object dismiss) {
        if (userId == null || userId.isEmpty()) return "no user id";
        Source from = source;
        Profile profile = from.profile(composer, userId);
        if (profile == null) return "user not loaded";
        String url = choose(profile.hd, profile.regular);
        if (url == null) return "no picture address";
        Activity activity = from.front();
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return "no screen in front";
        PictureViewer viewer = new PictureViewer(activity, url, profile.username, from, () -> closed(from, dismiss));
        current = viewer;
        // Threads is composing now; the dialog goes up straight after, outside its frame.
        Utils.runOnMainThread(() -> {
            if (!viewer.show()) closed(from, dismiss);
        });
        Logger.printDebug(() -> "Profile picture: opened full size");
        return null;
    }

    /**
     * The address to show: the largest size when it's one of Meta's media addresses, else the
     * picture Threads draws in its circle when that is, else null.
     */
    static String choose(String hd, String regular) {
        if (MediaSave.isMediaAddress(hd)) return hd;
        if (MediaSave.isMediaAddress(regular)) return regular;
        return null;
    }

    /** The viewer went away: runs Threads' callback so the profile drops its enlarged picture. */
    private static void closed(Source from, Object dismiss) {
        try {
            from.dismiss(dismiss);
        } catch (Throwable failure) {
            handBack = true;
            HookStatus.threw(FamilyNames.FULL_SIZE_PROFILE_PICTURES, "put the enlarged picture away", failure);
        } finally {
            current = null;
        }
    }

    /** Why the switch doesn't apply now, or null when it's on. Reads no setting before they're ready. */
    private static String offBecause() {
        if (handBack) return "Threads' callback failed earlier";
        if (!Utils.settingsReady()) return "settings not ready";
        if (!Settings.FULL_SIZE_PROFILE_PICTURES.get()) return Setting.isPaused() ? "HushThreads paused" : "switch off";
        return null;
    }
}
