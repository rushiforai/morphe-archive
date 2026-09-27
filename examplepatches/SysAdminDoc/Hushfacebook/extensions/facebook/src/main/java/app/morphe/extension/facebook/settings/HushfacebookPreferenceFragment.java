/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.facebook.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.BitmapDrawable;
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
import android.text.Layout;
import android.text.util.Linkify;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.View;
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
import java.util.List;
import java.util.Set;

import app.morphe.extension.facebook.download.DownloadQuality;
import app.morphe.extension.facebook.download.FileNameTemplate;
import app.morphe.extension.facebook.download.SaveFolder;
import app.morphe.extension.facebook.navigation.StartTab;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.morphe.extension.shared.settings.preference.ClearLogBufferPreference;
import app.morphe.extension.shared.settings.preference.ExportDiagnosticReportPreference;
import app.morphe.extension.shared.settings.preference.ImmediateAction;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * The preference list, built in code rather than from an XML resource so the bundle adds no
 * resources to Facebook. A switch appears only when its patch is in this build
 * ({@link PatchFamily}), but for the settings entry's own ({@link PatchFamily#ENTRY_SWITCHES}),
 * which every build has; a patch that works entirely at patch time gets a line saying so, and
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

    /**
     * Where the list was before the last section jump, as its first visible position and that row's
     * top, which Back goes back to once; null when there's been no jump since.
     */
    @Nullable
    int[] beforeJump;

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
    }

    @Override
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (pendingImport != null) outState.putBundle(PENDING_IMPORT_STATE, pendingImport);
    }

    @Override
    public void onDestroyView() {
        // The preview is drawn over this page's window. It stays unanswered, and the page that
        // replaces this one shows it again.
        SettingsBackupPreference.closePreview(this);
        ReleaseCheck.unwatch(this);
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
        SettingsBackupPreference.onResult(this, requestCode, resultCode, data);
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

        if (build.contains(PatchFamily.START_TAB)) {
            // First: it's what happens before anything the other rows change comes on screen.
            PreferenceCategory opening = category(screen, L10n.t("Opening Facebook"));
            opening.addPreference(toggle(context, Settings.OPEN_ON_CHOSEN_TAB, L10n.t("Open on a chosen tab"),
                    L10n.t("Starting Facebook from its icon opens the tab chosen below instead of Facebook's usual "
                            + "one. Notifications and links still open where they lead.")));
            opening.addPreference(startTabRow(context));
        }

        if (build.contains(PatchFamily.SPONSORED_POSTS) || build.contains(PatchFamily.SUGGESTED_POSTS)
                || build.contains(PatchFamily.STORIES_TRAY) || build.contains(PatchFamily.FEED_REELS)
                || build.contains(PatchFamily.RETURN_REFRESH)
                || build.contains(PatchFamily.AI_DETECTED_POSTS)) {
            PreferenceCategory feed = category(screen, L10n.t("News feed"));
            if (build.contains(PatchFamily.SPONSORED_POSTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_SPONSORED_POSTS, L10n.t("Hide sponsored posts"),
                        L10n.t("Paid ads in the feed. They're dropped before Facebook adds them, so no gap is left.")));
                feed.addPreference(toggle(context, Settings.HIDE_PROMOTED_POSTS, L10n.t("Hide promoted posts"),
                        L10n.t("Posts Facebook files as promotions rather than as ads.")));
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
                        L10n.t("The row of friend suggestions between posts.")));
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
            }
            if (build.contains(PatchFamily.AI_DETECTED_POSTS)) {
                feed.addPreference(toggle(context, Settings.HIDE_AI_DETECTED_POSTS, L10n.t("Hide AI-detected posts"),
                        L10n.t("Posts that Facebook's own detection marks as made with AI. A post that only its "
                                + "creator labelled as AI stays. It's off by default because it hasn't been tested "
                                + "on a real feed yet.")));
            }
        }

        if (build.contains(PatchFamily.SPONSORED_STORIES) || build.contains(PatchFamily.STORY_AUTO_ADVANCE)
                || build.contains(PatchFamily.STORY_DOWNLOAD)) {
            PreferenceCategory stories = category(screen, L10n.t("Stories"));
            if (build.contains(PatchFamily.SPONSORED_STORIES)) {
                stories.addPreference(toggle(context, Settings.HIDE_SPONSORED_STORIES, L10n.t("Hide sponsored stories"),
                        L10n.t("Ad cards between the stories people posted.")));
            }
            if (build.contains(PatchFamily.STORY_AUTO_ADVANCE)) {
                stories.addPreference(toggle(context, Settings.BLOCK_STORY_AUTO_ADVANCE,
                        L10n.t("Stop Story auto-advance"),
                        L10n.t("A finished story stays on screen until you tap or swipe. Turn this off for Facebook's timing.")));
            }
            if (build.contains(PatchFamily.STORY_DOWNLOAD)) {
                stories.addPreference(toggle(context, Settings.DOWNLOAD_STORIES, L10n.t("Save any story"),
                        L10n.t("Adds Save to the menu of anyone's story, and saves at the quality set under "
                                + "Downloads. Off or paused, only your own stories have Save, and it's "
                                + "Facebook's own.")));
            }
        }

        if (build.contains(PatchFamily.SPONSORED_REELS) || build.contains(PatchFamily.AI_DETECTED_POSTS)
                || build.contains(PatchFamily.REEL_DECLUTTER) || build.contains(PatchFamily.REEL_WATCH_HISTORY)
                || build.contains(PatchFamily.REEL_DOWNLOAD)) {
            PreferenceCategory reels = category(screen, L10n.t("Reels and Watch"));
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
                        L10n.t("Facebook stops getting the list of reels you've watched, which it uses to rank your "
                                + "Reels feed. Nobody else sees that list. Reels you've already watched may come back "
                                + "in the feed.")));
            }
            if (build.contains(PatchFamily.REEL_DOWNLOAD)) {
                reels.addPreference(toggle(context, Settings.DOWNLOAD_REELS, L10n.t("Download button on reels"),
                        L10n.t("A Download button in the sidebar of every reel saves it at the quality set "
                                + "under Downloads. Off or paused, reels show only Facebook's own buttons.")));
            }
        }

        if (build.contains(PatchFamily.STORY_DOWNLOAD) || build.contains(PatchFamily.REEL_DOWNLOAD)
                || build.contains(PatchFamily.VIDEO_DOWNLOAD)) {
            PreferenceCategory downloads = category(screen, L10n.t("Downloads"));
            if (build.contains(PatchFamily.VIDEO_DOWNLOAD)) {
                downloads.addPreference(toggle(context, Settings.DOWNLOAD_VIDEOS, L10n.t("Download feed and Watch videos"),
                        L10n.t("Adds \"Download to phone\" to feed and Watch video menus. Saves at the quality set "
                                + "below. Off or paused, Facebook's menu returns.")));
            }
            downloads.addPreference(qualityRow(context));
            downloads.addPreference(folderRow(context));
            downloads.addPreference(fileNameRow(context));
        }

        if (build.contains(PatchFamily.EXTERNAL_BROWSER) || build.contains(PatchFamily.SANITIZE_SHARING_LINKS)) {
            PreferenceCategory links = category(screen, L10n.t("Links"));
            if (build.contains(PatchFamily.EXTERNAL_BROWSER)) {
                links.addPreference(toggle(context, Settings.OPEN_LINKS_EXTERNALLY, L10n.t("Open links in your browser"),
                        L10n.t("Web links leave Facebook's in-app browser. Facebook's own pages still open in the app.")));
            }
            if (build.contains(PatchFamily.SANITIZE_SHARING_LINKS)) {
                links.addPreference(toggle(context, Settings.SANITIZE_SHARING_LINKS,
                        L10n.t("Remove tracking from shared links"),
                        L10n.t("Takes tracking tags such as mibextid off the links you share or copy. A "
                                + "facebook.com/share/ link is made for one share, so Facebook can still trace it back to you.")));
            }
        }

        // In every build: the release check is the settings entry's own, not a patch's. Its switch
        // is one Pause turns off, so it sits above the Pause row with the rest.
        PreferenceCategory updates = category(screen, L10n.t("Updates"));
        if (build.contains(PatchFamily.UPDATE_PROMPTS)) {
            updates.addPreference(toggle(context, Settings.STOP_UPDATE_PROMPTS, L10n.t("Stop update prompts"),
                    L10n.t("Facebook stops asking you to update through Meta App Manager and stops having it look for one. "
                            + "Chat promotions aimed at older versions go too. A patched build can't install Meta's updates anyway.")));
        }
        updates.addPreference(toggle(context, Settings.CHECK_FOR_RELEASES, L10n.t("Check for new Hushfacebook releases"),
                L10n.t("Once a day, when Facebook starts, Hushfacebook asks GitHub for its newest release and shows it "
                        + "at the top of this screen if it's newer. It's the only time Hushfacebook goes online for "
                        + "itself, so it's off until you turn it on. Nothing gets downloaded.")));
        updates.addPreference(checkNowRow(context));
        ReleaseCheck.watch(this);

        if (build.contains(PatchFamily.SYSTEM_FONT) || build.contains(PatchFamily.SYSTEM_EMOJI)) {
            PreferenceCategory appearance = category(screen, L10n.t("Appearance"));
            if (build.contains(PatchFamily.SYSTEM_FONT)) {
                appearance.addPreference(toggle(context, Settings.USE_SYSTEM_FONT, L10n.t("Use the system font"),
                        L10n.t("Facebook's text is drawn in your phone's font instead of Meta's own. Restart "
                                + "Facebook after changing this.")));
            }
            if (build.contains(PatchFamily.SYSTEM_EMOJI)) {
                // The quick emoji picker keeps the first typeface it's given until Facebook restarts.
                appearance.addPreference(toggle(context, Settings.USE_SYSTEM_EMOJI, L10n.t("Use the phone's emoji"),
                        L10n.t("Emoji are drawn with your phone's own emoji font instead of Meta's. Reactions and "
                                + "stickers don't change. Restart Facebook after changing this.")));
            }
        }

        if (build.contains(PatchFamily.AD_PREFETCH) || build.contains(PatchFamily.AD_TELEMETRY)
                || build.contains(PatchFamily.AUDIENCE_NETWORK) || build.contains(PatchFamily.AMOLED_THEME)
                || build.contains(PatchFamily.MATERIAL_YOU_THEME) || build.contains(PatchFamily.RESTORE_TRUST)
                || build.contains(PatchFamily.INSTALL_BESIDE_META_APPS)) {
            PreferenceCategory patched = category(screen, L10n.t("Set when you patched"));
            if (build.contains(PatchFamily.AD_PREFETCH)) {
                patched.addPreference(info(context, L10n.t("Background ad prefetch blocked"),
                        L10n.t("Facebook doesn't download ads or its ad model in the background.")));
            }
            if (build.contains(PatchFamily.AD_TELEMETRY)) {
                patched.addPreference(info(context, L10n.t("Ad telemetry blocked"),
                        L10n.t("No screenshot watching for ads, and no reports of which apps you install.")));
            }
            if (build.contains(PatchFamily.AUDIENCE_NETWORK)) {
                patched.addPreference(info(context, L10n.t("Audience Network off"),
                        L10n.t("Facebook doesn't serve ads to other apps on this phone.")));
            }
            if (build.contains(PatchFamily.AMOLED_THEME)) {
                patched.addPreference(info(context, L10n.t("AMOLED black theme"),
                        L10n.t("Dark mode draws black instead of dark grey. Turn on dark mode in Facebook to see it.")));
            }
            if (build.contains(PatchFamily.MATERIAL_YOU_THEME)) {
                patched.addPreference(info(context, L10n.t("Material You theme"),
                        L10n.t("Facebook dark mode and this screen use your wallpaper colours. Android 11 uses blue "
                                + "instead. Turn on Facebook dark mode to see it.")));
            }
            if (build.contains(PatchFamily.RESTORE_TRUST)) {
                patched.addPreference(info(context, L10n.t("Re-signed build fix"),
                        L10n.t("Profiles and some Settings pages open again on this re-signed build.")));
            }
            if (build.contains(PatchFamily.INSTALL_BESIDE_META_APPS)) {
                patched.addPreference(info(context, L10n.t("Room for Meta's apps"),
                        L10n.t("Messenger, Facebook Lite, Business Suite and Workplace install beside this Facebook. "
                                + "It gives the two permissions they share with it names of its own.")));
            }
            patched.addPreference(info(context, L10n.t("Changing these"),
                    L10n.t("They're chosen in Morphe Manager when you patch, and Pause doesn't turn them off. "
                            + "Patch again to change them.")));
        }

        // Named for its rows: the screen's own title already says Hushfacebook.
        PreferenceCategory hushfacebook = category(screen, L10n.t("Pause, backup and diagnostics"));
        hushfacebook.addPreference(toggle(context, BaseSettings.PAUSED, L10n.t("Pause Hushfacebook"),
                L10n.t("From the next start, the switches above stop running and Facebook's own behaviour returns. "
                        + "Debug logging keeps working, and your choices stay.")));
        String stays = PatchFamily.staysWhilePausedSummary(build);
        if (stays != null) hushfacebook.addPreference(info(context, L10n.t(STAYS_WHILE_PAUSED), stays));
        // Morphe Manager can export the patch choices and the signing key, not these switches.
        hushfacebook.addPreference(new BackupRow(this, context, SettingsBackupPreference.EXPORT,
                L10n.t("Export settings"),
                L10n.t("Save your switches and download settings to a file. Pause and Debug logging aren't included, "
                        + "and neither is the release check.")));
        // The preview gives a count of the switches and the download settings' new values, not
        // each switch by name.
        hushfacebook.addPreference(new BackupRow(this, context, SettingsBackupPreference.IMPORT,
                L10n.t("Import settings"),
                L10n.t("Choose a settings file. Before anything is imported, you'll see how many switches it "
                        + "changes and any new download settings.")));
        // Debug logging also fills the exported report and turns on error toasts (Logger).
        hushfacebook.addPreference(toggle(context, BaseSettings.DEBUG, L10n.t("Debug logging"),
                L10n.t("Writes what each patch does to the Android log and the diagnostic report, and shows "
                        + "errors on screen. Leave it off unless you're reporting a problem.")));
        // Both rows come without a title of their own: Hushfeed's gave them one from string
        // resources that Facebook's APK doesn't have, and untitled they showed as blank rows.
        ExportDiagnosticReportPreference export = new ExportRow(context);
        export.setTitle(L10n.t("Export diagnostic report"));
        export.setSummary(L10n.t("Copy a quick report or save the full one to Download/Morphe. Names, IDs, links "
                + "and cookies are omitted."));
        hushfacebook.addPreference(export);
        ClearLogBufferPreference clear = new ClearRow(context);
        clear.setTitle(L10n.t("Clear diagnostic data"));
        clear.setClearAndUndoSummaries(L10n.t("Empties the log and the filter counts a report would include."),
                L10n.t("Diagnostic data cleared. Tap again to put it back."));
        hushfacebook.addPreference(clear);

        PreferenceCategory about = category(screen, L10n.t("About"));
        about.addPreference(info(context, L10n.t("Version"), L10n.f("Hushfacebook %1$s on Facebook %2$s",
                L10n.isolate(Utils.getPatchesReleaseVersion()), L10n.isolate(Utils.getAppVersionName()))));

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
        about.addPreference(source);

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
        about.addPreference(licenses);
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

    /** The page's section titles in the order they're on the page; a tap on one goes there. */
    void showSections(Context context) {
        List<Preference> sections = sections();
        CharSequence[] titles = new CharSequence[sections.size()];
        for (int i = 0; i < titles.length; i++) titles[i] = sections.get(i).getTitle();
        ScreenColors.dialog(new AlertDialog.Builder(context)
                .setTitle(L10n.t("Jump to a section"))
                .setItems(titles, (dialog, which) -> jumpTo(sections.get(which)))
                .setNegativeButton(L10n.t("Cancel"), null)
                .show());
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
        int fill = paused
                ? (colors == null ? 0xFF858D9C : colors.switchOff)
                : (colors == null ? 0xFF1769E0 : colors.accent);
        int diameter = Math.round(40 * context.getResources().getDisplayMetrics().density);
        Bitmap mark = Bitmap.createBitmap(diameter, diameter, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(mark);
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setColor(fill);
        canvas.drawRoundRect(0, 0, diameter, diameter, diameter / 5f, diameter / 5f, paint);
        paint.setColor(colors == null ? Color.WHITE : colors.onAccent);
        if (paused) {
            canvas.drawRoundRect(diameter * .32f, diameter * .27f, diameter * .43f, diameter * .73f,
                    diameter * .05f, diameter * .05f, paint);
            canvas.drawRoundRect(diameter * .57f, diameter * .27f, diameter * .68f, diameter * .73f,
                    diameter * .05f, diameter * .05f, paint);
        } else {
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(diameter / 10f);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            Path check = new Path();
            check.moveTo(diameter * .24f, diameter * .52f);
            check.lineTo(diameter * .43f, diameter * .70f);
            check.lineTo(diameter * .77f, diameter * .32f);
            canvas.drawPath(check, paint);
        }
        card.setIcon(new BitmapDrawable(context.getResources(), mark));
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
            boolean markerGone = HushfacebookPause.turnBackOn(context);
            Preference pause = findPreference(BaseSettings.PAUSED.key);
            if (pause instanceof SwitchPreference) ((SwitchPreference) pause).setChecked(false);
            if (markerGone) {
                showStatus(card, context);
            } else {
                card.setSummary(L10n.f("The file %1$s couldn't be removed. Delete it from %2$s to turn Hushfacebook back on.",
                        L10n.isolate(HushfacebookPause.MARKER_FILE_NAME),
                        L10n.isolate(markerFolder(context.getPackageName()))));
            }
            return true;
        });
        return card;
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

    @Override
    protected void onRestartPendingChanged() {
        Preference card = statusCard;
        Context context = getContext();
        if (card != null && context != null) showStatus(card, context);
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
     * account's tab bar hasn't got, so the summary says so rather than promise the tab.
     */
    static String startTabSummary(StartTab tab) {
        return L10n.f("Facebook opens on %1$s. If your tab bar doesn't have it, Facebook opens on Home.",
                tabLabel(tab));
    }

    /** The quality and start tab rows' summaries are sentences of their own rather than the chosen entry. */
    @Override
    protected void updateListPreferenceSummary(ListPreference listPreference, Setting<?> setting) {
        if (listPreference instanceof QualityRow) {
            ((QualityRow) listPreference).showSummary();
        } else if (listPreference instanceof StartTabRow) {
            ((StartTabRow) listPreference).showSummary();
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
        }
    }

    /**
     * The video file name's row. Its summary follows its text, whoever sets it: the person, the
     * shared page syncing it from the setting, or an import.
     */
    static final class FileNameRow extends EditTextPreference {
        FileNameRow(Context context) {
            super(context);
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
    private static void showNotice(Context context) {
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
        ScreenColors.dialog(new AlertDialog.Builder(context)
                .setTitle(L10n.t("Licenses"))
                .setView(scroll)
                .setPositiveButton(L10n.t("OK"), null)
                .show());
    }

    @Override
    protected CharSequence initializationErrorTitle(@Nullable Context context) {
        return L10n.t(context, "Hushfacebook settings couldn't open");
    }
}
