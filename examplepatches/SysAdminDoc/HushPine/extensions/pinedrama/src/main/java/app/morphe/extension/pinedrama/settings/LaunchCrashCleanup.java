/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.settings;

import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.pinedrama.featuregatelab.FeatureGateLabStore;
import app.morphe.extension.pinedrama.privacy.DeviceIdentity;
import app.morphe.extension.pinedrama.settings.preference.ReleaseNotes;

import java.util.Arrays;

/**
 * PineDrama's own recovery from crashes at launch. On the third launch crash in a row it deletes
 * every preferences file whose name isn't on its keep-list, and HushPine's weren't on it: a crash
 * loop erased every setting and the Lab's rules one start before HushPine's safe mode could
 * pause anything.
 *
 * <p>This runs where PineDrama builds that list, which can be inside its crash handler and before
 * HushPine has a context, so it touches nothing but the array it is given. The names are
 * compile-time constants, and reading them loads none of the classes they come from.
 */
public final class LaunchCrashCleanup {
    /** Every preferences file HushPine writes. A new one belongs here as well. */
    static final String[] HUSHPINE_FILES = {
            Setting.PREFERENCES_NAME,
            FeatureGateLabStore.PREFS_NAME,
            ReleaseNotes.PREFS_NAME,
            DeviceIdentity.PREFERENCES,
            app.morphe.extension.pinedrama.inbox.GroupChats.PREFS_NAME,
            app.morphe.extension.pinedrama.comment.StickerRecents.PREFS_NAME,
    };

    private LaunchCrashCleanup() {
    }

    /** PineDrama's keep-list with HushPine's files after it. */
    public static String[] keepHushPineFiles(String[] kept) {
        if (kept == null) return HUSHPINE_FILES.clone();
        String[] joined = Arrays.copyOf(kept, kept.length + HUSHPINE_FILES.length);
        System.arraycopy(HUSHPINE_FILES, 0, joined, kept.length, HUSHPINE_FILES.length);
        return joined;
    }
}
