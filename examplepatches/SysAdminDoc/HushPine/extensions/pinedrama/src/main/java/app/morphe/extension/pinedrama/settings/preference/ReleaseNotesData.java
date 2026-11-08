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
            .append("## 0.1.1 (2026-11-07)\012\012* Saved posts opened from Favorites play in your Dub priority language. Right after PineDrama started, the app asked for the dub before the video's audio tracks had loaded, so the request got lost and the original audio played.\012\012## 0.1.0 (2026-11-07)\012\012* `Episodes in full screen` is new. Swipe up for the next episode and down for the previous one in PineDrama's full screen view, and an episode that ends moves on to the next instead of looping. Leave full screen and the portrait player is on the episode you stopped at. It's on by default, with a switch under Playback.\012* `Keep list position` is new. History and Favorites on your profile hold your place when you switch tabs or come back from a video, and a list you haven't scrolled still shows what you just watched. It's on by default.\012* `Subtitle and dub preference` is new. Give Playback an ordered list of subtitle languages and another for dubs, like `en, original`. Force subtitle and Force dub use the first one a video has, while Force original subtitle and Force original dub keep the video's own track. When nothing on your list exists, PineDrama's own pick plays as usual. Feed filter can also hide videos without one of your subtitles or dubs, and on Mini Drama a page it would empty keeps one video so there's still something to swipe from. A dub language counts only when the video has a dubbed track in it, since subtitles in your language don't mean a drama is spoken in it. Everything here starts off.\012* The bundle is built on Morphe patcher 2.3.0 now, the one that comes with Morphe Manager 2.5.0 and Morphe Desktop 2.1.0. Update Manager to 2.5.0 or newer before you add this release, since older Manager builds can't load it.\012* Retargeted to PineDrama 47.6.3 (version code 2024706030). All the patches apply to it. Every patch that hooks the app's own code was checked again against 47.6.3's code.\012* Auto-advance no longer depends on a panel check 47.6.3 dropped, and the streak button patch lets go of a getter the new build removed.\012* The Feature Gate Lab's Manage topics and More hashtags per post presets are gone, and AI Self sets one rule fewer. PineDrama 47.6.3 took those gates out of the app.\012* What's new shows up again on a PineDrama you first patched with Hushfeed's bundle. The version you'd dismissed there was higher than HushPine's, so the row stayed hidden.\012* Picking another language on PineDrama's App language page and tapping Done switches the app's language again. PineDrama waited on a Play Store language download that a patched copy never gets, so nothing changed.\012\012## 0.0.1 (2026-11-01)\012\012* HushPine starts here. The PineDrama patches used to ship inside Hushfeed's bundle, and they now live in their own repo with their own bundle and signing key. Your settings and saved data carry over when you move from Hushfeed's patches.\012* Press and hold any tab at the top of the feed to open HushPine's settings. It used to work on one tab only, and PineDrama's server decides which middle tab you get, so the shortcut could disappear.\012* Latest first on Following now leaves alone what you've already scrolled past. It used to reorder the whole list each time PineDrama read it.\012* New saves go to `DCIM/PineDrama` by default instead of `DCIM/TikTok`. A folder you picked yourself stays as it is, and files you've already saved don't move.\012* Settings no longer describe buttons and rows PineDrama doesn't have. The story save rows are gone, and so are the Balance and TikTok Minis rows for the profile menu, since PineDrama's gear goes straight to Settings and privacy.\012")
            .toString();

    /** The translated notes for a settings table tag (lower case, as L10n reads it), or null. */
    public static String translated(String tag) {
        if (tag == null) return null;
        switch (tag) {
            default: return null;
        }
    }
}
