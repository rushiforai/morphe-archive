package app.afterglow.extension.ui;

import android.content.SharedPreferences;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.playback.PlayerBehavior;
import app.afterglow.extension.playback.Autoplay;
import app.afterglow.extension.playback.Captions;
import app.afterglow.extension.navigation.Subbar;
import app.afterglow.extension.navigation.ShortsProgressPolicy;
import app.afterglow.extension.navigation.ShortsFullscreenPolicy;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.LiteMode;
import app.afterglow.extension.settings.TweakCatalog;
import app.afterglow.extension.sponsorblock.SponsorCategory;
import app.afterglow.extension.sponsorblock.SponsorSettings;
import app.afterglow.extension.ui.SettingsModel.Page;
import app.afterglow.extension.ui.SettingsModel.Row;
import app.afterglow.extension.ui.SettingsModel.SearchEntry;

/**
 * JVM check of the installed-tweak row rules (SettingsBehavior.shown), run by
 * tools/check_settings_ui.py. Uses the real spec and logic with an in-memory
 * SharedPreferences, in two cases: every tweak with a named patch installed, and only "Shorts layout and buttons" installed.
 */
public final class SettingsVisibilityTest {
    /**
     * The tweak ids the named tweak patches mark (every markTweakInstalled("...") under
     * patches/src), passed in by check_settings_ui.py so new tweak batches need no edit here.
     */
    static String[] currentTweaks = new String[0];

    private static int failures;
    private static int checks;
    private enum CaptionHint { UNKNOWN, OFF, ON, ON_RECOMMENDED, NEW_STATE }

    public static void main(String[] args) throws Exception {
        MemPrefs prefs = new MemPrefs();
        Field field = AfterglowPrefs.class.getDeclaredField("prefs");
        field.setAccessible(true);
        field.set(null, prefs);

        // ---- case 1: every tweak with a named patch. Expectations are derived from TweakCatalog
        // and the spec, so adding tweak batches or implemented keys needs no edit here.
        currentTweaks = args;
        check("named tweak patches passed in", true, args.length > 0);
        install(args);
        for (boolean advanced : new boolean[] {false, true}) {
            AfterglowPrefs.setBool("advancedMode", advanced);
            String c = "all tweaks, advanced " + (advanced ? "on" : "off") + ": ";
            checkKeyedRows(c);
            checkDerivedRows(c);
            expectRows(c, "page:about.credits", allRows("page:about.credits"));
            expectAbout(c);
            check(c + "root.search shown", true, SettingsBehavior.shown(SettingsBehavior.row("root.search")));
            check(c + "Lite Mode available", true, SettingsBehavior.shown(SettingsBehavior.row("root.liteMode")));
            for (String destination : new String[] {"root.aiHome", "root.abLab", "root.vault"})
                check(c + destination + " available", true, SettingsBehavior.shown(SettingsBehavior.row(destination)));
            check(c + "tools page is available", true, SettingsBehavior.shown(SettingsBehavior.row("root.tools")));
            check(c + "theme presets available", true, SettingsBehavior.shown(SettingsBehavior.row("themes.themeStudio")));
            expectSearch(c, advanced, list("Advanced", "Theme Presets", "GradientStart", "PrimaryText", "LiteMode"), list());
        }

        for (String owner : new String[] {"downloads", "ai-home", "ab-lab", "control-center"}) {
            install(owner);
            String[] owners = {"downloads", "ai-home", "ab-lab", "control-center"};
            String[] keys = {"destination.vault", "destination.aiHome", "destination.experimentLab", "destination.controlCenter"};
            for (int i = 0; i < owners.length; i++)
                check(owner + " destination ownership " + keys[i], owner.equals(owners[i]), SettingsBehavior.keyVisible(keys[i]));
        }

        // ---- case 2: only "Shorts layout and buttons"
        install("shorts-layout");
        for (boolean advanced : new boolean[] {false, true}) {
            AfterglowPrefs.setBool("advancedMode", advanced);
            String c = "shorts-layout only, advanced " + (advanced ? "on" : "off") + ": ";
            checkKeyedRows(c);
            // iOS shows Shorts > Layout & Buttons only in advanced mode (Settings.x:3013).
            expectRows(c, "page:root", advanced ? list("root.search", "root.shorts", "root.about") : list("root.search", "root.about"));
            expectRows(c, "page:shorts", advanced ? list("shorts.spacer1", "shorts.layoutButtons") : list());
            List<String> layout = new ArrayList<>();
            for (Row row : SettingsBehavior.page("page:shorts.layoutButtons").rows) {
                if (row.key != null && TweakCatalog.isShown(row.key)) layout.add(row.id);
            }
            layout.addAll(list("shortsLayout.reset.spacer", "shortsLayout.reset.header", "shortsLayout.reset.action"));
            int implemented = 0;
            for (String key : TweakCatalog.tweak("shorts-layout").keys) if (TweakCatalog.SHOWN_KEYS.contains(key)) implemented++;
            check(c + "every implemented Shorts layout key has a row", implemented, layout.size() - 3);
            expectRows(c, "page:shorts.layoutButtons", layout);
            expectAbout(c);
            expectHidden(c, "root.privacyAds", "root.player", "root.feed", "root.comments", "root.interface");
            List<String> shownSearch = advanced ? list("HideShortsLike", "Advanced") : list("Advanced");
            List<String> hiddenSearch = advanced ? list("RemoveAds", "HideShortsLogo", "CommentsHeader") : list("HideShortsLike", "RemoveAds");
            expectSearch(c, advanced, shownSearch, hiddenSearch);
        }

        install("player-overlay");
        AfterglowPrefs.remove("pauseOnOverlay");
        check("overlay alone exposes pause on overlay", true, SettingsBehavior.keyVisible("pauseOnOverlay"));
        check("pause on overlay defaults off", false, AfterglowPrefs.getBool("pauseOnOverlay"));
        AfterglowPrefs.setBool("advancedMode", false);
        check("overlay page requires advanced mode", false, SettingsBehavior.shown(SettingsBehavior.row("player.overlay")));
        AfterglowPrefs.setBool("advancedMode", true);
        check("overlay page available in advanced mode", true, SettingsBehavior.shown(SettingsBehavior.row("player.overlay")));
        check("overlay alone does not expose fullscreen automation", false, SettingsBehavior.keyVisible("autoFullscreen"));
        install("shorts-layout");
        check("other tweak does not expose pause on overlay", false, SettingsBehavior.keyVisible("pauseOnOverlay"));

        install("overlay-buttons");
        AfterglowPrefs.remove("muteButton"); AfterglowPrefs.remove("lockButton");
        check("buttons alone expose mute", true, SettingsBehavior.keyVisible("muteButton"));
        check("buttons alone expose lock", true, SettingsBehavior.keyVisible("lockButton"));
        check("mute button defaults on", true, AfterglowPrefs.getBool("muteButton"));
        check("lock button defaults on", true, AfterglowPrefs.getBool("lockButton"));
        check("buttons alone expose eye modes", true, SettingsBehavior.keyVisible("overlayDeclutterButton"));
        check("eye button defaults on", true, AfterglowPrefs.getBool("overlayDeclutterButton"));
        check("overlay reset is owned by overlay buttons", true, SettingsBehavior.keyVisible("action.resetOverlayMode"));
        check("controls sheet button is available", true, SettingsBehavior.keyVisible("controlsSheetButton"));
        check("buttons alone do not expose overlay pause", false, SettingsBehavior.keyVisible("pauseOnOverlay"));
        check("buttons alone do not expose automatic fullscreen", false, SettingsBehavior.keyVisible("autoFullscreen"));
        install("player-overlay");
        check("player overlay does not own mute button", false, SettingsBehavior.keyVisible("muteButton"));
        check("player overlay does not own lock button", false, SettingsBehavior.keyVisible("lockButton"));
        check("player overlay does not own eye button", false, SettingsBehavior.keyVisible("overlayDeclutterButton"));

        // Theme effects remain independently selectable, including internal color/image keys.
        install("theme-studio");
        check("studio alone opens editor", true, SettingsBehavior.keyVisible("destination.themeStudio"));
        check("studio alone hides Glow Lab", false, SettingsBehavior.keyVisible("destination.glowLab"));
        check("studio alone hides typography", false, SettingsBehavior.keyVisible("theme_fontMode"));
        check("studio alone hides native scrubber image", false, SettingsBehavior.keyVisible("seekBarScrubberImage"));
        install("glow");
        check("glow alone opens Glow Lab", true, SettingsBehavior.keyVisible("destination.glowLab"));
        check("glow alone exposes global color", true, SettingsBehavior.keyVisible("theme_glowColor"));
        check("glow alone exposes layers", true, SettingsBehavior.keyVisible("theme_glowLayers"));
        check("glow alone hides seek gradient", false, SettingsBehavior.keyVisible("seekBarGradient"));
        install("typography");
        check("typography alone exposes fonts", true, SettingsBehavior.keyVisible("theme_fontMode"));
        check("typography alone hides Theme Studio", false, SettingsBehavior.keyVisible("destination.themeStudio"));
        install("seek-bar");
        check("seek bar alone exposes image", true, SettingsBehavior.keyVisible("seekBarScrubberImage"));
        check("seek bar alone exposes played color", true, SettingsBehavior.keyVisible("theme_seekBar"));
        check("seek bar alone exposes live scrubber", true, SettingsBehavior.keyVisible("theme_seekBarScrubberLive"));
        check("seek bar alone exposes heatwaves", true, SettingsBehavior.keyVisible("hideHeatwaves"));
        Row gradient = SettingsBehavior.row("effects.seekBarGradient");
        AfterglowPrefs.remove("seekBarGradient");
        check("gradient switch reflects effective default", true, SettingsBehavior.switchValue(gradient));
        AfterglowPrefs.setBool("seekBarGradient", false);
        check("gradient switch reflects explicit false", false, SettingsBehavior.switchValue(gradient));

        install();
        AfterglowPrefs.setBool("persistentProgressBar", true);
        check("uninstalled seek owner preserves hidden progress", 0, Float.floatToIntBits(PlayerBehavior.progressVisibility(0f)));
        check("uninstalled seek owner hides persistent control", false, SettingsBehavior.keyVisible("persistentProgressBar"));
        install("glow");
        check("glow does not force progress visibility", Float.floatToIntBits(.4f), Float.floatToIntBits(PlayerBehavior.progressVisibility(.4f)));
        install("seek-bar");
        check("seek owner exposes persistent control", true, SettingsBehavior.keyVisible("persistentProgressBar"));
        for (float nativeFraction : new float[]{0f, .25f, .5f, 1f}) {
            check("persistent native track is visible", Float.floatToIntBits(1f), Float.floatToIntBits(PlayerBehavior.progressVisibility(nativeFraction)));
        }
        AfterglowPrefs.remove("persistentProgressBar");
        for (float nativeFraction : new float[]{0f, -0f, .25f, .5f, 1f, Float.NaN}) {
            check("default progress preserves native fraction bits", Float.floatToIntBits(nativeFraction), Float.floatToIntBits(PlayerBehavior.progressVisibility(nativeFraction)));
        }
        AfterglowPrefs.setBool("liteModeEnabled", true);
        check("Lite Mode does not force persistent track", 0, Float.floatToIntBits(PlayerBehavior.progressVisibility(0f)));
        AfterglowPrefs.setBool("persistentProgressBar", true);
        check("Lite Mode honors explicit persistent track", Float.floatToIntBits(1f), Float.floatToIntBits(PlayerBehavior.progressVisibility(0f)));
        AfterglowPrefs.setBool("liteModeEnabled", false);
        AfterglowPrefs.remove("persistentProgressBar");
        check("persistent reset restores native hidden track", 0, Float.floatToIntBits(PlayerBehavior.progressVisibility(0f)));

        for (String key : new String[]{"hideShortsSearch", "hideShortsCamera", "hideShortsMore", "hideShortsLens"}) {
            AfterglowPrefs.remove(key);
            install("shorts", "player-overlay");
            check("other player owners do not expose " + key, false, SettingsBehavior.keyVisible(key));
            install("shorts-layout");
            check("Shorts layout owns " + key, true, SettingsBehavior.keyVisible(key));
            check("Shorts native button defaults stay visible " + key, false, AfterglowPrefs.getBool(key));
        }

        install("shorts");
        AfterglowPrefs.remove("pinchToFullscreenShorts");
        check("Shorts pinch defaults OFF", false, ShortsFullscreenPolicy.enabled());
        check("Shorts exposes pinch setting", true, SettingsBehavior.keyVisible("pinchToFullscreenShorts"));
        check("Shorts pinch OFF preserves disabled capability", false, ShortsFullscreenPolicy.capability(false));
        check("Shorts pinch OFF preserves native capability", true, ShortsFullscreenPolicy.capability(true));
        AfterglowPrefs.setBool("pinchToFullscreenShorts", true);
        check("Shorts pinch enables native recognizer", true, ShortsFullscreenPolicy.capability(false));
        check("Shorts pinch preserves enabled recognizer", true, ShortsFullscreenPolicy.capability(true));
        install("shorts-layout");
        check("Layout does not own pinch behavior", false, SettingsBehavior.keyVisible("pinchToFullscreenShorts"));
        check("Layout does not force pinch capability", false, ShortsFullscreenPolicy.capability(false));
        install();
        check("Absent Shorts preserves native pinch", true, ShortsFullscreenPolicy.capability(true));
        check("Absent Shorts does not enable pinch", false, ShortsFullscreenPolicy.capability(false));
        install("shorts");
        AfterglowPrefs.remove("pinchToFullscreenShorts");
        check("Shorts pinch reset restores native capability", false, ShortsFullscreenPolicy.capability(false));

        AfterglowPrefs.remove("shortsProgress");
        check("Shorts progress default OFF", false, ShortsProgressPolicy.enabled());
        check("Shorts owner exposes progress", true, SettingsBehavior.keyVisible("shortsProgress"));
        for (int mode : new int[]{-1, 0, 1, 2, 3, 4, Integer.MAX_VALUE}) {
            check("Shorts progress OFF preserves native mode " + mode, mode, ShortsProgressPolicy.displayMode(mode));
        }
        AfterglowPrefs.setBool("shortsProgress", true);
        check("Shorts progress enables disabled native bar", 2, ShortsProgressPolicy.displayMode(1));
        check("Shorts progress retains always-visible native bar", 2, ShortsProgressPolicy.displayMode(2));
        check("Shorts progress enables playing as well as paused bar", 2, ShortsProgressPolicy.displayMode(3));
        for (int mode : new int[]{-1, 0, 4, Integer.MAX_VALUE}) {
            check("Shorts progress preserves unknown mode " + mode, mode, ShortsProgressPolicy.displayMode(mode));
        }
        install("shorts-layout");
        check("Layout owner does not expose progress", false, SettingsBehavior.keyVisible("shortsProgress"));
        check("Layout owner does not override native progress", 1, ShortsProgressPolicy.displayMode(1));
        install();
        check("Uninstalled Shorts preserves native progress", 3, ShortsProgressPolicy.displayMode(3));
        install("shorts");
        AfterglowPrefs.setBool("shortsProgress", false);
        AfterglowPrefs.setBool("liteModeEnabled", true);
        check("Lite Mode enables Shorts progress without changing stored choice", 2, ShortsProgressPolicy.displayMode(1));
        AfterglowPrefs.setBool("liteModeEnabled", false);
        check("Leaving Lite Mode restores stored Shorts progress", 1, ShortsProgressPolicy.displayMode(1));
        AfterglowPrefs.remove("shortsProgress");
        check("Reset restores native Shorts progress", 3, ShortsProgressPolicy.displayMode(3));

        install();
        AfterglowPrefs.setBool("hideHeatwaves", true);
        check("uninstalled seek bar preserves heatwaves", false, PlayerBehavior.hideHeatwaves());
        check("uninstalled seek bar hides heatwave setting", false, SettingsBehavior.keyVisible("hideHeatwaves"));
        install("glow");
        check("shared seek styling does not install heatwave control", false, PlayerBehavior.hideHeatwaves());
        install("seek-bar");
        check("seek bar honors imported heatwave choice", true, PlayerBehavior.hideHeatwaves());
        check("seek bar exposes heatwave setting", true, SettingsBehavior.keyVisible("hideHeatwaves"));
        AfterglowPrefs.remove("hideHeatwaves");
        check("heatwave defaults preserve native graph", false, PlayerBehavior.hideHeatwaves());
        AfterglowPrefs.setBool("liteModeEnabled", true);
        check("Lite Mode does not force heatwave setting", false, PlayerBehavior.hideHeatwaves());
        AfterglowPrefs.setBool("hideHeatwaves", true);
        check("Lite Mode honors explicit heatwave choice", true, PlayerBehavior.hideHeatwaves());
        AfterglowPrefs.setBool("liteModeEnabled", false);
        check("leaving Lite Mode keeps heatwave choice", true, PlayerBehavior.hideHeatwaves());
        AfterglowPrefs.remove("hideHeatwaves");
        check("heatwave reset restores native graph", false, PlayerBehavior.hideHeatwaves());

        install();
        AfterglowPrefs.setBool("noSubbar", true);
        check("uninstalled navigation preserves native chip rows", false, Subbar.hidden());
        check("uninstalled navigation hides subbar setting", false, SettingsBehavior.keyVisible("noSubbar"));
        install("navigation-bar");
        check("navigation honors imported subbar choice", true, Subbar.hidden());
        check("navigation exposes subbar setting", true, SettingsBehavior.keyVisible("noSubbar"));
        AfterglowPrefs.remove("noSubbar");
        check("subbar defaults preserve native rows", false, Subbar.hidden());
        AfterglowPrefs.setBool("liteModeEnabled", true);
        check("Lite Mode hides chip rows", true, Subbar.hidden());
        install();
        check("Lite Mode requires navigation owner", false, Subbar.hidden());
        install("navigation-bar");
        AfterglowPrefs.setBool("liteModeEnabled", false);
        check("leaving Lite Mode restores native chip rows", false, Subbar.hidden());

        // Autoplay changes initial readiness only. Unrelated native flag bits survive.
        install();
        AfterglowPrefs.setInt("autoplayMode", 2);
        check("uninstalled autoplay preserves initial flags", 7, Autoplay.startFlags(7));
        check("uninstalled autoplay keeps native switch", false, Autoplay.hideAutoplaySwitch());
        check("uninstalled autoplay hides its row", false, SettingsBehavior.keyVisible("autoplayMode"));
        install("autoplay");
        check("autoplay alone exposes its row", true, SettingsBehavior.keyVisible("autoplayMode"));
        for (int mode : new int[]{-1, 0, 1, 2, 9}) {
            AfterglowPrefs.setInt("autoplayMode", mode);
            check("autoplay hide mode " + mode, mode >= 2, Autoplay.hideAutoplaySwitch());
            check("autoplay initial readiness " + mode, mode > 0 ? 0 : 2, Autoplay.startFlags(2));
            check("autoplay never enables native paused state " + mode, 5, Autoplay.startFlags(5));
            check("autoplay preserves unrelated native bits " + mode,
                    mode > 0 ? 0x80000005 : 0x80000007, Autoplay.startFlags(0x80000007));
        }
        AfterglowPrefs.remove("autoplayMode");
        check("autoplay reset restores native flags", 7, Autoplay.startFlags(7));
        check("autoplay reset restores native switch", false, Autoplay.hideAutoplaySwitch());

        install();
        AfterglowPrefs.setBool("rememberCaptionState", true);
        AfterglowPrefs.setBool("disableAutoCaptions", true);
        check("uninstalled captions preserve native remembered false", false, Captions.rememberChoice(false));
        check("uninstalled captions preserve native remembered true", true, Captions.rememberChoice(true));
        check("uninstalled captions preserve server ON", false, Captions.ignoreServerState(CaptionHint.ON));
        check("uninstalled captions preserve muted behavior", true, Captions.allowMutedAutoCaptions(true));
        check("uninstalled captions preserve device behavior", true, Captions.respectDeviceSetting(true));
        check("uninstalled remember captions row hidden", false, SettingsBehavior.keyVisible("rememberCaptionState"));
        install("captions");
        check("caption patch alone exposes remember choice", true, SettingsBehavior.keyVisible("rememberCaptionState"));
        for (boolean remember : new boolean[]{false, true}) {
            for (boolean disableAuto : new boolean[]{false, true}) {
                AfterglowPrefs.setBool("rememberCaptionState", remember);
                AfterglowPrefs.setBool("disableAutoCaptions", disableAuto);
                String c = "captions " + remember + "/" + disableAuto + ": ";
                check(c + "remembered choice independent", remember, Captions.rememberChoice(false));
                check(c + "native recent viewer choice retained", true, Captions.rememberChoice(true));
                check(c + "device setting independence", !remember, Captions.respectDeviceSetting(true));
                check(c + "native device false retained", false, Captions.respectDeviceSetting(false));
                check(c + "server ON", disableAuto, Captions.ignoreServerState(CaptionHint.ON));
                check(c + "server ON_RECOMMENDED", disableAuto, Captions.ignoreServerState(CaptionHint.ON_RECOMMENDED));
                check(c + "server OFF retained", false, Captions.ignoreServerState(CaptionHint.OFF));
                check(c + "server UNKNOWN retained", false, Captions.ignoreServerState(CaptionHint.UNKNOWN));
                check(c + "new server state retained", false, Captions.ignoreServerState(CaptionHint.NEW_STATE));
                check(c + "null server state retained", false, Captions.ignoreServerState(null));
                check(c + "muted auto captions independent", !disableAuto, Captions.allowMutedAutoCaptions(true));
                check(c + "native muted false retained", false, Captions.allowMutedAutoCaptions(false));
            }
        }
        AfterglowPrefs.remove("rememberCaptionState"); AfterglowPrefs.remove("disableAutoCaptions");
        check("captions reset preserves native choice", false, Captions.rememberChoice(false));
        check("captions reset preserves native hint", false, Captions.ignoreServerState(CaptionHint.ON));

        AfterglowPrefs.remove("android_caption_choice");
        AfterglowPrefs.setBool("rememberCaptionState", true);
        install();
        Captions.onManualChoice(true, "fr");
        check("uninstalled caption write ignored", false, AfterglowPrefs.contains("android_caption_choice"));
        install("captions");
        check("no saved caption choice preserves native on", true, Captions.restoreEnabled(true));
        check("no saved caption choice preserves native off", false, Captions.restoreEnabled(false));
        Captions.onManualChoice(true, "fr");
        check("manual ON overrides native off", true, Captions.restoreEnabled(false));
        check("saved language overrides native language", "fr", Captions.restoreLanguage("en"));
        AfterglowPrefs.setBool("disableAutoCaptions", true);
        check("disable auto preserves explicit saved ON", true, Captions.restoreEnabled(false));
        Captions.onManualChoice(null, "de");
        check("null native selection never erases saved language", "fr", Captions.restoreLanguage("en"));
        AfterglowPrefs.setBool("rememberCaptionState", false);
        Captions.onManualChoice(false, "");
        check("disabled remembering preserves native off", false, Captions.restoreEnabled(false));
        check("disabled remembering preserves native language", "en", Captions.restoreLanguage("en"));
        AfterglowPrefs.setBool("rememberCaptionState", true);
        check("disabled recording did not erase saved ON", true, Captions.restoreEnabled(false));
        Captions.onManualChoice(false, "");
        check("manual OFF overrides native on", false, Captions.restoreEnabled(true));
        check("manual OFF clears remembered language", "en", Captions.restoreLanguage("en"));
        Captions.onManualChoice(true, null);
        check("missing saved language uses native fallback", "en", Captions.restoreLanguage("en"));
        install();
        check("uninstalled captions ignore imported saved ON", false, Captions.restoreEnabled(false));
        AfterglowPrefs.remove("rememberCaptionState"); AfterglowPrefs.remove("disableAutoCaptions");
        AfterglowPrefs.remove("android_caption_choice");

        install("captions");
        AfterglowPrefs.setBool("rememberCaptionState", true);
        AfterglowPrefs.setString("android_caption_choice", "invalid");
        check("malformed saved choice preserves native on", true, Captions.restoreEnabled(true));
        check("malformed saved choice preserves native off", false, Captions.restoreEnabled(false));
        check("malformed saved choice preserves native language", "en", Captions.restoreLanguage("en"));
        AfterglowPrefs.remove("rememberCaptionState"); AfterglowPrefs.remove("android_caption_choice");

        install();
        AfterglowPrefs.setBool("rememberLoop", true);
        check("uninstalled loop ignores imported setting", false, PlayerBehavior.rememberLoop());
        check("uninstalled loop row hidden", false, SettingsBehavior.keyVisible("rememberLoop"));
        install("loop");
        check("loop patch alone exposes its row", true, SettingsBehavior.keyVisible("rememberLoop"));
        check("loop patch follows enabled preference", true, PlayerBehavior.rememberLoop());
        check("loop patch does not expose captions", false, SettingsBehavior.keyVisible("rememberCaptionState"));
        AfterglowPrefs.setBool("rememberLoop", false);
        check("disabled loop preserves native policy", false, PlayerBehavior.rememberLoop());
        AfterglowPrefs.remove("rememberLoop");
        check("loop reset defaults off", false, PlayerBehavior.rememberLoop());

        // Imported preferences must not activate an uninstalled player patch.
        install();
        AfterglowPrefs.setBool("tapToSeek", true);
        AfterglowPrefs.setBool("disableAmbientMode", true);
        check("uninstalled tap gate stays off", false, PlayerBehavior.tapToSeek());
        check("uninstalled ambient gate stays off", false, PlayerBehavior.disableAmbientMode());
        install("player-gestures");
        check("gesture patch honors stored tap choice", true, PlayerBehavior.tapToSeek());
        check("gesture patch leaves ambient native", false, PlayerBehavior.disableAmbientMode());
        check("gesture patch exposes tap setting", true, SettingsBehavior.keyVisible("tapToSeek"));
        check("gesture patch hides ambient setting", false, SettingsBehavior.keyVisible("disableAmbientMode"));
        install("ambient-mode");
        check("ambient patch honors stored choice", true, PlayerBehavior.disableAmbientMode());
        check("ambient patch leaves native gestures", false, PlayerBehavior.tapToSeek());
        check("ambient patch exposes its setting", true, SettingsBehavior.keyVisible("disableAmbientMode"));
        install("ambient-mode", "player-gestures");
        AfterglowPrefs.remove("tapToSeek");
        AfterglowPrefs.remove("disableAmbientMode");
        check("tap reset preserves native behavior", false, PlayerBehavior.tapToSeek());
        check("ambient reset preserves native behavior", false, PlayerBehavior.disableAmbientMode());
        AfterglowPrefs.setBool("liteModeEnabled", true);
        check("Lite Mode suppresses ambient rendering", true, PlayerBehavior.disableAmbientMode());
        check("Lite Mode does not enable tap seeking", false, PlayerBehavior.tapToSeek());
        AfterglowPrefs.setBool("liteModeEnabled", false);
        check("leaving Lite Mode restores ambient choice", false, PlayerBehavior.disableAmbientMode());

        install();
        AfterglowPrefs.setBool("classicQuality", true);
        check("uninstalled classic quality preserves quick menu", false, PlayerBehavior.useClassicQualityMenu(false));
        check("uninstalled classic quality preserves Advanced", true, PlayerBehavior.useClassicQualityMenu(true));
        check("uninstalled classic quality hides setting", false, SettingsBehavior.keyVisible("classicQuality"));
        install("video-quality");
        check("classic quality promotes quick menu", true, PlayerBehavior.useClassicQualityMenu(false));
        check("classic quality preserves Advanced", true, PlayerBehavior.useClassicQualityMenu(true));
        check("classic quality exposes setting", true, SettingsBehavior.keyVisible("classicQuality"));
        AfterglowPrefs.remove("classicQuality");
        check("classic quality reset restores quick menu", false, PlayerBehavior.useClassicQualityMenu(false));
        check("classic quality reset preserves Advanced", true, PlayerBehavior.useClassicQualityMenu(true));

        install();
        AfterglowPrefs.setBool("noDoubleTapToSeek", true);
        AfterglowPrefs.setBool("noTwoFingerSnapToChapter", true);
        check("uninstalled single-finger gate preserves native", false, PlayerBehavior.blockDoubleTap(false));
        check("uninstalled two-finger gate preserves native", false, PlayerBehavior.blockDoubleTap(true));
        install("player-gestures");
        for (boolean single : new boolean[]{false, true}) {
            for (boolean chapter : new boolean[]{false, true}) {
                AfterglowPrefs.setBool("noDoubleTapToSeek", single);
                AfterglowPrefs.setBool("noTwoFingerSnapToChapter", chapter);
                check("single-finger independent " + single + "/" + chapter, single, PlayerBehavior.blockDoubleTap(false));
                check("two-finger independent " + single + "/" + chapter, chapter, PlayerBehavior.blockDoubleTap(true));
            }
        }
        AfterglowPrefs.remove("noDoubleTapToSeek"); AfterglowPrefs.remove("noTwoFingerSnapToChapter");
        check("single-finger reset preserves native", false, PlayerBehavior.blockDoubleTap(false));
        check("two-finger reset preserves native", false, PlayerBehavior.blockDoubleTap(true));
        check("single-finger control visible", true, SettingsBehavior.keyVisible("noDoubleTapToSeek"));
        check("two-finger control visible", true, SettingsBehavior.keyVisible("noTwoFingerSnapToChapter"));

        install();
        AfterglowPrefs.setBool("dontSnapToChapter", true);
        check("uninstalled chapter snap ignores imported preference", false, PlayerBehavior.disableChapterSnap());
        check("uninstalled chapter snap hides its row", false, SettingsBehavior.keyVisible("dontSnapToChapter"));
        install("player-gestures");
        check("installed chapter snap honors preference", true, PlayerBehavior.disableChapterSnap());
        check("installed chapter snap exposes its row", true, SettingsBehavior.keyVisible("dontSnapToChapter"));
        check("chapter snap leaves tap seeking independent", false, PlayerBehavior.tapToSeek());
        check("chapter snap leaves ordinary double taps independent", false, PlayerBehavior.blockDoubleTap(false));
        check("chapter snap leaves two-finger seeking independent", false, PlayerBehavior.blockDoubleTap(true));
        AfterglowPrefs.remove("dontSnapToChapter");
        check("chapter snap resets to native", false, PlayerBehavior.disableChapterSnap());
        AfterglowPrefs.setBool("noTwoFingerSnapToChapter", true);
        check("two-finger switch does not disable scrub snapping", false, PlayerBehavior.disableChapterSnap());
        AfterglowPrefs.remove("noTwoFingerSnapToChapter");

        install();
        AfterglowPrefs.setBool("noFreeZoom", true);
        check("uninstalled zoom override preserves native on", true, PlayerBehavior.allowFreeZoom(true));
        check("uninstalled zoom override preserves native off", false, PlayerBehavior.allowFreeZoom(false));
        check("uninstalled one-finger zoom stays native", false, PlayerBehavior.disableFreeZoom());
        install("player-gestures");
        check("free zoom override selects native fill-only branch", false, PlayerBehavior.allowFreeZoom(true));
        check("free zoom override never enables a native-disabled capability", false, PlayerBehavior.allowFreeZoom(false));
        check("free zoom also suppresses one-finger quick-scale", true, PlayerBehavior.disableFreeZoom());
        AfterglowPrefs.remove("noFreeZoom");
        check("zoom reset restores native on", true, PlayerBehavior.allowFreeZoom(true));
        check("zoom reset preserves native off", false, PlayerBehavior.allowFreeZoom(false));
        check("zoom reset restores one-finger gesture", false, PlayerBehavior.disableFreeZoom());
        check("zoom control visible for installed patch", true, SettingsBehavior.keyVisible("noFreeZoom"));

        install();
        AfterglowPrefs.setBool("autoFullscreen", true); AfterglowPrefs.setBool("exitFullscreen", true);
        check("uninstalled fullscreen ignores imported auto entry", false, PlayerBehavior.autoFullscreen());
        check("uninstalled fullscreen ignores imported exit", false, PlayerBehavior.exitFullscreen());
        install("fullscreen");
        check("installed fullscreen exposes auto entry", true, SettingsBehavior.keyVisible("autoFullscreen"));
        check("installed fullscreen exposes exit", true, SettingsBehavior.keyVisible("exitFullscreen"));
        check("installed fullscreen exposes portrait orientation", true, SettingsBehavior.keyVisible("portraitFullscreen"));
        AfterglowPrefs.setBool("portraitFullscreen", true);
        check("portrait fullscreen enabled", true, PlayerBehavior.portraitFullscreen());
        for (boolean enter : new boolean[] {false, true}) {
            for (boolean exit : new boolean[] {false, true}) {
                AfterglowPrefs.setBool("autoFullscreen", enter); AfterglowPrefs.setBool("exitFullscreen", exit);
                check("fullscreen entry independent " + enter + "/" + exit, enter, PlayerBehavior.autoFullscreen());
                check("fullscreen exit independent " + enter + "/" + exit, exit, PlayerBehavior.exitFullscreen());
            }
        }
        AfterglowPrefs.remove("autoFullscreen"); AfterglowPrefs.remove("exitFullscreen");
        check("fullscreen entry reset off", false, PlayerBehavior.autoFullscreen());
        check("fullscreen exit reset off", false, PlayerBehavior.exitFullscreen());
        AfterglowPrefs.remove("portraitFullscreen");
        check("portrait fullscreen reset off", false, PlayerBehavior.portraitFullscreen());

        install();
        AfterglowPrefs.setBool("videoEndTime", true);
        check("uninstalled end time ignores imported setting", false, PlayerBehavior.showEndTime());
        check("uninstalled end time hides its row", false, SettingsBehavior.keyVisible("videoEndTime"));
        install("video-end-time");
        check("installed end time exposes its row", true, SettingsBehavior.keyVisible("videoEndTime"));
        check("installed end time exposes independent clock format", true, SettingsBehavior.keyVisible("24hrFormat"));
        check("installed end time honors imported setting", true, PlayerBehavior.showEndTime());
        AfterglowPrefs.remove("videoEndTime");
        check("end time defaults off", false, PlayerBehavior.showEndTime());
        AfterglowPrefs.setBool("24hrFormat", true);
        check("clock format alone never enables end time", false, PlayerBehavior.showEndTime());
        AfterglowPrefs.setBool("advancedMode", false);
        check("end time page follows advanced gate", false, SettingsBehavior.shown(SettingsBehavior.row("player.overlay")));
        AfterglowPrefs.setBool("advancedMode", true);
        check("end time alone exposes advanced overlay page", true, SettingsBehavior.shown(SettingsBehavior.row("player.overlay")));
        AfterglowPrefs.remove("24hrFormat");
        check("clock format defaults to twelve hour", false, AfterglowPrefs.getBool("24hrFormat"));
        check("end time does not expose native overlay hides", false, SettingsBehavior.keyVisible("hideSubs"));

        install();
        AfterglowPrefs.setBool("noHUDMsgs", true);
        check("uninstalled HUD suppression preserves messages", false, PlayerBehavior.hideHudMessages(false));
        check("uninstalled HUD suppression preserves native skips", true, PlayerBehavior.hideHudMessages(true));
        check("uninstalled HUD suppression hides its row", false, SettingsBehavior.keyVisible("noHUDMsgs"));
        install("player-overlay");
        check("HUD suppression honors imported setting", true, PlayerBehavior.hideHudMessages(false));
        check("HUD suppression preserves native skips", true, PlayerBehavior.hideHudMessages(true));
        AfterglowPrefs.remove("noHUDMsgs");
        check("HUD reset restores native messages", false, PlayerBehavior.hideHudMessages(false));
        check("HUD reset preserves native skips", true, PlayerBehavior.hideHudMessages(true));
        AfterglowPrefs.setBool("liteModeEnabled", true);
        check("Lite Mode suppresses HUD messages", true, PlayerBehavior.hideHudMessages(false));
        install();
        check("Lite Mode requires the HUD owner", false, PlayerBehavior.hideHudMessages(false));
        install("player-overlay");
        AfterglowPrefs.setBool("liteModeEnabled", false);
        check("leaving Lite Mode restores native HUD messages", false, PlayerBehavior.hideHudMessages(false));
        for (String key : new String[] {"hideSubs", "hidePrevNext", "hidePlayerFullscreenButton",
                "hidePlayerCollapseButton", "hidePlayerOverflowButton", "hideOverlayTitle",
                "noDarkBg", "noFullscreenActions", "noWatermarks", "hidePlayerYouTubeMusicButton", "noHUDMsgs"}) {
            check("overlay patch exposes " + key, true, SettingsBehavior.keyVisible(key));
        }
        check("overlay patch does not enable gestures", false, SettingsBehavior.keyVisible("tapToSeek"));
        check("overlay patch exposes replacement controls", true, SettingsBehavior.keyVisible("replacePrevNext"));
        check("replacement controls default OFF", false, AfterglowPrefs.getBool("replacePrevNext"));
        AfterglowPrefs.setBool("advancedMode", false);
        check("overlay page follows iOS advanced gate", false, SettingsBehavior.shown(SettingsBehavior.row("player.overlay")));
        AfterglowPrefs.setBool("advancedMode", true);
        check("overlay page appears with advanced mode", true, SettingsBehavior.shown(SettingsBehavior.row("player.overlay")));
        check("overlay alone does not expose paid promotion setting", false, SettingsBehavior.keyVisible("noPromotionCards"));
        install("remove-ads");
        check("Remove ads alone exposes paid promotion setting", true, SettingsBehavior.keyVisible("noPromotionCards"));
        check("Remove ads alone does not expose Music control", false, SettingsBehavior.keyVisible("hidePlayerYouTubeMusicButton"));
        install();
        check("uninstalled Music control stays hidden", false, SettingsBehavior.keyVisible("hidePlayerYouTubeMusicButton"));
        check("uninstalled replacement controls stay hidden", false, SettingsBehavior.keyVisible("replacePrevNext"));

        install();
        AfterglowPrefs.remove("noRelatedWatchNexts");
        check("watch recommendations default visible", false, AfterglowPrefs.getBool("noRelatedWatchNexts"));
        check("uninstalled up-next setting stays hidden", false, SettingsBehavior.keyVisible("noRelatedWatchNexts"));
        AfterglowPrefs.setBool("noRelatedWatchNexts", true);
        check("import cannot expose uninstalled up-next setting", false, SettingsBehavior.keyVisible("noRelatedWatchNexts"));
        install("watch-page");
        AfterglowPrefs.setBool("advancedMode", false);
        check("watch page alone exposes up-next setting", true, SettingsBehavior.keyVisible("noRelatedWatchNexts"));
        check("up-next setting is available without advanced mode", true, SettingsBehavior.shown(SettingsBehavior.row("playback.noRelatedWatchNexts")));
        check("installed watch page honors imported up-next choice", true, LiteMode.effectiveBool("noRelatedWatchNexts"));
        AfterglowPrefs.remove("noRelatedWatchNexts");
        check("up-next reset restores recommendations", false, LiteMode.effectiveBool("noRelatedWatchNexts"));
        AfterglowPrefs.setBool("liteModeEnabled", true);
        check("Lite Mode hides up-next", true, LiteMode.effectiveBool("noRelatedWatchNexts"));
        check("Lite Mode preserves stored up-next default", false, AfterglowPrefs.getBool("noRelatedWatchNexts"));
        AfterglowPrefs.setBool("liteModeEnabled", false);
        check("leaving Lite Mode restores up-next default", false, LiteMode.effectiveBool("noRelatedWatchNexts"));
        check("watch page does not expose autoplay setting", false, SettingsBehavior.keyVisible("autoplayMode"));
        install("player-overlay");
        check("overlay alone does not expose up-next setting", false, SettingsBehavior.keyVisible("noRelatedWatchNexts"));

        String[][] newTools = {
                {"miniplayer", "miniplayer", "playback.miniplayer", "playback.reset.action"},
                {"miniplayer", "playlistOldMinibar", "playback.playlistOldMinibar", "playback.reset.action"},
                {"long-press-tools", "copyWithTimestamp", "tools.copyWithTimestamp", "tools.reset.action"},
                {"native-share", "nativeShare", "tools.nativeShare", "tools.reset.action"},
                {"fix-albums", "fixAlbums", "tools.fixAlbums", "tools.reset.action"}
        };
        for (String[] tool : newTools) {
            String owner = tool[0], key = tool[1];
            install();
            AfterglowPrefs.setBool("liteModeEnabled", false);
            AfterglowPrefs.setBool("advancedMode", false);
            AfterglowPrefs.remove(key);
            check(key + " defaults off", false, AfterglowPrefs.getBool(key));
            check(key + " is hidden without its patch", false, SettingsBehavior.keyVisible(key));
            AfterglowPrefs.setBool(key, true);
            check(key + " import cannot expose an uninstalled feature", false, SettingsBehavior.keyVisible(key));
            install("shorts-layout");
            check(key + " is hidden with unrelated patch", false, SettingsBehavior.keyVisible(key));
            install(owner);
            check(key + " owner exposes the control", true, SettingsBehavior.keyVisible(key));
            check(key + " honors the saved choice", true, SettingsBehavior.switchValue(SettingsBehavior.row(tool[2])));
            check(key + " basic visibility", !"playlistOldMinibar".equals(key), SettingsBehavior.shown(SettingsBehavior.row(tool[2])));
            AfterglowPrefs.setBool("advancedMode", true);
            check(key + " advanced visibility", true, SettingsBehavior.shown(SettingsBehavior.row(tool[2])));
            AfterglowPrefs.setBool("liteModeEnabled", true);
            check(key + " Lite Mode preserves the saved choice", true, LiteMode.effectiveBool(key));
            AfterglowPrefs.setBool("liteModeEnabled", false);
            for (String resetKey : SettingsBehavior.resetKeys(SettingsBehavior.row(tool[3]))) AfterglowPrefs.remove(resetKey);
            check(key + " page reset restores off", false, SettingsBehavior.switchValue(SettingsBehavior.row(tool[2])));
        }
        install("miniplayer");
        check("playlist bar describes required restart", true,
                SettingsBehavior.switchDescription(SettingsBehavior.row("playback.playlistOldMinibar")).contains(SettingsBehavior.NOTE_RESTART));
        check("mini player does not expose copy controls", false, SettingsBehavior.keyVisible("copyVideoInfo"));
        install("long-press-tools");
        AfterglowPrefs.setBool("copyVideoInfo", true);
        check("Description-header copy entry is available", true, SettingsBehavior.keyVisible("copyVideoInfo"));
        check("Description-header copy row is available", true, SettingsBehavior.shown(SettingsBehavior.row("tools.copyVideoInfo")));
        check("copy tools do not expose native share", false, SettingsBehavior.keyVisible("nativeShare"));
        check("copy tools do not expose album fix", false, SettingsBehavior.keyVisible("fixAlbums"));
        for (String key : new String[]{"copyVideoInfo", "postManager", "commentManager", "saveProfilePhoto"}) {
            AfterglowPrefs.remove(key);
            check(key + " is available with long-press tools", true, SettingsBehavior.keyVisible(key));
            check(key + " starts off", false, AfterglowPrefs.getBool(key));
        }

        install();
        check("SponsorBlock stays off when uninstalled", false, SponsorSettings.current().shouldRun(false));
        install("sponsorblock");
        check("SponsorBlock defaults on", true, SponsorSettings.current().shouldRun(false));
        check("SponsorBlock defaults on in Shorts", true, SponsorSettings.current().shouldRun(true));
        check("SponsorBlock markers default on", true, SponsorSettings.current().markers);
        check("SponsorBlock has two default skip categories", 2, SponsorSettings.current().skipCategories.size());
        check("SponsorBlock has all nine default markers", 9, SponsorSettings.current().markerCategories.size());
        for (SponsorCategory category : SponsorCategory.values()) {
            check("skip default " + category.id, category.skipByDefault, SponsorSettings.current().skipCategories.contains(category));
            check("category switch visible " + category.id, true, SettingsBehavior.keyVisible(category.skipKey));
            check("marker switch visible " + category.id, true, SettingsBehavior.keyVisible(category.markerKey));
        }
        AfterglowPrefs.setBool("sponsorBlockShortsEnabled", false);
        check("Shorts switch suppresses only Shorts", false, SponsorSettings.current().shouldRun(true));
        check("Shorts switch leaves watch-page enabled", true, SponsorSettings.current().shouldRun(false));
        AfterglowPrefs.setBool("sponsorBlockMarkerSponsor", false);
        check("sponsor marker can be hidden", false, SponsorSettings.current().markerCategories.contains(SponsorCategory.SPONSOR));
        check("hiding marker preserves sponsor skip", true, SponsorSettings.current().skipCategories.contains(SponsorCategory.SPONSOR));
        AfterglowPrefs.setBool("sponsorBlockCategoryInteraction", false);
        check("interaction skip can be disabled", false, SponsorSettings.current().skipCategories.contains(SponsorCategory.INTERACTION));
        check("disabling skip preserves interaction marker", true, SponsorSettings.current().markerCategories.contains(SponsorCategory.INTERACTION));
        AfterglowPrefs.setBool("sponsorBlockEnabled", false);
        check("master disables all playback", false, SponsorSettings.current().shouldRun(false));
        for (String key : TweakCatalog.tweak("sponsorblock").keys) AfterglowPrefs.remove(key);
        check("SponsorBlock reset restores master", true, SponsorSettings.current().shouldRun(false));
        check("SponsorBlock reset restores Shorts", true, SponsorSettings.current().shouldRun(true));
        check("SponsorBlock reset restores marker categories", 9, SponsorSettings.current().markerCategories.size());
        check("SponsorBlock reset restores skip categories", 2, SponsorSettings.current().skipCategories.size());
        check("SponsorBlock alone does not expose theme controls", false, SettingsBehavior.keyVisible("seekBarScrubberImage"));

        System.out.println((failures == 0 ? "PASS" : "FAIL") + " settings visibility: " + (checks - failures) + "/" + checks + " checks");
        System.exit(failures == 0 ? 0 : 1);
    }

    /** Every keyed row shows exactly when its key is base, or installed and implemented (and its iOS condition holds). */
    private static void checkKeyedRows(String c) {
        int mismatches = 0;
        for (Page page : SettingsSpec.pages()) {
            for (Row row : page.rows) {
                String key = row.registryKey != null ? row.registryKey : row.key;
                if (key == null || row.action == SettingsModel.Action.RESET_DEFAULTS) continue;
                TweakCatalog.Tweak tweak = TweakCatalog.tweakForKey(key);
                boolean expected = SettingsBehavior.isVisible(row) && (TweakCatalog.BASE_KEYS.contains(key)
                        || (tweak != null && InstalledTweaks.has(tweak.id) && TweakCatalog.SHOWN_KEYS.contains(key)));
                if (SettingsBehavior.shown(row) != expected) {
                    mismatches++;
                    System.out.println("  keyed row " + row.id + " (" + key + "): shown=" + SettingsBehavior.shown(row) + " expected=" + expected);
                }
            }
        }
        check(c + "keyed rows follow base/installed/implemented", 0, mismatches);
    }

    /**
     * Rows without their own key follow what the rules say they follow: section members
     * (headers, spacers, captions, links) their section's keyed rows, Reset to Defaults the keys
     * it resets, and sub-page rows whether their page shows a keyed row.
     */
    private static void checkDerivedRows(String c) {
        int mismatches = 0;
        for (Page page : SettingsSpec.pages()) {
            for (Row row : page.rows) {
                Boolean expected = null;
                if (row.action == SettingsModel.Action.RESET_DEFAULTS) {
                    boolean any = false;
                    for (String key : SettingsBehavior.resetKeys(row)) any |= SettingsBehavior.keyVisible(key);
                    expected = any;
                } else if (SettingsBehavior.isFollower(row) && row.section >= 0) {
                    boolean keyed = false, shown = false;
                    for (Row other : page.rows) {
                        if (other.section != row.section || SettingsBehavior.isFollower(other)) continue;
                        keyed = true;
                        shown |= SettingsBehavior.shown(other);
                    }
                    expected = !keyed || shown;
                } else if (row.key == null && row.registryKey == null && row.targetPage != null
                        && row.kind == SettingsModel.Kind.DESTINATION && !row.id.equals("root.search")) {
                    expected = pageHasShownKeyedRow(SettingsBehavior.page(row.targetPage));
                }
                if (expected == null) continue;
                expected &= SettingsBehavior.isVisible(row);
                if (SettingsBehavior.shown(row) != expected) {
                    mismatches++;
                    System.out.println("  row " + row.id + ": shown=" + SettingsBehavior.shown(row) + " expected=" + expected);
                }
            }
        }
        check(c + "keyless rows follow their section, keys or page", 0, mismatches);
    }

    private static boolean pageHasShownKeyedRow(Page page) {
        if (page == null) return false;
        boolean keyed = false;
        for (Row row : page.rows) {
            if (SettingsBehavior.isFollower(row)) continue;
            keyed = true;
            if (SettingsBehavior.shown(row)) return true;
        }
        return !keyed;
    }

    private static void expectAbout(String c) {
        expectRows(c, "page:about", list("about.advancedMode", "about.clearCache", "about.spacer1", "about.header.managePreferences",
                "about.exportPreferences", "about.importPreferences", "about.resetSettings", "about.spacer2", "about.header.debugLogging",
                "about.debugLogEnabled", "about.debugLogFirehose", "about.header.debugLogCategories", "about.debugLogDownloads",
                "about.debugLogPlayerUI", "about.debugLogPremiumControls", "about.debugLogPiP", "about.debugLogProbes",
                "about.debugHUDEnabled", "about.shareDebugLog", "about.clearDebugLog", "about.reset.spacer", "about.reset.header",
                "about.reset.action", "about.spacer3", "about.credits"));
    }

    private static void expectRows(String c, String pageId, List<String> expected) {
        List<String> shown = new ArrayList<>();
        for (Row row : SettingsBehavior.page(pageId).rows) if (SettingsBehavior.shown(row)) shown.add(row.id);
        check(c + pageId, expected, shown);
    }

    private static void expectHidden(String c, String... rowIds) {
        for (String id : rowIds) check(c + id + " hidden", false, SettingsBehavior.shown(SettingsBehavior.row(id)));
    }

    /** Search entries by title key (setting entries) or English title (page/literal entries). */
    private static void expectSearch(String c, boolean advanced, List<String> shown, List<String> hidden) {
        Map<String, Boolean> visible = new HashMap<>();
        for (SearchEntry entry : SettingsSpec.search()) {
            String name = entry.titleKey != null ? entry.titleKey : entry.title.en;
            visible.merge(name, SettingsBehavior.searchEntryShown(entry, advanced), Boolean::logicalOr);
        }
        for (String name : shown) check(c + "search " + name + " shown", true, visible.get(name));
        for (String name : hidden) check(c + "search " + name + " hidden", false, visible.get(name));
        check(c + "search row matches index", SearchIndex.build(advanced).isEmpty() ? Boolean.FALSE : Boolean.TRUE,
                SettingsBehavior.shown(SettingsBehavior.row("root.search")));
    }

    private static List<String> allRows(String pageId) {
        List<String> ids = new ArrayList<>();
        for (Row row : SettingsBehavior.page(pageId).rows) ids.add(row.id);
        return ids;
    }

    private static void install(String... ids) throws Exception {
        Field field = InstalledTweaks.class.getDeclaredField("INSTALLED");
        field.setAccessible(true);
        ((Set<?>) field.get(null)).clear();
        for (String id : ids) InstalledTweaks.mark(id);
    }

    private static List<String> list(String... values) {
        return new ArrayList<>(Arrays.asList(values));
    }

    private static void check(String name, Object want, Object got) {
        checks++;
        if (want == null ? got != null : !want.equals(got)) {
            failures++;
            System.out.println("FAIL " + name + "\n  want " + want + "\n  got  " + got);
        }
    }

    /** Map-backed SharedPreferences (apply == commit). */
    static final class MemPrefs implements SharedPreferences {
        final Map<String, Object> map = new HashMap<>();
        public Map<String, ?> getAll() { return new HashMap<>(map); }
        public String getString(String k, String d) { Object v = map.get(k); return v instanceof String ? (String) v : d; }
        public Set<String> getStringSet(String k, Set<String> d) { return d; }
        public int getInt(String k, int d) { Object v = map.get(k); return v instanceof Integer ? (Integer) v : d; }
        public long getLong(String k, long d) { Object v = map.get(k); return v instanceof Long ? (Long) v : d; }
        public float getFloat(String k, float d) { Object v = map.get(k); return v instanceof Float ? (Float) v : d; }
        public boolean getBoolean(String k, boolean d) { Object v = map.get(k); return v instanceof Boolean ? (Boolean) v : d; }
        public boolean contains(String k) { return map.containsKey(k); }
        public Editor edit() { return new MemEditor(); }
        public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l) {}
        public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l) {}

        final class MemEditor implements Editor {
            final Map<String, Object> put = new HashMap<>();
            final Set<String> remove = new HashSet<>();
            boolean clear;
            public Editor putString(String k, String v) { put.put(k, v); return this; }
            public Editor putStringSet(String k, Set<String> v) { put.put(k, v); return this; }
            public Editor putInt(String k, int v) { put.put(k, v); return this; }
            public Editor putLong(String k, long v) { put.put(k, v); return this; }
            public Editor putFloat(String k, float v) { put.put(k, v); return this; }
            public Editor putBoolean(String k, boolean v) { put.put(k, v); return this; }
            public Editor remove(String k) { remove.add(k); return this; }
            public Editor clear() { clear = true; return this; }
            public boolean commit() { apply(); return true; }
            public void apply() { if (clear) map.clear(); for (String k : remove) map.remove(k); map.putAll(put); }
        }
    }
}
