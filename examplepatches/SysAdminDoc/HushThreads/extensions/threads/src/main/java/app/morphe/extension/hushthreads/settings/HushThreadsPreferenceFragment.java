/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at a788c516 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.hushthreads.settings;

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
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.morphe.extension.shared.settings.preference.ClearLogBufferPreference;
import app.morphe.extension.shared.settings.preference.ExportDiagnosticReportPreference;
import app.morphe.extension.shared.settings.preference.ImmediateAction;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * The preference list, built in code rather than from an XML resource so the bundle adds no
 * resources to Threads. A switch appears only when its patch is in this build
 * ({@link PatchFamily}), but for the settings entry's own ({@link PatchFamily#ENTRY_SWITCHES}),
 * which every build has; a patch that works entirely at patch time gets a line saying so, and what
 * Pause can't reach is listed under the Pause switch. Switches are keyed by their setting, which is
 * how the shared fragment keeps them in sync with stored values. Every word is read from
 * {@link L10n} in the phone's language; the product names and the address stay as they are.
 */
@SuppressWarnings("deprecation")
public final class HushThreadsPreferenceFragment extends AbstractPreferenceFragment
        implements ReleaseCheck.Listener {
    /** The repository as a link, and as a person reads it. ExtensionHostsTest reads the link. */
    static final String SOURCE_URL = "https://github.com/SysAdminDoc/HushThreads";
    static final String SOURCE_ADDRESS = SOURCE_URL.substring(SOURCE_URL.indexOf("://") + 3);
    /** The English of the row listing what Pause can't reach, and its key in {@link L10n}. */
    static final String STAYS_WHILE_PAUSED = "Stays in while paused";
    /** The Check now row's key. It stores nothing: no setting has this name. */
    static final String CHECK_NOW = "action_check_for_release";
    /** The Supported links row's key. It stores nothing either. */
    static final String SUPPORTED_LINKS = "action_supported_links";
    /** The overview row naming omitted default patches. It stores nothing. */
    static final String MISSING_DEFAULTS = "action_missing_default_patches";

    /** Thrown by the next initialize() and then cleared: how a test reaches the recovery page. */
    static volatile RuntimeException failNextInitialization;

    /** The first row, which says whether HushThreads runs now and whether the next start changes that. */
    @Nullable
    private Preference statusCard;

    /** The row that asks GitHub for the newest release now, and says what the last try found. */
    @Nullable
    private Preference checkNowRow;

    /** Where a settings file waiting on the person's answer is kept across the page being rebuilt. */
    static final String PENDING_IMPORT_STATE = "hushthreads_pending_import";

    /**
     * A settings file that was read and waits on the person's answer, as
     * {@link SettingsBackup.Snapshot#toBundle()} wrote it, or null.
     */
    @Nullable
    Bundle pendingImport;

    /** The preview of {@link #pendingImport} while it's on screen. */
    @Nullable
    AlertDialog importPreview;

    /** The page's other dialogs that may still be on screen: the sections and Licenses. */
    private final List<Dialog> shownDialogs = new ArrayList<>();

    /**
     * Where the list was before the last section jump, as its first visible position and that row's
     * top, which Back goes back to once; null when there's been no jump since.
     */
    @Nullable
    int[] beforeJump;

    @Nullable
    SettingsNavigation navigation;

    /** The saves listed in Downloads, or null when this build has no save patch. */
    @Nullable
    SaveSettingsRows.Saves saves;

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
            // Set here rather than in initialize(), so a page whose initialize() failed, the
            // recovery page, is drawn on the same black.
            list.setBackgroundColor(ScreenColors.DEFAULT.background);
        }
    }

    @Override
    public void onResume() {
        super.onResume();
        SettingsBackupPreference.onPageResumed(this);
        showSupportedLinks();
        if (saves != null) saves.resume(getContext());
    }

    @Override
    public void onPause() {
        if (saves != null) saves.pause();
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
     * The file picker's answer. Android finds this page by the name the framework gave it when
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
        Settings.HIDE_ADS.get();

        // Every row inflates with the theme of the context it was built with. The host activity's
        // theme can be light, and its near-black primary text vanished on this screen's black
        // background on a phone (2026-09-24). The rows get the dark Material theme instead.
        Context context = themed(getContext());
        PreferenceScreen screen = getPreferenceManager().createPreferenceScreen(context);
        setPreferenceScreen(screen);

        screen.addPreference(statusCard(context));
        screen.addPreference(jumpRow(context));
        // The export row below reads these; registering twice keeps one.
        PatchFamily.registerDiagnostics();
        LogBufferManager.registerReportSection(ReleaseCheck.REPORT);
        Set<PatchFamily> build = PatchFamily.inThisBuild();

        if (build.contains(PatchFamily.HIDE_ADS) || build.contains(PatchFamily.HIDE_SUGGESTED_USERS)
                || build.contains(PatchFamily.RETURN_REFRESH) || build.contains(PatchFamily.VIDEO_AUTOPLAY)
                || build.contains(PatchFamily.MAX_IMAGE_QUALITY)) {
            PreferenceCategory feed = category(screen, L10n.t("Feed"));
            if (build.contains(PatchFamily.HIDE_ADS)) feed.addPreference(toggle(context, Settings.HIDE_ADS, L10n.t("Hide ads"),
                    L10n.t("Sponsored posts come out of For you and Following before Threads shows them, so no gap is "
                            + "left.")));
            if (build.contains(PatchFamily.HIDE_SUGGESTED_USERS)) {
                feed.addPreference(toggle(context, Settings.HIDE_SUGGESTED_USERS, L10n.t("Hide suggested users"),
                        L10n.t("Removes the cards that suggest accounts to follow, in your feed and on "
                                + "profiles. Normal posts and reposts stay.")));
            }
            if (build.contains(PatchFamily.RETURN_REFRESH)) {
                feed.addPreference(toggle(context, Settings.BLOCK_RETURN_REFRESH,
                        L10n.t("Keep feed position on return"),
                        L10n.t("Returning to Threads within ten minutes keeps your place. Pull to refresh still works.")));
                feed.addPreference(toggle(context, Settings.RETURN_REFRESH_NO_LIMIT,
                        L10n.t("No time limit"),
                        L10n.t("With the switch above on, your place stays however long you're away. Pull to refresh and a fresh start still load new posts.")));
            }
            if (build.contains(PatchFamily.VIDEO_AUTOPLAY)) {
                feed.addPreference(toggle(context, Settings.DISABLE_VIDEO_AUTOPLAY, L10n.t("Tap to play videos"),
                        L10n.t("Videos in your feed wait for a tap instead of playing as you scroll.")));
            }
            if (build.contains(PatchFamily.MAX_IMAGE_QUALITY)) {
                feed.addPreference(toggle(context, Settings.MAX_IMAGE_QUALITY, L10n.t("Full size photos"),
                        L10n.t("Photos load at the largest size Threads has, not one picked for your screen. They look sharper and use more data.")));
            }
        }

        if (build.contains(PatchFamily.SANITIZE_SHARING_LINKS) || build.contains(PatchFamily.EXTERNAL_BROWSER)
                || build.contains(PatchFamily.DISABLE_ANALYTICS) || build.contains(PatchFamily.SCREENSHOT_DETECTION)) {
            PreferenceCategory privacy = category(screen, L10n.t("Privacy"));
            if (build.contains(PatchFamily.SANITIZE_SHARING_LINKS)) {
                privacy.addPreference(toggle(context, Settings.SANITIZE_SHARING_LINKS,
                        L10n.t("Remove tracking from shared links"),
                        L10n.t("Takes tracking tags such as xmt and slof off the post links you copy or share. A short "
                                + "share link becomes the post's own link.")));
            }
            if (build.contains(PatchFamily.EXTERNAL_BROWSER)) {
                privacy.addPreference(toggle(context, Settings.OPEN_LINKS_EXTERNALLY,
                        L10n.t("Open links in your browser"),
                        L10n.t("Links you tap open in your browser or the site's app, skipping Threads' link "
                            + "tracking. Threads and Instagram pages still open in Threads.")));
            }
            if (build.contains(PatchFamily.DISABLE_ANALYTICS)) {
                privacy.addPreference(toggle(context, Settings.DISABLE_ANALYTICS, L10n.t("Stop analytics uploads"),
                        L10n.t("Stops most usage reports from reaching Meta. Some may still get through. Turn this "
                            + "off to send them as before.")));
                int mask = SettingsStatus.analyticsAddressMask();
                String coverage;
                if (mask <= 0 || (mask & ~7) != 0) {
                    coverage = L10n.t("This build didn't record which report types it covers. Patch again to see "
                        + "them.");
                } else {
                    List<String> matched = new ArrayList<>();
                    List<String> missing = new ArrayList<>();
                    String[] kinds = {"PIGEON", "DEFAULT", "MQTT"};
                    for (int i = 0; i < kinds.length; i++) {
                        ((mask & (1 << i)) != 0 ? matched : missing).add(kinds[i]);
                    }
                    String found = L10n.isolate(String.join(", ", matched));
                    String absent = missing.isEmpty() ? L10n.t("none") : L10n.isolate(String.join(", ", missing));
                    coverage = L10n.f("Blocked: %1$s. Not found in this build: %2$s.", found, absent);
                }
                privacy.addPreference(info(context, L10n.t("Analytics address coverage"), coverage));
            }
            if (build.contains(PatchFamily.SCREENSHOT_DETECTION)) {
                privacy.addPreference(toggle(context, Settings.DISABLE_SCREENSHOT_DETECTION,
                        L10n.t("Hide screenshots from Threads"),
                        L10n.t("Threads isn't told when you take a screenshot, so it can't log it or react to it.")));
            }
        }

        saves = null;
        if (build.contains(PatchFamily.SAVE_MEDIA)) {
            PreferenceCategory downloads = category(screen, L10n.t("Downloads"));
            downloads.addPreference(toggle(context, Settings.SAVE_MEDIA, L10n.t("Save photos and videos"),
                    L10n.t("Adds Save to a post's menu. A post with several photos or videos saves them all. Off or "
                        + "paused, you get Threads' normal menu.")));
            // Every save reads it, so it's here above the quality it keeps within.
            downloads.addPreference(toggle(context, Settings.DOWNLOAD_COMPATIBLE, L10n.t("Save videos other apps can open"),
                    L10n.t("Helps if WhatsApp, an editor like CapCut or InShot, or a gallery plays your saved video "
                        + "without sound. May lower quality.")));
            downloads.addPreference(SaveSettingsRows.qualityRow(context));
            downloads.addPreference(SaveSettingsRows.folderRow(context));
            downloads.addPreference(SaveSettingsRows.fileNameRow(context));
            saves = new SaveSettingsRows.Saves(downloads);
        }

        if (build.contains(PatchFamily.PURE_BLACK) || build.contains(PatchFamily.HIDE_INSTAGRAM_BUTTON)) {
            PreferenceCategory appearance = category(screen, L10n.t("Appearance"));
            if (build.contains(PatchFamily.PURE_BLACK)) {
                appearance.addPreference(toggle(context, Settings.PURE_BLACK, L10n.t("Pure black dark mode"),
                        L10n.t("Dark mode uses true black instead of dark gray. Turn on dark mode in Threads to see it. "
                            + "Restart Threads to see the change.")));
            }
            if (build.contains(PatchFamily.HIDE_INSTAGRAM_BUTTON)) {
                appearance.addPreference(toggle(context, Settings.HIDE_INSTAGRAM_BUTTON, L10n.t("Hide the Instagram button"),
                        L10n.t("Takes the Instagram button off the top of profiles, yours and other people's. "
                            + "Restart Threads to see the change.")));
            }
        }

        // In every build: Android checks Threads' links against Meta's signing key, which no
        // re-signed build has, whatever its patches.
        PreferenceCategory links = category(screen, L10n.t("Links"));
        links.addPreference(supportedLinksRow(context));
        links.addPreference(info(context, L10n.t("Selecting links by hand"),
                L10n.t("Android only sends Threads links to an app signed by Meta. Selecting the addresses sends "
                    + "their links here instead. Your other link settings stay as they are.")));

        // In every build: the release check is the settings entry's own, not a patch's. Its switch
        // is one Pause turns off, so it sits above the Pause row with the rest.
        PreferenceCategory updates = category(screen, L10n.t("Updates"));
        updates.addPreference(toggle(context, Settings.CHECK_FOR_RELEASES, L10n.t("Check for new HushThreads releases"),
                L10n.t("Once a day, when Threads starts, checks GitHub for a newer HushThreads and tells you here. "
                    + "Nothing is downloaded.")));
        updates.addPreference(checkNowRow(context));
        ReleaseCheck.watch(this);

        if (build.contains(PatchFamily.REMOVE_AD_ID) || build.contains(PatchFamily.RESTORE_TRUST)
                || build.contains(PatchFamily.VERSION_CODE) || build.contains(PatchFamily.REMOVE_SHARE_TARGETS)
                || build.contains(PatchFamily.TRUST_USER_CERTIFICATES)) {
            PreferenceCategory patched = category(screen, L10n.t("Set when you patched"));
            if (build.contains(PatchFamily.REMOVE_AD_ID)) {
                patched.addPreference(mark(info(context, L10n.t("Advertising ID removed"),
                        L10n.t("Threads can't read your phone's advertising ID. The permission for it is gone from this "
                                + "build.")), SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.RESTORE_TRUST)) {
                patched.addPreference(mark(info(context, L10n.t("Re-signed build fix"),
                        L10n.t("Some Threads screens check who signed the app and fail on a patched one. This fix "
                            + "makes them open again.")),
                        SettingsIcons.BUILD));
            }
            if (build.contains(PatchFamily.VERSION_CODE)) {
                patched.addPreference(mark(info(context, L10n.t("Version code raised"),
                        L10n.t("The version number is set as high as Android allows, so Google Play won't offer "
                            + "Meta's updates over this build. Threads still sees its real version. To go back to "
                            + "stock Threads, uninstall this one first, which deletes Threads' data on this phone. "
                            + "Later HushThreads builds need Change version code too, or they won't install over "
                            + "this one.")), SettingsIcons.UPDATES));
            }
            if (build.contains(PatchFamily.REMOVE_SHARE_TARGETS)) {
                patched.addPreference(mark(info(context, L10n.t("Share sheet entry removed"),
                        L10n.t("Threads doesn't show up when you share from other apps. Sharing from Threads to other "
                                + "apps still works.")), SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.TRUST_USER_CERTIFICATES)) {
                patched.addPreference(mark(info(context, L10n.t("User certificates trusted"),
                        L10n.t("Threads accepts security certificates you added to your phone. Its own checks on "
                            + "Meta's certificates are unchanged, so a proxy still can't read most of its traffic.")), SettingsIcons.TOOLS));
            }
            patched.addPreference(info(context, L10n.t("Changing these"),
                    L10n.t("They're chosen in Morphe Manager when you patch, and Pause doesn't turn them off. "
                            + "Patch again to change them.")));
        }

        // Named for its rows: the screen's own title already says HushThreads.
        PreferenceCategory hushthreads = category(screen, L10n.t("Pause, backup and diagnostics"));
        hushthreads.addPreference(mark(toggle(context, BaseSettings.PAUSED, L10n.t("Pause HushThreads"),
                L10n.t("Turns off every HushThreads switch except Debug logging the next time Threads starts. What "
                    + "you chose when you patched stays, and your choices are saved.")), SettingsIcons.PATCHED));
        String stays = PatchFamily.staysWhilePausedSummary(build);
        // Morphe Manager can export the patch choices and the signing key, not these switches.
        hushthreads.addPreference(mark(new BackupRow(this, context, SettingsBackupPreference.EXPORT,
                L10n.t("Export settings"),
                L10n.t("Save your switches to a file. Pause and Debug logging aren't included, and neither is the "
                        + "release check.")), SettingsIcons.EXPORT));
        // The preview gives a count of the switches, not each switch by name.
        hushthreads.addPreference(mark(new BackupRow(this, context, SettingsBackupPreference.IMPORT,
                L10n.t("Import settings"),
                L10n.t("Choose a settings file. Before anything is imported, you'll see how many switches it "
                        + "changes.")), SettingsIcons.DOWNLOADS));
        // Debug logging also fills the exported report and turns on error toasts (Logger).
        hushthreads.addPreference(mark(toggle(context, BaseSettings.DEBUG, L10n.t("Debug logging"),
                L10n.t("Record patch activity and show errors for a bug report. Leave off during normal use.")), SettingsIcons.BUG));
        // Both rows come without a title of their own: Hushfeed's gave them one from string
        // resources that Threads' APK doesn't have, and untitled they showed as blank rows.
        ExportDiagnosticReportPreference export = new ExportRow(context);
        export.setTitle(L10n.t("Export diagnostic report"));
        export.setSummary(L10n.t("Copy a quick report or save the full one to Download/Morphe. Links, IDs, cookies "
                + "and sign-in tokens are left out. Check it for other private text before you share it."));
        hushthreads.addPreference(mark(export, SettingsIcons.LICENSE));
        ClearLogBufferPreference clear = new ClearRow(context);
        clear.setTitle(L10n.t("Clear diagnostic data"));
        clear.setClearAndUndoSummaries(L10n.t("Clears the saved log and patch check results that a report would "
            + "include."),
                L10n.t("Diagnostic data cleared. Tap again to put it back."));
        hushthreads.addPreference(mark(clear, SettingsIcons.DELETE));
        // Keep the detailed patch-time exception list after the controls people come here for.
        if (stays != null) hushthreads.addPreference(info(context, L10n.t(STAYS_WHILE_PAUSED), stays));

        PreferenceCategory about = category(screen, L10n.t("About"));
        about.addPreference(mark(info(context, L10n.t("Version"), L10n.f("HushThreads %1$s on Threads %2$s",
                L10n.isolate(Utils.getPatchesReleaseVersion()), L10n.isolate(Utils.getAppVersionName()))
                + "\n" + L10n.f("Build %1$s", L10n.isolate(Utils.getPatchesBuildIdentity()))), SettingsIcons.ABOUT));

        Preference source = new Row(context);
        source.setTitle(L10n.t("Source code and issues"));
        source.setSummary(SOURCE_ADDRESS);
        source.setPersistent(false);
        source.setOnPreferenceClickListener(p -> {
            try {
                startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(SOURCE_URL)));
            } catch (ActivityNotFoundException | SecurityException missing) {
                // No browser, or none switched on. Uncaught, Android's exception closed Threads.
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

        // Appended to the model; the overview draws it immediately below its status card.
        Preference lacking = missingDefaultsRow(context, build);
        if (lacking != null) screen.addPreference(lacking);
    }

    /**
     * Straight to one section: two taps reach any section from the top, and Back goes back once to
     * where the list was.
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
        show(new AlertDialog.Builder(context)
                .setTitle(L10n.t("Jump to a section"))
                .setItems(titles, (dialog, which) -> jumpTo(sections.get(which)))
                .setNegativeButton(L10n.t("Cancel"), null));
    }

    /**
     * Shows [builder]'s dialog in the screen's colours, and closes it with the page's view. Nothing
     * shows once the view is gone or the activity is finishing: the dialog would come up over a
     * window that's gone.
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
     * The first row: whether HushThreads is on, and why not when it isn't. Paused by safe mode or
     * the marker file, a tap turns it back on from the next start.
     */
    private Preference statusCard(Context context) {
        Row card = new Row(context);
        card.setPersistent(false);
        boolean paused = HushThreadsPause.isPaused();
        ScreenColors palette = ScreenColors.DEFAULT;
        card.setIcon(SettingsIcons.icon(context, paused ? SettingsIcons.PAUSE : SettingsIcons.PATCHED,
                paused ? palette.summary : palette.heading));
        statusCard = card;
        if (!paused) {
            card.setTitle(L10n.t("HushThreads is on"));
            card.setSelectable(false);
            showStatus(card, context);
            return card;
        }
        card.setTitle(L10n.t("HushThreads is paused"));
        showStatus(card, context);
        // A tap acts at once, taking the pause off the next start, and the card says so in words.
        card.actsAtOnce = true;
        card.setOnPreferenceClickListener(p -> {
            resumeFromOverview();
            return true;
        });
        return card;
    }

    /** Missing-default disclosure ported from Hushfacebook 814acd23. */
    @Nullable
    private static Preference missingDefaultsRow(Context context, Set<PatchFamily> build) {
        List<String> missing = PatchFamily.missingDefaults(build);
        if (missing.isEmpty()) return null;
        List<String> names = new ArrayList<>();
        for (String name : missing) names.add(L10n.isolate(name));
        String closed = L10n.t("Tap to see which.");
        String open = L10n.quantity(missing.size(),
                "Not in this build: %1$s. Morphe Manager selects it by default. Patch again with it selected to "
                        + "get what it does.",
                "Not in this build: %1$s. Morphe Manager selects them by default. Patch again with them selected to "
                        + "get what they do.",
                L10n.join(names));
        Row row = new Row(context);
        row.setKey(MISSING_DEFAULTS);
        row.setPersistent(false);
        // The tap only opens or closes the list, so the row goes without a chevron.
        row.actsAtOnce = true;
        row.setTitle(L10n.quantity(missing.size(), "%1$d default patch isn't in this build",
                "%1$d default patches aren't in this build", missing.size()));
        row.setSummary(closed);
        row.setOnPreferenceClickListener(p -> {
            p.setSummary(closed.contentEquals(p.getSummary()) ? open : closed);
            return true;
        });
        return row;
    }

    void resumeFromOverview() {
        Context context = getContext();
        if (context == null || statusCard == null) return;
        HushThreadsPause.Reason still = HushThreadsPause.turnBackOn(context);
        // The switch shows what was kept. Setting it to off here would write off through the
        // preference itself when the store had just refused to.
        Preference pause = findPreference(BaseSettings.PAUSED.key);
        if (pause instanceof SwitchPreference) ((SwitchPreference) pause).setChecked(BaseSettings.PAUSED.savedValue());
        if (still == HushThreadsPause.Reason.MARKER_FILE) {
            String file = L10n.isolate(HushThreadsPause.MARKER_FILE_NAME);
            String folder = L10n.isolate(markerFolder(context.getPackageName()));
            // The switches stay as they were until the file goes, so say when they still pause.
            String left = BaseSettings.PAUSED.savedValue() || BaseSettings.SAFE_MODE.savedValue()
                    ? L10n.f("The file %1$s couldn't be removed. Delete it from %2$s, then tap Resume again.", file, folder)
                    : L10n.f("The file %1$s couldn't be removed. Delete it from %2$s to turn HushThreads back on.",
                    file, folder);
            statusCard.setSummary(left + "\n" + L10n.f("Build %1$s", L10n.isolate(buildIdentitySummary())));
            // Resume can be tapped on a category page too, where the card isn't in view.
            Utils.showToastLong(left);
            return;
        }
        if (still != HushThreadsPause.Reason.NONE) {
            Utils.showToastLong(L10n.t("Couldn't turn HushThreads back on. Try again."));
        }
        showStatus(statusCard, context);
    }

    /**
     * The card's line under its title: this start's state, and the next start's when a change on
     * this screen makes it differ. Pause switched on said "HushThreads is on" and nothing more,
     * and Pause switched back on after a tap on the card still said it turns back on at restart.
     * A newer release the release check found goes on a line of its own under that, paused or
     * not: a newer release can be the fix for what a pause is working around.
     */
    private void showStatus(Preference card, Context context) {
        boolean pausedNext = HushThreadsPause.pausesNextStart(context);
        String status;
        if (!HushThreadsPause.isPaused()) {
            String version = L10n.f("Version %1$s for Threads %2$s",
                    L10n.isolate(Utils.getPatchesReleaseVersion()), L10n.isolate(Utils.getAppVersionName()));
            status = pausedNext ? version + " " + L10n.t("HushThreads pauses when Threads restarts.") : version;
        } else if (pausedNext) {
            status = pausedSummary(HushThreadsPause.reason(), context.getPackageName())
                    + " " + L10n.t("Tap to turn it back on.");
        } else {
            status = L10n.t("HushThreads turns back on when Threads restarts.");
        }
        status += "\n" + L10n.f("Build %1$s", L10n.isolate(buildIdentitySummary()));
        String release = ReleaseCheck.statusLine();
        card.setSummary(release == null ? status : status + "\n" + release);
    }

    /** Keep the complete payload hash and source state here; About carries the full provenance. */
    static String buildIdentitySummary() {
        String identity = Utils.getPatchesBuildIdentity();
        int source = identity.indexOf("; source=");
        if (!identity.startsWith("sha256=") || source != "sha256=".length() + 64) return identity;
        int end = identity.indexOf(';', source + 2);
        int commit = identity.indexOf(':', source + 2);
        if (commit >= 0 && (end < 0 || commit < end)) end = commit;
        return end < 0 ? identity : identity.substring(0, end);
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
     * What Android says about sending Threads' web addresses here, and the way to its page for
     * them (Morphe Manager #1028). The page opens over Threads, so the row reads the state again
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
        Utils.showToastLong(L10n.t("Android's settings for this app didn't open. Open App info from Threads' icon, "
                + "then Open by default."));
    }

    /** A switch whose change waits for a restart: the card says what the next start brings. */
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
    static String pausedSummary(HushThreadsPause.Reason reason, String packageName) {
        String why;
        switch (reason) {
            case CRASH_LOOP:
                // Only a crash, a native crash or a hang counts toward safe mode (HushThreadsPause).
                why = L10n.t("Threads crashed or froze within a minute of starting three times in a row, so "
                        + "HushThreads paused itself.");
                break;
            case MARKER_FILE:
                why = L10n.f("A file named %1$s in %2$s paused HushThreads.",
                        L10n.isolate(HushThreadsPause.MARKER_FILE_NAME), L10n.isolate(markerFolder(packageName)));
                break;
            default:
                why = L10n.t("You paused HushThreads.");
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
     * The theme every row and dialog on this screen is built with, over Threads' own: dark
     * Material, which the black page reads on whatever the host activity's theme is.
     */
    static Context themed(Context base) {
        return new ContextThemeWrapper(base, ScreenColors.THEME);
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

    /** The quality row says what its choice does, where the shared page would show only its name. */
    @Override
    protected void updateListPreferenceSummary(ListPreference listPreference, Setting<?> setting) {
        if (listPreference instanceof SaveSettingsRows.QualityRow) {
            ((SaveSettingsRows.QualityRow) listPreference).showSummary();
        } else {
            super.updateListPreferenceSummary(listPreference, setting);
        }
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

    private static Preference mark(Preference row, String icon) {
        row.setIcon(SettingsIcons.icon(row.getContext(), icon, ScreenColors.DEFAULT.heading));
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

    static final class ExportRow extends ExportDiagnosticReportPreference {
        ExportRow(Context context) {
            super(context);
        }

        /** The two choices as cards, each saying what it does under its name. */
        @Override
        protected ListAdapter choices(Context dialogContext) {
            ScreenColors colors = ScreenColors.DEFAULT;
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
        BackupRow(HushThreadsPreferenceFragment page, Context context, int action, String title, String summary) {
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
        ScreenColors colors = ScreenColors.DEFAULT;
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
        return L10n.t(context, "HushThreads settings couldn't open");
    }
}
