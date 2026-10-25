/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.comment;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.EarlySwitch;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * The switch in front of Allow photo comments (#156).
 *
 * <p>The comment box builds its gallery tab when the {@code comment_photo_publish} value allows
 * it, and that value goes through the app's comment protocol on the way. TikTok's passes it
 * through. PineDrama's answers no whatever the value says. With the switch on, PineDrama's
 * protocol hands the value back the way TikTok's does; with it off, and while Hushfeed is paused,
 * PineDrama answers as it ships.
 *
 * <p>The photo button then has one more stop before the album opens. It asks the creation-tools
 * plugin service whether the {@code comment_photo_<method>} entry is installed, and PineDrama's
 * stand-in for that service says no to every entry. With the switch on, the stand-in says yes to
 * the comment photo entries alone, so the album opens; every other entry (the photo editor, the
 * camera, templates) still gets PineDrama's no.
 */
@SuppressWarnings("unused")
public final class CommentPhotos {
    /** {@link Settings#PINEDRAMA_COMMENT_PHOTOS}'s key, for a read before the settings context. */
    static final String SWITCH_KEY = "pinedrama_comment_photos";

    /** What the comment box puts in front of its shoot-enter method when it asks for the album. */
    static final String ALBUM_ENTRY_PREFIX = "comment_photo_";

    private CommentPhotos() {
    }

    public static boolean isOn() {
        return Utils.getContext() != null ? Settings.PINEDRAMA_COMMENT_PHOTOS.get() : EarlySwitch.isOn(SWITCH_KEY);
    }

    /** True when the plugin service should report {@code entry} as installed. */
    public static boolean allowPluginEntry(String entry) {
        return entry != null && entry.startsWith(ALBUM_ENTRY_PREFIX) && isOn();
    }
}
