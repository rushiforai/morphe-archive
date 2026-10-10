/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0).
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.net.Uri;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowPackageManager;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.hushtelegram.extension.telegram.ads.Ads;
import app.hushtelegram.extension.telegram.misc.Analytics;
import app.hushtelegram.extension.telegram.misc.AnalyticsTest.DeviceStatsController;
import app.hushtelegram.extension.telegram.misc.UpdateChecks;
import app.hushtelegram.extension.telegram.misc.Stories;
import app.hushtelegram.extension.telegram.misc.Recommendations;
import app.hushtelegram.extension.telegram.misc.Suggestions;
import app.hushtelegram.extension.telegram.misc.LinkRouting;
import app.hushtelegram.extension.telegram.ads.ProxyPromotions;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;

/**
 * What Pause and safe mode promise: every hook a switch runs takes Telegram's own path, and every
 * saved value stays as it is.
 *
 * <p>Each probe is one hook with its switch on. It must change what Telegram does while HushTelegram
 * runs, which is the control, and leave it alone while paused. A family that gains a switch
 * without a probe here fails the first test.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = {PausedHooksTest.AvatarScope.class, PausedHooksTest.ProxyScope.class, PausedHooksTest.LinkScope.class, PausedHooksTest.IdScope.class},
        instrumentedPackages = {"app.hushtelegram.extension.telegram.misc", "app.hushtelegram.extension.telegram.ads"})
public class PausedHooksTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final Object DIALOG_AVATAR = new Object();
    private static final String PROBE_BROWSER = "org.example.probe.browser";
    private static final String PROBE_URL = "https://example.com/path";
    private static final String TRACKED_URL = PROBE_URL + "?utm_source=probe";
    private static final Object SPONSORED_PROXY_CONTROLLER = new Object();
    private static final Object SPONSORED_PROXY_DIALOG = new Object();

    /** The fixture tests cover the real scope bytecode; this supplies a dialog avatar to probes. */
    @Implements(value = Stories.class, isInAndroidSdk = false)
    public static class AvatarScope {
        @Implementation protected static boolean isDialogAvatar(Object params) {
            return params == DIALOG_AVATAR;
        }
    }

    /** Supplies a known unjoined proxy sponsor; fixture tests cover the real host bridge. */
    @Implements(value = ProxyPromotions.class, isInAndroidSdk = false)
    public static class ProxyScope {
        static int calls;
        @Implementation protected static boolean isSponsoredProxyDialog(Object controller, Object dialog) {
            calls++;
            return controller == SPONSORED_PROXY_CONTROLLER && dialog == SPONSORED_PROXY_DIALOG;
        }
    }

    /** Fixture tests cover native classification; these probes use an ordinary unprotected URL. */
    @Implements(value = LinkRouting.class, isInAndroidSdk = false)
    public static class LinkScope {
        @Implementation protected static boolean protectedByTelegram(Uri uri) { return false; }
    }

    /** Fixture tests verify the native factory. This supplies a local inspection menu to Pause. */
    @Implements(value = app.hushtelegram.extension.telegram.misc.LocalIds.class, isInAndroidSdk = false)
    public static class IdScope {
        @Implementation protected static android.view.View nativeAddRow(Object menu, String text) {
            android.widget.TextView row = new android.widget.TextView(((android.view.View) menu).getContext());
            ((android.widget.FrameLayout) menu).addView(row);
            return row;
        }
    }

    /** One hook with its switch on: true when it changed what Telegram would have done. */
    interface Probe {
        boolean changedTelegram();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        for (BooleanSetting setting : settingsSwitches()) setting.resetToDefault();
        ReleaseCheckForTests.forget();
    }

    /**
     * The settings entry's own switches, which no family owns, one probe each, held to the same
     * promise as a family's: paused, or before the settings are ready, a start makes no request.
     */
    private static Map<BooleanSetting, Probe> entryProbes() {
        Map<BooleanSetting, Probe> probes = new LinkedHashMap<>();
        // Loads the check's own settings here, with the context, so a probe run without one reads
        // them rather than loading them.
        ReleaseCheck.Stored.CHECKED_AT.savedValue();
        // A Telegram start a day after the last try asks GitHub for the newest release.
        probes.put(Settings.CHECK_FOR_RELEASES, ReleaseCheckForTests::aStartAsksGitHub);
        return probes;
    }

    private static Map<PatchFamily, List<Probe>> probes() {
        registerProbeBrowser();
        Map<PatchFamily, List<Probe>> probes = new EnumMap<>(PatchFamily.class);
        // A sponsored messages, video ads or search ads request is answered without ever being made.
        probes.put(PatchFamily.HIDE_ADS, Arrays.asList(Ads::skipSponsoredMessages, Ads::skipVideoAds, Ads::skipSearchAds));
        probes.put(PatchFamily.HIDE_STORIES, Arrays.asList(
                Stories::skipStoryRequests, Stories::hideStoryBar,
                () -> !Stories.showStoryCamera(true),
                () -> Stories.hideAvatarStories(DIALOG_AVATAR),
                () -> Stories.hideAvatarStoryTouches(DIALOG_AVATAR)));
        probes.put(PatchFamily.HIDE_RECOMMENDATIONS, Arrays.asList(
                Recommendations::skipRecommendations, Recommendations::skipCachedRecommendations));
        probes.put(PatchFamily.HIDE_COMMERCE, Arrays.asList(
                () -> !app.hushtelegram.extension.telegram.misc.Commerce.addSettingsRow(new ArrayList<>(), new Object()),
                () -> !app.hushtelegram.extension.telegram.misc.Commerce.showGiftsTab(true)));
        probes.put(PatchFamily.HIDE_PROMOTIONAL_BANNERS, Arrays.asList(
                () -> !Suggestions.filterChatList(Collections.singleton("PREMIUM_UPGRADE")).contains("PREMIUM_UPGRADE"),
                () -> Suggestions.birthdayGiftBannerDismissed(false)));
        probes.put(PatchFamily.HIDE_SPONSORED_PROXY, Arrays.asList(
                () -> ProxyPromotions.hideCachedProxyDialog(SPONSORED_PROXY_CONTROLLER, SPONSORED_PROXY_DIALOG),
                () -> !ProxyPromotions.showSelectedDialog(true, SPONSORED_PROXY_CONTROLLER, SPONSORED_PROXY_DIALOG)));
        probes.put(PatchFamily.DISABLE_CALL_DEBUG, Arrays.asList(
                () -> app.hushtelegram.extension.telegram.misc.CallDebug.skipCallDebugUpload(true),
                app.hushtelegram.extension.telegram.misc.CallDebug::skipCallLogFileUpload,
                app.hushtelegram.extension.telegram.misc.CallDebug::skipCallLogUpload));
        // An unsent message's link preview is never asked for, on any compose surface.
        probes.put(PatchFamily.DISABLE_DRAFT_PREVIEWS, Arrays.asList(
                app.hushtelegram.extension.telegram.misc.DraftPreviews::skipChatPreview,
                app.hushtelegram.extension.telegram.misc.DraftPreviews::skipSharePreview,
                app.hushtelegram.extension.telegram.misc.DraftPreviews::skipPollPreview,
                app.hushtelegram.extension.telegram.misc.DraftPreviews::skipStoryLinkPreview,
                app.hushtelegram.extension.telegram.misc.DraftPreviews::skipBotSharePreview));
        // Search's Apps tab neither loads nor draws the Popular apps list.
        probes.put(PatchFamily.HIDE_POPULAR_APPS, Arrays.asList(
                app.hushtelegram.extension.telegram.misc.PopularApps::skipLoad,
                app.hushtelegram.extension.telegram.misc.PopularApps::hideSection));
        // A sideways swipe on a chat row starts nothing.
        probes.put(PatchFamily.DISABLE_CHAT_SWIPE, Collections.singletonList(
                app.hushtelegram.extension.telegram.misc.ChatSwipe::keepRowStill));
        probes.put(PatchFamily.DISABLE_CHANNEL_PULL, Arrays.asList(
                app.hushtelegram.extension.telegram.misc.ChannelPull::stopBottomPull,
                app.hushtelegram.extension.telegram.misc.ChannelPull::keepChannelStill,
                app.hushtelegram.extension.telegram.misc.ForumTopicPull::stopTopicPull,
                app.hushtelegram.extension.telegram.misc.ForumTopicPull::keepTopicStill));
        probes.put(PatchFamily.NORMAL_PASTE, Collections.singletonList(() -> {
            android.content.ClipboardManager clipboard = (android.content.ClipboardManager) RuntimeEnvironment.getApplication()
                    .getSystemService(android.content.Context.CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(android.content.ClipData.newPlainText("text", "plain"));
            return app.hushtelegram.extension.telegram.misc.NormalPaste.contextMenuAction(
                    new android.widget.EditText(RuntimeEnvironment.getApplication()), android.R.id.paste) == android.R.id.pasteAsPlainText;
        }));
        probes.put(PatchFamily.SHOW_LOCAL_IDS, Arrays.asList(() -> {
            android.widget.FrameLayout menu = new android.widget.FrameLayout(RuntimeEnvironment.getApplication());
            app.hushtelegram.extension.telegram.misc.LocalIds.addToProfile(menu, 42, 0);
            return menu.getChildCount() == 1;
        }, () -> app.hushtelegram.extension.telegram.misc.ProfileDcForTests.row(
                new android.widget.FrameLayout(RuntimeEnvironment.getApplication()))));
        probes.put(PatchFamily.DISABLE_DOUBLE_TAP_REACTIONS, Collections.singletonList(
                app.hushtelegram.extension.telegram.misc.DoubleTapReactions::stopReaction));
        probes.put(PatchFamily.HIDE_CONTACTS_BLOCK, Arrays.asList(
                () -> app.hushtelegram.extension.telegram.misc.ContactsBlock.rows(new java.util.ArrayList<>(Collections.singletonList("contact"))) == null,
                () -> !app.hushtelegram.extension.telegram.misc.ContactsBlock.placeholder(true)));
        probes.put(PatchFamily.HIDE_GREETING_STICKERS, Collections.singletonList(() -> {
            android.widget.FrameLayout stickers = new android.widget.FrameLayout(RuntimeEnvironment.getApplication());
            app.hushtelegram.extension.telegram.misc.GreetingStickers.measure(stickers, false);
            return stickers.getVisibility() == android.view.View.GONE;
        }));
        // After a "Not now", the Contacts tab neither asks again nor marks its icon.
        probes.put(PatchFamily.QUIET_CONTACTS_NAG, Arrays.asList(
                () -> app.hushtelegram.extension.telegram.misc.ContactsNag.skipAsk(declinedContactsPrompt()),
                () -> app.hushtelegram.extension.telegram.misc.ContactsNag.hideBadge(declinedContactsPrompt())));
        // Telegram's holiday check skips its date test and shows the New Year look.
        probes.put(PatchFamily.HOLIDAY_LOOK, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.HolidayLook.mode() == app.hushtelegram.extension.telegram.misc.HolidayLook.SHOW));
        // Telegram's medium font file is answered with the phone's own face.
        probes.put(PatchFamily.USE_SYSTEM_FONT, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.SystemFont.typeface("fonts/rmedium.ttf") != null));
        // Night's window color, as Telegram reads it from the theme file, turns black.
        probes.put(PatchFamily.AMOLED_BLACK, Collections.singletonList(() -> {
            app.hushtelegram.extension.telegram.misc.BlackThemeForTests.useStandInIds();
            android.util.SparseIntArray night = new android.util.SparseIntArray();
            night.put(1, 0xFF181819);
            app.hushtelegram.extension.telegram.misc.BlackTheme.loaded("night.attheme", night);
            return night.get(1) == 0xFF000000;
        }));
        // A chat that isn't being translated answers that its translate bar is hidden.
        probes.put(PatchFamily.HIDE_TRANSLATE_BAR, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.TranslateBar.hidden(new Object(), 42L)));
        // A count comes back written in full.
        probes.put(PatchFamily.EXACT_NUMBERS, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.ExactNumbers.format(12345, null) != null));
        // Spoiler text and media only the sender covered come back uncovered.
        probes.put(PatchFamily.REVEAL_SPOILERS, Arrays.asList(
                app.hushtelegram.extension.telegram.misc.SpoilersForTests::textUncovered,
                app.hushtelegram.extension.telegram.misc.SpoilersForTests::mediaUncovered));
        // A drag closes the keyboard.
        probes.put(PatchFamily.HIDE_KEYBOARD_ON_SCROLL, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.ScrollKeyboardForTests.dragCloses()));
        // A volume key in a chat goes to the volume.
        probes.put(PatchFamily.KEEP_VIDEOS_MUTED, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.VolumeKeysForTests.keyGoesToTheVolume()));
        // A swipe on a profile's photos goes back.
        probes.put(PatchFamily.SWIPE_BACK_ON_PROFILES, Collections.singletonList(
                () -> !app.hushtelegram.extension.telegram.misc.SwipeBack.touchBlocks(true)));
        // Your own number gets covered.
        probes.put(PatchFamily.HIDE_PHONE_NUMBER, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.HidePhoneForTests.covers()));
        // Message times get their seconds.
        probes.put(PatchFamily.MESSAGE_SECONDS, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.MessageTimeForTests.addsSeconds()));
        // Any phone may blur chats.
        probes.put(PatchFamily.ALLOW_CHAT_BLUR, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.ChatBlur.allowed()));
        // The next voice message doesn't start on its own.
        probes.put(PatchFamily.VOICE_ONE_AT_A_TIME, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.VoicePlaylist.queue(new java.util.ArrayList<>(Collections.singletonList("next"))) == null));
        // Telegram's taps stop vibrating.
        probes.put(PatchFamily.NO_HAPTICS, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.HapticsForTests.quiet()));
        // Reaction effects don't play.
        probes.put(PatchFamily.REACTION_EFFECTS_OFF, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.ReactionEffects.skipped()));
        // Folder tabs show no unread counts.
        probes.put(PatchFamily.HIDE_FOLDER_COUNTERS, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.FolderTabs.countersHidden()));
        // New forwards start with the sender hidden.
        probes.put(PatchFamily.FORWARD_HIDE_SENDER, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.ForwardSenderForTests.on()));
        // A voice message opens the full player.
        probes.put(PatchFamily.VOICE_MUSIC_PLAYER, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.VoicePlayerForTests.voiceOpensThePlayer()));
        // A stranger's notification goes out silently.
        probes.put(PatchFamily.SILENCE_NON_CONTACTS, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.NonContactsForTests.on()));
        // A hidden archive stays out of the chat list.
        probes.put(PatchFamily.DISABLE_ARCHIVE_PULL, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.ArchivePullForTests.on()));
        // The attachment camera starts on the rear lens.
        probes.put(PatchFamily.REAR_CAMERA_FIRST, Collections.singletonList(
                () -> !app.hushtelegram.extension.telegram.misc.RearCamera.front(true)));
        // The attachment gallery is built without its camera tile.
        probes.put(PatchFamily.HIDE_GALLERY_CAMERA_TILE, Collections.singletonList(
                () -> !app.hushtelegram.extension.telegram.misc.GalleryCameraTile.tile(true)));
        // A sticker skips its time.
        probes.put(PatchFamily.HIDE_STICKER_TIME, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.StickerTimeForTests.on()));
        // A mention in a muted chat stays quiet.
        probes.put(PatchFamily.IGNORE_MUTED_MENTIONS, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.MutedMentionsForTests.on()));
        // A blocked person's group messages are left out.
        probes.put(PatchFamily.HIDE_BLOCKED_IN_GROUPS, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.BlockedSendersForTests.on()));
        // Settings loses Telegram Features and Contacts loses Invite Friends.
        probes.put(PatchFamily.HIDE_FEATURES_AND_INVITE, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.FeaturesInviteForTests.on()));
        // A message's long-press menu offers Repeat, Copy photo, Message details and Quick forward, each under its own switch.
        probes.put(PatchFamily.MESSAGE_MENU_REPEAT, Arrays.asList(
                () -> app.hushtelegram.extension.telegram.misc.MessageMenuForTests.repeatOn(),
                () -> app.hushtelegram.extension.telegram.misc.MessageMenuForTests.copyPhotoOn(),
                () -> app.hushtelegram.extension.telegram.misc.MessageMenuForTests.detailsOn(),
                () -> app.hushtelegram.extension.telegram.misc.MessageMenuForTests.quickForwardOn()));
        // A message another person deletes stays on the phone.
        probes.put(PatchFamily.KEEP_DELETED_MESSAGES, Collections.singletonList(
                () -> app.hushtelegram.extension.telegram.misc.KeepDeleted.on()));
        // A sticker, a GIF, a voice or video message and a call each ask first, under their own switches.
        probes.put(PatchFamily.ASK_BEFORE_STICKER, Arrays.asList(
                () -> app.hushtelegram.extension.telegram.misc.SendConfirmForTests.stickerOn(),
                () -> app.hushtelegram.extension.telegram.misc.SendConfirmForTests.gifOn(),
                () -> app.hushtelegram.extension.telegram.misc.SendConfirmForTests.voiceVideoOn(),
                () -> app.hushtelegram.extension.telegram.misc.SendConfirmForTests.callOn()));
        // Telegram Beta stops forcing its debug logs on.
        probes.put(PatchFamily.BETA_LOGS_OFF, Collections.singletonList(
                () -> !app.hushtelegram.extension.telegram.misc.BetaLogs.forceLogs(true)));
        // The gallery's camera stays off until a tap, and a tap that asks for the permission wakes it.
        probes.put(PatchFamily.GALLERY_CAMERA_ON_TAP, Arrays.asList(
                () -> app.hushtelegram.extension.telegram.misc.GalleryCamera.keepCameraOff(new Object()),
                () -> app.hushtelegram.extension.telegram.misc.GalleryCamera.wakeOnTap(new Object(), null),
                () -> {
                    Object gallery = new Object();
                    app.hushtelegram.extension.telegram.misc.GalleryCamera.wakeForPermission(gallery);
                    return app.hushtelegram.extension.telegram.misc.GalleryCamera.openWhenReady(gallery, new Object());
                }));
        // A device statistics report is never read or sent, and neither is a channel's read time.
        // On Telegram Beta, Crashlytics never starts and Sessions reads its override as off.
        probes.put(PatchFamily.DISABLE_ANALYTICS, Arrays.asList(
                () -> Analytics.skipDeviceStats(new DeviceStatsController(true, false)),
                () -> Analytics.skipReadMetrics(new ArrayList<>()),
                () -> Analytics.skipPremiumAppLog("premium.promo_screen_show"),
                () -> Analytics.skipPremiumAppLog("premium.promo_screen_tap"),
                () -> Analytics.skipPremiumAppLog("premium.promo_screen_accept"),
                () -> Analytics.skipPremiumAppLog("premium.promo_screen_fail"),
                () -> Analytics.skipCrashReporterStart(),
                () -> Analytics.skipErrorReport(),
                () -> Boolean.FALSE.equals(Analytics.sessionsEnabled(null))));
        probes.put(PatchFamily.OPEN_EXTERNAL_LINKS, Collections.singletonList(PausedHooksTest::externalBrowserOpened));
        probes.put(PatchFamily.STRIP_LINK_TRACKING, Arrays.asList(
                () -> PROBE_URL.equals(LinkRouting.cleanOpenedUri(Uri.parse(TRACKED_URL), false, new boolean[1]).toString()),
                () -> PROBE_URL.equals(LinkRouting.cleanShareIntent(new Intent(Intent.ACTION_SEND).setType("text/plain")
                        .putExtra(Intent.EXTRA_TEXT, TRACKED_URL)).getStringExtra(Intent.EXTRA_TEXT))));
        // telegram.org's build never asks the server whether a newer one is out.
        probes.put(PatchFamily.DISABLE_UPDATE_CHECKS, Collections.singletonList(UpdateChecks::skipUpdateCheck));
        probes.put(PatchFamily.REPAIR_FIREBASE_PUSH, Collections.singletonList(PausedHooksTest::firebaseHeaderChanged));
        return probes;
    }

    private static boolean firebaseHeaderChanged() {
        try {
            java.net.URLConnection connection = new java.net.URLConnection(new java.net.URL(
                    "https://firebaseinstallations.googleapis.com/v1/projects/test/installations")) {
                @Override public void connect() { throw new AssertionError("a header hook must not connect"); }
            };
            connection.setRequestProperty("X-Android-Package", "org.telegram.messenger.web");
            String original = "test-installed-signer";
            return !original.equals(app.hushtelegram.extension.telegram.misc.FirebasePush.certificateHeader(connection, original));
        } catch (java.net.MalformedURLException impossible) {
            throw new AssertionError(impossible);
        }
    }

    /** Telegram's prompt flags after a "Not now" in the Contacts tab. */
    private static android.content.SharedPreferences declinedContactsPrompt() {
        android.content.SharedPreferences prefs = org.robolectric.RuntimeEnvironment.getApplication()
                .getSharedPreferences("paused_hooks_contacts", android.content.Context.MODE_PRIVATE);
        prefs.edit().putBoolean("askAboutContacts2", false).commit();
        return prefs;
    }

    /** A browser handling both schemes without a domain restriction, using the runtime's real query. */
    private static void registerProbeBrowser() {
        while (shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity() != null) { }
        ResolveInfo info = new ResolveInfo();
        info.activityInfo = new ActivityInfo();
        info.activityInfo.packageName = PROBE_BROWSER;
        info.activityInfo.name = PROBE_BROWSER + ".BrowserActivity";
        info.activityInfo.enabled = true;
        info.activityInfo.exported = true;
        info.filter = new IntentFilter(Intent.ACTION_VIEW);
        info.filter.addCategory(Intent.CATEGORY_DEFAULT);
        info.filter.addCategory(Intent.CATEGORY_BROWSABLE);
        info.filter.addDataScheme("http");
        info.filter.addDataScheme("https");
        ShadowPackageManager manager = shadowOf(RuntimeEnvironment.getApplication().getPackageManager());
        for (String scheme : new String[]{"http", "https"}) manager.addResolveInfoForIntent(
                new Intent(Intent.ACTION_VIEW, Uri.parse(scheme + "://")).addCategory(Intent.CATEGORY_BROWSABLE), info);
    }

    /** A true probe is an actual sandbox launch; disabled and paused probes must launch nothing. */
    private static boolean externalBrowserOpened() {
        boolean redirected = LinkRouting.tryOpenExternal(RuntimeEnvironment.getApplication(),
                Uri.parse(PROBE_URL), false, new boolean[1], PROBE_BROWSER);
        Intent launched = shadowOf(RuntimeEnvironment.getApplication()).getNextStartedActivity();
        assertEquals("routing and the actual browser launch disagree", redirected, launched != null);
        if (launched != null) {
            assertEquals(Intent.ACTION_VIEW, launched.getAction());
            assertEquals(PROBE_BROWSER, launched.getPackage());
            assertEquals(Uri.parse(PROBE_URL), launched.getData());
        }
        return redirected;
    }

    /** Every switch the settings screen can show, read off the class so a new one can't hide. */
    static List<BooleanSetting> settingsSwitches() {
        List<BooleanSetting> switches = new ArrayList<>();
        for (Field field : Settings.class.getDeclaredFields()) {
            if (!Modifier.isStatic(field.getModifiers()) || field.getType() != BooleanSetting.class) continue;
            try {
                switches.add((BooleanSetting) field.get(null));
            } catch (IllegalAccessException unreadable) {
                throw new AssertionError(unreadable);
            }
        }
        return switches;
    }

    private static Set<PatchFamily> switched() {
        Set<PatchFamily> switched = EnumSet.noneOf(PatchFamily.class);
        for (PatchFamily family : PatchFamily.values()) {
            if (!family.switches.isEmpty()) switched.add(family);
        }
        return switched;
    }

    /** Adds a line to [wrong] for every probe that didn't answer [changes]. */
    private static void everyProbe(Map<PatchFamily, List<Probe>> probes, boolean changes, String when,
                                   List<String> wrong) {
        ProxyScope.calls = 0;
        for (Map.Entry<PatchFamily, List<Probe>> entry : probes.entrySet()) {
            for (int i = 0; i < entry.getValue().size(); i++) {
                if (entry.getValue().get(i).changedTelegram() != changes) {
                    wrong.add(entry.getKey().patchName + ", probe " + i + ", " + when
                            + (changes ? ": left Telegram alone" : ": still changed Telegram"));
                }
            }
        }
        int expectedProxyScopeCalls = changes ? 2 : 0;
        if (ProxyScope.calls != expectedProxyScopeCalls) {
            wrong.add("proxy host scope, " + when + ": expected " + expectedProxyScopeCalls
                    + " calls, got " + ProxyScope.calls);
        }
    }

    /** Adds a line to [wrong] for every entry probe that didn't answer [changes]. */
    private static void everyEntryProbe(Map<BooleanSetting, Probe> probes, boolean changes, String when,
                                        List<String> wrong) {
        for (Map.Entry<BooleanSetting, Probe> entry : probes.entrySet()) {
            if (entry.getValue().changedTelegram() != changes) {
                wrong.add(entry.getKey().key + ", " + when + (changes ? ": left Telegram alone" : ": still changed Telegram"));
            }
        }
    }

    @Test
    public void everyHookASwitchRunsTakesTelegramsOwnPathWhilePaused() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(true);
        Map<PatchFamily, List<Probe>> probes = probes();
        assertEquals("every family with a switch needs a probe here", switched(), probes.keySet());
        Map<BooleanSetting, Probe> entry = entryProbes();
        assertEquals("every switch of the settings entry needs a probe here",
                new HashSet<>(PatchFamily.ENTRY_SWITCHES), entry.keySet());

        // Every hook is asked every time, so one run names every hook that broke the promise.
        List<String> wrong = new ArrayList<>();
        everyProbe(probes, true, "running", wrong);
        everyEntryProbe(entry, true, "running", wrong);

        for (HushTelegramPause.Reason why : new HushTelegramPause.Reason[]{
                HushTelegramPause.Reason.SWITCH, HushTelegramPause.Reason.CRASH_LOOP,
                HushTelegramPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            everyProbe(probes, false, "paused by " + why, wrong);
            everyEntryProbe(entry, false, "paused by " + why, wrong);
        }

        PauseForTests.resume();
        everyProbe(probes, true, "running again", wrong);
        everyEntryProbe(entry, true, "running again", wrong);
        assertEquals(Collections.emptyList(), wrong);
    }

    /** With its switch off, each hook leaves Telegram alone too, so a probe can't pass by luck. */
    @Test
    public void everyHookLeavesTelegramAloneWithItsSwitchOff() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(false);
        List<String> wrong = new ArrayList<>();
        everyProbe(probes(), false, "switched off", wrong);
        everyEntryProbe(entryProbes(), false, "switched off", wrong);
        assertEquals(Collections.emptyList(), wrong);
    }

    /**
     * Telegram can call a hook before its application's onCreate hands HushTelegram the context,
     * from a thread it starts early, and again while setContext is still deciding whether this
     * start runs paused. Until both are done, every hook takes Telegram's own path whatever is
     * saved (see Utils.settingsReady). This JVM's Setting class loaded with a context, so a hook
     * that reads its switch anyway answers on here and is named.
     */
    @Test
    public void untilTheSettingsAreReadyEveryHookTakesTelegramsOwnPath() {
        for (BooleanSetting setting : settingsSwitches()) setting.save(true);
        Map<PatchFamily, List<Probe>> probes = probes();
        assertEquals("every family with a switch needs a probe here", switched(), probes.keySet());
        Map<BooleanSetting, Probe> entry = entryProbes();

        List<String> wrong = new ArrayList<>();
        SettingsContextRule.withoutContext(() -> {
            everyProbe(probes, false, "before the context is set", wrong);
            everyEntryProbe(entry, false, "before the context is set", wrong);
        });
        // Safe mode on, as after three crashed starts: the context is set and the pause undecided.
        BaseSettings.SAFE_MODE.save(true);
        try {
            SettingsContextRule.beforeThePauseIsDecided(() -> {
                everyProbe(probes, false, "before the pause is decided", wrong);
                everyEntryProbe(entry, false, "before the pause is decided", wrong);
            });
        } finally {
            BaseSettings.SAFE_MODE.resetToDefault();
        }
        everyProbe(probes, true, "once they're ready", wrong);
        everyEntryProbe(entry, true, "once they're ready", wrong);
        assertEquals(Collections.emptyList(), wrong);
    }

    @Test
    public void pausedEverySwitchAnswersOffAndKeepsWhatWasSaved() {
        List<BooleanSetting> switches = settingsSwitches();
        assertFalse("found no switches to check", switches.isEmpty());
        for (BooleanSetting setting : switches) setting.save(true);

        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        for (BooleanSetting setting : switches) {
            assertFalse(setting.key + " answered on while paused", setting.get());
            assertTrue(setting.key + " lost what was saved", setting.savedValue());
        }

        PauseForTests.resume();
        for (BooleanSetting setting : switches) {
            assertTrue(setting.key + " stayed off after the pause ended", setting.get());
        }
    }

    /**
     * The Pause row and the paused card say Debug logging keeps working, which is how a paused
     * start gets logged for a report.
     */
    @Test
    public void debugLoggingKeepsWorkingWhilePaused() {
        BaseSettings.DEBUG.save(true);
        try {
            for (HushTelegramPause.Reason why : HushTelegramPause.Reason.values()) {
                if (why == HushTelegramPause.Reason.NONE) continue;
                PauseForTests.pause(why);
                assertTrue("Debug logging answered off while paused by " + why, BaseSettings.DEBUG.get());
            }
        } finally {
            BaseSettings.DEBUG.resetToDefault();
        }
    }
}
