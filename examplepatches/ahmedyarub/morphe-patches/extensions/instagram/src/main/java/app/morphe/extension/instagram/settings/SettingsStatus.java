/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
*/

package app.morphe.extension.instagram.settings;

/**
 * Which patches were applied. Each flag is switched on by a call the patch inserts at the end of
 * this class's static initialiser (enableSettings), so the extension only acts for patches the
 * user selected.
 */
public class SettingsStatus {
    public static boolean downloadMedia;
    public static void downloadMedia() { downloadMedia = true; }

    public static boolean downloadVoiceMessage;
    public static void downloadVoiceMessage() { downloadVoiceMessage = true; }

    public static boolean saveDeletedMessages;
    public static void saveDeletedMessages() { saveDeletedMessages = true; }

    public static boolean unlimitedReplaysOnEphemeralMedia;
    public static void unlimitedReplaysOnEphemeralMedia() { unlimitedReplaysOnEphemeralMedia = true; }

    // The patches insert their calls into the static initialiser, so there has to be one; with
    // no other static state to set up, this block is what guarantees it.
    static {
        downloadMedia = false;
    }
}
