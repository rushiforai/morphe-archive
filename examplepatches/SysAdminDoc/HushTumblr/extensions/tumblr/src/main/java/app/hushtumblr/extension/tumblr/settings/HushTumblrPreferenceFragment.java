/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
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
package app.hushtumblr.extension.tumblr.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ActivityNotFoundException;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.database.Cursor;
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
import android.provider.OpenableColumns;
import android.text.InputType;
import android.text.Layout;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.text.util.Linkify;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.EditorInfo;
import android.widget.AbsListView;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.Logger;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.settings.BaseSettings;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushtumblr.extension.shared.settings.preference.ClearLogBufferPreference;
import app.hushtumblr.extension.shared.settings.preference.ExportDiagnosticReportPreference;
import app.hushtumblr.extension.shared.settings.preference.ImmediateAction;
import app.hushtumblr.extension.shared.settings.preference.LogBufferManager;
import app.hushtumblr.extension.shared.settings.preference.QuickSetups;
import app.hushtumblr.extension.tumblr.rootmute.RootPostMutePreference;
import app.hushtumblr.extension.tumblr.timeline.PostRules;
import app.hushtumblr.extension.tumblr.ui.AppFont;
import app.hushtumblr.extension.tumblr.ui.BottomBarTabs;
import app.hushtumblr.extension.shared.settings.StringSetting;

/**
 * The preference list, built in code rather than from an XML resource so the bundle adds no
 * resources to Tumblr. A switch appears only when its patch is in this build
 * ({@link PatchFamily}), but for the settings entry's own ({@link PatchFamily#ENTRY_SWITCHES}),
 * which every build has; a patch that works entirely at patch time gets a line saying so, and what
 * Pause can't reach is listed under the Pause switch. Switches are keyed by their setting, which is
 * how the shared fragment keeps them in sync with stored values. Every word is read from
 * {@link L10n} in the phone's language; the product names and the address stay as they are.
 */
@SuppressWarnings("deprecation")
public final class HushTumblrPreferenceFragment extends AbstractPreferenceFragment
        implements ReleaseCheck.Listener {
    /** The repository as a link, and as a person reads it. ExtensionHostsTest reads the link. */
    static final String SOURCE_URL = "https://github.com/SysAdminDoc/HushTumblr";
    static final String SOURCE_ADDRESS = SOURCE_URL.substring(SOURCE_URL.indexOf("://") + 3);
    /** Where Support HushTumblr goes: the maintainer's Ko-fi page. ExtensionHostsTest reads the link. */
    static final String SUPPORT_URL = "https://ko-fi.com/X8K126YVER";
    static final String SUPPORT_ADDRESS = SUPPORT_URL.substring(SUPPORT_URL.indexOf("://") + 3);
    /** The key of Support HushTumblr, the settings home page's last row. It stores nothing. */
    static final String SUPPORT = "action_support_hushtumblr";
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
    /** The Words to hide row's key. The list itself is {@link TextSettings#HIDDEN_WORDS}. */
    static final String HIDDEN_WORDS_ROW = "action_hidden_words";
    static final String ALLOWED_WORDS_ROW = "action_allowed_words";
    static final String TAB_ORDER_ROW = "action_tab_order";
    /** The Choose a font file row's key. What it chose is {@link TextSettings#APP_FONT_FILE}. */
    static final String FONT_FILE_ROW = "action_font_file";
    static final String PHONE_FONT_ROW = "action_phone_font";
    /** The font picker's request. The settings file's two are in {@link SettingsBackupPreference}. */
    static final int FONT_FILE = 7313;

    /** Thrown by the next initialize() and then cleared: how a test reaches the recovery page. */
    static volatile RuntimeException failNextInitialization;

    /** The first row, which says whether HushTumblr runs now and whether the next start changes that. */
    @Nullable
    private Preference statusCard;
    @Nullable
    private RootPostMutePreference manageMutedPosts;

    /** The row that asks GitHub for the newest release now, and says what the last try found. */
    @Nullable
    private Preference checkNowRow;

    /** Where a settings file waiting on the person's answer is kept across the page being rebuilt. */
    static final String PENDING_IMPORT_STATE = "hushtumblr_pending_import";
    private static final String WORDS_DRAFT_STATE = "hushtumblr_words_draft";
    @Nullable private AlertDialog wordsDialog;
    @Nullable private EditText wordsField;
    @Nullable private String wordsDraft;
    private int wordsSelectionStart;
    private int wordsSelectionEnd;
    private boolean restoreWordsEditor;
    private boolean editingAllowedWords;

    @Nullable static Consumer<Runnable> editWorkerForTests;
    private static final java.util.concurrent.atomic.AtomicInteger pendingEdits =
            new java.util.concurrent.atomic.AtomicInteger();
    private static volatile boolean savedRefreshRetryScheduled;

    static boolean hasPendingEdits() {
        return pendingEdits.get() != 0 || savedRefreshRetryScheduled;
    }

    static boolean submitEdit(Runnable task) {
        return submitEdit(task, true);
    }

    static boolean submitEdit(Runnable task, Runnable completion) {
        return submitEdit(task, true, completion);
    }

    private static boolean submitEdit(Runnable task, boolean refreshOnRejection) {
        return submitEdit(task, refreshOnRejection, null);
    }

    private static boolean submitEdit(Runnable task, boolean refreshOnRejection, @Nullable Runnable completion) {
        pendingEdits.incrementAndGet();
        SettingsBackupPreference.refreshCurrentPage();
        java.util.concurrent.atomic.AtomicBoolean completed = new java.util.concurrent.atomic.AtomicBoolean();
        Runnable finish = () -> {
            if (!completed.compareAndSet(false, true)) return;
            pendingEdits.decrementAndGet();
            if (completion == null) {
                SettingsBackupPreference.refreshCurrentPage();
            } else {
                Utils.runOnMainThreadNowOrLater(() -> {
                    SettingsBackupPreference.refreshCurrentPage();
                    completion.run();
                });
            }
        };
        Runnable guarded = () -> {
            try {
                task.run();
            } finally {
                finish.run();
            }
        };
        Consumer<Runnable> worker = editWorkerForTests;
        boolean accepted = false;
        try {
            if (worker == null) accepted = Utils.runOnBackgroundThread(guarded);
            else {
                worker.accept(guarded);
                accepted = true;
            }
            return accepted;
        } catch (java.util.concurrent.RejectedExecutionException rejected) {
            return false;
        } finally {
            if (!accepted && completed.compareAndSet(false, true)) {
                pendingEdits.decrementAndGet();
                if (refreshOnRejection) SettingsBackupPreference.refreshCurrentPage();
            }
        }
    }

    /** Wait for external writes and rollback off main before refreshing an app-owned row. */
    static void scheduleSavedChangeRefresh() {
        if (hasPendingEdits()) return;
        if (!submitEdit(() -> {
            synchronized (app.hushtumblr.extension.shared.settings.Setting.class) {
                // The transaction that sent the notification must release its rollback lock.
            }
        }, false)) {
            savedRefreshRetryScheduled = true;
            Utils.runOnMainThreadDelayed(() -> {
                savedRefreshRetryScheduled = false;
                scheduleSavedChangeRefresh();
            }, 250);
        }
    }

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
        if (savedInstanceState != null) {
            pendingImport = savedInstanceState.getBundle(PENDING_IMPORT_STATE);
            wordsDraft = savedInstanceState.getString(WORDS_DRAFT_STATE);
            editingAllowedWords = savedInstanceState.getBoolean(WORDS_DRAFT_STATE + "_allowed");
            wordsSelectionStart = savedInstanceState.getInt(WORDS_DRAFT_STATE + "_start");
            wordsSelectionEnd = savedInstanceState.getInt(WORDS_DRAFT_STATE + "_end");
            restoreWordsEditor = wordsDraft != null;
        }
        super.onCreate(savedInstanceState);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup parent, Bundle savedInstanceState) {
        return super.onCreateView(inflater.cloneInContext(themed(inflater.getContext())), parent, savedInstanceState);
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
        if (restoreWordsEditor && getContext() != null) {
            Preference row = findPreference(editingAllowedWords ? ALLOWED_WORDS_ROW : HIDDEN_WORDS_ROW);
            if (row != null) showWords(themed(getContext()), row);
        }
    }

    @Override
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (pendingImport != null) outState.putBundle(PENDING_IMPORT_STATE, pendingImport);
        if (navigation != null) navigation.save(outState);
        rememberWordsDraft();
        if (wordsDraft != null) {
            outState.putString(WORDS_DRAFT_STATE, wordsDraft);
            outState.putBoolean(WORDS_DRAFT_STATE + "_allowed", editingAllowedWords);
            outState.putInt(WORDS_DRAFT_STATE + "_start", wordsSelectionStart);
            outState.putInt(WORDS_DRAFT_STATE + "_end", wordsSelectionEnd);
        }
    }

    @Override
    public void onDestroyView() {
        closeOwnedDialogs();
        ReleaseCheck.unwatch(this);
        if (navigation != null) navigation.close();
        navigation = null;
        super.onDestroyView();
    }

    /** Also called synchronously when the parent window closes, before fragment removal runs. */
    void closeOwnedDialogs() {
        // The preview is drawn over this page's window. It stays unanswered, and the page that
        // replaces this one shows it again.
        SettingsBackupPreference.closePreview(this);
        Preference guide = findPreference(SetupGuidancePreference.KEY);
        if (guide instanceof SetupGuidancePreference) ((SetupGuidancePreference) guide).closeDialog();
        if (manageMutedPosts != null) manageMutedPosts.closeDialogs();
        manageMutedPosts = null;
        rememberWordsDraft();
        // The page's other dialogs are drawn over its window too, and would outlive it.
        for (Dialog dialog : new ArrayList<>(shownDialogs)) dialog.dismiss();
        shownDialogs.clear();
        wordsDialog = null;
        wordsField = null;
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
        if (requestCode == FONT_FILE) {
            onFontFilePicked(resultCode, data);
            return;
        }
        SettingsBackupPreference.onResult(this, requestCode, resultCode, data);
    }

    /** Shows what the switches are saved as, after an import wrote them. */
    void refreshSwitches() {
        updateUIToSettingValues();
        Preference words = findPreference(HIDDEN_WORDS_ROW);
        if (words != null) words.setSummary(wordsSummary(TextSettings.HIDDEN_WORDS.savedValue()));
        Preference allowed = findPreference(ALLOWED_WORDS_ROW);
        if (allowed != null) allowed.setSummary(wordsSummary(TextSettings.ALLOWED_WORDS.savedValue()));
        Preference tabs = findPreference(TAB_ORDER_ROW);
        if (tabs != null) tabs.setSummary(tabOrderSummary(TextSettings.TAB_ORDER.savedValue()));
        String font = TextSettings.APP_FONT_FILE.savedValue();
        Preference fontFile = findPreference(FONT_FILE_ROW);
        if (fontFile != null) fontFile.setSummary(fontFileSummary(font));
        Preference phoneFont = findPreference(PHONE_FONT_ROW);
        if (phoneFont != null) phoneFont.setEnabled(!font.isEmpty());
        onRestartPendingChanged();
    }

    @Override
    protected void initialize() {
        RuntimeException fault = failNextInitialization;
        if (fault != null) {
            failNextInitialization = null;
            throw fault;
        }
        // Loads the switches before the shared fragment syncs them to the screen.
        Settings.HIDE_ADVERTISING_ID.get();

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
        // Tumblr does takes the stop sign.
        if (!Collections.disjoint(build, PatchFamily.FEED_PAGE)) {
            PreferenceCategory feed = category(screen, L10n.t("Feed"));
            patchToggle(feed, context, build, PatchFamily.HIDE_ADS, Settings.HIDE_ADS, L10n.t("Hide ads"),
                    L10n.t("Takes ads and paid Blaze posts out of your dashboard and other feeds. Ad requests stop "
                        + "after Tumblr restarts."), SettingsIcons.BLOCK);
            patchToggle(feed, context, build, PatchFamily.HIDE_AD_FREE_BANNER, Settings.HIDE_AD_FREE_BANNER,
                    L10n.t("Hide the ad-free banner"), L10n.t("Hides the dashboard banner that asks you to pay for "
                        + "Ad-Free Browsing."), SettingsIcons.BLOCK);
            // The card switches act on each page as it loads (TimelineFilter), so they need no restart.
            patchToggle(feed, context, build, PatchFamily.HIDE_SUGGESTED_BLOGS, Settings.HIDE_SUGGESTED_BLOGS,
                    L10n.t("Hide suggested blogs"), L10n.t("Takes the blogs Tumblr suggests you follow, and their "
                        + "headings, out of your dashboard and other feeds."), SettingsIcons.BLOCK);
            patchToggle(feed, context, build, PatchFamily.HIDE_SUGGESTED_COMMUNITIES,
                    Settings.HIDE_SUGGESTED_COMMUNITIES, L10n.t("Hide suggested communities"),
                    L10n.t("Takes the communities Tumblr suggests you join, and their headings, out of your "
                        + "dashboard and other feeds."), SettingsIcons.BLOCK);
            patchToggle(feed, context, build, PatchFamily.HIDE_SUGGESTED_TAGS, Settings.HIDE_SUGGESTED_TAGS,
                    L10n.t("Hide suggested tags"), L10n.t("Takes the tags Tumblr suggests you follow, and their "
                        + "headings, out of your dashboard and other feeds."), SettingsIcons.BLOCK);
            patchToggle(feed, context, build, PatchFamily.HIDE_WATCH_IT_ROWS, Settings.HIDE_WATCH_IT_ROWS,
                    L10n.t("Hide Watch it rows"), L10n.t("Takes Tumblr TV's Watch it rows and video hub cards, and "
                        + "their headings, out of your dashboard and other feeds."), SettingsIcons.BLOCK);
            // The post switches act on each page as it loads too (PostRules). A post's kind counts
            // the part it reblogs, and the word list is read with each page.
            patchToggle(feed, context, build, PatchFamily.HIDE_REBLOGS, Settings.HIDE_REBLOGS, L10n.t("Hide reblogs"),
                    L10n.t("Takes reblogs out of your dashboard and other feeds, and keeps the posts people made "
                        + "themselves."), SettingsIcons.BLOCK);
            patchToggle(feed, context, build, PatchFamily.HIDE_REBLOGS, Settings.KEEP_TAGGED_REBLOGS,
                    L10n.t("Keep tagged reblogs"),
                    L10n.t("When reblogs are hidden, keep ones with tags. Other post filters still apply."),
                    SettingsIcons.BLOCK);
            patchToggle(feed, context, build, PatchFamily.HIDE_REBLOGS, Settings.KEEP_REBLOGS_WITH_CONTENT,
                    L10n.t("Keep reblogs with added content"),
                    L10n.t("When reblogs are hidden, keep ones where the reblogger added something of their own. "
                        + "Other post filters still apply."),
                    SettingsIcons.BLOCK);
            patchToggle(feed, context, build, PatchFamily.MUTE_ROOT_POSTS, Settings.MUTE_ROOT_POSTS,
                    L10n.t("Mute posts locally"),
                    L10n.t("Add posts to a private list from their menu. Originals and their reblogs stay hidden for this account."),
                    SettingsIcons.BLOCK);
            if (build.contains(PatchFamily.MUTE_ROOT_POSTS)) {
                manageMutedPosts = new ManageMuteRow(context);
                feed.addPreference(mark(manageMutedPosts, SettingsIcons.BLOCK));
            }
            patchToggle(feed, context, build, PatchFamily.HIDE_VIDEO_POSTS, Settings.HIDE_VIDEO_POSTS,
                    L10n.t("Hide video posts"), L10n.t("Takes posts with a video anywhere in them, the reblogged part "
                        + "included, out of your dashboard and other feeds."), SettingsIcons.BLOCK);
            patchToggle(feed, context, build, PatchFamily.HIDE_PHOTO_POSTS, Settings.HIDE_PHOTO_POSTS,
                    L10n.t("Hide photo posts"), L10n.t("Takes posts with pictures and no video, the reblogged part "
                        + "included, out of your dashboard and other feeds."), SettingsIcons.BLOCK);
            patchToggle(feed, context, build, PatchFamily.HIDE_TEXT_POSTS, Settings.HIDE_TEXT_POSTS,
                    L10n.t("Hide text posts"), L10n.t("Takes posts with no pictures or video, the reblogged part "
                        + "included, out of your dashboard and other feeds."), SettingsIcons.BLOCK);
            patchToggle(feed, context, build, PatchFamily.HIDE_POSTS_WITH_WORDS, Settings.HIDE_POSTS_WITH_WORDS,
                    L10n.t("Hide posts with these words"), L10n.t("Takes posts out of your feeds when a hidden word "
                        + "matches one of the selected fields below."), SettingsIcons.BLOCK);
            if (build.contains(PatchFamily.HIDE_POSTS_WITH_WORDS)) feed.addPreference(mark(wordsRow(context), SettingsIcons.SEARCH));
            if (build.contains(PatchFamily.HIDE_POSTS_WITH_WORDS)) {
                feed.addPreference(mark(allowedWordsRow(context), SettingsIcons.SEARCH));
                String scopeSummary = L10n.t("Hidden and allowed words use the same selected fields. Other post filters still apply.");
                patchToggle(feed, context, build, PatchFamily.HIDE_POSTS_WITH_WORDS, Settings.WORDS_CURRENT_TEXT,
                        L10n.t("Match current post text"), scopeSummary, SettingsIcons.SEARCH);
                patchToggle(feed, context, build, PatchFamily.HIDE_POSTS_WITH_WORDS, Settings.WORDS_REBLOG_TRAIL,
                        L10n.t("Match reblog trail text"), scopeSummary, SettingsIcons.SEARCH);
                patchToggle(feed, context, build, PatchFamily.HIDE_POSTS_WITH_WORDS, Settings.WORDS_TAGS,
                        L10n.t("Match current post tags"), scopeSummary, SettingsIcons.SEARCH);
                patchToggle(feed, context, build, PatchFamily.HIDE_POSTS_WITH_WORDS, Settings.WORDS_SUMMARY,
                        L10n.t("Match post summaries"), scopeSummary, SettingsIcons.SEARCH);
            }
            patchToggle(feed, context, build, PatchFamily.HIDE_FILTERED_POSTS, Settings.HIDE_FILTERED_POSTS,
                    L10n.t("Hide filtered posts"), L10n.t("Takes the posts Tumblr covers for your filtered tags "
                        + "and words out of your feeds."), SettingsIcons.BLOCK);
        }

        // Parts of each post card. Tags, the Follow button and the counts are read as each card is drawn,
        // so they need no restart. The footer's buttons keep their first answer until Tumblr restarts
        // (PostFooter), since Compose expects a footer to draw the same buttons each time.
        if (!Collections.disjoint(build, PatchFamily.POSTS_PAGE)) {
            PreferenceCategory posts = category(screen, L10n.t("Posts"));
            patchToggle(posts, context, build, PatchFamily.SHOW_MUTUAL_MARKERS, Settings.SHOW_MUTUAL_MARKERS,
                    L10n.t("Show mutual markers"),
                    L10n.t("Marks blogs that follow your primary blog when you follow them."), SettingsIcons.ABOUT);
            patchToggle(posts, context, build, PatchFamily.SHOW_POST_TIMESTAMPS, Settings.SHOW_POST_TIMESTAMPS,
                    L10n.t("Show post timestamps"),
                    L10n.t("Shows Tumblr's own timestamps on newly drawn post cards."), SettingsIcons.ABOUT);
            patchToggle(posts, context, build, PatchFamily.VISIBLE_ALT_TEXT, Settings.SHOW_IMAGE_DESCRIPTIONS,
                    L10n.t("Visible image descriptions"),
                    L10n.t("Shows author-provided image descriptions below images."), SettingsIcons.ABOUT);
            patchToggle(posts, context, build, PatchFamily.REVEAL_ALLOWED_MATURE_CONTENT,
                    Settings.REVEAL_ALLOWED_MATURE_CONTENT, L10n.t("Reveal allowed mature content"),
                    L10n.t("Removes the tap-to-reveal blur only when Tumblr confirms this account may view the content."),
                    SettingsIcons.ABOUT);
            patchToggle(posts, context, build, PatchFamily.HIDE_HASHTAGS, Settings.HIDE_HASHTAGS,
                    L10n.t("Hide hashtags"), L10n.t("Takes the tags off the bottom of posts in your dashboard "
                        + "and other feeds, and keeps the source link."), SettingsIcons.BLOCK);
            patchToggle(posts, context, build, PatchFamily.HIDE_FOLLOW_BUTTON, Settings.HIDE_FOLLOW_BUTTON,
                    L10n.t("Hide the Follow button"), L10n.t("Takes the Follow button out of the header of "
                        + "posts from blogs you don't follow yet."), SettingsIcons.BLOCK);
            patchToggle(posts, context, build, PatchFamily.HIDE_NOTE_COUNTS, Settings.HIDE_NOTE_COUNTS,
                    L10n.t("Hide note counts"), L10n.t("Takes the like, reblog and comment counts off the footer "
                        + "under posts and off a post's notes, and keeps the buttons."), SettingsIcons.BLOCK);
            patchToggle(posts, context, build, PatchFamily.HIDE_LIKE_BUTTON, Settings.HIDE_LIKE_BUTTON,
                    L10n.t("Hide the like button"), L10n.t("Takes the like button out of the footer under posts, "
                        + "and the reactions off community posts."),
                    SettingsIcons.BLOCK);
            patchToggle(posts, context, build, PatchFamily.HIDE_REBLOG_BUTTON, Settings.HIDE_REBLOG_BUTTON,
                    L10n.t("Hide the reblog button"), L10n.t("Takes the reblog button out of the footer under "
                        + "posts."), SettingsIcons.BLOCK);
            patchToggle(posts, context, build, PatchFamily.HIDE_COMMENT_BUTTON, Settings.HIDE_COMMENT_BUTTON,
                    L10n.t("Hide the comment button"), L10n.t("Takes the comment button out of the footer under "
                        + "posts."), SettingsIcons.BLOCK);
            patchToggle(posts, context, build, PatchFamily.HIDE_SHARE_BUTTON, Settings.HIDE_SHARE_BUTTON,
                    L10n.t("Hide the share button"), L10n.t("Takes the share button out of the footer under "
                        + "posts."), SettingsIcons.BLOCK);
            patchToggle(posts, context, build, PatchFamily.HIDE_SAVE_BUTTON, Settings.HIDE_SAVE_BUTTON,
                    L10n.t("Hide the Save button"), L10n.t("Takes the Save button out of the footer under posts, "
                        + "when Tumblr shows one."), SettingsIcons.BLOCK);
        }

        // Tabs, buttons, prompts and pop-ups. A switch that answers one of Tumblr's own feature flags is
        // read once a run, so its change gets the page's shared restart line and toast (rebootApp in
        // Settings) instead of a sentence of its own. Skip review prompts is read each time the prompt
        // would open, so it needs none.
        if (!Collections.disjoint(build, PatchFamily.INTERFACE_PAGE)) {
            PreferenceCategory ui = category(screen, L10n.t("Interface"));
            patchToggle(ui, context, build, PatchFamily.HIDE_TUMBLR_TV, Settings.HIDE_TUMBLR_TV, L10n.t("Hide Tumblr TV"),
                    L10n.t("Takes the Tumblr TV tab out of the bottom bar, and keeps sign-up from sending you there."),
                    SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_COMMUNITIES_TAB, Settings.HIDE_COMMUNITIES_TAB,
                    L10n.t("Hide the Communities tab"), L10n.t("Takes the Communities tab out of the bottom bar and "
                        + "stops Communities tips in the post editor."), SettingsIcons.BLOCK);
            // The bar is built once a run (BottomBarTabs), so these show after a restart.
            patchToggle(ui, context, build, PatchFamily.HIDE_EXPLORE_TAB, Settings.HIDE_EXPLORE_TAB,
                    L10n.t("Hide the Explore tab"), L10n.t("Takes the Explore and search button off the bottom bar."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_NOTIFICATIONS_TAB, Settings.HIDE_NOTIFICATIONS_TAB,
                    L10n.t("Hide the Notifications tab"), L10n.t("Takes the Notifications button off the bottom bar."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.REORDER_TABS, Settings.REORDER_TABS,
                    L10n.t("Reorder the bottom bar"), L10n.t("Puts the bottom bar's tabs in the order set below."), SettingsIcons.INTERFACE);
            if (build.contains(PatchFamily.REORDER_TABS)) ui.addPreference(mark(tabOrderRow(context), SettingsIcons.INTERFACE));
            // One patch, a switch per tab's badge. Read each time Tumblr's unread counts come in
            // (BottomBar), so they need no restart.
            patchToggle(ui, context, build, PatchFamily.HIDE_UNREAD_DOTS, Settings.HIDE_DASHBOARD_COUNT,
                    L10n.t("Hide the Dashboard count"), L10n.t("Hides the unread count on the bottom bar's Dashboard "
                        + "tab. One already showing goes when Tumblr next updates its counts."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_UNREAD_DOTS, Settings.HIDE_COMMUNITIES_COUNT,
                    L10n.t("Hide the Communities count"), L10n.t("Hides the unread count on the bottom bar's "
                        + "Communities tab. One already showing goes when Tumblr next updates its counts."),
                    SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_UNREAD_DOTS, Settings.HIDE_NOTIFICATIONS_COUNT,
                    L10n.t("Hide the Notifications count"), L10n.t("Hides the unread count on the bottom bar's "
                        + "Notifications tab. One already showing goes when Tumblr next updates its counts."),
                    SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_BLAZE_PROMPTS, Settings.HIDE_BLAZE_PROMPTS,
                    L10n.t("Hide Blaze prompts"), L10n.t("Hides the Blaze buttons, banners and the nudge to promote "
                        + "a post after you share it. The Blaze item in a post's menu stays."),
                    SettingsIcons.BLOCK);
            // Not flag-backed, but the TumblrMart button is only placed when its screen is made.
            patchToggle(ui, context, build, PatchFamily.HIDE_TUMBLRMART, Settings.HIDE_TUMBLRMART,
                    L10n.t("Hide the diamond and TumblrMart"), L10n.t("Hides the Premium diamond on your dashboard, "
                        + "Explore and notifications when you return to them. Open screens keep their TumblrMart button until Tumblr restarts."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.TURN_OFF_SCREENSHOT_SHARING,
                    Settings.TURN_OFF_SCREENSHOT_SHARING, L10n.t("Turn off screenshot sharing"),
                    L10n.t("Stops Tumblr watching for screenshots and offering to save the post as an image."),
                    SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.SKIP_REVIEW_PROMPTS, Settings.SKIP_REVIEW_PROMPTS,
                    L10n.t("Skip review prompts"), L10n.t("Stops the pop-up that asks what you think of the Tumblr "
                        + "app and then asks for a rating or feedback."), SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.HIDE_BLOG_NOTIFICATION_REMINDERS,
                    Settings.HIDE_BLOG_NOTIFICATION_REMINDERS, L10n.t("Hide blog notification reminders"),
                    L10n.t("Hides the pop-up suggesting you turn on notifications for a blog. Your subscriptions and notification settings stay as they are."),
                    SettingsIcons.BELL);
            patchToggle(ui, context, build, PatchFamily.HIDE_GIFT_MESSAGE_POPUPS,
                    Settings.HIDE_GIFT_MESSAGE_POPUPS, L10n.t("Hide gift purchase popups"),
                    L10n.t("Hides the pop-up suggesting you buy a gift for a blog. You can still open gifting yourself."),
                    SettingsIcons.BLOCK);
            patchToggle(ui, context, build, PatchFamily.LINE_BETWEEN_POSTS,
                    Settings.LINE_BETWEEN_POSTS, L10n.t("Line between posts"),
                    L10n.t("Draws a thin line in the gap between posts, so it's easier to see where one ends and the next begins."),
                    SettingsIcons.INTERFACE);
            patchToggle(ui, context, build, PatchFamily.APP_FONT, Settings.APP_FONT, L10n.t("App font"),
                    L10n.t("Replaces Tumblr's own font with your phone's font, or a font file you choose below. Fonts a post's author picked stay as they are."),
                    SettingsIcons.INTERFACE);
            if (build.contains(PatchFamily.APP_FONT)) {
                ui.addPreference(mark(fontFileRow(context), SettingsIcons.INTERFACE));
                ui.addPreference(mark(phoneFontRow(context), SettingsIcons.INTERFACE));
            }
            // Read when a screen's theme is made (DarkBackground), so screens already open keep their colors.
            patchToggle(ui, context, build, PatchFamily.DARK_BACKGROUND, Settings.DARK_BACKGROUND,
                    L10n.t("Dark background color"), L10n.t("Makes newly opened Dark Mode screens black, or the dark "
                        + "color picked when patching. Open screens keep their colors until Tumblr restarts."), SettingsIcons.INTERFACE);
            patchToggle(ui, context, build, PatchFamily.DARK_BACKGROUND, Settings.DARK_BACKGROUND_WALLPAPER,
                    L10n.t("Match my wallpaper"), L10n.t("Takes the dark background from your wallpaper's colors in place of "
                        + "the one picked when patching. Needs Android 12 or newer and Dark background color on. "
                        + "A new wallpaper shows after Tumblr restarts."), SettingsIcons.INTERFACE);
        }

        if (!Collections.disjoint(build, PatchFamily.PRIVACY_PAGE)) {
            PreferenceCategory privacy = category(screen, L10n.t("Privacy"));
            // The switch covers Tumblr's own tracking flags, so a change gets the shared restart line.
            // The manifest half was set when patching, and the summary says so.
            patchToggle(privacy, context, build, PatchFamily.DISABLE_ANALYTICS, Settings.DISABLE_ANALYTICS,
                    L10n.t("Disable analytics"), L10n.t("Stops Tumblr's own tracking and ad measurement. Firebase "
                        + "and Google's analytics collection stay off until you patch again without it."),
                    SettingsIcons.BLOCK);
            patchToggle(privacy, context, build, PatchFamily.HIDE_ADVERTISING_ID, Settings.HIDE_ADVERTISING_ID,
                    L10n.t("Hide advertising ID"), L10n.t("Tumblr and the ad companies inside it see an empty "
                        + "advertising ID with ad tracking limited, as if you deleted your ad ID in Android "
                        + "settings."), SettingsIcons.BLOCK);
            if (build.contains(PatchFamily.REMOVE_AD_TRACKING_PERMISSIONS)) {
                privacy.addPreference(info(context, L10n.t("Remove ad tracking permissions"),
                        L10n.t("Tumblr can no longer use Google's ad ID permission or Android's ad services. "
                            + "This was set when you patched. Patch again without it to bring them back.")));
            }
            if (build.contains(PatchFamily.SPOOF_SIGNATURE)) {
                privacy.addPreference(info(context, L10n.t("Spoof signature for Google sign-in"),
                        L10n.t("Tells Android this is the original Tumblr, so Google sign-in can work with "
                            + "microG-RE or the XSpoofSignatures module. Stock Google Play services ignores it. "
                            + "This was set when you patched. Patch again without it to take it out.")));
            }
        }

        // In every build: a patched Tumblr isn't verified for its own links, so Android opens them
        // here only for the addresses selected on the app's Open by default page.
        PreferenceCategory links = category(screen, L10n.t("Links"));
        links.addPreference(mark(supportedLinksRow(context), SettingsIcons.LINKS));
        // An explanation, not a control: the info mark says so, as it does for Version on About.
        links.addPreference(mark(info(context, L10n.t("Selecting links by hand"),
                L10n.t("Android sends tumblr.com links to a patched Tumblr only after you select those addresses "
                    + "for it. Selecting them sends their links here. Your other link settings stay as they are.")),
                SettingsIcons.ABOUT));

        // Only with the patch: Firebase can refuse a patched Tumblr's sign-up for push notifications
        // unless it names Tumblr's own certificate (PushNotifications).
        if (build.contains(PatchFamily.FIX_PUSH_NOTIFICATIONS)
                || build.contains(PatchFamily.FILTER_ACTIVITY_NOTIFICATIONS)) {
            PreferenceCategory notifications = category(screen, L10n.t("Notifications"));
            String activitySummary = L10n.t("Hides these from newly loaded activity pages. Push notifications keep Tumblr's settings.");
            patchToggle(notifications, context, build, PatchFamily.FILTER_ACTIVITY_NOTIFICATIONS,
                    Settings.HIDE_NOTIFICATION_LIKES, L10n.t("Hide likes"), activitySummary, SettingsIcons.BELL);
            patchToggle(notifications, context, build, PatchFamily.FILTER_ACTIVITY_NOTIFICATIONS,
                    Settings.HIDE_NOTIFICATION_REBLOGS, L10n.t("Hide reblog notifications"), activitySummary, SettingsIcons.BELL);
            patchToggle(notifications, context, build, PatchFamily.FILTER_ACTIVITY_NOTIFICATIONS,
                    Settings.HIDE_NOTIFICATION_REPLIES, L10n.t("Hide reply notifications"), activitySummary, SettingsIcons.BELL);
            patchToggle(notifications, context, build, PatchFamily.FILTER_ACTIVITY_NOTIFICATIONS,
                    Settings.HIDE_NOTIFICATION_FOLLOWS, L10n.t("Hide follow notifications"), activitySummary, SettingsIcons.BELL);
            patchToggle(notifications, context, build, PatchFamily.FILTER_ACTIVITY_NOTIFICATIONS,
                    Settings.HIDE_NOTIFICATION_MENTIONS, L10n.t("Hide mention notifications"), activitySummary, SettingsIcons.BELL);
            patchToggle(notifications, context, build, PatchFamily.FILTER_ACTIVITY_NOTIFICATIONS,
                    Settings.HIDE_NOTIFICATION_ASKS, L10n.t("Hide ask notifications"), activitySummary, SettingsIcons.BELL);
            patchToggle(notifications, context, build, PatchFamily.FILTER_ACTIVITY_NOTIFICATIONS,
                    Settings.HIDE_NOTIFICATION_BOOPS, L10n.t("Hide boop notifications"), activitySummary, SettingsIcons.BELL);
            patchToggle(notifications, context, build, PatchFamily.FIX_PUSH_NOTIFICATIONS, Settings.FIX_PUSH_NOTIFICATIONS,
                    L10n.t("Fix push notifications"),
                    L10n.t("Lets a patched Tumblr sign up for push notifications when Google would turn it away."), SettingsIcons.BELL);
        }

        // In every build: where Tumblr keeps its own controls for what no switch here covers. The
        // rows name each path in Tumblr's own words where the build has them (NativeControls).
        PreferenceCategory tumblr = category(screen, L10n.t("Tumblr's own settings"));
        tumblr.addPreference(mark(info(context, L10n.t("Finding them"),
                L10n.t("Open Tumblr's settings from the gear on your account tab. HushTumblr doesn't change any of "
                    + "these.")), SettingsIcons.ABOUT));
        for (NativeControls.Control control : NativeControls.controls()) {
            tumblr.addPreference(mark(info(context, control.title, NativeControls.summary(context, control)),
                    SettingsIcons.SETTINGS));
        }

        // In every build: the release check is the settings entry's own, not a patch's. Its switch
        // is one Pause turns off, so it sits above the Pause row with the rest.
        PreferenceCategory updates = category(screen, L10n.t("Updates"));
        // Only with the patch, and first: Tumblr's own update check, which answers one of Tumblr's
        // feature flags, so a change gets the shared restart line.
        patchToggle(updates, context, build, PatchFamily.DISABLE_UPDATE_PROMPTS, Settings.DISABLE_UPDATE_PROMPTS,
                L10n.t("Disable update prompts"), L10n.t("Stops Tumblr asking Google Play for a newer Tumblr and "
                    + "showing Play's update prompt."), SettingsIcons.BLOCK);
        updates.addPreference(mark(toggle(context, Settings.CHECK_FOR_RELEASES, L10n.t("Check for new HushTumblr releases"),
                L10n.t("Once a day, when Tumblr starts, checks GitHub for a newer HushTumblr and tells you at "
                    + "the top of these settings. Nothing is downloaded.")), SettingsIcons.BELL));
        updates.addPreference(mark(checkNowRow(context), SettingsIcons.UPDATES));
        updates.addPreference(mark(releaseLink(context, RELEASE_NOTES, L10n.t("Release notes"),
                L10n.t("Read HushTumblr releases on GitHub. Nothing is downloaded here."), RELEASE_NOTES_URL), SettingsIcons.OPENING));
        updates.addPreference(mark(releaseLink(context, UPDATE_INSTRUCTIONS, L10n.t("Update instructions"),
                L10n.t("Open the installation steps on GitHub."), UPDATE_INSTRUCTIONS_URL), SettingsIcons.OPENING));
        ReleaseCheck.watch(this);

        // Named for its rows: the screen's own title already says HushTumblr.
        PreferenceCategory hushtumblr = category(screen, L10n.t("Pause, backup and diagnostics"));
        hushtumblr.addPreference(mark(toggle(context, BaseSettings.PAUSED, L10n.t("Pause HushTumblr"),
                L10n.t("Turns off every HushTumblr switch except Debug logging the next time Tumblr starts. "
                    + "What you chose when you patched stays, and your choices are saved.")), SettingsIcons.PATCHED));
        String stays = PatchFamily.staysWhilePausedSummary(build);
        // Morphe Manager can export the patch choices and the signing key, not these switches.
        hushtumblr.addPreference(mark(new BackupRow(this, context, SettingsBackupPreference.EXPORT,
                L10n.t("Export settings"),
                L10n.t("Save your settings to a file, including word lists and tab order. These choices apply to all "
                        + "accounts in this Tumblr app. Pause, Debug logging and release checks aren't included.")), SettingsIcons.EXPORT));
        hushtumblr.addPreference(mark(new BackupRow(this, context, SettingsBackupPreference.IMPORT,
                L10n.t("Import settings"),
                L10n.t("Choose a settings file. Review each setting's name and old and new values before importing. "
                        + "Your choices apply to all accounts in this Tumblr app.")), SettingsIcons.DOWNLOADS));
        hushtumblr.addPreference(mark(new BackupRow(this, context, SettingsBackupPreference.UNDO,
                L10n.t("Undo import"),
                L10n.t("There's no import to undo.")), SettingsIcons.UPDATES));
        hushtumblr.addPreference(mark(restoreQuickSetupsRow(context), SettingsIcons.TOOLS));
        // Debug logging also fills the exported report and turns on error toasts (Logger).
        hushtumblr.addPreference(mark(toggle(context, BaseSettings.DEBUG, L10n.t("Debug logging"),
                L10n.t("Record patch activity and show errors for a bug report. Leave off during normal use.")), SettingsIcons.BUG));
        // Both rows come without a title of their own: Hushfeed's gave them one from string
        // resources that Tumblr's APK doesn't have, and untitled they showed as blank rows.
        ExportDiagnosticReportPreference export = new ExportRow(context);
        export.setTitle(L10n.t("Export diagnostic report"));
        export.setSummary(export.destinationSummary());
        hushtumblr.addPreference(mark(export, SettingsIcons.LICENSE));
        ClearLogBufferPreference clear = new ClearRow(context);
        clear.setTitle(L10n.t("Clear diagnostic data"));
        clear.setClearAndUndoSummaries(L10n.t("Clears the saved log and patch check results that a report would "
            + "include."),
                L10n.t("Diagnostic data cleared. Tap again to put it back."));
        hushtumblr.addPreference(mark(clear, SettingsIcons.DELETE));
        // Keep the detailed patch-time exception list after the controls people come here for.
        if (stays != null) hushtumblr.addPreference(mark(info(context, L10n.t(STAYS_WHILE_PAUSED), stays), SettingsIcons.ABOUT));

        PreferenceCategory about = category(screen, L10n.t("About"));
        about.addPreference(mark(info(context, L10n.t("Version"), L10n.f("HushTumblr %1$s on Tumblr %2$s",
                L10n.isolate(Utils.getPatchesReleaseVersion()), L10n.isolate(Utils.getAppVersionName()))), SettingsIcons.ABOUT));
        // Switches live in one application-wide store, while Tumblr can hold several accounts.
        about.addPreference(mark(info(context, L10n.t("Accounts"), L10n.t("Every switch here applies to all the "
                + "accounts in this Tumblr app, not only the one you have open.")), SettingsIcons.ABOUT));

        about.addPreference(mark(new SetupGuidancePreference(context), SettingsIcons.ABOUT));

        Preference source = new Row(context);
        source.setTitle(L10n.t("Source code and issues"));
        source.setSummary(SOURCE_ADDRESS);
        source.setPersistent(false);
        source.setOnPreferenceClickListener(p -> {
            try {
                startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(SOURCE_URL)));
            } catch (ActivityNotFoundException | SecurityException missing) {
                // No browser, or none switched on. Uncaught, Android's exception closed Tumblr.
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

    /** Hides the Quick setups row on the home page, or shows it again. The home page follows the next time it's drawn. */
    private static Preference restoreQuickSetupsRow(Context context) {
        Row row = new Row(context);
        row.setKey(SettingsNavigation.RESTORE_QUICK_SETUPS);
        row.setTitle(L10n.t("Quick setups on the home page"));
        row.setSummary(restoreQuickSetupsSummary());
        row.setPersistent(false);
        row.actsAtOnce = true;
        row.setOnPreferenceClickListener(p -> {
            SettingsNavigation.HIDE_QUICK_SETUPS.save(!SettingsNavigation.HIDE_QUICK_SETUPS.get());
            p.setSummary(restoreQuickSetupsSummary());
            return true;
        });
        return row;
    }

    static String restoreQuickSetupsSummary() {
        return SettingsNavigation.HIDE_QUICK_SETUPS.get() ? L10n.t("Hidden. Tap to show it again.") : L10n.t("Shown. Tap to hide it.");
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
     * window that's gone. Answers the dialog, or null when none showed.
     */
    @Nullable
    private AlertDialog show(AlertDialog.Builder builder) {
        Activity activity = getActivity();
        if (getView() == null || activity == null || activity.isFinishing() || activity.isDestroyed()) return null;
        AlertDialog dialog = builder.show();
        ScreenColors.dialog(dialog);
        shownDialogs.add(dialog);
        dialog.setOnDismissListener(shownDialogs::remove);
        return dialog;
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
     * The first row: whether HushTumblr is on, and why not when it isn't. Paused by safe mode or
     * the marker file, a tap turns it back on from the next start.
     */
    private Preference statusCard(Context context) {
        Row card = new Row(context);
        card.setPersistent(false);
        boolean paused = HushTumblrPause.isPaused();
        ScreenColors palette = ScreenColors.DEFAULT;
        card.setIcon(SettingsIcons.icon(context, paused ? SettingsIcons.PAUSE : SettingsIcons.PATCHED,
                paused ? palette.summary : palette.heading));
        statusCard = card;
        if (!paused) {
            card.setTitle(L10n.t("HushTumblr is on"));
            card.setSelectable(false);
            showStatus(card, context);
            return card;
        }
        card.setTitle(L10n.t("HushTumblr is paused"));
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
        Preference card = statusCard;
        if (context == null || card == null || hasPendingEdits() || !ownsStatusCard(card)) return;
        card.setEnabled(false);
        card.setSummary(L10n.t("Saving changes"));
        java.util.concurrent.atomic.AtomicReference<HushTumblrPause.Reason> outcome =
                new java.util.concurrent.atomic.AtomicReference<>(HushTumblrPause.Reason.SWITCH);
        if (!submitEdit(() -> {
            try {
                outcome.set(HushTumblrPause.turnBackOn(context));
            } catch (RuntimeException failure) {
                Logger.printInfo(() -> "HushTumblr resume failed", failure);
            }
        }, () -> {
            // The worker has refreshed a replacement page before this owned result runs.
            if (!ownsStatusCard(card)) return;
            card.setEnabled(true);
            // Show the value actually kept, including a failed write or rollback.
            Preference pause = findPreference(BaseSettings.PAUSED.key);
            if (pause instanceof SwitchPreference) {
                ((SwitchPreference) pause).setChecked(BaseSettings.PAUSED.savedValue());
            }
            if (outcome.get() == HushTumblrPause.Reason.MARKER_FILE) {
                String file = L10n.isolate(HushTumblrPause.MARKER_FILE_NAME);
                String folder = L10n.isolate(markerFolder(context.getPackageName()));
                String left = BaseSettings.PAUSED.savedValue() || BaseSettings.SAFE_MODE.savedValue()
                        ? L10n.f("The file %1$s couldn't be removed. Delete it from %2$s, then tap Resume again.", file, folder)
                        : L10n.f("The file %1$s couldn't be removed. Delete it from %2$s to turn HushTumblr back on.",
                        file, folder);
                card.setSummary(left);
                Utils.showToastLong(left);
                return;
            }
            if (outcome.get() != HushTumblrPause.Reason.NONE) {
                Utils.showToastLong(L10n.t("Couldn't turn HushTumblr back on. Try again."));
            }
            showStatus(card, context);
        })) {
            card.setEnabled(true);
            showStatus(card, context);
            Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
        }
    }

    private boolean ownsStatusCard(Preference card) {
        if (!isAdded() || getView() == null || statusCard != card) return false;
        if (!(getParentFragment() instanceof SettingsDialog)) return true;
        Dialog dialog = ((SettingsDialog) getParentFragment()).getDialog();
        return dialog != null && dialog.isShowing();
    }

    /**
     * The card's line under its title: this start's state, and the next start's when a change on
     * this screen makes it differ. Pause switched on said "HushTumblr is on" and nothing more,
     * and Pause switched back on after a tap on the card still said it turns back on at restart.
     * A newer release the release check found goes on a line of its own under that, paused or
     * not: a newer release can be the fix for what a pause is working around.
     */
    private void showStatus(Preference card, Context context) {
        boolean pausedNext = HushTumblrPause.pausesNextStart(context);
        String status;
        if (!HushTumblrPause.isPaused()) {
            // The version lives on the About page. Here it pushed the line that matters below it.
            status = pausedNext ? L10n.t("HushTumblr pauses when Tumblr restarts.") : L10n.t("Your switches "
                + "are working.");
        } else if (pausedNext) {
            status = pausedSummary(HushTumblrPause.reason(), context.getPackageName())
                    + " " + L10n.t("Tap to turn it back on.");
        } else {
            status = L10n.t("HushTumblr turns back on when Tumblr restarts.");
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
     * The list Hide posts with these words looks for. A tap opens it in a box, one entry a line, and
     * Save keeps it for the next page that loads.
     */
    private Preference wordsRow(Context context) {
        Row row = new Row(context);
        row.setKey(HIDDEN_WORDS_ROW);
        row.setTitle(L10n.t("Words to hide"));
        row.setPersistent(false);
        row.setSummary(wordsSummary(TextSettings.HIDDEN_WORDS.savedValue()));
        row.setOnPreferenceClickListener(p -> {
            showWords(context, p);
            return true;
        });
        return row;
    }

    private Preference allowedWordsRow(Context context) {
        Row row = new Row(context);
        row.setKey(ALLOWED_WORDS_ROW);
        row.setTitle(L10n.t("Allowed words"));
        row.setPersistent(false);
        row.setSummary(wordsSummary(TextSettings.ALLOWED_WORDS.savedValue()));
        row.setOnPreferenceClickListener(p -> {
            showWords(context, p);
            return true;
        });
        return row;
    }

    private void showWords(Context context, Preference row) {
        if (wordsDialog != null && wordsDialog.isShowing()) return;
        editingAllowedWords = ALLOWED_WORDS_ROW.equals(row.getKey());
        StringSetting setting = editingAllowedWords ? TextSettings.ALLOWED_WORDS : TextSettings.HIDDEN_WORDS;
        EditText field = new EditText(context);
        field.setId(android.R.id.edit);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        field.setImeOptions(EditorInfo.IME_FLAG_NO_FULLSCREEN | EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        int editorHeight = context.getResources().getDisplayMetrics().heightPixels / 4;
        field.setMinHeight(Math.min(editorHeight,
                Math.round(96 * context.getResources().getDisplayMetrics().density)));
        field.setMaxHeight(editorHeight);
        field.setVerticalScrollBarEnabled(true);
        field.setOnTouchListener((view, event) -> {
            int action = event.getActionMasked();
            boolean finished = action == android.view.MotionEvent.ACTION_UP
                    || action == android.view.MotionEvent.ACTION_CANCEL;
            // The draft scrolls under a finger before the surrounding help and error text does.
            view.getParent().requestDisallowInterceptTouchEvent(!finished
                    && (view.canScrollVertically(-1) || view.canScrollVertically(1)));
            return false;
        });
        field.setHint(L10n.t("One word or phrase a line"));
        field.setText(wordsDraft == null ? setting.savedValue() : wordsDraft);
        if (wordsDraft != null) field.setSelection(Math.min(wordsSelectionStart, field.length()),
                Math.min(wordsSelectionEnd, field.length()));
        LinearLayout editor = new LinearLayout(context);
        editor.setOrientation(LinearLayout.VERTICAL);
        int inset = Math.round(24 * context.getResources().getDisplayMetrics().density);
        editor.setPaddingRelative(inset, 0, inset, 0);
        TextView explanation = new TextView(context);
        explanation.setText(editingAllowedWords
                ? L10n.t("Allowed words keep a post when the word filter would hide it. Other filters still apply.")
                : L10n.t("Match whole words or phrases in the fields you chose. Case doesn't matter."));
        explanation.setTextSize(14);
        explanation.setTextColor(ScreenColors.DEFAULT.summary);
        explanation.setPaddingRelative(0, 0, 0, Math.round(12 * context.getResources().getDisplayMetrics().density));
        editor.addView(explanation);
        TextView label = new TextView(context);
        label.setText(L10n.t("One word or phrase a line"));
        label.setTextSize(13);
        label.setTextColor(ScreenColors.DEFAULT.heading);
        label.setLabelFor(android.R.id.edit);
        label.setPaddingRelative(0, 0, 0, Math.round(6 * context.getResources().getDisplayMetrics().density));
        editor.addView(label);
        editor.addView(field, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        TextView feedback = new TextView(context);
        feedback.setText(L10n.t("Changes are saved only when you tap Save."));
        feedback.setTextSize(14);
        feedback.setTextColor(ScreenColors.DEFAULT.summary);
        feedback.setPaddingRelative(0, Math.round(8 * context.getResources().getDisplayMetrics().density), 0, 0);
        feedback.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        editor.addView(feedback);
        ScreenColors.startSide(label);
        ScreenColors.startSide(field);
        ScreenColors.startSide(feedback);
        field.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence text, int start, int before, int count) {
                if (field.getError() != null) {
                    field.setError(null);
                    feedback.setText(L10n.t("Changes are saved only when you tap Save."));
                }
            }
            @Override public void afterTextChanged(android.text.Editable text) { }
        });
        android.widget.ScrollView body = new android.widget.ScrollView(context);
        body.addView(editor, new android.widget.ScrollView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        AlertDialog dialog = show(new AlertDialog.Builder(context)
                .setTitle(row.getTitle())
                .setView(body)
                .setPositiveButton(L10n.t("Save"), null)
                .setNegativeButton(L10n.t("Cancel"), null));
        if (dialog == null) return;
        // With no mode of its own the dialog pans for the keyboard: it slid up to the cursor and
        // left Save and Cancel under the Samsung keyboard at twice the text size. Resized, the
        // body scrolls and the buttons stay above the keyboard.
        android.view.Window window = dialog.getWindow();
        if (window != null) window.setSoftInputMode(android.view.WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        wordsDialog = dialog;
        wordsField = field;
        restoreWordsEditor = false;
        dialog.setOnDismissListener(ignored -> {
            shownDialogs.remove(dialog);
            if (wordsDialog == dialog) {
                wordsDialog = null;
                wordsField = null;
            }
        });
        dialog.setOnCancelListener(ignored -> {
            if (wordsDialog == dialog) clearWordsDraft();
        });
        dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setOnClickListener(ignored -> {
            if (wordsDialog != dialog || !isAdded()) return;
            clearWordsDraft();
            dialog.dismiss();
        });
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(ignored -> {
            if (wordsDialog != dialog || !dialog.isShowing() || !isAdded() || !field.isEnabled()) return;
            String words = field.getText().toString().trim();
            rememberWordsDraft();
            field.setEnabled(false);
            setEditorBusy(dialog, true);
            feedback.setText(L10n.t("Saving changes"));
            if (!submitEdit(() -> {
                String error = null;
                try {
                    if (!SettingsBackup.saveText(setting, words)) {
                        error = L10n.t("Couldn't save the words. Your earlier list is unchanged. Try again.");
                    }
                } catch (SettingsBackup.Rejected refused) {
                    error = refused.reason == SettingsBackup.Reason.SIZE
                            ? L10n.t("This list is too large for a settings backup. Shorten it before saving. Your draft is still here.")
                            : L10n.t("Couldn't save the words. Your earlier list is unchanged. Try again.");
                } catch (RuntimeException unavailable) {
                    Logger.printInfo(() -> "Word list save failed", unavailable);
                    error = L10n.t("Couldn't save the words. Your earlier list is unchanged. Try again.");
                }
                String outcome = error;
                Utils.runOnMainThreadNowOrLater(() -> {
                    SettingsBackupPreference.refreshCurrentPage();
                    if (wordsDialog != dialog || !dialog.isShowing() || !isAdded()) return;
                    field.setEnabled(true);
                    setEditorBusy(dialog, false);
                    if (outcome != null) {
                        field.setError(outcome);
                        feedback.setText(outcome);
                        Utils.showToastLong(outcome);
                        return;
                    }
                    row.setSummary(wordsSummary(setting.savedValue()));
                    clearWordsDraft();
                    dialog.dismiss();
                    Utils.showToastShort(L10n.t("Words saved"));
                });
            })) {
                field.setEnabled(true);
                setEditorBusy(dialog, false);
                String error = L10n.t("Couldn't start that. Try again in a moment.");
                field.setError(error);
                feedback.setText(error);
                Utils.showToastLong(error);
            }
        });
    }

    private static void setEditorBusy(AlertDialog dialog, boolean busy) {
        dialog.setCancelable(!busy);
        dialog.setCanceledOnTouchOutside(!busy);
        for (int button : new int[]{AlertDialog.BUTTON_POSITIVE, AlertDialog.BUTTON_NEGATIVE,
                AlertDialog.BUTTON_NEUTRAL}) {
            Button action = dialog.getButton(button);
            if (action != null) action.setEnabled(!busy);
        }
    }

    private void rememberWordsDraft() {
        if (wordsField == null || wordsDialog == null || !wordsDialog.isShowing()) return;
        wordsDraft = wordsField.getText().toString();
        wordsSelectionStart = Math.max(0, wordsField.getSelectionStart());
        wordsSelectionEnd = Math.max(0, wordsField.getSelectionEnd());
        restoreWordsEditor = true;
    }

    private void clearWordsDraft() {
        wordsDraft = null;
        restoreWordsEditor = false;
    }

    /** The row that opens the file picker for a font. Its summary names the file in use. */
    private Preference fontFileRow(Context context) {
        Row row = new Row(context);
        row.setKey(FONT_FILE_ROW);
        row.setTitle(L10n.t("Choose a font file"));
        row.setPersistent(false);
        row.setSummary(fontFileSummary(TextSettings.APP_FONT_FILE.savedValue()));
        row.setOnPreferenceClickListener(p -> {
            pickFontFile();
            return true;
        });
        return row;
    }

    private static String fontFileSummary(String saved) {
        return saved.isEmpty() ? L10n.t("Uses your phone's font. Tap to pick a .ttf or .otf file.")
                : L10n.f("Using %1$s. Tap to pick another.", AppFont.shownName(saved));
    }

    /** The row that goes back to the phone's font, with nothing to do until a file is chosen. */
    private Preference phoneFontRow(Context context) {
        Row row = new Row(context);
        row.actsAtOnce = true;
        row.setKey(PHONE_FONT_ROW);
        row.setTitle(L10n.t("Use the phone's font"));
        row.setSummary(L10n.t("Forgets the chosen font file."));
        row.setPersistent(false);
        row.setEnabled(!TextSettings.APP_FONT_FILE.savedValue().isEmpty());
        row.setOnPreferenceClickListener(p -> {
            forgetFontFile();
            return true;
        });
        return row;
    }

    /** Every file is offered, as a font's type depends on the app holding it. The file itself gets checked. */
    private void pickFontFile() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*");
        try {
            startActivityForResult(intent, FONT_FILE);
        } catch (ActivityNotFoundException missing) {
            Logger.printInfo(() -> "No file picker for the font file");
            Utils.showToastLong(L10n.t("This phone has no file picker, so there's no way to choose a file here."));
        } catch (RuntimeException error) {
            Logger.printInfo(() -> "Could not open the file picker: " + error.getClass().getSimpleName());
            Utils.showToastLong(L10n.t("Couldn't open the file picker. Try again."));
        }
    }

    private void onFontFilePicked(int resultCode, Intent data) {
        Uri uri = resultCode == Activity.RESULT_OK && data != null ? data.getData() : null;
        if (uri == null) return; // Cancelled.
        Context app = getContext().getApplicationContext();
        String[] outcome = new String[1];
        if (!submitEdit(() -> outcome[0] = installFontFile(app, uri), () -> showFontOutcome(outcome[0]))) {
            Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
        }
    }

    /** Takes the picked file and answers the toast. A failure logs its class alone, as its message can name the file. */
    private static String installFontFile(Context context, Uri uri) {
        ContentResolver resolver = context.getContentResolver();
        try (InputStream source = resolver.openInputStream(uri)) {
            if (source == null) throw new IOException("no stream");
            saveFontFile(AppFont.install(context, source, fontFileName(resolver, uri)));
            return Settings.APP_FONT.savedValue() ? L10n.t("Font file saved.") : L10n.t("Font file saved. Turn on App font to use it.");
        } catch (AppFont.Refused refused) {
            return refused.getMessage();
        } catch (IOException | RuntimeException failure) {
            Logger.printInfo(() -> "Could not take the font file: " + failure.getClass().getSimpleName());
            return L10n.t("Couldn't read that file. Try again.");
        }
    }

    /** What the picked file is called, or null when the app holding it won't say. */
    @Nullable
    private static String fontFileName(ContentResolver resolver, Uri uri) {
        try (Cursor cursor = resolver.query(uri, new String[] {OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            return cursor != null && cursor.moveToFirst() && !cursor.isNull(0) ? cursor.getString(0) : null;
        } catch (RuntimeException unsupported) {
            return null;
        }
    }

    private void forgetFontFile() {
        Context app = getContext().getApplicationContext();
        String[] outcome = new String[1];
        if (!submitEdit(() -> {
            try {
                // An empty value stops the file being read, so a delete that fails does no harm.
                saveFontFile("");
                AppFont.forget(app);
                outcome[0] = L10n.t("Back to the phone's font.");
            } catch (IOException | RuntimeException failure) {
                Logger.printInfo(() -> "Could not forget the font file: " + failure.getClass().getSimpleName());
                outcome[0] = L10n.t("Couldn't change the font. Try again.");
            }
        }, () -> showFontOutcome(outcome[0]))) {
            Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
        }
    }

    /** A new file only needs a restart while the switch is on. With it off, Tumblr isn't reading one. */
    private static void saveFontFile(String value) throws IOException {
        synchronized (app.hushtumblr.extension.shared.settings.Setting.class) {
            String before = TextSettings.APP_FONT_FILE.persistedValue();
            if (!TextSettings.APP_FONT_FILE.save(value)) throw new IOException("not saved");
            if (Settings.APP_FONT.savedValue()) {
                recordRestartPendingChanges(Collections.singletonMap(TextSettings.APP_FONT_FILE, before));
            }
        }
    }

    private void showFontOutcome(@Nullable String message) {
        if (message != null) Utils.showToastLong(message);
        if (!isAdded()) return;
        refreshSwitches();
        onRestartPendingChanged();
        if (restartPending.contains(TextSettings.APP_FONT_FILE.key)) showRestartDialog(getContext());
    }

    /** The row that opens the tab order list. Its summary names the order chosen. */
    private Preference tabOrderRow(Context context) {
        Row row = new Row(context);
        row.setKey(TAB_ORDER_ROW);
        row.setTitle(L10n.t("Tab order"));
        row.setPersistent(false);
        row.setSummary(tabOrderSummary(TextSettings.TAB_ORDER.savedValue()));
        row.setOnPreferenceClickListener(p -> {
            showTabOrder(context, p);
            return true;
        });
        return row;
    }

    /**
     * The tabs on the bar in the order chosen. A tap on one moves it a place up and saves the order
     * at once, keeping the list open, so a tab can be walked to the top. Tumblr's order clears the
     * choice. The bar is built as Tumblr starts, so it shows after a restart.
     */
    private void showTabOrder(Context context, Preference row) {
        List<String> order = new ArrayList<>(BottomBarTabs.choices(TextSettings.TAB_ORDER.savedValue()));
        String[] focusedTab = {order.get(0)};
        ArrayAdapter<String> labels = new ArrayAdapter<String>(context,
                android.R.layout.simple_list_item_1, tabLabels(order)) {
            @Override public View getView(int position, View recycled, ViewGroup parent) {
                TextView label = (TextView) super.getView(position, recycled, parent);
                float density = label.getResources().getDisplayMetrics().density;
                android.graphics.drawable.Drawable glyph = SettingsIcons.icon(context, SettingsIcons.BACK,
                        position == 0 ? ScreenColors.DEFAULT.summary : ScreenColors.DEFAULT.accent);
                // Up has the same direction in every language, unlike the source Back arrow.
                glyph.setAutoMirrored(false);
                android.graphics.drawable.RotateDrawable up = new android.graphics.drawable.RotateDrawable();
                up.setDrawable(glyph);
                up.setFromDegrees(90);
                up.setToDegrees(90);
                up.setLevel(10000);
                int size = Math.round(24 * density);
                up.setBounds(0, 0, size, size);
                label.setCompoundDrawablesRelative(null, null, up, null);
                label.setCompoundDrawablePadding(Math.round(16 * density));
                return label;
            }
        };
        AlertDialog dialog = show(new AlertDialog.Builder(context)
                .setTitle(L10n.t("Tap a tab to move it up"))
                .setAdapter(labels, null)
                .setNeutralButton(L10n.t("Tumblr's order"), null)
                .setPositiveButton(L10n.t("Done"), null));
        if (dialog == null) return;
        boolean[] saving = {false};
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(ignored -> {
            if (saving[0] || !dialog.isShowing() || !isAdded()) return;
            saving[0] = true;
            saveTabOrder("", dialog, saved -> {
                saving[0] = false;
                order.clear();
                order.addAll(BottomBarTabs.choices(TextSettings.TAB_ORDER.savedValue()));
                labels.clear();
                labels.addAll(tabLabels(order));
                row.setSummary(tabOrderSummary(TextSettings.TAB_ORDER.savedValue()));
                focusTab(dialog, order, focusedTab[0], false);
            });
        });
        // A click listener of its own, so a tap moves the tab without closing the list.
        dialog.getListView().setOnItemClickListener((parent, view, position, id) -> {
            if (saving[0] || !dialog.isShowing() || !isAdded()) return;
            String movedTab = order.get(position);
            if (position == 0) {
                String first = L10n.f("%1$s is already first.", tabLabel(movedTab));
                dialog.getListView().announceForAccessibility(first);
                Utils.showToastShort(first);
                return;
            }
            focusedTab[0] = movedTab;
            List<String> moved = BottomBarTabs.movedUp(order, position);
            saving[0] = true;
            saveTabOrder(BottomBarTabs.join(moved), dialog, saved -> {
                saving[0] = false;
                order.clear();
                order.addAll(BottomBarTabs.choices(TextSettings.TAB_ORDER.savedValue()));
                labels.clear();
                labels.addAll(tabLabels(order));
                row.setSummary(tabOrderSummary(TextSettings.TAB_ORDER.savedValue()));
                focusTab(dialog, order, movedTab, saved);
            });
        });
    }

    private void focusTab(AlertDialog dialog, List<String> order, String tab, boolean announce) {
        ListView list = dialog.getListView();
        list.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override public void onGlobalLayout() {
                list.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                if (!dialog.isShowing() || !isAdded()) return;
                int position = order.indexOf(tab);
                View target = list.getChildAt(position - list.getFirstVisiblePosition());
                if (target != null) {
                    target.requestFocus();
                    target.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null);
                }
                if (announce) list.announceForAccessibility(L10n.f("%1$s moved to position %2$d of %3$d.",
                        tabLabel(tab), position + 1, order.size()));
            }
        });
        list.setSelection(order.indexOf(tab));
        list.requestLayout();
    }

    private void saveTabOrder(String value, AlertDialog dialog, Consumer<Boolean> done) {
        setEditorBusy(dialog, true);
        dialog.getListView().setEnabled(false);
        dialog.getListView().announceForAccessibility(L10n.t("Saving changes"));
        if (!submitEdit(() -> {
            boolean saved = false;
            try {
                synchronized (app.hushtumblr.extension.shared.settings.Setting.class) {
                    String before = TextSettings.TAB_ORDER.persistedValue();
                    saved = SettingsBackup.saveText(TextSettings.TAB_ORDER, value);
                    if (saved) recordRestartPendingChanges(Collections.singletonMap(TextSettings.TAB_ORDER, before));
                }
            } catch (SettingsBackup.Rejected | RuntimeException refused) {
                // No draft or tab names belong in the log.
            }
            boolean outcome = saved;
            Utils.runOnMainThreadNowOrLater(() -> {
                SettingsBackupPreference.refreshCurrentPage();
                if (!dialog.isShowing() || !isAdded() || !shownDialogs.contains(dialog)) return;
                setEditorBusy(dialog, false);
                dialog.getListView().setEnabled(true);
                if (!outcome) Utils.showToastLong(L10n.t("Couldn't save the tab order. Your earlier order is unchanged. Try again."));
                else {
                    onRestartPendingChanged();
                    if (restartPending.contains(TextSettings.TAB_ORDER.key)) showRestartDialog(getContext());
                }
                done.accept(outcome);
            });
        })) {
            setEditorBusy(dialog, false);
            dialog.getListView().setEnabled(true);
            Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
            done.accept(false);
        }
    }

    /** What the tab order [saved] does, for its row's summary. */
    static String tabOrderSummary(String saved) {
        if (BottomBarTabs.parse(saved).isEmpty()) return L10n.t("The bottom bar keeps Tumblr's order.");
        return L10n.f("Tabs go in this order: %1$s.", tabsShown(saved));
    }

    /**
     * The tabs of the order [saved] by their labels, joined the way the text's language writes a
     * list. The row's summary and the settings file preview both say the order this way.
     */
    static String tabsShown(String saved) {
        List<String> labels = new ArrayList<>();
        for (String name : BottomBarTabs.choices(saved)) labels.add(L10n.isolate(tabLabel(name)));
        return L10n.join(labels);
    }

    /** What the tab order list calls the tab named [name] in Tumblr's tab enum. */
    static String tabLabel(String name) {
        switch (name) {
            case "Search":
                return L10n.t("Explore");
            case "TumblrTV":
                return L10n.t("Tumblr TV");
            case "Communities":
                return L10n.t("Communities");
            case "Notifications":
                return L10n.t("Notifications");
            case "Account":
                return L10n.t("Account");
            default:
                return L10n.t("Dashboard");
        }
    }

    private static List<String> tabLabels(List<String> names) {
        List<String> labels = new ArrayList<>(names.size());
        for (String name : names) labels.add(tabLabel(name));
        return labels;
    }

    /** The words row's summary: the saved entries, or how to add the first. */
    static String wordsSummary(String saved) {
        List<String> words = PostRules.wordList(saved);
        if (words.isEmpty()) return L10n.t("The list is empty. Tap to add words or phrases.");
        return L10n.f("Looks for: %1$s", wordsShown(words));
    }

    /**
     * The person's own [words] as one isolated run, comma separated as they'd type them. The row's
     * summary and the settings file preview both show the list this way.
     */
    static String wordsShown(List<String> words) {
        return L10n.isolate(String.join(", ", words));
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
     * What Android says about sending Tumblr's web addresses here, and the way to its page for
     * them (Morphe Manager #1028). The page opens over Tumblr, so the row reads the state again
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
        Utils.showToastLong(L10n.t("Android's settings for this app didn't open. Open App info from Tumblr's icon, "
                + "then Open by default."));
    }

    /**
     * A switch whose change waits for a restart: the card says what the next start brings, and the
     * restart row comes, goes or counts again.
     */
    @Override
    protected void onRestartPendingChanged() {
        Preference card = statusCard;
        Context context = getContext();
        if (card != null && context != null) showStatus(card, context);
        if (navigation != null) navigation.restartChanged();
    }

    /**
     * Quick setups: Quiet, Privacy or Back to defaults ({@link QuickSetupKeys}), each changing its
     * switches at once, then a toast saying how many changed. A switch that needs a restart brings
     * up the restart row the way a tap on it would.
     */
    void showQuickSetups() {
        Context context = getContext();
        if (context == null) return;
        List<Map<BooleanSetting, Boolean>> choices = Arrays.asList(
                QuickSetupKeys.quiet(), QuickSetupKeys.privacy(), QuickSetupKeys.defaults());
        CharSequence[] names = {L10n.t("Quiet"), L10n.t("Privacy"), L10n.t("Back to defaults")};
        CharSequence[] details = {
                L10n.t("Hides ads, suggestions, prompts and unread counts."),
                L10n.t("Stops Tumblr's tracking and screenshot watching, and hides your advertising ID."),
                L10n.t("Puts every feature switch back the way it started.")};
        AlertDialog dialog = show(new AlertDialog.Builder(themed(context))
                .setTitle(L10n.t("Quick setups"))
                .setAdapter(new ChoiceCards(ScreenColors.DEFAULT, names, details),
                        (shown, which) -> applyQuickSetup(choices.get(which)))
                .setNegativeButton(L10n.t("Cancel"), null));
        ListView list = dialog == null ? null : dialog.getListView();
        if (list != null) {
            // The cards bring their own spacing and press ripple, as in the diagnostic report's choices.
            list.setDivider(null);
            list.setSelector(new ColorDrawable(Color.TRANSPARENT));
        }
    }

    /**
     * Applies one Quick setups choice to the switches this page shows. The save runs on the
     * settings worker in one commit, as a tap on a switch does; a row's own setChecked never
     * saves. Then the page shows what was saved and a toast says how many changed.
     */
    void applyQuickSetup(Map<BooleanSetting, Boolean> values) {
        PreferenceScreen screen = getPreferenceScreen();
        if (screen == null || getContext() == null) return;
        Map<BooleanSetting, Boolean> shown = QuickSetups.shown(screen, values);
        if (hasPendingEdits()) {
            // A switch is still saving. Its own save would land after this one and undo part of it.
            Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
            return;
        }
        int[] changed = {0};
        boolean[] failed = {false};
        boolean accepted = submitEdit(() -> {
            try {
                changed[0] = QuickSetups.save(shown);
            } catch (java.io.IOException | RuntimeException failure) {
                failed[0] = true;
                Logger.printInfo(() -> "Quick setup save failed", failure);
            }
        }, () -> {
            Context context = getContext();
            if (isAdded()) refreshSwitches();
            if (failed[0]) {
                Utils.showToastLong(String.valueOf(preferenceChangeRecoveredMessage(context)));
                return;
            }
            int count = changed[0];
            Utils.showToastLong(L10n.quantity(count, "Changed %1$d setting", "Changed %1$d settings", count));
            if (count == 0 || context == null || !isAdded()) return;
            for (BooleanSetting setting : shown.keySet()) {
                if (restartPending.contains(setting.key)) {
                    showRestartDialog(context);
                    return;
                }
            }
        });
        if (!accepted) Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
    }

    /**
     * Why this start runs paused, what a pause does and doesn't reach, and that nothing the reader
     * saved has changed.
     */
    static String pausedSummary(HushTumblrPause.Reason reason, String packageName) {
        String why;
        switch (reason) {
            case CRASH_LOOP:
                // Only a crash, a native crash or a hang counts toward safe mode (HushTumblrPause).
                why = L10n.t("Tumblr crashed or froze within a minute of starting three times in a row, so "
                        + "HushTumblr paused itself.");
                break;
            case MARKER_FILE:
                why = L10n.f("A file named %1$s in %2$s paused HushTumblr.",
                        L10n.isolate(HushTumblrPause.MARKER_FILE_NAME), L10n.isolate(markerFolder(packageName)));
                break;
            default:
                why = L10n.t("You paused HushTumblr.");
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

    /** The Ko-fi page, for a browser, in a task of its own so it never opens inside Tumblr's. */
    static Intent supportIntent() {
        return new Intent(Intent.ACTION_VIEW, Uri.parse(SUPPORT_URL))
                .addCategory(Intent.CATEGORY_BROWSABLE)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    }

    /** Opens the Ko-fi page, or says no app here can, as Source code and issues does. */
    static void openSupport(Context context) {
        try {
            context.startActivity(supportIntent());
        } catch (ActivityNotFoundException | SecurityException missing) {
            // No browser, or none switched on. Uncaught, Android's exception closed Tumblr.
            Logger.printInfo(() -> "No app opened the support link");
            Utils.showToastLong(L10n.f("No app on this phone can open the link. The address is %1$s.",
                    L10n.isolate(SUPPORT_ADDRESS)));
        }
    }

    /**
     * The theme every row and dialog on this screen is built with, over Tumblr's own: dark
     * Material, which the black page reads on whatever the host activity's theme is.
     */
    public static Context themed(Context base) {
        // Tumblr omits supportsRtl. Only views built for this screen opt in; the host stays intact.
        ApplicationInfo settingsInfo = new ApplicationInfo(base.getApplicationInfo());
        settingsInfo.flags |= ApplicationInfo.FLAG_SUPPORTS_RTL;
        return new ContextThemeWrapper(base, ScreenColors.THEME) {
            @Override public ApplicationInfo getApplicationInfo() { return settingsInfo; }
        };
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

    private void patchToggle(PreferenceCategory category, Context context, Set<PatchFamily> build,
                                    PatchFamily family, BooleanSetting setting, String title, String summary, String icon) {
        if (build.contains(family)) {
            category.addPreference(mark(toggle(context, setting, title, family.coverageSummary(summary)), icon));
        }
    }

    private SwitchPreference toggle(Context context, BooleanSetting setting, String title, String summary) {
        SwitchPreference preference = new Toggle(context, this, setting);
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
            markHeading(view);
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

    static final class ManageMuteRow extends RootPostMutePreference {
        ManageMuteRow(Context context) {
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

    @Override protected void onNonPersistentPreferenceChanged(String key) {
        if (!settingImportInProgress) scheduleSavedChangeRefresh();
    }

    /** A switch row, which a screen reader calls a switch and reads as on or off. */
    static final class Toggle extends SwitchPreference {
        private final HushTumblrPreferenceFragment owner;
        private final BooleanSetting setting;
        private boolean saving;
        private boolean available = true;

        Toggle(Context context, HushTumblrPreferenceFragment owner, BooleanSetting setting) {
            super(context);
            this.owner = owner;
            this.setting = setting;
            // Framework persistence uses apply(), whose default cleanup then commits on the UI
            // thread. Keep the visible value until our durable save and rollback have finished.
            setPersistent(false);
            setChecked(setting.savedValue());
            setOnPreferenceChangeListener((preference, value) -> {
                if (!(value instanceof Boolean) || saving || !isEnabled() || !ownsVisibleRow()) return false;
                CharSequence summary = getSummary();
                saving = true;
                super.setEnabled(false);
                setSummary(L10n.t("Saving the setting"));
                boolean accepted = submitEdit(() -> {
                    boolean saved = false;
                    try {
                        synchronized (app.hushtumblr.extension.shared.settings.Setting.class) {
                            boolean before = setting.persistedValue();
                            saved = setting.save((Boolean) value);
                            if (saved) recordRestartPendingChanges(Collections.singletonMap(setting, before));
                        }
                    } catch (RuntimeException failure) {
                        Logger.printInfo(() -> "Settings switch save failed", failure);
                    }
                    boolean success = saved;
                    Utils.runOnMainThreadNowOrLater(() -> {
                        saving = false;
                        setSummary(summary);
                        super.setEnabled(available);
                        SettingsBackupPreference.refreshCurrentPage();
                        if (!success) {
                            Utils.showToastLong(String.valueOf(owner.preferenceChangeRecoveredMessage(getContext())));
                        }
                        if (!ownsVisibleRow()) return;
                        setChecked(setting.savedValue());
                        owner.updateUIAvailability();
                        owner.onRestartPendingChanged();
                        if (success && restartPending.contains(setting.key)) {
                            showRestartDialog(getContext());
                        }
                    });
                });
                if (!accepted) {
                    saving = false;
                    setSummary(summary);
                    super.setEnabled(available);
                    Utils.showToastLong(L10n.t("Couldn't start that. Try again in a moment."));
                }
                return false;
            });
        }

        @Override public void setEnabled(boolean enabled) {
            available = enabled;
            super.setEnabled(enabled && !saving);
        }

        @Override public void setChecked(boolean checked) {
            if (!saving) super.setChecked(checked);
        }

        private boolean ownsVisibleRow() {
            if (!owner.isAdded() || owner.findPreference(getKey()) != this) return false;
            if (!(owner.getParentFragment() instanceof SettingsDialog)) return true;
            Dialog dialog = ((SettingsDialog) owner.getParentFragment()).getDialog();
            return dialog != null && dialog.isShowing();
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Switch.class));
        }
    }

    final class ExportRow extends ExportDiagnosticReportPreference {
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
            shownDialogs.add(dialog);
            ListView list = dialog.getListView();
            if (list != null) {
                list.setDivider(null);
                list.setSelector(new ColorDrawable(Color.TRANSPARENT));
            }
            ScreenColors.dialog(dialog);
        }

        @Override
        protected void onDialogDismissed(AlertDialog dialog) {
            shownDialogs.remove(dialog);
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
        BackupRow(HushTumblrPreferenceFragment page, Context context, int action, String title, String summary) {
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
     * Tells a screen reader [view] is a heading, so it can jump between them. Android 8 has no
     * heading flag to set, so there the title is read as ordinary text; calling for the flag
     * anyway would end the screen with NoSuchMethodError.
     */
    static void markHeading(View view) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) view.setAccessibilityHeading(true);
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
        return L10n.t(context, "HushTumblr settings couldn't open");
    }
}
