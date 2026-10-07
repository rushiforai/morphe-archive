/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.hushpinterest.extension.pinterest.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.preference.TwoStatePreference;
import android.text.Layout;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
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
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.BaseSettings;
import app.hushpinterest.extension.shared.settings.BooleanSetting;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushpinterest.extension.shared.settings.preference.ClearLogBufferPreference;
import app.hushpinterest.extension.shared.settings.preference.ExportDiagnosticReportPreference;
import app.hushpinterest.extension.shared.settings.preference.ImmediateAction;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;

/**
 * The preference list, built in code rather than from an XML resource so the bundle adds no
 * resources to Pinterest. A switch appears only when its patch is in this build
 * ({@link PatchFamily}), but for the settings entry's own ({@link PatchFamily#ENTRY_SWITCHES}),
 * which every build has; a patch that works entirely at patch time gets a line saying so, and what
 * Pause can't reach is listed under the Pause switch. Switches are keyed by their setting, which is
 * how the shared fragment keeps them in sync with stored values. Every word is read from
 * {@link L10n} in the phone's language; the product names and the address stay as they are.
 */
@SuppressWarnings("deprecation")
public final class HushPinterestPreferenceFragment extends AbstractPreferenceFragment
        implements ReleaseCheck.Listener {
    /** The repository as a link, and as a person reads it. ExtensionHostsTest reads the link. */
    static final String SOURCE_URL = "https://github.com/SysAdminDoc/HushPinterest";
    static final String SOURCE_ADDRESS = SOURCE_URL.substring(SOURCE_URL.indexOf("://") + 3);
    /** The English of the row listing what Pause can't reach, and its key in {@link L10n}. */
    static final String STAYS_WHILE_PAUSED = "Stays in while paused";
    /** The Check now row's key. It stores nothing: no setting has this name. */
    static final String CHECK_NOW = "action_check_for_release";
    static final String RELEASE_NOTES = "action_release_notes";
    static final String UPDATE_INSTRUCTIONS = "action_update_instructions";
    static final String RELEASE_NOTES_URL = SOURCE_URL + "/releases";
    static final String UPDATE_INSTRUCTIONS_URL = SOURCE_URL + "#install";
    /** The Supported links row's key. It stores nothing either. */
    static final String SUPPORTED_LINKS = "action_supported_links";

    /** Thrown by the next initialize() and then cleared: how a test reaches the recovery page. */
    static volatile RuntimeException failNextInitialization;

    /** The first row, which says whether HushPinterest runs now and whether the next start changes that. */
    @Nullable
    private Preference statusCard;

    /** The row that asks GitHub for the newest release now, and says what the last try found. */
    @Nullable
    private Preference checkNowRow;

    /** Where a settings file waiting on the person's answer is kept across the page being rebuilt. */
    static final String PENDING_IMPORT_STATE = "hushpinterest_pending_import";

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

        // Every row carries an icon, so all pages share one text edge. A switch that stops something
        // Pinterest does takes the stop sign.
        if (!Collections.disjoint(build, PatchFamily.FEED_PAGE)) {
            PreferenceCategory feed = category(screen, L10n.t("Feed"));
            if (build.contains(PatchFamily.HIDE_ADS)) {
                feed.addPreference(mark(toggle(context, Settings.HIDE_ADS, L10n.t("Hide ads"),
                        PatchFamily.HIDE_ADS.coverageSummary(L10n.t("Promoted pins leave the home feed, search, related pins and boards "
                                + "before they're shown, and ad-only panels stay folded away."))), SettingsIcons.BLOCK));
            }
            if (build.contains(PatchFamily.HIDE_AI_PINS)) {
                feed.addPreference(mark(toggle(context, Settings.HIDE_AI_PINS, L10n.t("Hide AI-labeled pins"),
                        PatchFamily.HIDE_AI_PINS.coverageSummary(L10n.t("Pins that Pinterest labels as made or changed with AI leave the same lists. "
                                + "AI images without Pinterest's label still show."))), SettingsIcons.BLOCK));
            }
            patchToggle(feed, context, build, PatchFamily.HIDE_SHOPPING, Settings.HIDE_SHOPPING,
                    L10n.t("Hide shopping and product pins"), L10n.t("Shoppable pins, shopping stories and featured boards"), SettingsIcons.BLOCK);
        }

        if (!Collections.disjoint(build, PatchFamily.PRIVACY_PAGE)) {
            PreferenceCategory privacy = category(screen, L10n.t("Privacy"));
            patchToggle(privacy, context, build, PatchFamily.DISABLE_ANALYTICS, Settings.DISABLE_ANALYTICS,
                    L10n.t("Disable analytics"), L10n.t("Stops usage uploads and analytics launch tasks. Firebase and Google Analytics collection stays off until you patch without this patch."), SettingsIcons.BLOCK);
            patchToggle(privacy, context, build, PatchFamily.STRIP_LINK_TRACKING, Settings.STRIP_LINK_TRACKING,
                    L10n.t("Strip link tracking"), L10n.t("Removes known tracking parameters from copied and shared links. Short links stay as Pinterest made them."), SettingsIcons.LINKS);
            patchToggle(privacy, context, build, PatchFamily.HIDE_ADVERTISING_ID, Settings.HIDE_ADVERTISING_ID,
                    L10n.t("Hide advertising ID"), L10n.t("Pinterest and the ad and tracking code inside it read an all-zero ad ID with ad tracking limited, as if you deleted your ad ID in Android settings."), SettingsIcons.BLOCK);
            // A patch-time fact with no switch: an explanation, so it takes the info mark.
            if (build.contains(PatchFamily.REMOVE_AD_TRACKING_PERMISSIONS)) {
                privacy.addPreference(mark(info(context, L10n.t("Remove ad tracking permissions"),
                        L10n.t("Pinterest no longer has Google's ad ID permission or Android's ad services. This was set when you patched, and only patching again without it brings them back.")),
                        SettingsIcons.ABOUT));
            }
            if (build.contains(PatchFamily.SPOOF_SIGNATURE)) {
                privacy.addPreference(mark(info(context, L10n.t("Spoof signature for Google sign-in"),
                        L10n.t("Pinterest's manifest names its original signing certificate, so Google sign-in can work with microG-RE or the XSpoofSignatures module. Stock Google Play services ignores it. This was set when you patched, and only patching again without it takes it out.")),
                        SettingsIcons.ABOUT));
            }
        }

        if (!Collections.disjoint(build, PatchFamily.ACTIONS_PAGE)) {
            PreferenceCategory actions = category(screen, L10n.t("Pin actions"));
            patchToggle(actions, context, build, PatchFamily.DOWNLOAD_PINS, Settings.DOWNLOAD_PINS,
                    L10n.t("Download pins"), L10n.t("Download a pin or select visible grid pins. Saves videos and original images, or the largest size Pinterest supplied."), SettingsIcons.DOWNLOADS);
            if (build.contains(PatchFamily.DOWNLOAD_PINS)) {
                actions.addPreference(mark(new DownloadHistoryPreference(context), SettingsIcons.DOWNLOADS));
                if (Build.VERSION.SDK_INT == 28) actions.addPreference(mark(new PendingSavesPreference(context), SettingsIcons.DOWNLOADS));
            }
            patchToggle(actions, context, build, PatchFamily.SYSTEM_SHARE, Settings.SYSTEM_SHARE,
                    L10n.t("System share sheet"), L10n.t("Share uses Android's share sheet."), SettingsIcons.EXPORT);
        }

        if (!Collections.disjoint(build, PatchFamily.INTERFACE_PAGE)) {
            PreferenceCategory ui = category(screen, L10n.t("Interface"));
            patchToggle(ui, context, build, PatchFamily.HIDE_SCREENSHOT_SHARE, Settings.HIDE_SCREENSHOT_SHARE,
                    L10n.t("No screenshot share menu"),
                    L10n.t("Stops screenshot sharing suggestions after Pinterest restarts. Screenshots still work."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_SEARCH_HISTORY, Settings.HIDE_SEARCH_HISTORY,
                    L10n.t("Hide search history"),
                    L10n.t("Hides recent-search rows and carousels on their next layout or visibility update. It doesn't delete account history."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_NAVIGATION_BUTTONS, Settings.HIDE_NAV_CREATE,
                    L10n.t("Hide Create button"), L10n.t("Hides Create in the bottom bar on its next layout."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_NAVIGATION_BUTTONS, Settings.HIDE_NAV_NOTIFICATIONS,
                    L10n.t("Hide Notifications button"), L10n.t("Hides Notifications in the bottom bar on its next layout."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_NAVIGATION_BUTTONS, Settings.HIDE_NAV_SEARCH,
                    L10n.t("Hide Search button"), L10n.t("Hides Search in the bottom bar on its next layout."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_HEADER_BUTTONS, Settings.HIDE_HEADER_BUTTONS,
                    L10n.t("Hide header buttons"),
                    L10n.t("Hides trailing header icons on their next layout. Back, text actions and account controls stay available."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_PIN_MENU_ITEMS, Settings.HIDE_PIN_MENU_COLLAGE,
                    L10n.t("Hide collage menu items"),
                    L10n.t("Hides Add to collage and Remix collage in newly created pin menus. An existing menu won't change."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_PIN_MENU_ITEMS, Settings.HIDE_PIN_MENU_VISUAL_SEARCH,
                    L10n.t("Hide Search image menu item"),
                    L10n.t("Hides Search image in newly created pin menus. An existing menu won't change."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_PIN_MENU_ITEMS, Settings.HIDE_PIN_MENU_PIN_BOOST,
                    L10n.t("Hide Promote pin menu item"),
                    L10n.t("Hides Promote pin in newly created pin menus. An existing menu won't change."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_COMMENTS, Settings.HIDE_COMMENTS,
                    L10n.t("Hide comments"),
                    L10n.t("Hides comments panels and previews under pins on their next layout or visibility update. It doesn't change who can comment."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_TOPIC_SUGGESTIONS, Settings.HIDE_TOPIC_SUGGESTIONS,
                    L10n.t("Hide topic suggestions"),
                    L10n.t("Hides the \"Ideas you might love\" row of topic bubbles under pins the next time Pinterest shows it. Comments and related pins stay."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.QUIET_EMAIL_REMINDER, Settings.QUIET_EMAIL_REMINDER,
                    L10n.t("Quiet email reminders"),
                    L10n.t("Dismisses newly created optional confirm-email reminders. An open reminder won't change. Verification and sign-in checks still apply."), SettingsIcons.BELL);
            patchToggle(ui, context, build, PatchFamily.HIDE_SAVE_TOASTS, Settings.HIDE_SAVE_TOASTS,
                    L10n.t("Hide save toasts"),
                    L10n.t("Saving a pin no longer pops up \"Saved to\" your board or a suggestion to follow its creator. The pin is still saved."), SettingsIcons.BELL);
            patchToggle(ui, context, build, PatchFamily.ORIGINAL_IMAGES, Settings.ORIGINAL_IMAGES,
                    L10n.t("Original-quality images"),
                    L10n.t("Shows the original image instead of the large size in pin closeups and collages, wherever Pinterest sends one. Uses more data. Pins already loaded keep their size until Pinterest loads them again."), SettingsIcons.FEED);
        }

        // In every build: a patched Pinterest isn't verified for its own links, so Android opens them
        // here only for the addresses selected on the app's Open by default page.
        PreferenceCategory links = category(screen, L10n.t("Links"));
        patchToggle(links, context, build, PatchFamily.EXTERNAL_BROWSER, Settings.EXTERNAL_BROWSER,
                L10n.t("Open links in your browser"), L10n.t("Open pin Visit links and profile websites in your browser."), SettingsIcons.LINKS);
        links.addPreference(mark(supportedLinksRow(context), SettingsIcons.LINKS));
        // An explanation, not a control: the info mark says so, as it does for Version on About.
        links.addPreference(mark(info(context, L10n.t("Selecting links by hand"),
                L10n.t("Android opens pinterest.com and pin.it links in a patched Pinterest only when their addresses are selected for it. "
                        + "Selecting them sends their links here, and your other link settings stay as they are.")),
                SettingsIcons.ABOUT));

        // In every build: the release check is the settings entry's own, not a patch's. Its switch
        // is one Pause turns off, so it sits above the Pause row with the rest.
        PreferenceCategory updates = category(screen, L10n.t("Updates"));
        patchToggle(updates, context, build, PatchFamily.DISABLE_UPDATE_NAG, Settings.DISABLE_UPDATE_NAG,
                L10n.t("Disable update nag"), L10n.t("Hides new Play Store update prompts. An open prompt won't change."), SettingsIcons.BLOCK);
        updates.addPreference(mark(toggle(context, Settings.CHECK_FOR_RELEASES, L10n.t("Check for new HushPinterest releases"),
                L10n.t("Ask GitHub once a day when Pinterest starts, and show a newer release at the top of these "
                        + "settings. Off by default. Nothing is downloaded.")), SettingsIcons.BELL));
        updates.addPreference(mark(checkNowRow(context), SettingsIcons.UPDATES));
        updates.addPreference(mark(releaseLink(context, RELEASE_NOTES, L10n.t("Release notes"),
                L10n.t("Read HushPinterest releases on GitHub. Nothing is downloaded here."), RELEASE_NOTES_URL), SettingsIcons.OPENING));
        updates.addPreference(mark(releaseLink(context, UPDATE_INSTRUCTIONS, L10n.t("Update instructions"),
                L10n.t("Open the installation steps on GitHub."), UPDATE_INSTRUCTIONS_URL), SettingsIcons.OPENING));
        ReleaseCheck.watch(this);

        // Named for its rows: the screen's own title already says HushPinterest.
        PreferenceCategory hushpinterest = category(screen, L10n.t("Pause, backup and diagnostics"));
        hushpinterest.addPreference(mark(toggle(context, BaseSettings.PAUSED, L10n.t("Pause HushPinterest"),
                L10n.t("From the next start, every switch but Debug logging acts as if it were off. "
                        + "Changes made when you patched stay in, and your choices stay saved.")), SettingsIcons.PATCHED));
        String stays = PatchFamily.staysWhilePausedSummary(build);
        // Morphe Manager can export the patch choices and the signing key, not these switches.
        hushpinterest.addPreference(mark(new BackupRow(this, context, SettingsBackupPreference.EXPORT,
                L10n.t("Export settings"),
                L10n.t("Save your switches to a file. They cover all the accounts in this Pinterest app. Pause and "
                        + "Debug logging aren't included, and neither is the release check.")), SettingsIcons.EXPORT));
        hushpinterest.addPreference(mark(new BackupRow(this, context, SettingsBackupPreference.IMPORT,
                L10n.t("Import settings"),
                L10n.t("Choose a settings file. Review each switch's name and old and new values before importing. "
                        + "Your choices apply to all accounts in this Pinterest app.")), SettingsIcons.DOWNLOADS));
        hushpinterest.addPreference(mark(new BackupRow(this, context, SettingsBackupPreference.UNDO,
                L10n.t("Undo import"),
                L10n.t("There's no import to undo.")), SettingsIcons.UPDATES));
        // Debug logging also fills the exported report and turns on error toasts (Logger).
        hushpinterest.addPreference(mark(toggle(context, BaseSettings.DEBUG, L10n.t("Debug logging"),
                L10n.t("Record patch activity and show errors for a bug report. Leave off during normal use.")), SettingsIcons.BUG));
        // Both rows come without a title of their own: Hushfeed's gave them one from string
        // resources that Pinterest's APK doesn't have, and untitled they showed as blank rows.
        ExportDiagnosticReportPreference export = new ExportRow(context);
        export.setTitle(L10n.t("Export diagnostic report"));
        export.setSummary(export.destinationSummary());
        hushpinterest.addPreference(mark(export, SettingsIcons.LICENSE));
        ClearLogBufferPreference clear = new ClearRow(context);
        clear.setTitle(L10n.t("Clear diagnostic data"));
        clear.setClearAndUndoSummaries(L10n.t("Empties the log and the hook findings a report would include."),
                L10n.t("Diagnostic data cleared. Tap again to put it back."));
        hushpinterest.addPreference(mark(clear, SettingsIcons.DELETE));
        // Keep the detailed patch-time exception list after the controls people come here for.
        if (stays != null) hushpinterest.addPreference(mark(info(context, L10n.t(STAYS_WHILE_PAUSED), stays), SettingsIcons.ABOUT));

        PreferenceCategory about = category(screen, L10n.t("About"));
        about.addPreference(mark(info(context, L10n.t("Version"), L10n.f("HushPinterest %1$s on Pinterest %2$s",
                L10n.isolate(Utils.getPatchesReleaseVersion()), L10n.isolate(Utils.getAppVersionName()))), SettingsIcons.ABOUT));
        // Switches live in one application-wide store, while Pinterest can hold several accounts.
        about.addPreference(mark(info(context, L10n.t("Accounts"), L10n.t("Every switch here applies to all the "
                + "accounts in this Pinterest app, not only the one you have open.")), SettingsIcons.ABOUT));

        about.addPreference(mark(new SetupGuidancePreference(context), SettingsIcons.ABOUT));

        Preference source = new Row(context);
        source.setTitle(L10n.t("Source code and issues"));
        source.setSummary(SOURCE_ADDRESS);
        source.setPersistent(false);
        source.setOnPreferenceClickListener(p -> {
            try {
                startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(SOURCE_URL)));
            } catch (ActivityNotFoundException | SecurityException missing) {
                // No browser, or none switched on. Uncaught, Android's exception closed Pinterest.
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
     * The first row: whether HushPinterest is on, and why not when it isn't. Paused by safe mode or
     * the marker file, a tap turns it back on from the next start.
     */
    private Preference statusCard(Context context) {
        Row card = new Row(context);
        card.setPersistent(false);
        boolean paused = HushPinterestPause.isPaused();
        ScreenColors palette = ScreenColors.DEFAULT;
        card.setIcon(SettingsIcons.icon(context, paused ? SettingsIcons.PAUSE : SettingsIcons.PATCHED,
                paused ? palette.summary : palette.heading));
        statusCard = card;
        if (!paused) {
            card.setTitle(L10n.t("HushPinterest is on"));
            card.setSelectable(false);
            showStatus(card, context);
            return card;
        }
        card.setTitle(L10n.t("HushPinterest is paused"));
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
        HushPinterestPause.Reason still = HushPinterestPause.turnBackOn(context);
        // The switch shows what was kept. Setting it to off here would write off through the
        // preference itself when the store had just refused to.
        Preference pause = findPreference(BaseSettings.PAUSED.key);
        if (pause instanceof SwitchPreference) ((SwitchPreference) pause).setChecked(BaseSettings.PAUSED.savedValue());
        if (still == HushPinterestPause.Reason.MARKER_FILE) {
            String file = L10n.isolate(HushPinterestPause.MARKER_FILE_NAME);
            String folder = L10n.isolate(markerFolder(context.getPackageName()));
            // The switches stay as they were until the file goes, so say when they still pause.
            String left = BaseSettings.PAUSED.savedValue() || BaseSettings.SAFE_MODE.savedValue()
                    ? L10n.f("The file %1$s couldn't be removed. Delete it from %2$s, then tap Resume again.", file, folder)
                    : L10n.f("The file %1$s couldn't be removed. Delete it from %2$s to turn HushPinterest back on.",
                    file, folder);
            statusCard.setSummary(left);
            // Resume can be tapped on a category page too, where the card isn't in view.
            Utils.showToastLong(left);
            return;
        }
        if (still != HushPinterestPause.Reason.NONE) {
            Utils.showToastLong(L10n.t("Couldn't turn HushPinterest back on. Try again."));
        }
        showStatus(statusCard, context);
    }

    /**
     * The card's line under its title: this start's state, and the next start's when a change on
     * this screen makes it differ. Pause switched on said "HushPinterest is on" and nothing more,
     * and Pause switched back on after a tap on the card still said it turns back on at restart.
     * A newer release the release check found goes on a line of its own under that, paused or
     * not: a newer release can be the fix for what a pause is working around.
     */
    private void showStatus(Preference card, Context context) {
        boolean pausedNext = HushPinterestPause.pausesNextStart(context);
        String status;
        if (!HushPinterestPause.isPaused()) {
            // The version lives on the About page. Here it pushed the line that matters below it.
            status = pausedNext ? L10n.t("HushPinterest pauses when Pinterest restarts.") : L10n.t("Your controls are active.");
        } else if (pausedNext) {
            status = pausedSummary(HushPinterestPause.reason(), context.getPackageName())
                    + " " + L10n.t("Tap to turn it back on.");
        } else {
            status = L10n.t("HushPinterest turns back on when Pinterest restarts.");
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

    /** Fixed project pages. Neither a release's body nor its html_url can choose the destination. */
    private Preference releaseLink(Context context, String key, String title, String summary, String url) {
        Row row = new Row(context);
        row.setKey(key);
        row.setTitle(title);
        row.setSummary(summary);
        row.setPersistent(false);
        row.setOnPreferenceClickListener(ignored -> {
            try {
                startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
            } catch (ActivityNotFoundException | SecurityException missing) {
                Logger.printInfo(() -> "No app opened the release help link");
                String address = url.substring(url.indexOf("://") + 3);
                Utils.showToastLong(L10n.f("No app on this phone can open the link. The address is %1$s.",
                        L10n.isolate(address)));
            }
            return true;
        });
        return row;
    }

    /**
     * What Android says about sending Pinterest's web addresses here, and the way to its page for
     * them (Morphe Manager #1028). The page opens over Pinterest, so the row reads the state again
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
        Utils.showToastLong(L10n.t("Android's settings for this app didn't open. Open App info from Pinterest's icon, "
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
    static String pausedSummary(HushPinterestPause.Reason reason, String packageName) {
        String why;
        switch (reason) {
            case CRASH_LOOP:
                // Only a crash, a native crash or a hang counts toward safe mode (HushPinterestPause).
                why = L10n.t("Pinterest crashed or froze within a minute of starting three times in a row, so "
                        + "HushPinterest paused itself.");
                break;
            case MARKER_FILE:
                why = L10n.f("A file named %1$s in %2$s paused HushPinterest.",
                        L10n.isolate(HushPinterestPause.MARKER_FILE_NAME), L10n.isolate(markerFolder(packageName)));
                break;
            default:
                why = L10n.t("You paused HushPinterest.");
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
     * The theme every row and dialog on this screen is built with, over Pinterest's own: dark
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

    private static void patchToggle(PreferenceCategory category, Context context, Set<PatchFamily> build,
                                    PatchFamily family, BooleanSetting setting, String title, String summary, String icon) {
        if (build.contains(family)) {
            category.addPreference(mark(toggle(context, setting, title, family.coverageSummary(summary)), icon));
        }
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
                            fullReportSummary()});
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
        BackupRow(HushPinterestPreferenceFragment page, Context context, int action, String title, String summary) {
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
        ScreenColors colors = ScreenColors.DEFAULT;
        text.setText(noticeForScreen(notice, colors.title));
        text.setTextIsSelectable(true);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        text.setBreakStrategy(Layout.BREAK_STRATEGY_HIGH_QUALITY);
        int pad = Math.round(16 * context.getResources().getDisplayMetrics().density);
        text.setPadding(pad, pad, pad, pad);
        text.setLineSpacing(Math.round(2 * context.getResources().getDisplayMetrics().density), 1.04f);
        ScrollView scroll = new ScrollView(context);
        scroll.addView(text);
        text.setTextColor(colors.summary);
        text.setLinkTextColor(colors.heading);
        Linkify.addLinks(text, Linkify.WEB_URLS);
        show(new AlertDialog.Builder(context)
                .setTitle(L10n.t("Licenses"))
                .setView(scroll)
                .setPositiveButton(L10n.t("OK"), null));
    }

    /**
     * NOTICE marks its headings with a line of = or - under them, which reads as a heading in a
     * text file and as a row of symbols on a phone. The heading turns bold and the rule goes, and
     * so does a rule standing alone between notices, since the blank lines already part them.
     */
    static CharSequence noticeForScreen(String notice, int headingColor) {
        Matcher heading = Pattern.compile("(?m)^(\\S[^\\n]*)\\n[=-]{3,}$").matcher(notice);
        SpannableStringBuilder shown = new SpannableStringBuilder();
        int at = 0;
        while (heading.find()) {
            shown.append(notice, at, heading.start());
            int start = shown.length();
            shown.append(heading.group(1));
            shown.setSpan(new StyleSpan(Typeface.BOLD), start, shown.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            shown.setSpan(new ForegroundColorSpan(headingColor), start, shown.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            at = heading.end();
        }
        shown.append(notice, at, notice.length());
        for (Matcher rule = Pattern.compile("(?m)^[=-]{3,}\\n").matcher(shown); rule.find(); rule.reset(shown)) {
            shown.delete(rule.start(), rule.end());
        }
        for (Matcher gap = Pattern.compile("\\n{4,}").matcher(shown); gap.find(); gap.reset(shown)) {
            shown.replace(gap.start(), gap.end(), "\n\n\n");
        }
        return shown;
    }

    @Override
    protected CharSequence initializationErrorTitle(@Nullable Context context) {
        return L10n.t(context, "HushPinterest settings couldn't open");
    }
}
