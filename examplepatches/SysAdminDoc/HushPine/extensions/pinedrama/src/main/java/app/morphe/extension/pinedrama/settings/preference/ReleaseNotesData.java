/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/HushPine
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.pinedrama.settings.preference;

/** The newest curated release summaries carried inside the app. Run tools/gen-release-notes.py after release edits. */
public final class ReleaseNotesData {
    private ReleaseNotesData() {}
    public static final String TEXT = new StringBuilder()
            .append("## 0.0.1 (2026-11-01)\012\012* HushPine starts here. The PineDrama patches used to ship inside Hushfeed's bundle, and they now live in their own repo with their own bundle and signing key. Your settings and saved data carry over when you move from Hushfeed's patches.\012* Press and hold any tab at the top of the feed to open HushPine's settings. It used to work on one tab only, and PineDrama's server decides which middle tab you get, so the shortcut could disappear.\012* Latest first on Following now leaves alone what you've already scrolled past. It used to reorder the whole list each time PineDrama read it.\012* New saves go to `DCIM/PineDrama` by default instead of `DCIM/TikTok`. A folder you picked yourself stays as it is, and files you've already saved don't move.\012* Settings no longer describe buttons and rows PineDrama doesn't have. The story save rows are gone, and so are the Balance and TikTok Minis rows for the profile menu, since PineDrama's gear goes straight to Settings and privacy.\012")
            .toString();

    /** The translated notes for a settings table tag (lower case, as L10n reads it), or null. */
    public static String translated(String tag) {
        if (tag == null) return null;
        switch (tag) {
            default: return null;
        }
    }
}
