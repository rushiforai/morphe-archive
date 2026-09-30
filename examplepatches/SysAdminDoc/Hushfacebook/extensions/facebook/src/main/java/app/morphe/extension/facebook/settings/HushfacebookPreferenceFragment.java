/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.facebook.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.preference.EditTextPreference;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.preference.TwoStatePreference;
import android.text.InputType;
import android.text.Layout;
import android.text.util.Linkify;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.facebook.coexist.MessengerLinkCheck;
import app.morphe.extension.facebook.comments.CommentOrder;
import app.morphe.extension.facebook.download.DownloadQuality;
import app.morphe.extension.facebook.download.FileNameTemplate;
import app.morphe.extension.facebook.download.SaveControl;
import app.morphe.extension.facebook.download.SaveFolder;
import app.morphe.extension.facebook.feed.PostWords;
import app.morphe.extension.facebook.media.PlaybackQuality;
import app.morphe.extension.facebook.navigation.StartTab;
import app.morphe.extension.facebook.navigation.MarketplaceOnly;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.morphe.extension.shared.settings.preference.ClearLogBufferPreference;
import app.morphe.extension.shared.settings.preference.ExportDiagnosticReportPreference;
import app.morphe.extension.shared.settings.preference.ImmediateAction;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * The preference list, built in code rather than from an XML resource so the bundle adds no
 * resources to Facebook. A switch appears only when its patch is in this build
 * ({@link PatchFamily}), but for the settings entry's own ({@link PatchFamily#ENTRY_SWITCHES}),
 * which every build has, and the ones the downloads share ({@link PatchFamily#DOWNLOAD_SWITCHES}),
 * which any download patch brings; a patch that works entirely at patch time gets a line saying so, and
 * what Pause can't reach is listed under the Pause switch. Switches are keyed by their setting,
 * which is how the shared fragment keeps them in sync with stored values. Every word is read from
 * {@link L10n} in the phone's language; the product names and the address stay as they are.
 */
@SuppressWarnings("deprecation")
public final class HushfacebookPreferenceFragment extends AbstractPreferenceFragment
        implements ReleaseCheck.Listener {
    /** The repository as a link, and as a person reads it. ExtensionHostsTest reads the link. */
    static final String SOURCE_URL = "https://github.com/SysAdminDoc/Hushfacebook";
    static final String SOURCE_ADDRESS = SOURCE_URL.substring(SOURCE_URL.indexOf("://") + 3);
    /** The English of the row listing what Pause can't reach, and its key in {@link L10n}. */
    static final String STAYS_WHILE_PAUSED = "Stays in while paused";
    /** The Check now row's key. It stores nothing: no setting has this name. */
    static final String CHECK_NOW = "action_check_for_release";
    /** The Supported links row's key. It stores nothing either. */
    static final String SUPPORTED_LINKS = "action_supported_links";

    /** Thrown by the next initialize() and then cleared: how a test reaches the recovery page. */
    static volatile RuntimeException failNextInitialization;

    /** The first row, which says whether Hushfacebook runs now and whether the next start changes that. */
    @Nullable
    private Preference statusCard;

    /** The row that asks GitHub for the newest release now, and says what the last try found. */
    @Nullable
    private Preference checkNowRow;

    /** Where a settings file waiting on the person's answer is kept across the page being rebuilt. */
    static final String PENDING_IMPORT_STATE = "hushfacebook_pending_import";

    /**
     * A settings file that was read and waits on the person's answer, as
     * {@link SettingsBackup.Snapshot#toBundle()} wrote it, or null.
     */
    @Nullable
    Bundle pendingImport;

    /** The preview of {@link #pendingImport} while it's on screen. */
    @Nullable
    AlertDialog importPreview;

    /** The page's other dialogs that may still be on screen: the sections, Licenses and a word list's note. */
    private final List<Dialog> shownDialogs = new ArrayList<>();

    /**
     * Where the list was before the last section jump, as its first visible position and that row's
     * top, which Back goes back to once; null when there's been no jump since.
     */
    @Nullable
    int[] beforeJump;

    @Nullable
    SettingsNavigation navigation;

    /** The Downloads section, where the running saves are listed, or null when no download patch is in. */
    @Nullable
    private PreferenceCategory downloads;

    /** The rows of the saves running now, by save number. */
    private final Map<Integer, SaveRow> saveRows = new HashMap<>();

    /** Keeps the rows in step with the saves while the page is showing. Saves tell it from their own thread. */
    private final SaveControl.Watcher saves = () -> Utils.runOnMainThread(this::showSaves);

    @Override
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        // The complete model remains usable as a standalone preference page. The dialog adds
        // its navigation shell only after the framework has bound that model to the list.
        if (getParentFragment() instanceof SettingsDialog && !sections().isEmpty()) {
            navigation = new SettingsNavigation(this, (SettingsDialog) getParentFragment(), savedInstanceState);
        }
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        if (savedInstanceState != null) pendingImport = savedInstanceState.getBundle(PENDING_IMPORT_STATE);
        super.onCreate(savedInstanceState);
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ListView list = view.findViewById(android.R.id.list);
        if (list != null) {
            list.setDivider(null);
            list.setDividerHeight(0);
            // From the context, not from what initialize() stores: a page whose initialize() failed
            // before it got that far kept an earlier screen's colours, or none, and a light Material
            // You error page drew its dark message on black.
            ScreenColors colors = ScreenColors.forScreen(getContext());
            list.setBackgroundColor(colors == null ? Color.BLACK : colors.background);
        }
    }

    @Override
    public void onResume() {
        super.onResume();
        SettingsBackupPreference.onPageResumed(this);
        showMarketplaceSettings();
        showSupportedLinks();
        SaveControl.watch(saves);
        showSaves();
    }

    @Override
    public void onPause() {
        SaveControl.unwatch(saves);
        super.onPause();
    }

    @Override
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (pendingImport != null) outState.putBundle(PENDING_IMPORT_STATE, pendingImport);
        if (navigation != null) navigation.save(outState);
    }

    @Override
    public void onDestroyView() {
        // The preview is drawn over this page's window. It stays unanswered, and the page that
        // replaces this one shows it again.
        SettingsBackupPreference.closePreview(this);
        // The page's other dialogs are drawn over its window too, and would outlive it.
        for (Dialog dialog : new ArrayList<>(shownDialogs)) dialog.dismiss();
        shownDialogs.clear();
        ReleaseCheck.unwatch(this);
        if (navigation != null) navigation.close();
        navigation = null;
        super.onDestroyView();
    }

    /** A release check ended: the card and the Check now row say what it found. */
    @Override
    public void releaseCheckFinished() {
        Context context = getContext();
        if (context == null) return;
        if (statusCard != null) showStatus(statusCard, context);
        if (checkNowRow != null) checkNowRow.setSummary(ReleaseCheck.checkNowSummary());
    }

    /**
     * The file pickers' answers. Android finds this page by the name the framework gave it when
     * the picker was opened, and a page rebuilt while the picker was up is given the same name.
     */
    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (SettingsBackupPreference.onResult(this, requestCode, resultCode, data)) return;
        FontFilePreference.onResult(this, requestCode, resultCode, data);
    }

    /** Shows what the switches are saved as, after an import wrote them. */
    void refreshSwitches() {
        updateUIToSettingValues();
    }

    @Override
    protected void initialize() {
        RuntimeException fault = failNextInitialization;
        if (fault != null) {
            failNextInitialization = null;
            throw fault;
        }
        // Loads the switches before the shared fragment syncs them to the screen.
        Settings.HIDE_SPONSORED_POSTS.get();

        // Every row inflates with the theme of the context it was built with. Facebook's activity
        // theme is light, so its near-black primary text vanished on this screen's black background
        // on a phone (2026-09-24). The rows get a dark Material theme instead, or with the Material
        // You theme in the build, the phone's dark or light one in its wallpaper colours.
        ScreenColors.shown = ScreenColors.forScreen(getContext());
        Context context = themed(getContext());
        PreferenceScreen screen = getPreferenceManager().createPreferenceScreen(context);
        setPreferenceScreen(screen);

        screen.addPreference(statusCard(context));
        screen.addPreference(jumpRow(context));
        // The export row below reads these; registering twice keeps one.
        PatchFamily.registerDiagnostics();
        LogBufferManager.registerReportSection(ReleaseCheck.REPORT);
        Set<PatchFamily> build = PatchFamily.inThisBuild();

        if (build.contains(PatchFamily.START_TAB) || build.contains(PatchFamily.MARKETPLACE_ONLY)) {
            // First: it's what happens before anything the other rows change comes on screen.
            PreferenceCategory opening = category(screen, L10n.t("Opening Facebook"));
            if (build.contains(PatchFamily.MARKETPLACE_ONLY)) {
                // Facebook builds the tab bar once, and the hook is asked then and not again.
                opening.addPreference(toggle(context, Settings.MARKETPLACE_ONLY, L10n.t("Marketplace only"), ""));
                opening.addPreference(toggle(context, Settings.MARKETPLACE_QUIET_NOTIFICATIONS,
                        L10n.t("Quiet social notifications"),
                        L10n.t("Silence video suggestions, memories, birthdays and friend suggestions while this mode is on. Messages and trading updates stay. Your other notification choices stay saved.")));
                Row regular = new Row(context);
                regular.actsAtOnce = true;
                regular.setKey("action_regular_facebook");
                regular.setTitle(L10n.t("Return to regular Facebook"));
                regular.setSummary(L10n.t("Restore the normal tabs at the next restart. Your other settings stay saved."));
                regular.setOnPreferenceClickListener(ignored -> {
                    if (Settings.MARKETPLACE_ONLY.save(false)) {
                        refreshSwitches();
                        Utils.showToastLong(MarketplaceOnly.state() == MarketplaceOnly.State.RESTART_NEEDED
                                ? L10n.t("Marketplace mode is off. Restart Facebook to restore its normal tabs.")
                                : L10n.t("Marketplace mode is off."));
                    } else {
                        Utils.showToastLong(L10n.t("Couldn't save the change. Try again."));
                    }
                    return true;
                });
                opening.addPreference(regular);
                opening.addPreference(toggle(context, Settings.MARKETPLACE_SKIP_FEED_PREFETCH,
                        L10n.t("Skip feed preloading"),
                        L10n.t("Reduce background feed loading while Marketplace mode is active. Some loading can still happen during startup.")));
            }
            if (build.contains(PatchFamily.START_TAB)) {
                opening.addPreference(toggle(context, Settings.OPEN_ON_CHOSEN_TAB, L10n.t("Open on a chosen tab"),
                        L10n.t("Choose where Facebook opens from its icon. Notifications and links still open their destination.")));
                opening.addPreference(startTabRow(context));
            }
        }

        if (build.contains(PatchFamily.SPONSORED_POSTS) || build.contains(PatchFamily.SUGGESTED_POSTS)
                || build.contains(PatchFamily.STORIES_TRAY) || build.contains(PatchFamily.FEED_REELS)
                || build.contains(PatchFamily.RETURN_REFRESH)
                || build.contains(PatchFamily.AI_DETECTED_POSTS)
                || build.contains(PatchFamily.SPONSORED_PROFILE_POSTS)
                || build.contains(PatchFamily.POST_WORDS)) {
            PreferenceCategory feed = category(screen, L10n.t("News feed"));
            if (build.contains(PatchFamily.SPONSORED_POSTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_SPONSORED_POSTS, L10n.t("Hide sponsored posts"),
                        L10n.t("Paid ads in the feed. They're dropped before Facebook adds them, so no gap is left.")));
                feed.addPreference(toggle(context, Settings.HIDE_PROMOTED_POSTS, L10n.t("Hide promoted posts"),
                        L10n.t("Posts Facebook files as promotions rather than as ads.")));
            }
            // Profiles have no section of their own; their ads sit with the feed's.
            if (build.contains(PatchFamily.SPONSORED_PROFILE_POSTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_SPONSORED_PROFILE_POSTS,
                        L10n.t("Hide sponsored profile posts"),
                        L10n.t("Ads between the posts on someone's profile or a Page. Their own posts stay.")));
            }
            if (build.contains(PatchFamily.SUGGESTED_POSTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_SUGGESTED_POSTS,
                        L10n.t("Hide page suggestions and Facebook's own promos"),
                        L10n.t("\"Pages you may like\" cards and the cards Facebook uses to push its own features. "
                                + "In-feed surveys go too.")));
                feed.addPreference(toggle(context, Settings.HIDE_SUGGESTED_FOR_YOU,
                        L10n.t("Hide \"Suggested for you\" posts"),
                        L10n.t("Posts Facebook slips into your feed from people and pages you don't follow and groups you haven't joined.")));
                feed.addPreference(toggle(context, Settings.HIDE_PEOPLE_YOU_MAY_KNOW,
                        L10n.t("Hide \"People you may know\""),
                        L10n.t("The row of friend suggestions between posts, and the one on your own profile.")));
                feed.addPreference(toggle(context, Settings.HIDE_SUGGESTED_GROUPS,
                        L10n.t("Hide suggested groups"),
                        L10n.t("The row of groups to join between posts, with its Discover more groups button. "
                                + "Posts from groups you're in stay.")));
                feed.addPreference(toggle(context, Settings.HIDE_STORIES_YOU_MIGHT_LIKE,
                        L10n.t("Hide \"Stories you might like\""),
                        L10n.t("The row of Stories from people you aren't connected to that Facebook puts between "
                                + "posts. Your friends' Stories and the Stories tray stay.")));
            }
            if (build.contains(PatchFamily.STORIES_TRAY)) {
                // Facebook builds the feed's adapters once, when the feed is set up, and the tray is
                // one of them. The hook is asked then and not again, so a change waits for a restart.
                feed.addPreference(toggle(context, Settings.HIDE_STORIES_TRAY, L10n.t("Hide the Stories tray"),
                        L10n.t("The row of stories at the top of the feed, Create story included.") + " "
                                + L10n.t("The switch takes effect when Facebook restarts.")));
            }
            if (build.contains(PatchFamily.FEED_REELS)) {
                feed.addPreference(toggle(context, Settings.HIDE_FEED_REELS, L10n.t("Hide Reels in the feed"),
                        L10n.t("The rows of reels between posts, and the reels Facebook adds where your feed ends.")));
            }
            if (build.contains(PatchFamily.RETURN_REFRESH)) {
                feed.addPreference(toggle(context, Settings.BLOCK_RETURN_REFRESH,
                        L10n.t("Keep feed position on return"),
                        L10n.t("Returning to Facebook within ten minutes keeps your place. Pull to refresh still works.")));
                feed.addPreference(toggle(context, Settings.RETURN_REFRESH_NO_LIMIT,
                        L10n.t("No time limit"),
                        L10n.t("With the switch above on, your place stays however long you're away. Pull to refresh and a fresh start still load new posts.")));
            }
            if (build.contains(PatchFamily.AI_DETECTED_POSTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_AI_DETECTED_POSTS, L10n.t("Hide AI-detected posts"),
                        L10n.t("Posts that Facebook's own detection marks as made with AI. A post that only its "
                                + "creator labelled as AI stays. It's off by default because it hasn't been tested "
                                + "on a real feed yet.")));
                feed.addPreference(toggle(context, Settings.HIDE_AI_LABELLED_POSTS,
                        L10n.t("Also hide posts labelled as AI"),
                        L10n.t("Posts whose creator marked them as made with AI. Facebook puts its AI label next to "
                                + "the name on these as well as on the posts its detection found, and with this on, "
                                + "both kinds go. It's off by default because it hasn't been tested on a real feed "
                                + "yet.")));
            }
            if (build.contains(PatchFamily.POST_WORDS)) {
                feed.addPreference(toggle(context, Settings.HIDE_POSTS_WITH_WORDS,
                        L10n.t("Hide posts with words you choose"),
                        L10n.t("Posts whose text has a word or phrase from your list below. A post with a word from "
                                + "your keep list stays, and so does a post with no text. Your words only leave the "
                                + "phone in a settings file you export.")));
                feed.addPreference(wordsRow(context, Settings.HIDDEN_WORDS, true));
                feed.addPreference(wordsRow(context, Settings.KEPT_WORDS, false));
            }
        }

        if (build.contains(PatchFamily.SPONSORED_STORIES) || build.contains(PatchFamily.SUGGESTED_STORIES)
                || build.contains(PatchFamily.STORY_AUTO_ADVANCE) || build.contains(PatchFamily.STORY_SEEN)
                || build.contains(PatchFamily.STORY_DOWNLOAD)) {
            PreferenceCategory stories = category(screen, L10n.t("Stories"));
            if (build.contains(PatchFamily.SPONSORED_STORIES)) {
                stories.addPreference(toggle(context, Settings.HIDE_SPONSORED_STORIES, L10n.t("Hide sponsored stories"),
                        L10n.t("Ad cards between the stories people posted.")));
            }
            if (build.contains(PatchFamily.SUGGESTED_STORIES)) {
                // The tray's buckets are filtered as each answer of its fetch comes in, so a change
                // shows when Facebook next loads the tray, not on the tray already drawn.
                stories.addPreference(toggle(context, Settings.HIDE_SUGGESTED_STORIES,
                        L10n.t("Hide suggested stories"),
                        L10n.t("Keep friends and followed Pages in the Stories tray. Applies when Facebook next loads the tray.")));
            }
            if (build.contains(PatchFamily.STORY_AUTO_ADVANCE)) {
                stories.addPreference(toggle(context, Settings.BLOCK_STORY_AUTO_ADVANCE,
                        L10n.t("Stop Story auto-advance"),
                        L10n.t("A finished story stays on screen until you tap or swipe. Turn this off for Facebook's timing.")));
            }
            if (build.contains(PatchFamily.STORY_SEEN)) {
                stories.addPreference(toggle(context, Settings.VIEW_STORIES_ANONYMOUSLY,
                        L10n.t("View stories anonymously"),
                        L10n.t("Facebook isn't told which stories you watch, so you stay off their viewer lists. "
                                + "Replying or reacting still shows you, and stories you've watched keep their "
                                + "unwatched ring.")));
            }
            if (build.contains(PatchFamily.STORY_DOWNLOAD)) {
                stories.addPreference(toggle(context, Settings.DOWNLOAD_STORIES, L10n.t("Save any story"),
                        L10n.t("Add Save to every story menu, using your download quality. Off or paused, Facebook only saves your own stories.")));
            }
        }

        // In every build: "How do I block Reels?" has four answers in four places (discussion #17),
        // and the tab's answer is Facebook's own setting, so the map is here whatever was patched.
        PreferenceCategory reels = category(screen, L10n.t("Reels and Watch"));
        reels.addPreference(info(context, L10n.t("How to block Reels"),
                L10n.t("Reels show up in four places, and each one has its own control.")));
        reels.addPreference(reelsLink(context, build, PatchFamily.FEED_REELS, Settings.HIDE_FEED_REELS,
                L10n.t("Reels in the feed"),
                L10n.t("In News feed, Hide Reels in the feed blocks the rows of reels between posts.")));
        reels.addPreference(reelsLink(context, build, PatchFamily.TAP_TO_PLAY, Settings.TAP_TO_PLAY,
                L10n.t("Reels that play by themselves"),
                L10n.t("In Playback, Tap to play blocks autoplay, so reels and other videos wait for your tap.")));
        // Without Hide the Reels tab, Facebook's own Hide is the answer, on the accounts that have it.
        if (build.contains(PatchFamily.REELS_TAB)) {
            reels.addPreference(reelsLink(context, build, PatchFamily.REELS_TAB, Settings.HIDE_REELS_TAB,
                    L10n.t("The Reels tab"),
                    L10n.t("In Reels and Watch, Hide the Reels tab blocks it after a restart.")));
        } else {
            reels.addPreference(info(context, L10n.t("The Reels tab"),
                    L10n.f("Facebook's own setting blocks it. Open Settings, Tab bar, Customize the bar and choose "
                            + "Hide next to Reels, which some accounts call Video. If neither is listed, choose the "
                            + "%1$s patch in Morphe Manager and patch again.",
                            L10n.isolate(PatchFamily.REELS_TAB.patchName))));
        }
        reels.addPreference(reelsLink(context, build, PatchFamily.MARKETPLACE_ONLY, Settings.MARKETPLACE_ONLY,
                L10n.t("Everything except Marketplace"),
                L10n.t("In Opening Facebook, Marketplace only blocks the feed, the Reels tab and the other social "
                        + "tabs after a restart.")));
        if (build.contains(PatchFamily.REELS_TAB)) {
            // Facebook keeps the tab bar it built, so a change waits for a restart and the page says so.
            reels.addPreference(toggle(context, Settings.HIDE_REELS_TAB, L10n.t("Hide the Reels tab"),
                    L10n.t("Take the Reels tab, called Video on some accounts, off the tab bar. Reel links and reels "
                            + "in the feed still open. Changes show after Facebook restarts.")));
        }
        if (build.contains(PatchFamily.REELS_TAB_DOT)) {
            reels.addPreference(toggle(context, Settings.HIDE_REELS_TAB_DOT, L10n.t("Hide the Reels tab dot"),
                    L10n.t("No dot or new count on the Reels tab, called Video on some accounts. Other tabs keep theirs.")));
        }
        // Both reel filters work on each batch of reels as it arrives, so a change leaves the
        // reels already loaded as they are, and the rows say so.
        if (build.contains(PatchFamily.SPONSORED_REELS)) {
            reels.addPreference(toggle(context, Settings.HIDE_SPONSORED_REELS, L10n.t("Hide sponsored reels"),
                    L10n.t("Ads inside Reels, starting with the next batch Facebook loads. Banners, mid-rolls "
                            + "and app-inserted ads stay blocked even while paused.")));
        }
        if (build.contains(PatchFamily.AI_DETECTED_POSTS)) {
            reels.addPreference(toggle(context, Settings.HIDE_AI_DETECTED_REELS,
                    L10n.t("Hide AI-detected reels and videos"),
                    L10n.t("Reels and Watch videos that Facebook's own detection marks as made with AI, starting "
                            + "with the next batch Facebook loads. One that only its creator labelled as AI stays. "
                            + "It's off by default because it hasn't been tested on a real account yet.")));
        }
        if (build.contains(PatchFamily.REEL_DECLUTTER)) {
            reels.addPreference(toggle(context, Settings.HIDE_REEL_CHIPS,
                    L10n.t("Hide prompts and promos under reels"),
                    L10n.t("Remix, Use template, Add yours and Edits buttons, plus Stars, games, partner apps "
                            + "and outside links. The song and other labels stay.")));
            reels.addPreference(toggle(context, Settings.HIDE_REEL_FOLLOW_BUTTON,
                    L10n.t("Hide the Follow button on reels"),
                    L10n.t("The Follow button next to the reel's author. You can still follow them from their profile.")));
            reels.addPreference(toggle(context, Settings.HIDE_REEL_SOCIAL_FOOTER,
                    L10n.t("Hide comment and reaction previews"),
                    L10n.t("The comment Facebook previews under a reel and the bubbles of friends who reacted. "
                            + "Open the comments to see them all.")));
        }
        if (build.contains(PatchFamily.REEL_WATCH_HISTORY)) {
            reels.addPreference(toggle(context, Settings.DONT_SEND_REEL_WATCH_HISTORY,
                    L10n.t("Don't send reel watch history"),
                    L10n.t("Stop sending watched-reel lists to Facebook. It uses them to rank your feed, so watched reels may return.")));
        }
        if (build.contains(PatchFamily.DOUBLE_TAP_LIKE)) {
            reels.addPreference(toggle(context, Settings.TURN_OFF_DOUBLE_TAP_LIKE,
                    L10n.t("Turn off double tap to like"),
                    L10n.t("A double tap on a reel or video no longer likes it or shows a heart. A single tap and the Like "
                            + "button work as before.")));
        }
        if (build.contains(PatchFamily.KEEP_REEL_SPEED)) {
            reels.addPreference(toggle(context, Settings.KEEP_REEL_SPEED, L10n.t("Keep the reel speed"),
                    L10n.t("A playback speed you pick in a reel's menu stays for the next reels until you pick another "
                            + "or Facebook restarts. Off, every reel starts at normal speed.")));
        }
        if (build.contains(PatchFamily.REEL_HOLD)) {
            reels.addPreference(toggle(context, Settings.HOLD_REEL_FOR_2X, L10n.t("Hold a reel for 2x"),
                    L10n.t("Holding a reel plays it at double speed until you let go, in place of Facebook's long-press "
                            + "menu. The reel's more button still opens that menu.")));
        }
        if (build.contains(PatchFamily.REEL_DOWNLOAD)) {
            reels.addPreference(toggle(context, Settings.DOWNLOAD_REELS, L10n.t("Download button on reels"),
                    L10n.t("Add a Download button to reels, using your download quality. Off or paused, Facebook's own buttons return.")));
        }

        if (build.contains(PatchFamily.DEFAULT_COMMENT_ORDER)) {
            PreferenceCategory comments = category(screen, L10n.t("Comments"));
            comments.addPreference(toggle(context, Settings.DEFAULT_COMMENT_ORDER, L10n.t("Default comment order"),
                    L10n.t("Use the order below. A choice made on a post lasts until restart. Links to comments keep Facebook's order.")));
            comments.addPreference(commentOrderRow(context));
        }

        if (build.contains(PatchFamily.TAG_SUGGESTIONS)) {
            PreferenceCategory writing = category(screen, L10n.t("Writing"));
            writing.addPreference(toggle(context, Settings.TAG_SUGGESTIONS_ONLY_AFTER_AT,
                    L10n.t("Tag suggestions only after @"),
                    L10n.t("Type @ before Facebook suggests someone to tag in posts or comments. Your text stays unchanged.")));
        }

        if (build.contains(PatchFamily.TAP_TO_PLAY) || build.contains(PatchFamily.RESUME_LONG_VIDEOS)
                || build.contains(PatchFamily.PLAYBACK_QUALITY)) {
            PreferenceCategory playback = category(screen, L10n.t("Playback"));
            if (build.contains(PatchFamily.TAP_TO_PLAY)) {
                playback.addPreference(toggle(context, Settings.TAP_TO_PLAY, L10n.t("Tap to play"),
                        L10n.t("Videos, reels, stories and music wait for your tap. Facebook's Autoplay setting temporarily reads Off.")));
            }
            if (build.contains(PatchFamily.RESUME_LONG_VIDEOS)) {
                playback.addPreference(toggle(context, Settings.RESUME_LONG_VIDEOS, L10n.t("Resume long videos"),
                        L10n.t("Resume videos over two minutes where you left off. Seek to start elsewhere. Reels, live videos and ads start as usual.")));
            }
            if (build.contains(PatchFamily.PLAYBACK_QUALITY)) {
                playback.addPreference(toggle(context, Settings.DEFAULT_PLAYBACK_QUALITY, L10n.t("Default playback quality"),
                        L10n.t("Play videos, reels and stories at the quality below. A quality picked in a video's own menu still wins.")));
                playback.addPreference(playbackQualityRow(context));
            }
        }

        if (build.contains(PatchFamily.STORY_DOWNLOAD) || build.contains(PatchFamily.REEL_DOWNLOAD)
                || build.contains(PatchFamily.VIDEO_DOWNLOAD)) {
            PreferenceCategory downloads = category(screen, L10n.t("Downloads"));
            this.downloads = downloads;
            if (build.contains(PatchFamily.VIDEO_DOWNLOAD)) {
                downloads.addPreference(toggle(context, Settings.DOWNLOAD_VIDEOS, L10n.t("Download feed and Watch videos"),
                        L10n.t("Add Download to phone to feed and Watch video menus. Uses the quality below. Off or paused, Facebook's menu returns.")));
            }
            // Every save reads it, a story's and a reel's as much as a feed video's, so it's here
            // whichever download patch is in, above the quality it keeps within.
            downloads.addPreference(toggle(context, Settings.DOWNLOAD_COMPATIBLE, L10n.t("Save videos other apps can open"),
                    L10n.t("For WhatsApp, video editors such as CapCut and InShot, or a gallery or player that plays saves "
                            + "without sound. May lower quality.")));
            downloads.addPreference(qualityRow(context));
            downloads.addPreference(folderRow(context));
            downloads.addPreference(fileNameRow(context));
        }

        if (build.contains(PatchFamily.MESSENGER_CARD) || build.contains(PatchFamily.MESSENGER_ICON)) {
            PreferenceCategory chats = category(screen, L10n.t("Chats"));
            if (build.contains(PatchFamily.MESSENGER_CARD)) {
                chats.addPreference(toggle(context, Settings.HIDE_GET_MESSENGER_CARD, L10n.t("Hide the Get Messenger card"),
                        L10n.t("The card at the top of Chats that asks you to get the Messenger app goes while Messenger "
                                + "is installed. Without Messenger it stays, so you can still install it from there.")));
            }
            if (build.contains(PatchFamily.MESSENGER_ICON)) {
                chats.addPreference(toggle(context, Settings.OPEN_MESSENGER_APP, L10n.t("Open the Messenger app"),
                        L10n.t("A tap on the Messenger icon at the top of Facebook opens the Messenger app instead "
                                + "of Chats. Without Messenger installed, Chats opens as before.")));
            }
        }

        if (build.contains(PatchFamily.MENU_PROMOTIONS)) {
            PreferenceCategory menu = category(screen, L10n.t("Menu"));
            menu.addPreference(toggle(context, Settings.HIDE_MENU_UPGRADES, L10n.t("Hide Upgrades"),
                    L10n.t("The Upgrades section and its offers leave Facebook's Menu. Settings, Help and support "
                            + "and the rest of the Menu stay.")));
            menu.addPreference(toggle(context, Settings.HIDE_MENU_ALSO_FROM_META, L10n.t("Hide Also from Meta"),
                    L10n.t("The Also from Meta section leaves Facebook's Menu, with its links to Meta's other apps "
                            + "and its ads for Meta's devices. Your own shortcuts stay.")));
        }

        if (build.contains(PatchFamily.META_AI_SEARCH) || build.contains(PatchFamily.SPONSORED_SEARCH)) {
            PreferenceCategory search = category(screen, L10n.t("Search"));
            if (build.contains(PatchFamily.META_AI_SEARCH)) {
                search.addPreference(toggle(context, Settings.HIDE_META_AI_IN_SEARCH, L10n.t("Hide Meta AI in search"),
                        L10n.t("Search results lose the Meta AI answer and the Ask Meta AI prompts, and a suggestion no "
                                + "longer sends your search to Meta AI. People, groups, pages and posts stay, and the Meta "
                                + "AI button still opens Meta AI.")));
            }
            if (build.contains(PatchFamily.SPONSORED_SEARCH)) {
                search.addPreference(toggle(context, Settings.HIDE_SPONSORED_SEARCH_RESULTS,
                        L10n.t("Hide sponsored search results"),
                        L10n.t("Ads between the results when you search Facebook. What you searched for stays.")));
            }
        }

        if (build.contains(PatchFamily.SPONSORED_MARKETPLACE)) {
            PreferenceCategory marketplace = category(screen, L10n.t("Marketplace"));
            marketplace.addPreference(toggle(context, Settings.HIDE_SPONSORED_MARKETPLACE_LISTINGS,
                    L10n.t("Hide sponsored Marketplace listings"),
                    L10n.t("Ads and boosted listings in Marketplace's feed and search results. The other "
                            + "listings stay.")));
        }

        if (build.contains(PatchFamily.PROMO_NOTIFICATIONS)) {
            PreferenceCategory notifications = category(screen, L10n.t("Notifications"));
            notifications.addPreference(toggle(context, Settings.BLOCK_TRENDING_VIDEO_NOTIFICATIONS,
                    L10n.t("Block trending video notifications"),
                    L10n.t("Trending videos and the reels Facebook picked for you stop showing up in your "
                            + "notifications.")));
            notifications.addPreference(toggle(context, Settings.BLOCK_MEMORY_NOTIFICATIONS,
                    L10n.t("Block memory notifications"),
                    L10n.t("Facebook's \"On this day\" memories stop showing up in your notifications.")));
            notifications.addPreference(toggle(context, Settings.BLOCK_BIRTHDAY_NOTIFICATIONS,
                    L10n.t("Block birthday notifications"),
                    L10n.t("No more reminders that it's a friend's birthday.")));
            notifications.addPreference(toggle(context, Settings.BLOCK_HIGHLIGHT_NOTIFICATIONS,
                    L10n.t("Block group and Page highlights"),
                    L10n.t("Digests of what's going on in groups, Pages and creators you follow stop. Comments, "
                            + "replies and mentions still come through.")));
            notifications.addPreference(toggle(context, Settings.BLOCK_PEOPLE_YOU_MAY_KNOW_NOTIFICATIONS,
                    L10n.t("Block \"People you may know\""),
                    L10n.t("Friend suggestions stop showing up in your notifications. Friend requests still come "
                            + "through.")));
            notifications.addPreference(toggle(context, Settings.BLOCK_NEARBY_NOTIFICATIONS,
                    L10n.t("Block nearby and weather notifications"),
                    L10n.t("Alerts about places near you and about the weather stop.")));
            notifications.addPreference(info(context, L10n.t("What always comes through"),
                    L10n.t("Messages, friend requests, comments, mentions, calls and login alerts, and any kind "
                            + "Hushfacebook doesn't know. Android's own settings for Facebook's notification "
                            + "categories work too, since Facebook drops a notification whose category you turned "
                            + "off. Facebook's server decides which categories you get, though, so they may not "
                            + "split these kinds out.")));
        }

        // In every build: Android checks Facebook's links against Meta's signing key, which no
        // re-signed build has, whatever its patches.
        PreferenceCategory links = category(screen, L10n.t("Links"));
        if (build.contains(PatchFamily.EXTERNAL_BROWSER)) {
            links.addPreference(toggle(context, Settings.OPEN_LINKS_EXTERNALLY, L10n.t("Open links in your browser"),
                    L10n.t("Open web links in your browser. Facebook's own pages stay in the app.")));
        }
        if (build.contains(PatchFamily.SANITIZE_SHARING_LINKS)) {
            links.addPreference(toggle(context, Settings.SANITIZE_SHARING_LINKS,
                    L10n.t("Remove tracking from shared links"),
                    L10n.t("Takes tracking tags such as mibextid off the links you share or copy. A "
                            + "facebook.com/share/ link is made for one share, so Facebook can still trace it back to you.")));
        }
        links.addPreference(supportedLinksRow(context));
        links.addPreference(info(context, L10n.t("Selecting links by hand"),
                L10n.t("Android checks Facebook's links against Meta's signing key, which a re-signed build doesn't have. "
                        + "Selecting the addresses sends their links here again. It doesn't restore Meta's verification, "
                        + "and your other link settings stay as they are.")));

        // In every build: the release check is the settings entry's own, not a patch's. Its switch
        // is one Pause turns off, so it sits above the Pause row with the rest.
        PreferenceCategory updates = category(screen, L10n.t("Updates"));
        if (build.contains(PatchFamily.UPDATE_PROMPTS)) {
            updates.addPreference(toggle(context, Settings.STOP_UPDATE_PROMPTS, L10n.t("Stop update prompts"),
                    L10n.t("Facebook stops asking you to update through Meta App Manager and stops having it look for one. "
                            + "Chat promotions aimed at older versions go too. A patched build can't install Meta's updates anyway.")));
        }
        updates.addPreference(toggle(context, Settings.CHECK_FOR_RELEASES, L10n.t("Check for new Hushfacebook releases"),
                L10n.t("Ask GitHub once a day at startup and show newer releases on the overview. Off by default. Nothing is downloaded.")));
        updates.addPreference(checkNowRow(context));
        ReleaseCheck.watch(this);

        if (build.contains(PatchFamily.SYSTEM_FONT) || build.contains(PatchFamily.SYSTEM_EMOJI)) {
            PreferenceCategory appearance = category(screen, L10n.t("Appearance"));
            if (build.contains(PatchFamily.SYSTEM_FONT)) {
                appearance.addPreference(toggle(context, Settings.USE_SYSTEM_FONT, L10n.t("Use the system font"),
                        L10n.t("Use your phone's font or a file chosen below. Restart Facebook after changing it.")));
                // The file the switch draws in, and, while one is picked, the way back to the phone's font.
                // The way back goes in once whatever is picked, so it keeps its place right after Font file
                // when a pick brings it back, rather than landing at the end of the section.
                FontRow choose = new FontRow(this, context, FontFilePreference.CHOOSE);
                choose.wayBack = new FontRow(this, context, FontFilePreference.PHONE_FONT);
                appearance.addPreference(choose);
                appearance.addPreference(choose.wayBack);
                choose.show();
            }
            if (build.contains(PatchFamily.SYSTEM_EMOJI)) {
                // The quick emoji picker keeps the first typeface it's given until Facebook restarts.
                appearance.addPreference(toggle(context, Settings.USE_SYSTEM_EMOJI, L10n.t("Use the phone's emoji"),
                        L10n.t("Use your phone's emoji. Reactions and stickers stay the same. Restart Facebook after changing it.")));
            }
        }

        if (build.contains(PatchFamily.AD_PREFETCH) || build.contains(PatchFamily.AD_TELEMETRY)
                || build.contains(PatchFamily.AUDIENCE_NETWORK) || build.contains(PatchFamily.AMOLED_THEME)
                || build.contains(PatchFamily.MATERIAL_YOU_THEME) || build.contains(PatchFamily.RESTORE_TRUST)
                || build.contains(PatchFamily.INSTALL_BESIDE_META_APPS)) {
            PreferenceCategory patched = category(screen, L10n.t("Set when you patched"));
            if (build.contains(PatchFamily.AD_PREFETCH)) {
                patched.addPreference(mark(info(context, L10n.t("Background ad prefetch blocked"),
                        L10n.t("Facebook doesn't download ads or its ad model in the background.")), SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.AD_TELEMETRY)) {
                patched.addPreference(mark(info(context, L10n.t("Ad telemetry blocked"),
                        L10n.t("No screenshot watching for ads, and no reports of which apps you install.")), SettingsIcons.TELEMETRY));
            }
            if (build.contains(PatchFamily.AUDIENCE_NETWORK)) {
                patched.addPreference(mark(info(context, L10n.t("Audience Network off"),
                        L10n.t("Facebook doesn't serve ads to other apps on this phone.")), SettingsIcons.NETWORK));
            }
            if (build.contains(PatchFamily.AMOLED_THEME)) {
                patched.addPreference(mark(info(context, L10n.t("AMOLED black theme"),
                        L10n.t("Dark mode draws black instead of dark grey. Turn on dark mode in Facebook to see it.")), SettingsIcons.MOON));
            }
            if (build.contains(PatchFamily.MATERIAL_YOU_THEME)) {
                patched.addPreference(mark(info(context, L10n.t("Material You theme"),
                        L10n.t("Facebook dark mode and this screen use your wallpaper colours. Android 11 uses blue "
                                + "instead. Turn on Facebook dark mode to see it.")), SettingsIcons.APPEARANCE));
            }
            if (build.contains(PatchFamily.RESTORE_TRUST)) {
                patched.addPreference(mark(info(context, L10n.t("Re-signed build fix"),
                        L10n.t("Profiles and some Settings pages open again on this re-signed build.")), SettingsIcons.BUILD));
            }
            if (build.contains(PatchFamily.INSTALL_BESIDE_META_APPS)) {
                patched.addPreference(mark(info(context, L10n.t("Room for Meta's apps"),
                        L10n.t("Messenger, Facebook Lite, Business Suite and Workplace install beside this Facebook. "
                                + "It gives the two permissions they share with it names of its own.")), SettingsIcons.PHONE));
            }
            patched.addPreference(info(context, L10n.t("Changing these"),
                    L10n.t("They're chosen in Morphe Manager when you patch, and Pause doesn't turn them off. "
                            + "Patch again to change them.")));
        }

        // Named for its rows: the screen's own title already says Hushfacebook.
        PreferenceCategory hushfacebook = category(screen, L10n.t("Pause, backup and diagnostics"));
        hushfacebook.addPreference(mark(toggle(context, BaseSettings.PAUSED, L10n.t("Pause Hushfacebook"),
                L10n.t("From the next start, every switch but Debug logging acts as if it were off. "
                        + "Changes made when you patched stay in, and your choices stay saved.")), SettingsIcons.PATCHED));
        String stays = PatchFamily.staysWhilePausedSummary(build);
        // Morphe Manager can export the patch choices and the signing key, not these switches.
        hushfacebook.addPreference(mark(new BackupRow(this, context, SettingsBackupPreference.EXPORT,
                L10n.t("Export settings"),
                L10n.t("Save your switches and download settings to a file. Pause and Debug logging aren't included, "
                        + "and neither is the release check.")), SettingsIcons.EXPORT));
        // The preview gives a count of the switches and the download settings' new values, not
        // each switch by name.
        hushfacebook.addPreference(mark(new BackupRow(this, context, SettingsBackupPreference.IMPORT,
                L10n.t("Import settings"),
                L10n.t("Choose a settings file. Before anything is imported, you'll see how many switches it "
                        + "changes and any new download settings.")), SettingsIcons.DOWNLOADS));
        // Debug logging also fills the exported report and turns on error toasts (Logger).
        hushfacebook.addPreference(mark(toggle(context, BaseSettings.DEBUG, L10n.t("Debug logging"),
                L10n.t("Record patch activity and show errors for a bug report. Leave off during normal use.")), SettingsIcons.BUG));
        // A test for Debug logging only: a Messenger patched with this build's key, asked now
        // instead of on Facebook's own schedule. Restore screens fills it in. The screen is built
        // once, so the row comes and goes when settings open again after Debug logging changes: a
        // row this page can only disable would sit greyed out in every build with Restore screens.
        if (build.contains(PatchFamily.RESTORE_TRUST) && BaseSettings.DEBUG.get() && MessengerLinkCheck.available()) {
            Preference link = new Row(context);
            link.setTitle(L10n.t("Test the Messenger link"));
            link.setSummary(L10n.t("Runs the two reads Facebook makes of Messenger at startup, now, and shows whether "
                    + "each one answered. Shown while Debug logging is on."));
            link.setPersistent(false);
            link.setOnPreferenceClickListener(p -> {
                MessengerLinkCheck.start(context);
                return true;
            });
            hushfacebook.addPreference(mark(link, SettingsIcons.BUG));
        }
        // Both rows come without a title of their own: Hushfeed's gave them one from string
        // resources that Facebook's APK doesn't have, and untitled they showed as blank rows.
        ExportDiagnosticReportPreference export = new ExportRow(context);
        export.setTitle(L10n.t("Export diagnostic report"));
        export.setSummary(L10n.t("Copy a quick report or save the full one to Download/Morphe. Links, IDs, cookies "
                + "and sign-in tokens are left out. Check it for other private text before you share it."));
        hushfacebook.addPreference(mark(export, SettingsIcons.LICENSE));
        ClearLogBufferPreference clear = new ClearRow(context);
        clear.setTitle(L10n.t("Clear diagnostic data"));
        clear.setClearAndUndoSummaries(L10n.t("Empties the log and the filter counts a report would include."),
                L10n.t("Diagnostic data cleared. Tap again to put it back."));
        hushfacebook.addPreference(mark(clear, SettingsIcons.DELETE));
        // Keep the detailed patch-time exception list after the controls people come here for.
        if (stays != null) hushfacebook.addPreference(info(context, L10n.t(STAYS_WHILE_PAUSED), stays));

        PreferenceCategory about = category(screen, L10n.t("About"));
        about.addPreference(mark(info(context, L10n.t("Version"), L10n.f("Hushfacebook %1$s on Facebook %2$s",
                L10n.isolate(Utils.getPatchesReleaseVersion()), L10n.isolate(Utils.getAppVersionName()))), SettingsIcons.ABOUT));

        Preference source = new Row(context);
        source.setTitle(L10n.t("Source code and issues"));
        source.setSummary(SOURCE_ADDRESS);
        source.setPersistent(false);
        source.setOnPreferenceClickListener(p -> {
            try {
                startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(SOURCE_URL)));
            } catch (ActivityNotFoundException | SecurityException missing) {
                // No browser, or none switched on. Uncaught, Android's exception closed Facebook.
                Logger.printInfo(() -> "No app opened the source code link");
                Utils.showToastLong(L10n.f("No app on this phone can open the link. The address is %1$s.",
                        L10n.isolate(SOURCE_ADDRESS)));
            }
            return true;
        });
        about.addPreference(mark(source, SettingsIcons.OPENING));

        // Section 7b asks that its notice reach the person using the software, and a file in the
        // repository does not reach them.
        Preference licenses = new Row(context);
        licenses.setTitle(L10n.t("Licenses"));
        licenses.setSummary(L10n.t("GPL-3.0, with the notices of the projects this is built on"));
        licenses.setPersistent(false);
        licenses.setOnPreferenceClickListener(p -> {
            showNotice(context);
            return true;
        });
        about.addPreference(mark(licenses, SettingsIcons.LICENSE));
    }

    /**
     * Lists each save running now at the top of Downloads, and takes a finished one away. The
     * notification was the only way to follow or stop a save, and with Facebook's notifications or
     * the saves channel off there wasn't one. A row that stays is changed in place.
     */
    void showSaves() {
        PreferenceCategory group = downloads;
        if (group == null) return;
        List<SaveControl.Running> running = SaveControl.running();
        Set<Integer> now = new HashSet<>();
        for (SaveControl.Running save : running) now.add(save.id);
        for (java.util.Iterator<Map.Entry<Integer, SaveRow>> rows = saveRows.entrySet().iterator(); rows.hasNext(); ) {
            Map.Entry<Integer, SaveRow> row = rows.next();
            if (now.contains(row.getKey())) continue;
            group.removePreference(row.getValue());
            rows.remove();
        }
        for (SaveControl.Running save : running) {
            SaveRow row = saveRows.get(save.id);
            if (row != null) {
                row.show(save);
                continue;
            }
            row = new SaveRow(group.getContext(), save);
            saveRows.put(save.id, row);
            group.addPreference(row);
        }
    }

    /**
     * Straight to one section. The page is long enough that reaching Downloads took several screens
     * of swiping on a phone (2026-09-26), so two taps reach any section from the top, and Back goes
     * back once to where the list was.
     */
    private Preference jumpRow(Context context) {
        Row row = new Row(context);
        row.setKey("action_jump_to_section");
        row.setPersistent(false);
        row.setTitle(L10n.t("Jump to a section"));
        row.setSummary(L10n.t("Go straight to one group of settings. Back returns to where you were."));
        row.setOnPreferenceClickListener(p -> {
            showSections(context);
            return true;
        });
        return row;
    }

    /**
     * One line of the Reels map. A tap goes to [setting]'s own row, and changes nothing. Without
     * [family] in the build there's no row to go to, so the line names the patch to add instead
     * and can't be tapped.
     */
    private Preference reelsLink(Context context, Set<PatchFamily> build, PatchFamily family, BooleanSetting setting,
                                 String title, String summary) {
        if (!build.contains(family)) {
            return info(context, title, L10n.f("Not in this build. To block this, choose the %1$s patch in "
                    + "Morphe Manager and patch again.", L10n.isolate(family.patchName)));
        }
        Row row = new Row(context);
        row.setKey("action_show_" + setting.key);
        row.setPersistent(false);
        row.setTitle(title);
        row.setSummary(summary);
        row.setOnPreferenceClickListener(ignored -> {
            Preference target = findPreference(setting.key);
            return target != null && jumpTo(target);
        });
        return row;
    }

    /** The page's section titles in the order they're on the page; a tap on one goes there. */
    void showSections(Context context) {
        List<Preference> sections = sections();
        CharSequence[] titles = new CharSequence[sections.size()];
        for (int i = 0; i < titles.length; i++) titles[i] = sections.get(i).getTitle();
        show(new AlertDialog.Builder(context)
                .setTitle(L10n.t("Jump to a section"))
                .setItems(titles, (dialog, which) -> jumpTo(sections.get(which)))
                .setNegativeButton(L10n.t("Cancel"), null));
    }

    /**
     * Shows [builder]'s dialog in the screen's colours, and closes it with the page's view. Nothing
     * shows once the view is gone or the activity is finishing: a word list's Save can land as the
     * activity goes, and its note would come up over a window that's gone.
     */
    private void show(AlertDialog.Builder builder) {
        Activity activity = getActivity();
        if (getView() == null || activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        AlertDialog dialog = builder.show();
        ScreenColors.dialog(dialog);
        shownDialogs.add(dialog);
        dialog.setOnDismissListener(shownDialogs::remove);
    }

    /** The section headings on the page, in order. */
    List<Preference> sections() {
        List<Preference> sections = new ArrayList<>();
        PreferenceScreen screen = getPreferenceScreen();
        for (int i = 0; screen != null && i < screen.getPreferenceCount(); i++) {
            Preference preference = screen.getPreference(i);
            if (preference instanceof PreferenceCategory) sections.add(preference);
        }
        return sections;
    }

    /**
     * Scrolls [section]'s heading to the top of the list, and remembers where the list was for
     * Back. Looked up in the list's own adapter, so it lands right however the page is flattened.
     */
    boolean jumpTo(Preference section) {
        if (navigation != null) return navigation.open(section);
        ListView list = listView();
        if (list == null || list.getAdapter() == null) return false;
        for (int position = 0; position < list.getAdapter().getCount(); position++) {
            if (list.getAdapter().getItem(position) != section) continue;
            View first = list.getChildAt(0);
            beforeJump = new int[] {list.getFirstVisiblePosition(), first == null ? 0 : first.getTop()};
            list.setSelectionFromTop(position, 0);
            return true;
        }
        return false;
    }

    /** Back after a jump: the list goes back to where it was, once, and the page stays open. */
    boolean backFromJump() {
        if (navigation != null) return navigation.back();
        int[] before = beforeJump;
        if (before == null) return false;
        beforeJump = null;
        ListView list = listView();
        if (list == null) return false;
        list.setSelectionFromTop(before[0], before[1]);
        return true;
    }

    @Nullable
    private ListView listView() {
        View view = getView();
        return view == null ? null : view.findViewById(android.R.id.list);
    }

    /**
     * The first row: whether Hushfacebook is on, and why not when it isn't. Paused by safe mode or
     * the marker file, a tap turns it back on from the next start.
     */
    private Preference statusCard(Context context) {
        Row card = new Row(context);
        card.setPersistent(false);
        ScreenColors colors = ScreenColors.shown;
        boolean paused = HushfacebookPause.isPaused();
        ScreenColors palette = colors == null ? ScreenColors.DEFAULT : colors;
        card.setIcon(SettingsIcons.icon(context, paused ? SettingsIcons.PAUSE : SettingsIcons.PATCHED,
                paused ? palette.summary : palette.heading));
        statusCard = card;
        if (!paused) {
            card.setTitle(L10n.t("Hushfacebook is on"));
            card.setSelectable(false);
            showStatus(card, context);
            return card;
        }
        card.setTitle(L10n.t("Hushfacebook is paused"));
        showStatus(card, context);
        // A tap acts at once, taking the pause off the next start, and the card says so in words.
        card.actsAtOnce = true;
        card.setOnPreferenceClickListener(p -> {
            resumeFromOverview();
            return true;
        });
        return card;
    }

    void resumeFromOverview() {
        Context context = getContext();
        if (context == null || statusCard == null) return;
        HushfacebookPause.Reason still = HushfacebookPause.turnBackOn(context);
        // The switch shows what was kept. Setting it to off here would write off through the
        // preference itself when the store had just refused to.
        Preference pause = findPreference(BaseSettings.PAUSED.key);
        if (pause instanceof SwitchPreference) ((SwitchPreference) pause).setChecked(BaseSettings.PAUSED.savedValue());
        if (still == HushfacebookPause.Reason.MARKER_FILE) {
            String file = L10n.isolate(HushfacebookPause.MARKER_FILE_NAME);
            String folder = L10n.isolate(markerFolder(context.getPackageName()));
            // The switches stay as they were until the file goes, so say when they still pause.
            String left = BaseSettings.PAUSED.savedValue() || BaseSettings.SAFE_MODE.savedValue()
                    ? L10n.f("The file %1$s couldn't be removed. Delete it from %2$s, then tap Resume again.", file, folder)
                    : L10n.f("The file %1$s couldn't be removed. Delete it from %2$s to turn Hushfacebook back on.",
                    file, folder);
            statusCard.setSummary(left);
            // Resume can be tapped on a category page too, where the card isn't in view.
            Utils.showToastLong(left);
            return;
        }
        if (still != HushfacebookPause.Reason.NONE) {
            Utils.showToastLong(L10n.t("Couldn't turn Hushfacebook back on. Try again."));
        }
        showStatus(statusCard, context);
    }

    /**
     * The card's line under its title: this start's state, and the next start's when a change on
     * this screen makes it differ. Pause switched on said "Hushfacebook is on" and nothing more,
     * and Pause switched back on after a tap on the card still said it turns back on at restart.
     * A newer release the release check found goes on a line of its own under that, paused or
     * not: a newer release can be the fix for what a pause is working around.
     */
    private void showStatus(Preference card, Context context) {
        boolean pausedNext = HushfacebookPause.pausesNextStart(context);
        String status;
        if (!HushfacebookPause.isPaused()) {
            String version = L10n.f("Version %1$s for Facebook %2$s",
                    L10n.isolate(Utils.getPatchesReleaseVersion()), L10n.isolate(Utils.getAppVersionName()));
            status = pausedNext ? version + " " + L10n.t("Hushfacebook pauses when Facebook restarts.") : version;
        } else if (pausedNext) {
            status = pausedSummary(HushfacebookPause.reason(), context.getPackageName())
                    + " " + L10n.t("Tap to turn it back on.");
        } else {
            status = L10n.t("Hushfacebook turns back on when Facebook restarts.");
        }
        String release = ReleaseCheck.statusLine();
        card.setSummary(release == null ? status : status + "\n" + release);
    }

    /**
     * Asks GitHub for the newest release now, and says what the last try found. The tap is the
     * request for that one check, so it runs with the switch off too.
     */
    private Preference checkNowRow(Context context) {
        Row row = new Row(context);
        row.setKey(CHECK_NOW);
        row.setTitle(L10n.t("Check now"));
        row.setPersistent(false);
        // The tap starts the check and the row says how it went: nothing opens, so no chevron.
        row.actsAtOnce = true;
        row.setSummary(ReleaseCheck.checkNowSummary());
        row.setOnPreferenceClickListener(p -> {
            if (!ReleaseCheck.checkNow()) Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
            p.setSummary(ReleaseCheck.checkNowSummary());
            return true;
        });
        checkNowRow = row;
        return row;
    }

    /**
     * What Android says about sending Facebook's web addresses here, and the way to its page for
     * them (Morphe Manager #1028). The page opens over Facebook, so the row reads the state again
     * on the way back.
     */
    private Preference supportedLinksRow(Context context) {
        Row row = new Row(context);
        row.setKey(SUPPORTED_LINKS);
        row.setTitle(L10n.t("Supported links"));
        row.setPersistent(false);
        row.setSummary(SupportedLinks.summary(SupportedLinks.read(context)));
        row.setOnPreferenceClickListener(p -> {
            openLinkSettings(context);
            return true;
        });
        return row;
    }

    private void showSupportedLinks() {
        if (getPreferenceScreen() == null) return;
        Preference row = findPreference(SUPPORTED_LINKS);
        if (row != null) row.setSummary(SupportedLinks.summary(SupportedLinks.read(row.getContext())));
    }

    private void openLinkSettings(Context context) {
        for (Intent page : SupportedLinks.settingsIntents(context)) {
            try {
                startActivity(page);
                return;
            } catch (ActivityNotFoundException | SecurityException missing) {
                // A phone without Open by default still has the app's own page, which leads there.
            }
        }
        Logger.printInfo(() -> "No settings page opened for supported links");
        Utils.showToastLong(L10n.t("Android's settings for this app didn't open. Open App info from Facebook's icon, "
                + "then Open by default."));
    }

    @Override
    protected boolean noteRestartPending(Setting<?> setting, Object valueBefore) {
        if (setting != Settings.MARKETPLACE_ONLY) return super.noteRestartPending(setting, valueBefore);
        // This mode can leave the bar unchanged when Marketplace is unavailable. Its observed
        // result, rather than the previous saved switch, decides whether restarting is useful.
        boolean pending = MarketplaceOnly.state() == MarketplaceOnly.State.RESTART_NEEDED;
        if (pending) restartPending.add(setting.key);
        else restartPending.remove(setting.key);
        onRestartPendingChanged();
        return pending;
    }

    @Override
    protected void onRestartPendingChanged() {
        Preference card = statusCard;
        Context context = getContext();
        if (card != null && context != null) showStatus(card, context);
        showMarketplaceSettings();
    }

    @Override
    protected void updateUIAvailability() {
        super.updateUIAvailability();
        showMarketplaceSettings();
    }

    @Override
    protected void updateUIToSettingValues() {
        super.updateUIToSettingValues();
        showMarketplaceSettings();
    }

    /**
     * Recomputed after a tap, an import or a resumed page; no saved start-tab choice is changed.
     * The start tab's rows are redone without Marketplace only too, since Hide the Reels tab changes
     * what a chosen Reels tab does.
     */
    private void showMarketplaceSettings() {
        if (getPreferenceScreen() == null) return;
        Preference mode = findPreference(Settings.MARKETPLACE_ONLY.key);
        boolean selected = mode != null && Settings.MARKETPLACE_ONLY.savedValue();
        if (mode != null) {
            mode.setSummary(marketplaceSummary());
            Preference regular = findPreference("action_regular_facebook");
            if (regular != null) regular.setEnabled(selected);
            Preference quiet = findPreference(Settings.MARKETPLACE_QUIET_NOTIFICATIONS.key);
            if (quiet != null) quiet.setEnabled(selected);
            Preference prefetch = findPreference(Settings.MARKETPLACE_SKIP_FEED_PREFETCH.key);
            if (prefetch != null) prefetch.setEnabled(selected);
        }
        Preference chosen = findPreference(Settings.OPEN_ON_CHOSEN_TAB.key);
        if (chosen != null) {
            chosen.setEnabled(!selected);
            chosen.setSummary(selected ? L10n.t("Marketplace mode chooses the opening tab. Your previous choice stays saved.")
                    : L10n.t("Choose where Facebook opens from its icon. Notifications and links still open their destination."));
        }
        Preference tab = findPreference(Settings.START_TAB.key);
        if (tab != null) {
            tab.setEnabled(!selected);
            tab.setSummary(selected ? L10n.t("Marketplace mode chooses the opening tab. Your previous choice stays saved.")
                    : startTabSummary(Settings.START_TAB.savedValue()));
        }
    }

    static String marketplaceSummary() {
        switch (MarketplaceOnly.state()) {
            case ACTIVE:
                return L10n.t("Active. Marketplace, Notifications and Profile/Menu stay. Find Hushfacebook settings in Menu, under Settings and privacy.");
            case RESTART_NEEDED:
                return Settings.MARKETPLACE_ONLY.savedValue()
                        ? L10n.t("Restart needed. Marketplace mode will turn on the next time Facebook starts.")
                        : L10n.t("Restart needed. The normal tabs will return the next time Facebook starts.");
            case PAUSED:
                return L10n.t("Paused with Hushfacebook. Your Marketplace choice stays saved. Tabs already hidden return after a restart while paused.");
            case HIDDEN:
                return L10n.t("Marketplace is hidden in Facebook's tab settings. Show it under Settings, Tab bar, Customize the bar. Your normal tabs stay available.");
            case MISSING:
                return L10n.t("Marketplace unavailable. Facebook hasn't supplied a Marketplace tab for this account. Your normal tabs stay available.");
            case UNREADABLE:
                return L10n.t("Couldn't check the tab bar. Your normal tabs stay available. Restart Facebook to try again.");
            case WAITING:
                return L10n.t("Waiting for Facebook's tab bar. Marketplace mode will apply when Facebook builds it.");
            default:
                return L10n.t("Off. Turn on to open Marketplace and hide the feed and other social tabs after restarting Facebook.");
        }
    }

    /**
     * Why this start runs paused, what a pause does and doesn't reach, and that nothing the reader
     * saved has changed.
     */
    static String pausedSummary(HushfacebookPause.Reason reason, String packageName) {
        String why;
        switch (reason) {
            case CRASH_LOOP:
                // Only a crash, a native crash or a hang counts toward safe mode (HushfacebookPause).
                why = L10n.t("Facebook crashed or froze within a minute of starting three times in a row, so "
                        + "Hushfacebook paused itself.");
                break;
            case MARKER_FILE:
                why = L10n.f("A file named %1$s in %2$s paused Hushfacebook.",
                        L10n.isolate(HushfacebookPause.MARKER_FILE_NAME), L10n.isolate(markerFolder(packageName)));
                break;
            default:
                why = L10n.t("You paused Hushfacebook.");
                break;
        }
        return why + " " + L10n.t("Every switch but Debug logging acts as if it were off, and what was set when you "
                + "patched stays in. Your settings stay as they are.");
    }

    /**
     * Where the marker file goes, the way a file manager shows it: the app's own files folder, not
     * the folder above it, which is the one a person finds first.
     */
    static String markerFolder(String packageName) {
        return "Android/data/" + packageName + "/files";
    }

    /**
     * The theme every row and dialog on this screen is built with, over Facebook's own: dark
     * Material, or with the Material You theme in the build, the phone's dark or light setting.
     */
    static Context themed(Context base) {
        return new ContextThemeWrapper(base, ScreenColors.themeFor(base));
    }

    /** The recovery page draws on the same page as the rows, so it gets the same theme. */
    @Override
    protected Context pageContext(Activity activity) {
        return themed(activity);
    }

    @Override
    protected ErrorActionStyler errorActionStyler() {
        return ScreenColors::recoveryAction;
    }

    @Override
    protected void styleInitializationMessage(View row) {
        ScreenColors.recoveryMessage(row);
    }

    private static PreferenceCategory category(PreferenceScreen screen, String title) {
        PreferenceCategory category = new Heading(screen.getContext());
        category.setTitle(title);
        screen.addPreference(category);
        return category;
    }

    static SwitchPreference toggle(Context context, BooleanSetting setting, String title, String summary) {
        SwitchPreference preference = new Toggle(context);
        preference.setKey(setting.key);
        preference.setTitle(title);
        preference.setSummary(summary);
        return preference;
    }

    /**
     * The quality a video save asks for. The list's values are the setting's own names, which is
     * what the shared page syncs a list by, and the summary says what the choice does.
     */
    static QualityRow qualityRow(Context context) {
        QualityRow row = new QualityRow(context);
        row.setKey(Settings.DOWNLOAD_QUALITY.key);
        row.setTitle(L10n.t("Download quality"));
        row.setDialogTitle(L10n.t("Download quality"));
        // A list's dialog keeps DialogPreference's Cancel, which Android fills in the activity's
        // language unless it's set here, as the folder and file name rows' are.
        row.setNegativeButtonText(L10n.t("Cancel"));
        DownloadQuality[] qualities = DownloadQuality.values();
        CharSequence[] entries = new CharSequence[qualities.length];
        CharSequence[] values = new CharSequence[qualities.length];
        for (int i = 0; i < qualities.length; i++) {
            entries[i] = qualityLabel(qualities[i]);
            values[i] = qualities[i].name();
        }
        row.setEntries(entries);
        row.setEntryValues(values);
        row.setValue(Settings.DOWNLOAD_QUALITY.savedValue().name());
        return row;
    }

    /** What the list shows for [quality]: a word for the two ends, the label itself between them. */
    static String qualityLabel(DownloadQuality quality) {
        switch (quality) {
            case BEST:
                return L10n.t("Best");
            case SMALLEST:
                return L10n.t("Smallest");
            default:
                return L10n.isolate(quality.ceilingLabel());
        }
    }

    /**
     * What a save does with [quality], for the row's summary. A cap takes the best rendition at or
     * under it, and only a video with nothing that low goes above it ({@link DownloadQuality}), so
     * the sentence names both directions: "the closest quality" alone read as 1080p beating 240p
     * under a 720p cap, and the save picks 240p.
     */
    static String qualitySummary(DownloadQuality quality) {
        switch (quality) {
            case BEST:
                return L10n.t("Each video saves at the best quality the player streams.");
            case SMALLEST:
                return L10n.t("Each video saves at its lowest quality, for the smallest file.");
            default:
                return L10n.f("Each video saves at %1$s or the closest quality below it. A video with nothing "
                        + "that low saves at the closest quality above.", L10n.isolate(quality.ceilingLabel()));
        }
    }

    /**
     * The tab a start from the launcher icon opens on. Like the quality row, its values are the
     * setting's own names and its summary says what the choice does.
     */
    static StartTabRow startTabRow(Context context) {
        StartTabRow row = new StartTabRow(context);
        row.setKey(Settings.START_TAB.key);
        row.setTitle(L10n.t("Tab to open on"));
        row.setDialogTitle(L10n.t("Tab to open on"));
        // Android's own Cancel follows the activity's language, as the quality row's did.
        row.setNegativeButtonText(L10n.t("Cancel"));
        StartTab[] tabs = StartTab.values();
        CharSequence[] entries = new CharSequence[tabs.length];
        CharSequence[] values = new CharSequence[tabs.length];
        for (int i = 0; i < tabs.length; i++) {
            entries[i] = tabLabel(tabs[i]);
            values[i] = tabs[i].name();
        }
        row.setEntries(entries);
        row.setEntryValues(values);
        row.setValue(Settings.START_TAB.savedValue().name());
        return row;
    }

    /** What the list, its summary and an import's preview call [tab]: the tab's name in Facebook. */
    static String tabLabel(StartTab tab) {
        switch (tab) {
            case HOME:
                return L10n.t("Home");
            case FEEDS:
                return L10n.t("Feeds");
            case VIDEO:
                return L10n.t("Video");
            case FRIENDS:
                return L10n.t("Friends");
            case NOTIFICATIONS:
                return L10n.t("Notifications");
            case MENU:
                return L10n.t("Menu");
            default:
                return L10n.t("Marketplace");
        }
    }

    /**
     * What a start does with [tab], for the row's summary. Facebook opens Home for a tab the
     * account's tab bar hasn't got, so the summary says so rather than promise the tab. A Reels tab
     * Hide the Reels tab keeps off the bar is asked for as Home, and the summary says that instead.
     */
    static String startTabSummary(StartTab tab) {
        if (tab == StartTab.VIDEO && Settings.HIDE_REELS_TAB.savedValue() && PatchFamily.REELS_TAB.inBuild()) {
            return L10n.t("Facebook opens on Home while Hide the Reels tab is on, since Video is off the tab bar. "
                    + "Your choice stays saved.");
        }
        return L10n.f("Facebook opens on %1$s. If your tab bar doesn't have it, Facebook opens on Home.",
                tabLabel(tab));
    }

    /**
     * The order comment sheets ask for. Like the start tab row, its values are the setting's own
     * names and its summary says what the choice does.
     */
    static CommentOrderRow commentOrderRow(Context context) {
        CommentOrderRow row = new CommentOrderRow(context);
        row.setKey(Settings.COMMENT_ORDER.key);
        row.setTitle(L10n.t("Comment order"));
        row.setDialogTitle(L10n.t("Comment order"));
        // Android's own Cancel follows the activity's language, as the other lists' did.
        row.setNegativeButtonText(L10n.t("Cancel"));
        CommentOrder[] orders = CommentOrder.values();
        CharSequence[] entries = new CharSequence[orders.length];
        CharSequence[] values = new CharSequence[orders.length];
        for (int i = 0; i < orders.length; i++) {
            entries[i] = commentOrderLabel(orders[i]);
            values[i] = orders[i].name();
        }
        row.setEntries(entries);
        row.setEntryValues(values);
        row.setValue(Settings.COMMENT_ORDER.savedValue().name());
        return row;
    }

    /** What the list and its summary call [order]: the name Facebook's own sort menu gives it. */
    static String commentOrderLabel(CommentOrder order) {
        switch (order) {
            case MOST_RELEVANT:
                return L10n.t("Most relevant");
            case NEWEST:
                return L10n.t("Newest");
            case ALL_COMMENTS:
                return L10n.t("All comments");
            default:
                return L10n.t("Facebook's choice");
        }
    }

    /**
     * What a comment sheet does with [order], for the row's summary. Facebook answers with the
     * order it used and its menu shows that one, so the summary names the menu, and says the post
     * has to offer the order rather than promise it.
     */
    static String commentOrderSummary(CommentOrder order) {
        if (order == CommentOrder.FACEBOOK) {
            return L10n.t("Comments open in the order Facebook picks, which is usually Most relevant.");
        }
        return L10n.f("A post's comments open with %1$s picked in their sort menu, where the post offers it.",
                commentOrderLabel(order));
    }

    /**
     * The quality videos play at. Like the comment order row, its values are the setting's own
     * names and its summary says what the choice does.
     */
    static PlaybackQualityRow playbackQualityRow(Context context) {
        PlaybackQualityRow row = new PlaybackQualityRow(context);
        row.setKey(Settings.PLAYBACK_QUALITY.key);
        row.setTitle(L10n.t("Playback quality"));
        row.setDialogTitle(L10n.t("Playback quality"));
        // Android's own Cancel follows the activity's language, as the other lists' did.
        row.setNegativeButtonText(L10n.t("Cancel"));
        PlaybackQuality[] qualities = PlaybackQuality.values();
        CharSequence[] entries = new CharSequence[qualities.length];
        CharSequence[] values = new CharSequence[qualities.length];
        for (int i = 0; i < qualities.length; i++) {
            entries[i] = playbackQualityLabel(qualities[i]);
            values[i] = qualities[i].name();
        }
        row.setEntries(entries);
        row.setEntryValues(values);
        row.setValue(Settings.PLAYBACK_QUALITY.savedValue().name());
        return row;
    }

    /** What the list calls [quality]: Auto, as Facebook's own quality menu calls it, and a ceiling by its label. */
    static String playbackQualityLabel(PlaybackQuality quality) {
        switch (quality) {
            case DATA_SAVER:
                return L10n.t("Data saver");
            case P480:
            case P720:
                return L10n.f("Up to %1$s", L10n.isolate(quality.fileValue));
            case HIGHEST:
                return L10n.t("Highest");
            default:
                return L10n.t("Auto");
        }
    }

    /**
     * What a video does with [quality], for the row's summary. The rungs are the ones Facebook offers
     * for each video, so the summary says the video has to offer the quality rather than promise it.
     */
    static String playbackQualitySummary(PlaybackQuality quality) {
        switch (quality) {
            case DATA_SAVER:
                return L10n.t("Videos play at the lowest quality Facebook offers for each.");
            case P480:
            case P720:
                return L10n.f("Videos play at the best quality up to %1$s that Facebook offers for each, or the closest above.",
                        L10n.isolate(quality.fileValue));
            case HIGHEST:
                return L10n.t("Videos play at the highest quality Facebook offers for each.");
            default:
                return L10n.t("Facebook picks the quality as each video plays, from your connection.");
        }
    }

    /**
     * The quality, start tab, comment order and playback quality rows' summaries are sentences of
     * their own rather than the chosen entry.
     */
    @Override
    protected void updateListPreferenceSummary(ListPreference listPreference, Setting<?> setting) {
        if (listPreference instanceof QualityRow) {
            ((QualityRow) listPreference).showSummary();
        } else if (listPreference instanceof StartTabRow) {
            ((StartTabRow) listPreference).showSummary();
        } else if (listPreference instanceof CommentOrderRow) {
            ((CommentOrderRow) listPreference).showSummary();
        } else if (listPreference instanceof PlaybackQualityRow) {
            ((PlaybackQualityRow) listPreference).showSummary();
        } else {
            super.updateListPreferenceSummary(listPreference, setting);
        }
    }

    /**
     * The folder every save goes to. What's typed is cleaned before it's kept, so the row, the
     * setting and the next save all show the one folder name the save will use.
     */
    static FolderRow folderRow(Context context) {
        FolderRow row = new FolderRow(context);
        row.setKey(Settings.SAVE_FOLDER.key);
        row.setTitle(L10n.t("Save folder"));
        row.setDialogTitle(L10n.t("Save folder"));
        row.setDialogMessage(L10n.f("Choose a folder name under Movies and Pictures. Invalid characters become "
                + "underscores. Leave it blank to use the default folder, %1$s.", L10n.isolate(SaveFolder.DEFAULT)));
        row.setPositiveButtonText(L10n.t("Save"));
        // Unset, Android fills in its own Cancel in the activity's language, which can differ
        // from Facebook's, and the dialog read "Speichern" next to "Cancel".
        row.setNegativeButtonText(L10n.t("Cancel"));
        EditText field = row.getEditText();
        field.setSingleLine(true);
        field.setHint(L10n.t("Folder name"));
        row.setText(Settings.SAVE_FOLDER.savedValue());
        row.setOnPreferenceChangeListener((preference, typed) -> {
            String raw = typed == null ? "" : typed.toString();
            String clean = SaveFolder.sanitize(raw);
            if (clean.equals(raw)) return true;
            // Keeps the clean name in place of what was typed. The store changes, and the shared
            // page reads the setting from the row as it does for any change.
            ((FolderRow) preference).setText(clean);
            Utils.showToastShort(L10n.f("Folder set to %1$s.", L10n.isolate(clean)));
            return false;
        });
        return row;
    }

    /**
     * The name every saved video gets, next to the folder it goes to. What's typed is cleaned the
     * way the folder is, and held to the gallery's naming, so the row, the setting and the next
     * save all show the one template the save will use.
     */
    static FileNameRow fileNameRow(Context context) {
        FileNameRow row = new FileNameRow(context);
        row.setKey(Settings.FILENAME_TEMPLATE.key);
        row.setTitle(L10n.t("Video file name"));
        row.setDialogTitle(L10n.t("Video file name"));
        row.setDialogMessage(L10n.f("%1$s becomes the date and time of the save, %2$s the video's number on "
                        + "Facebook, %3$s who posted it and %4$s the day it was posted. What a save doesn't know is "
                        + "left out, and a name with none of these gets the date added. When the name is already in "
                        + "the folder, the time of the save goes on the end. Invalid characters become underscores. "
                        + "Leave it blank to use the default, %5$s.",
                L10n.isolate(FileNameTemplate.DATE), L10n.isolate(FileNameTemplate.VIDEO_ID),
                L10n.isolate(FileNameTemplate.OWNER), L10n.isolate(FileNameTemplate.POSTED),
                L10n.isolate(FileNameTemplate.DEFAULT)));
        row.setPositiveButtonText(L10n.t("Save"));
        // Android's own Cancel follows the activity's language, as the folder row's did.
        row.setNegativeButtonText(L10n.t("Cancel"));
        EditText field = row.getEditText();
        field.setSingleLine(true);
        field.setHint(L10n.t("File name"));
        row.setText(Settings.FILENAME_TEMPLATE.savedValue());
        row.setOnPreferenceChangeListener((preference, typed) -> {
            String raw = typed == null ? "" : typed.toString();
            String clean = FileNameTemplate.sanitize(raw);
            if (clean.equals(raw)) return true;
            // Keeps the clean template in place of what was typed, as the folder row does.
            ((FileNameRow) preference).setText(clean);
            Utils.showToastShort(L10n.f("File name set to %1$s.", L10n.isolate(clean)));
            return false;
        });
        return row;
    }

    /** "Videos are named FB_VID_{date}. Photos keep Facebook's own FB_IMG_ names." for [template]. */
    static String fileNameSummary(String template) {
        return L10n.f("Videos are named %1$s. Photos keep Facebook's own %2$s names.",
                L10n.isolate(template), L10n.isolate(FileNameTemplate.PHOTO_PREFIX));
    }

    /** "Videos go to Movies/Clips and photos to Pictures/Clips." for the folder [leaf]. */
    static String folderSummary(String leaf) {
        String videos = Environment.DIRECTORY_MOVIES + "/" + leaf;
        String photos = Environment.DIRECTORY_PICTURES + "/" + leaf;
        return L10n.f("Videos go to %1$s and photos to %2$s.", L10n.isolate(videos), L10n.isolate(photos));
    }

    /**
     * One of the word filter's two lists: the words that hide a post ([hides]), or the ones that keep
     * it. What's typed is cleaned before it's kept, one phrase per line within the bounds
     * {@link PostWords} holds every list to, so the row, the setting and the filter all read the
     * same phrases. A dialog says how many lines were left out, never which.
     */
    WordsRow wordsRow(Context context, StringSetting setting, boolean hides) {
        WordsRow row = new WordsRow(context, hides);
        row.setKey(setting.key);
        String title = hides ? L10n.t("Words to hide") : L10n.t("Words that keep a post");
        row.setTitle(title);
        row.setDialogTitle(title);
        row.setDialogMessage(hides
                ? L10n.f("One word or phrase per line, up to %1$d, each %2$d to %3$d characters long, or just "
                        + "one for an emoji, a Chinese character, a kana or a Hangul syllable. Capital letters "
                        + "don't matter, and a phrase matches anywhere in a post's text, inside longer words too.",
                        PostWords.MAX_PHRASES, PostWords.MIN_LENGTH, PostWords.MAX_LENGTH)
                : L10n.f("A post with any of these stays, even when it also has a word to hide. One per line, up "
                        + "to %1$d, each %2$d to %3$d characters long, or just one for an emoji, a Chinese "
                        + "character, a kana or a Hangul syllable.", PostWords.MAX_PHRASES, PostWords.MIN_LENGTH,
                        PostWords.MAX_LENGTH));
        row.setPositiveButtonText(L10n.t("Save"));
        // Android's own Cancel follows the activity's language, as the folder row's did.
        row.setNegativeButtonText(L10n.t("Cancel"));
        EditText field = row.getEditText();
        field.setSingleLine(false);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        field.setMinLines(3);
        field.setMaxLines(8);
        field.setHint(L10n.t("One word or phrase per line"));
        row.setText(setting.savedValue());
        row.setOnPreferenceChangeListener((preference, typed) -> {
            String raw = typed == null ? "" : typed.toString();
            String clean = PostWords.clean(raw);
            if (clean.equals(raw)) return true;
            // Keeps the clean list in place of what was typed, as the folder row does.
            int leftOut = PostWords.leftOut(raw);
            ((WordsRow) preference).setText(clean);
            if (leftOut > 0) {
                // A dialog, not a toast: Android 12 and later cut a toast to two lines, and the
                // reasons run past that, most of all at a large text size.
                String why = L10n.quantity(leftOut,
                        "%1$d line was left out. A phrase needs %2$d to %3$d characters, or just one for an emoji, "
                                + "a Chinese character, a kana or a Hangul syllable. One given twice counts once, "
                                + "and a list holds %4$d.",
                        "%1$d lines were left out. A phrase needs %2$d to %3$d characters, or just one for an "
                                + "emoji, a Chinese character, a kana or a Hangul syllable. One given twice counts "
                                + "once, and a list holds %4$d.",
                        leftOut, PostWords.MIN_LENGTH, PostWords.MAX_LENGTH, PostWords.MAX_PHRASES);
                show(new AlertDialog.Builder(preference.getContext())
                        .setTitle(title)
                        .setMessage(why)
                        .setPositiveButton(L10n.t("OK"), null));
            }
            return false;
        });
        return row;
    }

    /**
     * What a word list's row says: how many phrases it holds, and for the hide list how many posts
     * it has hidden since Facebook started. Counts only, never a phrase.
     */
    static String wordsSummary(String stored, boolean hides) {
        int phrases = PostWords.count(stored);
        if (phrases == 0) {
            return hides ? L10n.t("No words yet, so no post is hidden.") : L10n.t("No words yet.");
        }
        String summary = L10n.quantity(phrases, "%1$d word or phrase.", "%1$d words or phrases.", phrases);
        int hidden = hides ? PostWords.hiddenSinceStart() : 0;
        if (hidden > 0) {
            summary += " " + L10n.quantity(hidden, "Hid %1$d post since Facebook started.",
                    "Hid %1$d posts since Facebook started.", hidden);
        }
        return summary;
    }

    private static Preference mark(Preference row, String icon) {
        ScreenColors colors = ScreenColors.shown == null ? ScreenColors.DEFAULT : ScreenColors.shown;
        row.setIcon(SettingsIcons.icon(row.getContext(), icon, colors.heading));
        return row;
    }

    private static Preference info(Context context, String title, String summary) {
        Preference preference = new Row(context);
        preference.setTitle(title);
        preference.setSummary(summary);
        preference.setSelectable(false);
        preference.setPersistent(false);
        return preference;
    }

    /**
     * Lets a row's title and summary wrap to as many lines as they need. Android draws a row's
     * title on one line and cuts its summary at ten, and at 200% text size the paused card, the
     * Pause row and the list of what Pause can't reach ran past ten lines and lost their ends.
     */
    static void showAllText(View row) {
        TextView title = row.findViewById(android.R.id.title);
        if (title != null) {
            title.setSingleLine(false);
            title.setMaxLines(Integer.MAX_VALUE);
        }
        TextView summary = row.findViewById(android.R.id.summary);
        if (summary != null) summary.setMaxLines(Integer.MAX_VALUE);
    }

    /** A section title, which a screen reader announces as a heading so a reader can jump between sections. */
    static final class Heading extends PreferenceCategory {
        Heading(Context context) {
            super(context);
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            view.setAccessibilityHeading(true);
            showAllText(view);
            ScreenColors.heading(view);
        }
    }

    /** A row of text, which a screen reader calls a button when a tap does something. */
    static final class Row extends Preference implements ImmediateAction {
        /** Set on a row whose tap does what it says at once, which then goes without a chevron. */
        boolean actsAtOnce;

        Row(Context context) {
            super(context);
        }

        @Override
        public boolean actsOnTap() {
            return actsAtOnce;
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(isSelectable() ? new RowSemantics(this, Button.class) : null);
        }
    }

    /**
     * A running save: what it is, what it's doing, how far it has got, and a Cancel button. Its text
     * changes in place: a row rebuilt under a finger loses the tap on its button.
     */
    static final class SaveRow extends Preference {
        /** Before every setting of the section, oldest save first. */
        private static final int FIRST = Integer.MIN_VALUE / 2;

        final int id;
        private final boolean video;
        private String status;
        @Nullable
        private View bound;

        SaveRow(Context context, SaveControl.Running save) {
            super(context);
            id = save.id;
            video = save.video;
            status = SaveControl.status(save);
            setKey("running_save_" + save.id);
            setPersistent(false);
            setSelectable(false);
            setOrder(FIRST + save.id);
            setTitle(video ? L10n.t("Saving a video") : L10n.t("Saving a photo"));
        }

        @Override
        public CharSequence getSummary() {
            return status;
        }

        void show(SaveControl.Running save) {
            String next = SaveControl.status(save);
            if (next.equals(status)) return;
            status = next;
            TextView summary = bound == null ? null : bound.findViewById(android.R.id.summary);
            if (summary != null) summary.setText(next);
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            bound = view;
            showAllText(view);
            ScreenColors.row(view, this);
            android.view.ViewGroup frame = view.findViewById(android.R.id.widget_frame);
            if (frame == null) return;
            frame.removeAllViews();
            Button cancel = new Button(getContext());
            cancel.setText(L10n.t("Cancel"));
            // Two saves can be listed at once, so the button says whose it is.
            cancel.setContentDescription(video ? L10n.t("Cancel saving this video") : L10n.t("Cancel saving this photo"));
            cancel.setAllCaps(false);
            cancel.setTextSize(14);
            ScreenColors colors = ScreenColors.shown == null ? ScreenColors.DEFAULT : ScreenColors.shown;
            cancel.setTextColor(colors.heading);
            cancel.setBackgroundColor(Color.TRANSPARENT);
            int touch = Math.round(48 * view.getResources().getDisplayMetrics().density);
            cancel.setMinWidth(touch);
            cancel.setMinimumWidth(touch);
            cancel.setMinHeight(touch);
            cancel.setMinimumHeight(touch);
            cancel.setPadding(touch / 4, 0, touch / 4, 0);
            cancel.setOnClickListener(ignored -> {
                cancel.setEnabled(false);
                SaveControl.cancel(id);
            });
            frame.addView(cancel, new android.widget.LinearLayout.LayoutParams(
                    android.view.ViewGroup.LayoutParams.WRAP_CONTENT, android.view.ViewGroup.LayoutParams.WRAP_CONTENT));
            frame.setVisibility(View.VISIBLE);
        }
    }

    /** A switch row, which a screen reader calls a switch and reads as on or off. */
    static final class Toggle extends SwitchPreference {
        Toggle(Context context) {
            super(context);
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Switch.class));
        }
    }

    /**
     * An edit dialog shrinks to fit above the keyboard instead of going under it. Android's own
     * EditTextPreference only asks for the keyboard, so at a large font size a long message pushed
     * the dialog's Save and Cancel behind the keyboard, where nobody could reach them. The dialog's
     * keyboard state is kept; only how it adjusts changes.
     */
    static void fitAboveKeyboard(Dialog dialog) {
        Window window = dialog == null ? null : dialog.getWindow();
        if (window == null) return;
        int mode = window.getAttributes().softInputMode;
        window.setSoftInputMode((mode & ~WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST)
                | WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
    }

    /**
     * The save folder's row. Its summary follows its text, whoever sets it: the person, the shared
     * page syncing it from the setting, or an import.
     */
    static final class FolderRow extends EditTextPreference {
        FolderRow(Context context) {
            super(context);
        }

        @Override
        public void setText(String text) {
            super.setText(text);
            setSummary(folderSummary(SaveFolder.sanitize(text)));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }

        /** Its edit dialog takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
            fitAboveKeyboard(getDialog());
        }
    }

    /**
     * A word list's row. Its summary follows its text, whoever sets it: the person, the shared page
     * syncing it from the setting, or an import.
     */
    static final class WordsRow extends EditTextPreference {
        final boolean hides;

        WordsRow(Context context, boolean hides) {
            super(context);
            this.hides = hides;
        }

        @Override
        public void setText(String text) {
            super.setText(text);
            setSummary(wordsSummary(text, hides));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }

        /** Its edit dialog takes the screen's colours, as the folder's does. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
            fitAboveKeyboard(getDialog());
        }
    }

    /**
     * The video file name's row. Its summary follows its text, whoever sets it: the person, the
     * shared page syncing it from the setting, or an import.
     */
    static final class FileNameRow extends EditTextPreference {
        @Nullable private TextView preview;
        private java.util.Date previewDate;

        FileNameRow(Context context) {
            super(context);
            getEditText().addTextChangedListener(new android.text.TextWatcher() {
                @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) { }
                @Override public void onTextChanged(CharSequence text, int start, int before, int count) {
                    if (preview != null) preview.setText(previewName(text.toString(), previewDate));
                }
                @Override public void afterTextChanged(android.text.Editable text) { }
            });
        }

        static String previewName(String text, java.util.Date when) {
            return FileNameTemplate.videoName(FileNameTemplate.sanitize(text), when, "123456") + ".mp4";
        }

        @Override protected View onCreateDialogView() {
            Context context = getContext();
            ScreenColors colors = ScreenColors.shown == null ? ScreenColors.DEFAULT : ScreenColors.shown;
            int pad = Math.round(20 * context.getResources().getDisplayMetrics().density);
            android.widget.LinearLayout content = new android.widget.LinearLayout(context);
            content.setOrientation(android.widget.LinearLayout.VERTICAL);
            content.setPadding(pad, pad / 2, pad, pad);
            EditText field = getEditText();
            if (field.getParent() instanceof android.view.ViewGroup) ((android.view.ViewGroup) field.getParent()).removeView(field);
            content.addView(field, new android.widget.LinearLayout.LayoutParams(-1, -2));
            TextView label = new TextView(context);
            label.setText(L10n.t("Example without post details"));
            label.setTextSize(12);
            label.setTextColor(colors.summary);
            label.setPadding(0, pad, 0, pad / 4);
            content.addView(label);
            previewDate = new java.util.Date();
            preview = new TextView(context);
            preview.setTextSize(14);
            preview.setTextColor(colors.title);
            preview.setText(previewName(getText(), previewDate));
            content.addView(preview);
            TextView help = new TextView(context);
            help.setId(android.R.id.message);
            help.setText(getDialogMessage());
            help.setTextSize(14);
            help.setTextColor(colors.summary);
            help.setPadding(0, pad, 0, 0);
            content.addView(help);
            ScrollView scroll = new ScrollView(context);
            scroll.addView(content);
            return scroll;
        }

        @Override protected void onBindDialogView(View view) {
            // The input is already in the custom scroll container, before its explanatory text.
            getEditText().setText(getText());
        }

        @Override protected void onDialogClosed(boolean positive) {
            super.onDialogClosed(positive);
            preview = null;
        }

        @Override
        public void setText(String text) {
            super.setText(text);
            setSummary(fileNameSummary(FileNameTemplate.sanitize(text)));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }

        /** Its edit dialog takes the screen's colours, as the folder's does. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
            fitAboveKeyboard(getDialog());
        }
    }

    /**
     * The download quality's row. Its summary follows its value, whoever sets it: the person, the
     * shared page syncing it from the setting, or an import.
     */
    static final class QualityRow extends ListPreference {
        QualityRow(Context context) {
            super(context);
        }

        @Override
        public void setValue(String value) {
            super.setValue(value);
            showSummary();
        }

        void showSummary() {
            DownloadQuality quality = DownloadQuality.BEST;
            for (DownloadQuality candidate : DownloadQuality.values()) {
                if (candidate.name().equals(getValue())) quality = candidate;
            }
            setSummary(qualitySummary(quality));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }

        /** Its list takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
        }
    }

    /**
     * The start tab's row. Its summary follows its value, whoever sets it: the person, the shared
     * page syncing it from the setting, or an import.
     */
    static final class StartTabRow extends ListPreference {
        StartTabRow(Context context) {
            super(context);
        }

        @Override
        public void setValue(String value) {
            super.setValue(value);
            showSummary();
        }

        void showSummary() {
            StartTab tab = StartTab.MARKETPLACE;
            for (StartTab candidate : StartTab.values()) {
                if (candidate.name().equals(getValue())) tab = candidate;
            }
            setSummary(startTabSummary(tab));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }

        /** Its list takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
        }
    }

    /**
     * The comment order's row. Its summary follows its value, whoever sets it: the person, the
     * shared page syncing it from the setting, or an import.
     */
    static final class CommentOrderRow extends ListPreference {
        CommentOrderRow(Context context) {
            super(context);
        }

        @Override
        public void setValue(String value) {
            super.setValue(value);
            showSummary();
        }

        void showSummary() {
            CommentOrder order = CommentOrder.FACEBOOK;
            for (CommentOrder candidate : CommentOrder.values()) {
                if (candidate.name().equals(getValue())) order = candidate;
            }
            setSummary(commentOrderSummary(order));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }

        /** Its list takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
        }
    }

    /**
     * The playback quality's row. Its summary follows its value, whoever sets it: the person, the
     * shared page syncing it from the setting, or an import.
     */
    static final class PlaybackQualityRow extends ListPreference {
        PlaybackQualityRow(Context context) {
            super(context);
        }

        @Override
        public void setValue(String value) {
            super.setValue(value);
            showSummary();
        }

        void showSummary() {
            PlaybackQuality quality = PlaybackQuality.AUTO;
            for (PlaybackQuality candidate : PlaybackQuality.values()) {
                if (candidate.name().equals(getValue())) quality = candidate;
            }
            setSummary(playbackQualitySummary(quality));
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }

        /** Its list takes the screen's colours, as the other rows' dialogs do. */
        @Override
        protected void showDialog(Bundle state) {
            super.showDialog(state);
            if (getDialog() instanceof AlertDialog) ScreenColors.dialog((AlertDialog) getDialog());
        }
    }

    static final class ExportRow extends ExportDiagnosticReportPreference {
        ExportRow(Context context) {
            super(context);
        }

        /** The two choices as cards, each saying what it does under its name. */
        @Override
        protected ListAdapter choices(Context dialogContext) {
            ScreenColors colors = ScreenColors.shown == null ? ScreenColors.DEFAULT : ScreenColors.shown;
            return new ChoiceCards(colors,
                    new CharSequence[]{L10n.t(getContext(), "Copy quick report"),
                            L10n.t(getContext(), "Save full report")},
                    new CharSequence[]{L10n.t(getContext(), "Copy a short report to the clipboard."),
                            L10n.t(getContext(), "Save the full report in Download/Morphe.")});
        }

        /**
         * The screen's colours, before the dialog is shown so its first layout measures them. The
         * cards bring their own spacing and press ripple, so the list draws no divider and no
         * highlight of its own over them.
         */
        @Override
        protected void onDialogCreated(AlertDialog dialog) {
            ListView list = dialog.getListView();
            if (list != null) {
                list.setDivider(null);
                list.setSelector(new ColorDrawable(Color.TRANSPARENT));
            }
            ScreenColors.dialog(dialog);
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }
    }

    static final class ClearRow extends ClearLogBufferPreference {
        ClearRow(Context context) {
            super(context);
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }
    }

    /** Font file, which opens the picker, or Use your phone's font, which acts at once. */
    static final class FontRow extends FontFilePreference {
        FontRow(HushfacebookPreferenceFragment page, Context context, int role) {
            super(page, context, role);
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }
    }

    /** Export settings or Import settings. */
    static final class BackupRow extends SettingsBackupPreference {
        BackupRow(HushfacebookPreferenceFragment page, Context context, int action, String title, String summary) {
            super(page, context, action, title, summary);
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
        }
    }

    /**
     * What a screen reader hears about a row a tap acts on. The list itself gives such a row its
     * place and a click action and no role, and the switch drawn in a switch row can't take
     * focus, so on its own a switch row said neither that it was a switch nor whether it was on.
     * A double tap goes through the list, the way a tap does, so the preference's own click runs.
     */
    static final class RowSemantics extends View.AccessibilityDelegate {
        private final Preference preference;
        private final Class<? extends View> role;

        RowSemantics(Preference preference, Class<? extends View> role) {
            this.preference = preference;
            this.role = role;
        }

        @Override
        public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
            super.onInitializeAccessibilityNodeInfo(host, info);
            AbsListView list = listOf(host);
            int position = list == null ? AdapterView.INVALID_POSITION : list.getPositionForView(host);
            if (position != AdapterView.INVALID_POSITION) {
                list.onInitializeAccessibilityNodeInfoForItem(host, position, info);
            }
            info.setClassName(role.getName());
            if (preference instanceof TwoStatePreference) {
                info.setCheckable(true);
                info.setChecked(((TwoStatePreference) preference).isChecked());
            }
            if (preference.isEnabled() && !info.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK)) {
                info.setClickable(true);
                info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK);
            }
        }

        @Override
        public void onInitializeAccessibilityEvent(View host, AccessibilityEvent event) {
            super.onInitializeAccessibilityEvent(host, event);
            // The click event is what a screen reader answers a double tap with, so it carries the
            // state the tap left.
            event.setClassName(role.getName());
            if (preference instanceof TwoStatePreference) {
                event.setChecked(((TwoStatePreference) preference).isChecked());
            }
        }

        @Override
        public boolean performAccessibilityAction(View host, int action, Bundle arguments) {
            AbsListView list = listOf(host);
            if (action == AccessibilityNodeInfo.ACTION_CLICK && list != null && preference.isEnabled()) {
                int position = list.getPositionForView(host);
                if (position != AdapterView.INVALID_POSITION) {
                    return list.performItemClick(host, position, list.getItemIdAtPosition(position));
                }
            }
            return super.performAccessibilityAction(host, action, arguments);
        }

        @Nullable
        private static AbsListView listOf(View row) {
            return row.getParent() instanceof AbsListView ? (AbsListView) row.getParent() : null;
        }
    }

    /**
     * The notice itself stays in English, as the licence texts it carries are: a translation of
     * the GPL is not the licence.
     */
    private void showNotice(Context context) {
        TextView text = new TextView(context);
        // NOTICE is hard-wrapped for a source file. Reflow prose on a narrow screen while keeping
        // blank lines, headings, lists and the generated notice itself intact.
        String notice = LicenseNotice.TEXT.replaceAll("(?<=[\\p{L}.,;])\\n(?=\\p{L})", " ")
                .replaceAll("(?m)^(  .+?) {2,}(https?://[^\\n]+)$", "$1\n$2\n");
        text.setText(notice);
        text.setTextIsSelectable(true);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        text.setBreakStrategy(Layout.BREAK_STRATEGY_HIGH_QUALITY);
        int pad = Math.round(16 * context.getResources().getDisplayMetrics().density);
        text.setPadding(pad, pad, pad, pad);
        text.setLineSpacing(Math.round(2 * context.getResources().getDisplayMetrics().density), 1.04f);
        ScrollView scroll = new ScrollView(context);
        scroll.addView(text);
        ScreenColors colors = ScreenColors.shown == null ? ScreenColors.DEFAULT : ScreenColors.shown;
        text.setTextColor(colors.summary);
        text.setLinkTextColor(colors.heading);
        Linkify.addLinks(text, Linkify.WEB_URLS);
        show(new AlertDialog.Builder(context)
                .setTitle(L10n.t("Licenses"))
                .setView(scroll)
                .setPositiveButton(L10n.t("OK"), null));
    }

    @Override
    protected CharSequence initializationErrorTitle(@Nullable Context context) {
        return L10n.t(context, "Hushfacebook settings couldn't open");
    }
}
