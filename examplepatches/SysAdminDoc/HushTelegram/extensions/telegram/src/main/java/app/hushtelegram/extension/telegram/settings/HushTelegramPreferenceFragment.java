/*
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
package app.hushtelegram.extension.telegram.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import android.preference.TwoStatePreference;
import android.text.Layout;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.text.util.Linkify;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
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

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.function.BooleanSupplier;
import java.util.function.Consumer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.StringSetting;
import app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushtelegram.extension.shared.settings.preference.ClearLogBufferPreference;
import app.hushtelegram.extension.shared.settings.preference.ExportDiagnosticReportPreference;
import app.hushtelegram.extension.shared.settings.preference.ImmediateAction;
import app.hushtelegram.extension.shared.settings.preference.LogBufferManager;
import app.hushtelegram.extension.shared.settings.preference.QuickSetups;
import app.hushtelegram.extension.telegram.misc.CallRecorder;
import app.hushtelegram.extension.telegram.misc.ChatTypeFolders;
import app.hushtelegram.extension.telegram.misc.DataSaverDownloads;
import app.hushtelegram.extension.telegram.misc.FirebasePush;
import app.hushtelegram.extension.telegram.misc.GalleryFolder;
import app.hushtelegram.extension.telegram.misc.HiddenChats;
import app.hushtelegram.extension.telegram.misc.KeepDeleted;
import app.hushtelegram.extension.telegram.misc.KeepEdits;
import app.hushtelegram.extension.telegram.misc.LaunchFolder;
import app.hushtelegram.extension.telegram.misc.OutsideTranslate;
import app.hushtelegram.extension.telegram.misc.StickerSize;
import app.hushtelegram.extension.telegram.misc.StorageFolder;
import app.hushtelegram.extension.telegram.misc.UnifiedPush;

/**
 * The preference list, built in code rather than from an XML resource so the bundle adds no
 * resources to Telegram. A switch appears only when its patch is in this build
 * ({@link PatchFamily}), but for the settings entry's own ({@link PatchFamily#ENTRY_SWITCHES}),
 * which every build has; a patch that works entirely at patch time gets a line saying so, and what
 * Pause can't reach is listed under the Pause switch. Switches are keyed by their setting, which is
 * how the shared fragment keeps them in sync with stored values. Every word is read from
 * {@link L10n} in the phone's language; the product names and the address stay as they are.
 */
@SuppressWarnings("deprecation")
public final class HushTelegramPreferenceFragment extends AbstractPreferenceFragment
        implements ReleaseCheck.Listener {
    /** The repository as a link, and as a person reads it. ExtensionHostsTest reads the link. */
    static final String SOURCE_URL = "https://github.com/SysAdminDoc/HushTelegram";
    static final String SOURCE_ADDRESS = SOURCE_URL.substring(SOURCE_URL.indexOf("://") + 3);
    /** Where Support HushTelegram goes: the maintainer's Ko-fi page. */
    static final String SUPPORT_URL = "https://ko-fi.com/X8K126YVER";
    static final String SUPPORT_ADDRESS = SUPPORT_URL.substring(SUPPORT_URL.indexOf("://") + 3);
    /** The key of Support HushTelegram, the settings home page's last row. It stores nothing. */
    static final String SUPPORT = "action_support_hushtelegram";
    /** The English of the row listing what Pause can't reach, and its key in {@link L10n}. */
    static final String STAYS_WHILE_PAUSED = "Stays in while paused";
    /** The Check now row's key. It stores nothing: no setting has this name. */
    static final String CHECK_NOW = "action_check_for_release";
    /** The Supported links row's key. It stores nothing either. */
    static final String SUPPORTED_LINKS = "action_supported_links";
    /** The Clear kept messages row's key, which stores nothing. */
    static final String CLEAR_KEPT = "action_clear_kept_messages";
    /** The Clear edit history row's key, which stores nothing. */
    static final String CLEAR_EDITS = "action_clear_edit_history";
    /** The Sticker size row's key. The size itself is saved under {@link Settings#STICKER_SIZE}. */
    static final String STICKER_SIZE_ROW = "action_sticker_size";
    /** The Gallery folder row's key. The choice itself is saved under {@link Settings#GALLERY_FOLDER}. */
    static final String GALLERY_FOLDER_ROW = "action_gallery_folder";
    /** The Folder to open row's key. The picks are kept by {@link LaunchFolder}, one for each account. */
    static final String LAUNCH_FOLDER_ROW = "action_launch_folder";
    static final String HIDDEN_CHATS_ROW = "action_hidden_chats";

    /** Thrown by the next initialize() and then cleared: how a test reaches the recovery page. */
    static volatile RuntimeException failNextInitialization;

    /** The first row, which says whether HushTelegram runs now and whether the next start changes that. */
    @Nullable
    private Preference statusCard;

    /** The row that asks GitHub for the newest release now, and says what the last try found. */
    @Nullable
    private Preference checkNowRow;

    @Nullable
    private Preference localNotificationStatus;

    /** Where a settings file waiting on the person's answer is kept across the page being rebuilt. */
    static final String PENDING_IMPORT_STATE = "hushtelegram_pending_import";

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
            // The list keeps a keyboard's focus and moves it row to row, the status rows included,
            // where Enter presses their Pause, Resume or Undo button. Focus inside a row is no
            // good: moving on from a row's button, the list hands focus to the window's first view.
            list.setItemsCanFocus(false);
            // Set here rather than in initialize(), so a page whose initialize() failed, the
            // recovery page, is drawn on the same black.
            list.setBackgroundColor(ScreenColors.DEFAULT.background);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup parent, Bundle savedInstanceState) {
        Context context = themed(getContext());
        View view = super.onCreateView(inflater.cloneInContext(context), parent, savedInstanceState);
        view.setLayoutDirection(context.getResources().getConfiguration().getLayoutDirection());
        return view;
    }

    @Override
    public void onResume() {
        super.onResume();
        SettingsBackupPreference.onPageResumed(this);
        showSupportedLinks();
        showPushApp();
        if (localNotificationStatus != null) localNotificationStatus.setSummary(notificationSummary(FirebasePush.localStatus(getContext())));
        // Back from All files access, the row says what Android gives now.
        Preference storage = findPreference(Settings.STORAGE_FOLDER.key);
        if (storage != null) storage.setSummary(storageFolderSummary(StorageFolder.allFilesAccess()));
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

    /**
     * Shows what the switches are saved as, which are in reach and whether a restart is owed, as an
     * import starts and when it ends.
     */
    void refreshSwitches() {
        updateUIToSettingValues();
        onRestartPendingChanged();
        // An import can change the filter lists, the sticker size, the title emoji, the gallery folder and the
        // translation language too, and their rows say so.
        if (getPreferenceScreen() == null) return;
        Preference groups = findPreference(FilterEditor.GROUPS);
        if (groups != null) groups.setSummary(FilterEditor.summary(Settings.MESSAGE_FILTERS_GROUPS));
        Preference channels = findPreference(FilterEditor.CHANNELS);
        if (channels != null) channels.setSummary(FilterEditor.summary(Settings.MESSAGE_FILTERS_CHANNELS));
        Preference size = findPreference(STICKER_SIZE_ROW);
        if (size != null) size.setSummary(stickerSizeSummary());
        Preference emoji = findPreference(TitleEmojiEditor.KEY);
        if (emoji != null) emoji.setSummary(TitleEmojiEditor.summary(Settings.TITLE_EMOJI.savedValue()));
        Preference gallery = findPreference(GALLERY_FOLDER_ROW);
        if (gallery != null) gallery.setSummary(galleryFolderSummary());
        Preference target = findPreference(TranslateTargetPicker.KEY);
        if (target != null) target.setSummary(TranslateTargetPicker.summary(Settings.TRANSLATE_TARGET.savedValue()));
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
        localNotificationStatus = null;

        // One page per group of Morphe Manager categories, drawn in PatchFamily.Page order; a page
        // this build put nothing on isn't drawn. Notifications and Privacy lead with their own rows.
        // Rows on these pages carry no icon. The home page's icon already names the page, the same
        // stop sign or chat bubble on every row said nothing and narrowed the text beside it, and a
        // lone icon pushed its row's text out of line with the rows around it. Conversations and
        // Look and feel are split under headings in SettingsNavigation, from PatchFamily.Group.
        Map<PatchFamily.Page, PreferenceCategory> pages = new EnumMap<>(PatchFamily.Page.class);
        for (PatchFamily.Page page : PatchFamily.Page.values()) {
            if (page.inBuild(build)) pages.put(page, category(screen, page.label()));
        }
        addAdsPage(context, pages, build);
        addChatListPage(context, pages, build);
        addConversationsPage(context, pages, build);
        addPlaybackPage(context, pages, build);
        addNotificationsPage(context, pages, build);
        addLookPage(context, pages, build);
        addPrivacyPage(context, pages, build);

        addLinksPage(context, screen, build);
        addUpdatesPage(context, screen, build);
        addRoutesPage(context, screen);
        addPausePage(context, screen, build);
        addBackupPage(context, screen, build);
        addDiagnosticsPage(context, screen);
        addAboutPage(context, screen);
    }

    /** The Ads page: what Telegram sells or promotes, from sponsored messages to popular apps. */
    private void addAdsPage(Context context, Map<PatchFamily.Page, PreferenceCategory> pages, Set<PatchFamily> build) {
        if (build.contains(PatchFamily.HIDE_ADS)) {
            on(pages, PatchFamily.HIDE_ADS).addPreference(toggle(context, Settings.HIDE_ADS, L10n.t("Hide ads"),
                    PatchFamily.HIDE_ADS.coverageSummary(L10n.t("Removes sponsored messages in channels, sponsored accounts in search and ads in "
                            + "videos. They're never loaded, so none count as seen."))));
        }
        if (build.contains(PatchFamily.HIDE_COMMERCE)) {
            on(pages, PatchFamily.HIDE_COMMERCE).addPreference(toggle(context, Settings.HIDE_COMMERCE, L10n.t("Hide Premium, gifts and Stars"),
                    PatchFamily.HIDE_COMMERCE.coverageSummary(L10n.t("Removes Premium, Stars, My Grams, Wallet, Business and Send a Gift from Settings, "
                            + "Wallet and Send Gram from the chat, profile and link menus, Gifts tabs on profiles, the Gift button in channels, "
                            + "and Premium stickers, their effects and Premium emoji packs if you don't have Premium."))));
            if (PatchFamily.Capability.COMMERCE_EMOJI_STATUS.installed()) {
                on(pages, PatchFamily.HIDE_COMMERCE).addPreference(toggle(context, Settings.HIDE_EMOJI_STATUS,
                        L10n.t("Hide emoji statuses"), L10n.t("The emoji a Premium account puts next to its name goes away in chats, "
                                + "the chat list and profiles, and the Premium star shows instead. Your own status hides too but stays "
                                + "set for everyone else. A chat picks this up the next time you open it.")));
            }
            if (PatchFamily.Capability.COMMERCE_PREMIUM_ICONS.installed()) {
                on(pages, PatchFamily.HIDE_COMMERCE).addPreference(toggle(context, Settings.UNLOCK_PREMIUM_ICONS,
                        L10n.t("Unlock Premium app icons"), L10n.t("Premium, Turbo and Nox in Telegram's App Icon list work without "
                                + "Premium, with no lock and no Premium sheet. Only the icon on your home screen changes.")));
            }
            if (PatchFamily.Capability.COMMERCE_LOCAL_EMOJI_STATUS.installed()) {
                on(pages, PatchFamily.HIDE_COMMERCE).addPreference(toggle(context, Settings.LOCAL_EMOJI_STATUS,
                        L10n.t("Emoji status on this phone"), L10n.t("Tap the star next to Telegram at the top of the chat list "
                                + "and pick any emoji status, animated ones too, without Premium. It shows there on this phone only. "
                                + "Nobody else sees it, and nothing is sent to Telegram.")));
            }
        }
        if (build.contains(PatchFamily.HIDE_PROMOTIONAL_BANNERS)) {
            on(pages, PatchFamily.HIDE_PROMOTIONAL_BANNERS).addPreference(toggle(context, Settings.HIDE_PROMOTIONAL_BANNERS, L10n.t("Hide promotional banners"),
                    PatchFamily.HIDE_PROMOTIONAL_BANNERS.coverageSummary(L10n.t("Hides the Premium, birthday and low Stars balance banners above your chat list. "
                            + "Account security notices and other suggestions still show."))));
        }
        if (build.contains(PatchFamily.HIDE_SPONSORED_PROXY)) {
            on(pages, PatchFamily.HIDE_SPONSORED_PROXY).addPreference(toggle(context, Settings.HIDE_SPONSORED_PROXY, L10n.t("Hide sponsored proxy channel"),
                    PatchFamily.HIDE_SPONSORED_PROXY.coverageSummary(L10n.t("Hides the sponsored channel a proxy adds to your chat list and folders. Your "
                            + "proxy settings aren't touched."))));
        }
        if (build.contains(PatchFamily.HIDE_POPULAR_APPS)) {
            on(pages, PatchFamily.HIDE_POPULAR_APPS).addPreference(toggle(context, Settings.HIDE_POPULAR_APPS, L10n.t("Hide popular apps"),
                    PatchFamily.HIDE_POPULAR_APPS.coverageSummary(L10n.t("Hides the Popular apps list on the Apps tab of search, and doesn't ask Telegram "
                            + "for it. Apps you've opened and other results stay."))));
            if (PatchFamily.Capability.MY_CHATS_SEARCH.installed()) {
                on(pages, PatchFamily.HIDE_POPULAR_APPS).addPreference(toggle(context, Settings.SEARCH_ONLY_MY_CHATS,
                        L10n.t("Search only my chats"),
                        L10n.t("Search finds your chats, contacts and messages from chats you're in, and nothing public. The "
                                + "Channels, Apps and Posts tabs go away, and a hashtag's public posts don't load.")));
            }
            if (PatchFamily.Capability.NAME_FOLD.installed()) {
                on(pages, PatchFamily.HIDE_POPULAR_APPS).addPreference(toggle(context, Settings.SEARCH_STYLED_NAMES,
                        L10n.t("Find names in styled letters"),
                        L10n.t("Searching your chats and contacts also finds names written in letters like 𝐁𝐨𝐥𝐝, 𝘐𝘵𝘢𝘭𝘪𝘤 or "
                                + "Ｗｉｄｅ when you type plain ones. Names still show as they're written and numbers aren't "
                                + "changed. A name found this way isn't highlighted.")));
            }
            // A parental control: the settings lock is what keeps it on, so the row says to set it.
            if (PatchFamily.Capability.BLOCK_NEW_CHATS.installed()) {
                on(pages, PatchFamily.HIDE_POPULAR_APPS).addPreference(toggle(context, Settings.BLOCK_NEW_CHATS,
                        L10n.t("Block new channels and groups"),
                        L10n.t("Stops joining channels and groups, from search, a link or a shared folder, and opening ones "
                                + "you aren't in. Chats you're already in stay. To keep this on, also turn on Lock HushTelegram "
                                + "settings.")));
            }
        }
    }

    /** The Chat list page: Stories, swipes, pulls, folders and the contacts under a short list. */
    private void addChatListPage(Context context, Map<PatchFamily.Page, PreferenceCategory> pages, Set<PatchFamily> build) {
        if (build.contains(PatchFamily.HIDE_STORIES)) {
            on(pages, PatchFamily.HIDE_STORIES).addPreference(toggle(context, Settings.HIDE_STORIES, L10n.t("Hide Stories"),
                    PatchFamily.HIDE_STORIES.coverageSummary(L10n.t("Removes the story bar above your chats, the rings around profile pictures and "
                            + "the Post Story button. Profile stories and archives stay."))));
        }
        if (build.contains(PatchFamily.HIDE_CONTACTS_BLOCK)) {
            on(pages, PatchFamily.HIDE_CONTACTS_BLOCK).addPreference(toggle(context, Settings.HIDE_CONTACTS_BLOCK, L10n.t("Hide contacts on Telegram"),
                    PatchFamily.HIDE_CONTACTS_BLOCK.coverageSummary(L10n.t("When your chat list is short, Telegram lists your contacts below it. This hides "
                            + "that list and its heading. Chats, folders and search stay."))));
        }
        if (build.contains(PatchFamily.DISABLE_CHAT_SWIPE)) {
            on(pages, PatchFamily.DISABLE_CHAT_SWIPE).addPreference(toggle(context, Settings.DISABLE_CHAT_SWIPE, L10n.t("No swipe actions on chats"),
                    PatchFamily.DISABLE_CHAT_SWIPE.coverageSummary(L10n.t("Swiping a chat in your list no longer archives, mutes, pins, deletes or marks it"
                            + " read. Press and hold still offers every action."))));
        }
        if (build.contains(PatchFamily.HIDE_FOLDER_COUNTERS)) {
            PreferenceCategory folderTabs = on(pages, PatchFamily.HIDE_FOLDER_COUNTERS);
            SwitchPreference counters = toggle(context, Settings.HIDE_FOLDER_COUNTERS, L10n.t("Hide folder tab counters"),
                    PatchFamily.HIDE_FOLDER_COUNTERS.coverageSummary(L10n.t("Folder tabs above the chat list show just their names, without unread counts. "
                            + "Chats stay unread and the app icon badge doesn't change.")));
            counters.setOnPreferenceChangeListener((row, value) -> {
                // The tabs only ask for their counts when the counts change, so they're counted again once the switch is saved.
                Utils.runOnMainThreadDelayed(HiddenChats::refreshAll, 0);
                return true;
            });
            folderTabs.addPreference(counters);
            if (PatchFamily.Capability.LAUNCH_FOLDER.installed()) {
                folderTabs.addPreference(toggle(context, Settings.LAUNCH_FOLDER, L10n.t("Open a folder at launch"),
                        L10n.t("The chat list opens on the folder you pick below instead of All Chats. Each account keeps its "
                                + "own pick, and the folder order doesn't change. If that folder is gone, renamed or locked, "
                                + "All Chats opens as usual.")));
                folderTabs.addPreference(launchFolderRow(context));
            }
            if (PatchFamily.Capability.HIDE_ALL_CHATS.installed()) {
                folderTabs.addPreference(toggle(context, Settings.HIDE_ALL_CHATS, L10n.t("Hide All Chats"), hideAllChatsSummary()));
            }
            if (PatchFamily.Capability.HIDDEN_CHATS.installed()) {
                SwitchPreference hide = toggle(context, Settings.HIDDEN_CHATS, L10n.t("Hide picked chats"),
                        L10n.t("The chats you pick below leave All Chats, your folders and archived chats. They keep their "
                                + "messages and notifications, search still finds them, and nothing changes on your other "
                                + "devices. Each account keeps its own list.") + " "
                                // The badge follows their notifications, which they keep.
                                + (PatchFamily.Capability.HIDDEN_UNREAD.installed()
                                        ? L10n.t("Folder tab counts leave them out, but the app badge still counts their unread messages.")
                                        : L10n.t("Folder tab counts and the app badge still count their unread messages.")));
                hide.setOnPreferenceChangeListener((row, value) -> {
                    // Once the switch is saved, so the chat list sorts by what it says.
                    Utils.runOnMainThreadDelayed(HiddenChats::refreshAll, 0);
                    return true;
                });
                folderTabs.addPreference(hide);
                folderTabs.addPreference(hiddenChatsRow(context));
            }
        }
        if (build.contains(PatchFamily.CHAT_TYPE_FOLDERS)) {
            SwitchPreference folders = toggle(context, Settings.CHAT_TYPE_FOLDERS, L10n.t("Folders by chat type"),
                    PatchFamily.CHAT_TYPE_FOLDERS.coverageSummary(L10n.t("Turning this on makes Private, Groups, Channels and Bots "
                            + "folders, as tabs above the chat list and on your other devices. Turning it off removes the ones it "
                            + "made, unless you renamed or changed them.") + " "
                            + L10n.t("Both work on the account you have open.")));
            folders.setOnPreferenceChangeListener((row, value) -> {
                // Once the switch is saved, so the folders follow what it says.
                Utils.runOnMainThreadDelayed(() -> {
                    String said = ChatTypeFolders.apply(context);
                    if (said != null) Utils.showToastLong(said);
                }, 0);
                return true;
            });
            on(pages, PatchFamily.CHAT_TYPE_FOLDERS).addPreference(folders);
        }
        if (build.contains(PatchFamily.DISABLE_ARCHIVE_PULL)) {
            on(pages, PatchFamily.DISABLE_ARCHIVE_PULL).addPreference(toggle(context, Settings.DISABLE_ARCHIVE_PULL, L10n.t("Disable pull to archive"),
                    PatchFamily.DISABLE_ARCHIVE_PULL.coverageSummary(L10n.t("Pulling down the chat list no longer opens the archive. Use Archived chats in "
                            + "the list's menu instead. Restart Telegram to see the change."))));
        }
        if (build.contains(PatchFamily.HIDE_CONTACTS_TAB)) {
            on(pages, PatchFamily.HIDE_CONTACTS_TAB).addPreference(toggle(context, Settings.HIDE_CONTACTS_TAB, L10n.t("Hide Contacts tab"),
                    PatchFamily.HIDE_CONTACTS_TAB.coverageSummary(L10n.t("The Contacts tab leaves the bar at the bottom of the main screen, and "
                            + "swiping doesn't open its page either. The Calls or Settings tab stays as Telegram has it, and the chat "
                            + "list's new message button still opens your contacts. Restart Telegram to see the change."))));
            if (PatchFamily.Capability.COMPACT_TAB_BAR.installed()) {
                on(pages, PatchFamily.HIDE_CONTACTS_TAB).addPreference(toggle(context, Settings.COMPACT_TAB_BAR,
                        L10n.t("Compact bottom bar"),
                        L10n.t("The bar at the bottom of the main screen gets shorter and only as wide as its tabs need. "
                                + "The tabs keep their full height, so they're just as easy to tap. Restart Telegram to see the change.")));
            }
            if (PatchFamily.Capability.SIDE_MENU.installed()) {
                on(pages, PatchFamily.HIDE_CONTACTS_TAB).addPreference(toggle(context, Settings.SIDE_MENU,
                        L10n.t("Side menu"),
                        L10n.t("Swipe right on your first chat folder and a menu slides in, like the one older Telegram had. It has "
                                + "your profile, new message, contacts, calls, saved messages and settings, plus a way to switch "
                                + "accounts. Back or a tap beside it closes it.")));
            }
            if (PatchFamily.Capability.HIDE_NEW_MESSAGE.installed()) {
                on(pages, PatchFamily.HIDE_CONTACTS_TAB).addPreference(toggle(context, Settings.HIDE_NEW_MESSAGE,
                        L10n.t("Hide new message button"),
                        L10n.t("Removes the round pencil button from the chat list. Start a chat from the menu or search. "
                                + "Restart Telegram to see the change.")));
            }
        }
    }

    /** The Conversations page: in a chat, its menus, sending, translation, hidden and kept messages. */
    private void addConversationsPage(Context context, Map<PatchFamily.Page, PreferenceCategory> pages, Set<PatchFamily> build) {
        if (build.contains(PatchFamily.HIDE_GREETING_STICKERS)) {
            on(pages, PatchFamily.HIDE_GREETING_STICKERS).addPreference(toggle(context, Settings.HIDE_GREETING_STICKERS, L10n.t("Hide greeting stickers"),
                    PatchFamily.HIDE_GREETING_STICKERS.coverageSummary(L10n.t("Empty private chats stop suggesting a sticker to say hello. Their other text and"
                            + " notices, and the sticker picker, stay."))));
        }
        if (build.contains(PatchFamily.DISABLE_CHANNEL_PULL)) {
            on(pages, PatchFamily.DISABLE_CHANNEL_PULL).addPreference(toggle(context, Settings.DISABLE_CHANNEL_PULL, L10n.t("Stop pull to next channel"),
                    L10n.t("Pulling up at the bottom of a channel only scrolls. Open the next channel from your chat list.")));
            on(pages, PatchFamily.DISABLE_CHANNEL_PULL).addPreference(toggle(context, Settings.DISABLE_TOPIC_PULL, L10n.t("Stop pull to next topic"),
                    L10n.t("Pulling up at the bottom of a forum topic only scrolls. Open the next topic from"
                            + " the topic list.")));
        }
        if (build.contains(PatchFamily.NORMAL_PASTE)) {
            on(pages, PatchFamily.NORMAL_PASTE).addPreference(toggle(context, Settings.NORMAL_PASTE, L10n.t("Use normal paste"),
                    PatchFamily.NORMAL_PASTE.coverageSummary(L10n.t("Pastes text exactly as you copied it, without Telegram adding formatting, tables"
                            + " or code styling. Spaces and links stay as they were."))));
        }
        if (build.contains(PatchFamily.DISABLE_DOUBLE_TAP_REACTIONS)) {
            on(pages, PatchFamily.DISABLE_DOUBLE_TAP_REACTIONS).addPreference(toggle(context, Settings.DISABLE_DOUBLE_TAP_REACTIONS, L10n.t("Disable double-tap reactions"),
                    PatchFamily.DISABLE_DOUBLE_TAP_REACTIONS.coverageSummary(L10n.t("Double-tapping a message no longer adds a reaction. Scrolling, normal taps, "
                            + "selecting and the reaction menu work as before."))));
            if (PatchFamily.Capability.REACTION_ROWS.installed()) {
                on(pages, PatchFamily.DISABLE_DOUBLE_TAP_REACTIONS).addPreference(toggle(context, Settings.HIDE_REACTION_ROWS,
                        L10n.t("Hide reactions under messages"), L10n.t("The row of reactions under each message isn't drawn. "
                                + "Nothing is removed, so turn it off and they're back. Tags in Saved Messages stay.")));
            }
            if (PatchFamily.Capability.REACTION_PICKER.installed()) {
                on(pages, PatchFamily.DISABLE_DOUBLE_TAP_REACTIONS).addPreference(toggle(context, Settings.HIDE_REACTION_PICKER,
                        L10n.t("Hide the reaction picker"), L10n.t("The row of reactions at the top of the long-press menu and the "
                                + "panel it opens are gone. The rest of the menu works as before.")));
            }
        }
        if (build.contains(PatchFamily.HIDE_TRANSLATE_BAR)) {
            on(pages, PatchFamily.HIDE_TRANSLATE_BAR).addPreference(toggle(context, Settings.HIDE_TRANSLATE_BAR, L10n.t("Hide translate bar"),
                    PatchFamily.HIDE_TRANSLATE_BAR.coverageSummary(L10n.t("Chats in another language stop showing the translate bar at the top. Translate "
                            + "moves to the chat's menu, and a chat you're translating keeps its bar."))));
        }
        if (build.contains(PatchFamily.REVEAL_SPOILERS)) {
            on(pages, PatchFamily.REVEAL_SPOILERS).addPreference(toggle(context, Settings.REVEAL_SPOILERS, L10n.t("Reveal spoilers"),
                    PatchFamily.REVEAL_SPOILERS.coverageSummary(L10n.t("Spoiler text, photos and videos show right away without a tap. View-once media, "
                            + "sensitive content and login codes stay covered."))));
        }
        if (build.contains(PatchFamily.FORWARD_HIDE_SENDER)) {
            on(pages, PatchFamily.FORWARD_HIDE_SENDER).addPreference(toggle(context, Settings.FORWARD_HIDE_SENDER, L10n.t("Hide sender names when forwarding"),
                    PatchFamily.FORWARD_HIDE_SENDER.coverageSummary(L10n.t("Each new forward starts with Hide sender's name turned on, so copies arrive "
                            + "without the original author. You can still turn it off before sending."))));
        }
        if (build.contains(PatchFamily.REAR_CAMERA_FIRST)) {
            on(pages, PatchFamily.REAR_CAMERA_FIRST).addPreference(toggle(context, Settings.REAR_CAMERA_FIRST, L10n.t("Start the camera on the rear lens"),
                    PatchFamily.REAR_CAMERA_FIRST.coverageSummary(L10n.t("The camera in the attachment menu always opens on the rear lens, not the lens "
                            + "you used last. You can still flip it."))));
        }
        if (build.contains(PatchFamily.HIDE_GALLERY_CAMERA_TILE)) {
            on(pages, PatchFamily.HIDE_GALLERY_CAMERA_TILE).addPreference(toggle(context, Settings.HIDE_GALLERY_CAMERA_TILE, L10n.t("Hide gallery camera tile"),
                    PatchFamily.HIDE_GALLERY_CAMERA_TILE.coverageSummary(L10n.t("The attachment menu's photo grid starts with your photos instead of a live "
                            + "camera tile. A chat picks this up the next time you open it."))));
        }
        if (build.contains(PatchFamily.HIDE_BLOCKED_IN_GROUPS)) {
            on(pages, PatchFamily.HIDE_BLOCKED_IN_GROUPS).addPreference(toggle(context, Settings.HIDE_BLOCKED_IN_GROUPS, L10n.t("Hide blocked users in groups"),
                    PatchFamily.HIDE_BLOCKED_IN_GROUPS.coverageSummary(L10n.t("Messages from people you've blocked are left out of groups and supergroups you "
                            + "open, and don't notify you. Nothing is deleted. Private chats and channel posts stay as they are."))));
        }
        if (build.contains(PatchFamily.HIDE_BY_KEYWORD)) {
            PreferenceCategory page = on(pages, PatchFamily.HIDE_BY_KEYWORD);
            page.addPreference(toggle(context, Settings.HIDE_BY_KEYWORD, L10n.t("Hide messages by keyword"),
                    PatchFamily.HIDE_BY_KEYWORD.coverageSummary(L10n.t("Messages in groups and channels that match one of your "
                            + "filters are left out when you open the chat. Private chats and your own messages stay as they "
                            + "are. Nothing is deleted, and your filters stay on this phone."))));
            page.addPreference(filtersRow(context, Settings.MESSAGE_FILTERS_GROUPS, FilterEditor.GROUPS,
                    L10n.t("Filters for groups")));
            page.addPreference(filtersRow(context, Settings.MESSAGE_FILTERS_CHANNELS, FilterEditor.CHANNELS,
                    L10n.t("Filters for channels")));
        }
        if (build.contains(PatchFamily.MESSAGE_MENU_REPEAT)) {
            on(pages, PatchFamily.MESSAGE_MENU_REPEAT).addPreference(toggle(context, Settings.MESSAGE_MENU_REPEAT, L10n.t("Add Repeat to the message menu"),
                    PatchFamily.MESSAGE_MENU_REPEAT.coverageSummary(L10n.t("Adds Repeat under Forward in a message's menu. It sends the same "
                            + "message again to the chat. Not shown in protected or secret chats."))));
            on(pages, PatchFamily.MESSAGE_MENU_REPEAT).addPreference(toggle(context, Settings.MESSAGE_MENU_COPY_PHOTO, L10n.t("Add Copy photo to the message menu"),
                    PatchFamily.MESSAGE_MENU_REPEAT.coverageSummary(L10n.t("Adds Copy photo to a downloaded photo's menu, so you can paste "
                            + "the picture into another app. Not shown in protected or secret chats."))));
            on(pages, PatchFamily.MESSAGE_MENU_REPEAT).addPreference(toggle(context, Settings.MESSAGE_MENU_DETAILS, L10n.t("Add Message details to the message menu"),
                    PatchFamily.MESSAGE_MENU_REPEAT.coverageSummary(L10n.t("Adds Message details to a message's menu. It shows IDs, send and "
                            + "edit times, where it was forwarded from, and file info."))));
            on(pages, PatchFamily.MESSAGE_MENU_REPEAT).addPreference(toggle(context, Settings.MESSAGE_MENU_QUICK_FORWARD, L10n.t("Add Quick forward to the message menu"),
                    PatchFamily.MESSAGE_MENU_REPEAT.coverageSummary(L10n.t("Adds Quick forward to a message's menu. One tap sends it to Saved"
                            + " Messages or a recent chat. Not in protected or secret chats."))));
            on(pages, PatchFamily.MESSAGE_MENU_REPEAT).addPreference(toggle(context, Settings.MESSAGE_MENU_COPY_PROTECTED, L10n.t("Copy text from chats that don't allow saving"),
                    PatchFamily.MESSAGE_MENU_REPEAT.coverageSummary(PatchFamily.Capability.COPY_SELECTION.installed()
                            ? L10n.t("Puts Copy back in the menu of a message in a chat that doesn't allow saving, and lets you copy "
                                    + "selected text there. Secret chats stay as they are.")
                            : L10n.t("Puts Copy back in the menu of a message in a chat that doesn't allow saving. Secret chats stay "
                                    + "as they are."))));
            on(pages, PatchFamily.MESSAGE_MENU_REPEAT).addPreference(toggle(context, Settings.MESSAGE_MENU_SAVE_PROTECTED, L10n.t("Add Save to Downloads to the message menu"),
                    PatchFamily.MESSAGE_MENU_REPEAT.coverageSummary(L10n.t("Adds Save to Downloads to a downloaded photo, video, file or song "
                            + "in a chat that doesn't allow saving. Nothing is copied until you tap it."))));
            on(pages, PatchFamily.MESSAGE_MENU_REPEAT).addPreference(toggle(context, Settings.MESSAGE_MENU_FORWARD_COPY, L10n.t("Add Forward as copy to the message menu"),
                    PatchFamily.MESSAGE_MENU_REPEAT.coverageSummary(L10n.t("Adds Forward as copy to a message in a chat that doesn't allow forwarding. "
                            + "Pick a chat and the message's text, or its downloaded photo or file, is sent there as a new message."))));
        }
        if (build.contains(PatchFamily.KEEP_DELETED_MESSAGES)) {
            on(pages, PatchFamily.KEEP_DELETED_MESSAGES).addPreference(toggle(context, Settings.KEEP_DELETED_MESSAGES, L10n.t("Keep deleted messages"),
                    PatchFamily.KEEP_DELETED_MESSAGES.coverageSummary(L10n.t("Messages others delete stay in your chat on this phone, marked deleted next to "
                            + "the time. Your own deletes and disappearing messages work as usual."))));
            if (PatchFamily.Capability.RED_DELETED_LABEL.installed()) {
                on(pages, PatchFamily.KEEP_DELETED_MESSAGES).addPreference(toggle(context, Settings.RED_DELETED_LABEL,
                        L10n.t("Show deleted in red"), L10n.t("The deleted label next to a kept message's time turns red, so"
                                + " it stands out in the chat. Works with Keep deleted messages on.")));
            }
            on(pages, PatchFamily.KEEP_DELETED_MESSAGES).addPreference(clearKeptRow(context));
            // The earlier text shows in Message details, which the message menu patch adds.
            if (PatchFamily.Capability.EDIT_HISTORY.installed()) {
                on(pages, PatchFamily.KEEP_DELETED_MESSAGES).addPreference(toggle(context, Settings.KEEP_EDIT_HISTORY,
                        L10n.t("Keep edit history"), L10n.t("Keeps the text a message had before someone else edited it, on this"
                                + " phone only. Message details in the message's menu shows it.")));
                on(pages, PatchFamily.KEEP_DELETED_MESSAGES).addPreference(clearEditsRow(context));
            }
        }
        if (build.contains(PatchFamily.ASK_BEFORE_STICKER)) {
            on(pages, PatchFamily.ASK_BEFORE_STICKER).addPreference(toggle(context, Settings.ASK_BEFORE_STICKER, L10n.t("Ask before sending a sticker"),
                    PatchFamily.ASK_BEFORE_STICKER.coverageSummary(L10n.t("Asks Send or Cancel before a sticker you tap goes into a chat. Cancel drops it. "
                            + "Scheduled stickers go out without asking."))));
            on(pages, PatchFamily.ASK_BEFORE_STICKER).addPreference(toggle(context, Settings.ASK_BEFORE_GIF, L10n.t("Ask before sending a GIF"),
                    PatchFamily.ASK_BEFORE_STICKER.coverageSummary(L10n.t("Asks Send or Cancel before a GIF you tap goes into a chat. Cancel drops it. "
                            + "Scheduled GIFs go out without asking."))));
            on(pages, PatchFamily.ASK_BEFORE_STICKER).addPreference(toggle(context, Settings.ASK_BEFORE_VOICE_VIDEO, L10n.t("Ask before sending a voice or video message"),
                    PatchFamily.ASK_BEFORE_STICKER.coverageSummary(L10n.t("Asks Send or Cancel before a voice or video message you recorded goes out. "
                            + "The recording pauses first, and Cancel leaves it paused, ready to play, delete or send."))));
            on(pages, PatchFamily.ASK_BEFORE_STICKER).addPreference(toggle(context, Settings.ASK_BEFORE_CALL, L10n.t("Ask before starting a call"),
                    PatchFamily.ASK_BEFORE_STICKER.coverageSummary(L10n.t("Asks Call or Cancel before the call button in a chat or on a profile starts a "
                            + "call."))));
        }
        if (build.contains(PatchFamily.OUTSIDE_TRANSLATE)) {
            SwitchPreference outside = toggle(context, Settings.OUTSIDE_TRANSLATE, L10n.t("Translate with an outside service"),
                    PatchFamily.OUTSIDE_TRANSLATE.coverageSummary(L10n.t("Adds Translate here to a message's menu and Translate this chat to a chat's menu, "
                            + "using the translation service you choose. The text you ask to translate is sent to that service, "
                            + "one message at a time. Nothing leaves your "
                            + "phone until you turn a chat or message on.") + " "
                            + L10n.t("A chat or message you turn on stays on only in the account you turned it on in.")));
            // Off means off: switching back on later starts with no chat or message turned on.
            outside.setOnPreferenceChangeListener((row, value) -> {
                if (Boolean.FALSE.equals(value)) OutsideTranslate.forgetChats();
                return true;
            });
            on(pages, PatchFamily.OUTSIDE_TRANSLATE).addPreference(outside);
            on(pages, PatchFamily.OUTSIDE_TRANSLATE).addPreference(translateServiceRow(context));
            on(pages, PatchFamily.OUTSIDE_TRANSLATE).addPreference(translateTargetRow(context));
        }
    }

    /** The Playback page: voice and video messages, and downloads. */
    private void addPlaybackPage(Context context, Map<PatchFamily.Page, PreferenceCategory> pages, Set<PatchFamily> build) {
        if (build.contains(PatchFamily.KEEP_VIDEOS_MUTED)) {
            on(pages, PatchFamily.KEEP_VIDEOS_MUTED).addPreference(toggle(context, Settings.KEEP_VIDEOS_MUTED, L10n.t("Keep videos muted on volume keys"),
                    PatchFamily.KEEP_VIDEOS_MUTED.coverageSummary(L10n.t("Volume keys only change the volume. They no longer start the video or round "
                            + "video on screen with sound. Tap a video to hear it."))));
            if (PatchFamily.Capability.VIDEO_EITHER_LANDSCAPE.installed()) {
                on(pages, PatchFamily.KEEP_VIDEOS_MUTED).addPreference(toggle(context, Settings.VIDEO_EITHER_LANDSCAPE,
                        L10n.t("Full screen videos turn either way"), L10n.t("After you tap full screen, a video follows"
                                + " your phone to either landscape side, even with auto-rotate off. Turning your phone"
                                + " upright doesn't end full screen. Tap the button to leave it.")));
            }
            if (PatchFamily.Capability.VIDEO_ONLY_FROM_BUTTON.installed()) {
                on(pages, PatchFamily.KEEP_VIDEOS_MUTED).addPreference(toggle(context, Settings.VIDEO_ONLY_FROM_BUTTON,
                        L10n.t("Turn videos only from the full screen button"), L10n.t("An open video stays upright when you"
                                + " turn your phone. It goes landscape only when you tap full screen, and back only when"
                                + " you tap the button again.")));
            }
        }
        if (build.contains(PatchFamily.VOICE_ONE_AT_A_TIME)) {
            on(pages, PatchFamily.VOICE_ONE_AT_A_TIME).addPreference(toggle(context, Settings.VOICE_ONE_AT_A_TIME, L10n.t("Play voice messages one at a time"),
                    PatchFamily.VOICE_ONE_AT_A_TIME.coverageSummary(L10n.t("When a voice or video message ends, the next one doesn't start by itself."))));
            if (PatchFamily.Capability.LOCKED_VOICE.installed()) {
                on(pages, PatchFamily.VOICE_ONE_AT_A_TIME).addPreference(toggle(context, Settings.LOCKED_VOICE_GUARD,
                        L10n.t("Keep voice messages quiet while locked"),
                        L10n.t("While your phone is locked, voice and round video messages don't start, resume or skip to the next one, "
                                + "whether from headphones, a car, the notification or the lock screen. One that's already playing "
                                + "finishes. Music and other videos play as usual.")));
            }
        }
        if (build.contains(PatchFamily.VOICE_MUSIC_PLAYER)) {
            on(pages, PatchFamily.VOICE_MUSIC_PLAYER).addPreference(toggle(context, Settings.VOICE_MUSIC_PLAYER, L10n.t("Voice messages in the music player"),
                    PatchFamily.VOICE_MUSIC_PLAYER.coverageSummary(L10n.t("While a voice message plays, tapping the bar above the chat opens the full music"
                            + " player, where you can drag to skip around, instead of jumping to the message."))));
        }
        if (build.contains(PatchFamily.FASTER_DOWNLOADS)) {
            on(pages, PatchFamily.FASTER_DOWNLOADS).addPreference(toggle(context, Settings.FASTER_DOWNLOADS, L10n.t("Faster downloads"),
                    PatchFamily.FASTER_DOWNLOADS.coverageSummary(L10n.t("Files download in 512 KB pieces, 8 at a time, instead of 128 KB pieces"
                            + " 4 at a time. If a big piece fails, Telegram goes back to small ones. The next download picks this up."))));
            if (PatchFamily.Capability.DATA_SAVER_DOWNLOADS.installed()) {
                SwitchPreference dataSaver = toggle(context, Settings.DATA_SAVER_DOWNLOADS,
                        L10n.t("Hold automatic downloads on Data Saver"), dataSaverSummary(DataSaverDownloads.status(context)));
                dataSaver.setOnPreferenceChangeListener((row, value) -> {
                    // Once the switch is saved, so Telegram's queue follows it now rather than at the next network change.
                    Utils.runOnMainThreadDelayed(DataSaverDownloads::switched, 0);
                    return true;
                });
                on(pages, PatchFamily.FASTER_DOWNLOADS).addPreference(dataSaver);
            }
        }
        if (build.contains(PatchFamily.SAVE_DOWNLOADS)) {
            on(pages, PatchFamily.SAVE_DOWNLOADS).addPreference(toggle(context, Settings.SAVE_DOWNLOADS, L10n.t("Save downloaded files"),
                    PatchFamily.SAVE_DOWNLOADS.coverageSummary(L10n.t("Each file or song you download also goes to Download/Telegram on your"
                            + " phone, where file managers and other apps can open it. Files from secret chats and chats that don't"
                            + " allow saving stay in Telegram."))));
            on(pages, PatchFamily.SAVE_DOWNLOADS).addPreference(toggle(context, Settings.SAVE_RESTRICTED_DOWNLOADS,
                    L10n.t("Also save from chats that don't allow saving"),
                    L10n.t("With Save downloaded files on, files from chats whose owner turned off saving get copied too. Only use"
                            + " it where the owner is fine with you keeping a copy, since it goes past their setting. Secret chats"
                            + " still stay in Telegram.")));
            on(pages, PatchFamily.SAVE_DOWNLOADS).addPreference(toggle(context, Settings.SAVE_TIMED_MEDIA,
                    L10n.t("Also save view-once and timed media"),
                    L10n.t("With Save downloaded files on, view-once and self-destructing photos, videos, voice and video"
                            + " messages get copied to Download/Telegram when they download. The sender meant them to disappear,"
                            + " so only use it where they're fine with you keeping a copy. Secret chats still stay in Telegram.")));
            if (PatchFamily.Capability.GALLERY_FOLDER.installed()) {
                on(pages, PatchFamily.SAVE_DOWNLOADS).addPreference(galleryFolderRow(context));
            }
            // Before Android 11 Telegram already keeps its files in Internal storage/Telegram.
            if (PatchFamily.Capability.STORAGE_FOLDER.installed() && Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                SwitchPreference storage = toggle(context, Settings.STORAGE_FOLDER,
                        L10n.t("Keep Telegram's files in internal storage"), storageFolderSummary(StorageFolder.allFilesAccess()));
                storage.setOnPreferenceChangeListener((row, value) -> {
                    if (Boolean.TRUE.equals(value) && !StorageFolder.allFilesAccess()) openAllFilesAccess(context);
                    return true;
                });
                on(pages, PatchFamily.SAVE_DOWNLOADS).addPreference(storage);
            }
        }
    }

    /** What the storage folder switch does, then whether Android gives Telegram the access it needs, read when the page shows. */
    static String storageFolderSummary(boolean access) {
        return L10n.t("New photos, videos and files Telegram downloads go to Internal storage/Telegram, where file managers"
                + " and other apps can open them, instead of Android/data. Files downloaded before stay in Android/data,"
                + " and Telegram still opens them from there. Needs All files access and a restart.")
                + "\n" + (access ? L10n.t("All files access is on.")
                : L10n.t("All files access is off, so Telegram's files stay in Android/data. Turning this on opens the setting."));
    }

    /** Android's All files access page for Telegram, or the list of every app's when that won't open. Opening either changes nothing. */
    static void openAllFilesAccess(Context context) {
        Intent app = new Intent(android.provider.Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION,
                Uri.parse("package:" + context.getPackageName()));
        Intent list = new Intent(android.provider.Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION);
        for (Intent intent : new Intent[]{app, list}) {
            try {
                context.startActivity(intent);
                return;
            } catch (ActivityNotFoundException | SecurityException exception) {
                Logger.printException(() -> "Could not open all files access", exception);
            }
        }
        Utils.showToastLong(L10n.t("Couldn't open All files access."));
    }

    /** The Notifications page: the status on this phone and the two push switches lead. */
    static String notificationSummary(FirebasePush.LocalStatus status) {
        return status.permissionLine() + "\n" + status.backgroundLine()
                + "\n" + L10n.f("Signed-in accounts: %1$s", status.activeAccounts < 0 ? L10n.t("Unknown") : status.activeAccounts)
                + "\n" + L10n.t("Tap for details and Android settings.");
    }

    /**
     * Whether the battery optimization list is where the person can let Telegram run. Before Android
     * 12, App info holds the background setting and only reaches battery optimization a few taps in,
     * so when only that applies, the list itself is the shorter way.
     */
    static boolean batteryListFirst(FirebasePush.LocalStatus status) {
        return Build.VERSION.SDK_INT < Build.VERSION_CODES.S && !Boolean.TRUE.equals(status.backgroundRestricted)
                && Boolean.TRUE.equals(status.batteryOptimized);
    }

    /** Android's battery optimization list, or App info when the list won't open. Opening either changes nothing. */
    static void openBatteryOptimization(Context context) {
        Intent list = new Intent(android.provider.Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS);
        Intent details = new Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                Uri.parse("package:" + context.getPackageName()));
        for (Intent intent : new Intent[]{list, details}) {
            try {
                context.startActivity(intent);
                return;
            } catch (ActivityNotFoundException | SecurityException exception) {
                Logger.printException(() -> "Could not open battery optimization", exception);
            }
        }
        Utils.showToastLong(L10n.t("Couldn't open battery optimization. Open Android settings."));
    }

    /** App info, where Android keeps an app's background setting, and from Android 12 its battery one. Opening it changes nothing. */
    static void openAppInfo(Context context) {
        try {
            context.startActivity(new Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                    Uri.parse("package:" + context.getPackageName())));
        } catch (ActivityNotFoundException | SecurityException exception) {
            Logger.printException(() -> "Could not open app info", exception);
            Utils.showToastLong(L10n.t("Couldn't open app info. Open Android settings."));
        }
    }

    void openNotificationSettings(Context context) {
        Intent notifications = new Intent(android.provider.Settings.ACTION_APP_NOTIFICATION_SETTINGS)
                .putExtra(android.provider.Settings.EXTRA_APP_PACKAGE, context.getPackageName());
        Intent details = new Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                Uri.parse("package:" + context.getPackageName()));
        for (Intent intent : new Intent[]{notifications, details}) {
            try {
                context.startActivity(intent);
                return;
            } catch (ActivityNotFoundException | SecurityException exception) {
                Logger.printException(() -> "Could not open notification settings", exception);
            }
        }
        Utils.showToastLong(L10n.t("Couldn't open notification settings. Open Android settings."));
    }

    private void addNotificationsPage(Context context, Map<PatchFamily.Page, PreferenceCategory> pages, Set<PatchFamily> build) {
        if (build.contains(PatchFamily.REPAIR_FIREBASE_PUSH)) {
            PreferenceCategory notifications = pages.get(PatchFamily.Page.NOTIFICATIONS);
            localNotificationStatus = new Row(context);
            localNotificationStatus.setTitle(L10n.t("Notification status on this phone"));
            localNotificationStatus.setPersistent(false);
            localNotificationStatus.setSummary(notificationSummary(FirebasePush.localStatus(context)));
            localNotificationStatus.setKey("local_notification_status");
            localNotificationStatus.setIcon(SettingsIcons.icon(context, SettingsIcons.ABOUT, ScreenColors.DEFAULT.heading));
            localNotificationStatus.setOnPreferenceClickListener(row -> {
                FirebasePush.LocalStatus status = FirebasePush.localStatus(context);
                AlertDialog.Builder details = new AlertDialog.Builder(themed(context))
                        .setTitle(L10n.t("Notification status on this phone"))
                        .setMessage(status.summary())
                        .setPositiveButton(L10n.t("Open notification settings"), (dialog, which) -> openNotificationSettings(context))
                        .setNegativeButton(L10n.t("Close"), null);
                // Only when Android holds Telegram back, and to the page where the person can change that.
                if (batteryListFirst(status)) {
                    details.setNeutralButton(L10n.t("Open battery optimization"), (dialog, which) -> openBatteryOptimization(context));
                } else if (status.androidLimitsBackground()) {
                    details.setNeutralButton(L10n.t("Open app info"), (dialog, which) -> openAppInfo(context));
                }
                show(details);
                return true;
            });
            notifications.addPreference(localNotificationStatus);
            notifications.addPreference(toggle(context, Settings.REPAIR_FIREBASE_PUSH, L10n.t("Repair Firebase push registration"),
                    PatchFamily.REPAIR_FIREBASE_PUSH.coverageSummary(L10n.t("Tries to help this patched Telegram sign up for push notifications with Firebase, "
                            + "Google's notification service, using Telegram's original certificate. Notification "
                            + "permission and battery settings still apply.") + " "
                            + L10n.t("A change here applies after Telegram restarts."))));
        }
        if (build.contains(PatchFamily.UNIFIED_PUSH)) {
            SwitchPreference push = toggle(context, Settings.UNIFIED_PUSH, L10n.t("UnifiedPush notifications"),
                    PatchFamily.UNIFIED_PUSH.coverageSummary(L10n.t("For phones where Firebase notifications don't arrive. Telegram signs up an "
                            + "address from a UnifiedPush app like ntfy, and Telegram's servers call it to wake Telegram when "
                            + "something arrives. The messages still come from Telegram itself. It also turns on Telegram's own "
                            + "Keep-Alive Service and Background Connection, unless you've set either one yourself. Turned "
                            + "off, Telegram goes back to Firebase the next time it starts.")));
            Preference app = pushAppRow(context);
            push.setOnPreferenceChangeListener((row, value) -> {
                boolean on = Boolean.TRUE.equals(value);
                UnifiedPush.switched(context, on);
                // The app answers in a moment, so the row reads its state again after.
                app.setSummary(UnifiedPush.status(context, on));
                Utils.runOnMainThreadDelayed(() -> {
                    // A page closed in the meantime has nothing to show it on.
                    if (isAdded()) app.setSummary(UnifiedPush.status(context, Settings.UNIFIED_PUSH.savedValue()));
                }, 2000);
                return true;
            });
            on(pages, PatchFamily.UNIFIED_PUSH).addPreference(push);
            on(pages, PatchFamily.UNIFIED_PUSH).addPreference(app);
            // Works with or without UnifiedPush, for builds where no push arrives at all.
            if (PatchFamily.Capability.REACTION_ALERTS.installed()) {
                on(pages, PatchFamily.UNIFIED_PUSH).addPreference(toggle(context, Settings.REACTION_ALERTS,
                        L10n.t("Reaction notifications without push"), L10n.t("Shows a notification when someone reacts to your"
                                + " message while Telegram is connected, even when no push arrives. A reaction that also"
                                + " comes by push shows once.")));
            }
            // Pushed reactions too: Telegram keeps every reaction notification silent.
            if (PatchFamily.Capability.REACTION_SOUND.installed()) {
                on(pages, PatchFamily.UNIFIED_PUSH).addPreference(toggle(context, Settings.REACTION_SOUND,
                        L10n.t("Sound for reaction notifications"), L10n.t("Telegram's reaction notifications make no sound."
                                + " Turned on, they play the sound and vibration set in Telegram's Notifications and Sounds"
                                + " > Reactions.")));
            }
        }
        if (build.contains(PatchFamily.SILENCE_NON_CONTACTS)) {
            on(pages, PatchFamily.SILENCE_NON_CONTACTS).addPreference(toggle(context, Settings.SILENCE_NON_CONTACTS, L10n.t("Silence people outside your contacts"),
                    PatchFamily.SILENCE_NON_CONTACTS.coverageSummary(L10n.t("Private messages from people not in your contacts still show a notification, but"
                            + " without sound or vibration. Bots, reminders and login codes keep their sound."))));
        }
        if (build.contains(PatchFamily.IGNORE_MUTED_MENTIONS)) {
            on(pages, PatchFamily.IGNORE_MUTED_MENTIONS).addPreference(toggle(context, Settings.IGNORE_MUTED_MENTIONS, L10n.t("Ignore mentions in muted chats"),
                    PatchFamily.IGNORE_MUTED_MENTIONS.coverageSummary(L10n.t("Mentions and replies in groups or channels you've muted no longer notify you. "
                            + "Chats you haven't muted notify as before."))));
        }
    }

    /**
     * The Look and feel page: theme, messages and stickers, profiles, touch, less clutter. Its first
     * row is the look of these settings themselves, which sits on Settings backup instead in a build
     * without the page.
     */
    private void addLookPage(Context context, Map<PatchFamily.Page, PreferenceCategory> pages, Set<PatchFamily> build) {
        PreferenceCategory look = pages.get(PatchFamily.Page.LOOK);
        if (look != null) look.addPreference(settingsLookRow(context));
        if (build.contains(PatchFamily.HIDE_RECOMMENDATIONS)) {
            on(pages, PatchFamily.HIDE_RECOMMENDATIONS).addPreference(toggle(context, Settings.HIDE_RECOMMENDATIONS, L10n.t("Hide recommendations"),
                    PatchFamily.HIDE_RECOMMENDATIONS.coverageSummary(L10n.t("Hides suggested similar channels and bots, including ones already saved, and "
                            + "stops asking Telegram for new ones."))));
            if (PatchFamily.Capability.KEYBOARD_FEATURED.installed()) {
                on(pages, PatchFamily.HIDE_RECOMMENDATIONS).addPreference(toggle(context, Settings.HIDE_KEYBOARD_FEATURED,
                        L10n.t("Hide trending packs"), L10n.t("The sticker keyboard's Trending tab and row and the emoji keyboard's "
                                + "trending packs go away, so both list only packs you've added. Search and the Stickers and Emoji "
                                + "screen still show them. A chat picks this up the next time you open it.")));
            }
        }
        if (build.contains(PatchFamily.QUIET_CONTACTS_NAG)) {
            on(pages, PatchFamily.QUIET_CONTACTS_NAG).addPreference(toggle(context, Settings.QUIET_CONTACTS_NAG, L10n.t("Quiet contacts prompts"),
                    PatchFamily.QUIET_CONTACTS_NAG.coverageSummary(L10n.t("After you say no to contacts access, the Contacts tab stops asking again and its"
                            + " warning badge goes away."))));
        }
        if (build.contains(PatchFamily.SHOW_LOCAL_IDS)) {
            on(pages, PatchFamily.SHOW_LOCAL_IDS).addPreference(toggle(context, Settings.SHOW_LOCAL_IDS, L10n.t("Show user and chat IDs"),
                    PatchFamily.SHOW_LOCAL_IDS.coverageSummary(L10n.t("Adds a copyable ID number for a user or chat to the profile's menu. Telegram "
                            + "isn't asked for anything extra."))));
            on(pages, PatchFamily.SHOW_LOCAL_IDS).addPreference(toggle(context, Settings.PROFILE_DATA_CENTER, L10n.t("Show where a profile photo is stored"),
                    L10n.t("A profile's menu also shows which of Telegram's five data centers (its server "
                            + "locations) stores the profile photo. No photo, no number.")));
        }
        if (build.contains(PatchFamily.HOLIDAY_LOOK)) {
            on(pages, PatchFamily.HOLIDAY_LOOK).addPreference(toggle(context, Settings.HOLIDAY_LOOK, L10n.t("New Year look all year"),
                    PatchFamily.HOLIDAY_LOOK.coverageSummary(L10n.t("Shows Telegram's Santa hat and New Year snow all year, not only around New Year."
                            + " Snow falls on the chat list's top bar and on chat backgrounds once Wallpaper rotation is on under Power Saving, in Effects in Chats."))));
            if (PatchFamily.Capability.TITLE_EMOJI.installed()) {
                on(pages, PatchFamily.HOLIDAY_LOOK).addPreference(titleEmojiRow(context));
            }
        }
        if (build.contains(PatchFamily.USE_SYSTEM_FONT)) {
            on(pages, PatchFamily.USE_SYSTEM_FONT).addPreference(toggle(context, Settings.USE_SYSTEM_FONT, L10n.t("Use system font"),
                    PatchFamily.USE_SYSTEM_FONT.coverageSummary(L10n.t("Bold, italic and code text use your phone's font instead of Telegram's built-in "
                            + "one. Restart Telegram to see the change."))));
        }
        if (build.contains(PatchFamily.AMOLED_BLACK)) {
            on(pages, PatchFamily.AMOLED_BLACK).addPreference(toggle(context, Settings.AMOLED_BLACK, L10n.t("AMOLED black"),
                    PatchFamily.AMOLED_BLACK.coverageSummary(L10n.t("Night and Dark themes use pure black screens. Message bubbles and menus keep "
                            + "their colors. Restart Telegram to see the change."))));
        }
        if (build.contains(PatchFamily.EXACT_NUMBERS)) {
            on(pages, PatchFamily.EXACT_NUMBERS).addPreference(toggle(context, Settings.EXACT_NUMBERS, L10n.t("Exact numbers"),
                    PatchFamily.EXACT_NUMBERS.coverageSummary(L10n.t("Member, subscriber, view, reply and reaction counts show in full, like 12,345 "
                            + "instead of 12.3K."))));
        }
        if (build.contains(PatchFamily.HIDE_KEYBOARD_ON_SCROLL)) {
            on(pages, PatchFamily.HIDE_KEYBOARD_ON_SCROLL).addPreference(toggle(context, Settings.HIDE_KEYBOARD_ON_SCROLL, L10n.t("Hide keyboard on scroll"),
                    PatchFamily.HIDE_KEYBOARD_ON_SCROLL.coverageSummary(L10n.t("The keyboard closes when you start scrolling a chat. The emoji and sticker panel"
                            + " stays open."))));
        }
        if (build.contains(PatchFamily.SWIPE_BACK_ON_PROFILES)) {
            on(pages, PatchFamily.SWIPE_BACK_ON_PROFILES).addPreference(toggle(context, Settings.SWIPE_BACK_ON_PROFILES, L10n.t("Swipe back on profiles"),
                    PatchFamily.SWIPE_BACK_ON_PROFILES.coverageSummary(L10n.t("Swiping right on a profile's photos or media tabs goes back, like the rest of "
                            + "the profile, instead of showing the previous photo or tab."))));
        }
        if (build.contains(PatchFamily.MESSAGE_SECONDS)) {
            on(pages, PatchFamily.MESSAGE_SECONDS).addPreference(toggle(context, Settings.MESSAGE_SECONDS, L10n.t("Message times with seconds"),
                    PatchFamily.MESSAGE_SECONDS.coverageSummary(L10n.t("Each message's time includes seconds, like 9:41:27 PM, so messages sent close "
                            + "together are easy to tell apart."))));
        }
        if (build.contains(PatchFamily.ALLOW_CHAT_BLUR)) {
            on(pages, PatchFamily.ALLOW_CHAT_BLUR).addPreference(toggle(context, Settings.ALLOW_CHAT_BLUR, L10n.t("Allow chat blur on slower phones"),
                    PatchFamily.ALLOW_CHAT_BLUR.coverageSummary(L10n.t("Telegram only blurs chat headers and panels on fast phones. This lets any phone "
                            + "do it, once Blur in chat is on under Power saving."))));
        }
        if (build.contains(PatchFamily.NO_HAPTICS)) {
            on(pages, PatchFamily.NO_HAPTICS).addPreference(toggle(context, Settings.NO_HAPTICS, L10n.t("Stop vibrations on taps"),
                    PatchFamily.NO_HAPTICS.coverageSummary(L10n.t("Taps, long presses, swipes and wrong entries no longer vibrate the phone. "
                            + "Incoming calls still vibrate, and notifications follow your own settings."))));
        }
        if (build.contains(PatchFamily.REACTION_EFFECTS_OFF)) {
            on(pages, PatchFamily.REACTION_EFFECTS_OFF).addPreference(toggle(context, Settings.REACTION_EFFECTS_OFF, L10n.t("Turn off reaction effects"),
                    PatchFamily.REACTION_EFFECTS_OFF.coverageSummary(L10n.t("When someone reacts to a message, the emoji doesn't fly across the screen and "
                            + "burst. The reaction still shows on the message."))));
        }
        if (build.contains(PatchFamily.HIDE_STICKER_TIME)) {
            on(pages, PatchFamily.HIDE_STICKER_TIME).addPreference(toggle(context, Settings.HIDE_STICKER_TIME, L10n.t("Hide time on stickers"),
                    PatchFamily.HIDE_STICKER_TIME.coverageSummary(L10n.t("Stickers and big animated emoji no longer show the time and read checks in their"
                            + " corner. Other messages keep their time."))));
        }
        if (build.contains(PatchFamily.CHANGE_STICKER_SIZE)) {
            PreferenceCategory page = on(pages, PatchFamily.CHANGE_STICKER_SIZE);
            page.addPreference(toggle(context, Settings.CHANGE_STICKER_SIZE, L10n.t("Change sticker size"),
                    PatchFamily.CHANGE_STICKER_SIZE.coverageSummary(L10n.t("Stickers in chats show at the size you pick below. "
                            + "Animated emoji and dice keep Telegram's size. A chat picks this up the next time you open it."))));
            page.addPreference(stickerSizeRow(context));
        }
        if (build.contains(PatchFamily.HIDE_CHANNEL_BUTTONS)) {
            on(pages, PatchFamily.HIDE_CHANNEL_BUTTONS).addPreference(toggle(context, Settings.HIDE_CHANNEL_BUTTONS, L10n.t("Hide channel bar buttons"),
                    L10n.t("Search, Direct messages and Info leave the bar at the bottom of a channel. "
                            + "Mute and Join stay, and tapping the channel's name at the top still opens its info. A channel picks "
                            + "this up the next time you open it.")));
            if (PatchFamily.Capability.HIDE_CHANNEL_MUTE.installed()) {
                on(pages, PatchFamily.HIDE_CHANNEL_BUTTONS).addPreference(toggle(context, Settings.HIDE_CHANNEL_MUTE,
                        L10n.t("Hide channel Mute button"), L10n.t("The bar at the bottom of a channel you've joined goes away, along with its "
                                + "Mute button and the Search and Info buttons beside it. Channels you haven't joined still show "
                                + "Join. To mute a channel, open its info. A channel picks this up the next time you open it.")));
            }
            if (PatchFamily.Capability.HIDE_CHANNEL_SHARE.installed()) {
                on(pages, PatchFamily.HIDE_CHANNEL_BUTTONS).addPreference(toggle(context, Settings.HIDE_CHANNEL_SHARE,
                        L10n.t("Hide channel share button"), L10n.t("The round share button beside channel posts goes away, in the "
                                + "channel and wherever a post is forwarded. A post's own menu still forwards it. Bots and Saved "
                                + "Messages keep theirs. A chat picks this up the next time you open it.")));
            }
        }
        if (build.contains(PatchFamily.HIDE_SEND_AS)) {
            on(pages, PatchFamily.HIDE_SEND_AS).addPreference(toggle(context, Settings.HIDE_SEND_AS, L10n.t("Hide Send as button"),
                    PatchFamily.HIDE_SEND_AS.coverageSummary(L10n.t("Your picture next to the message box goes away in groups and channels where you "
                            + "could post as a channel, while you're posting as yourself. Once you pick a channel it shows again, so you "
                            + "can always see who you're posting as. To pick one, turn this off first. A chat picks this up the next "
                            + "time you open it."))));
        }
        if (build.contains(PatchFamily.HIDE_FEATURES_AND_INVITE)) {
            on(pages, PatchFamily.HIDE_FEATURES_AND_INVITE).addPreference(toggle(context, Settings.HIDE_FEATURES_AND_INVITE, L10n.t("Hide Telegram Features and Invite Friends"),
                    PatchFamily.HIDE_FEATURES_AND_INVITE.coverageSummary(L10n.t("Removes the Telegram Features row from Settings and Invite Friends from "
                            + "Contacts. With no contacts yet, the invite list goes too."))));
        }
    }

    /** The Privacy page: the report and preview switches lead. */
    private void addPrivacyPage(Context context, Map<PatchFamily.Page, PreferenceCategory> pages, Set<PatchFamily> build) {
        if (build.contains(PatchFamily.DISABLE_ANALYTICS) || build.contains(PatchFamily.DISABLE_CALL_DEBUG)
                || build.contains(PatchFamily.DISABLE_DRAFT_PREVIEWS) || build.contains(PatchFamily.GALLERY_CAMERA_ON_TAP)) {
            PreferenceCategory privacy = pages.get(PatchFamily.Page.PRIVACY);
            if (build.contains(PatchFamily.DISABLE_ANALYTICS)) {
                privacy.addPreference(toggle(context, Settings.DISABLE_ANALYTICS, L10n.t("Stop usage reports"),
                    PatchFamily.DISABLE_ANALYTICS.coverageSummary(L10n.t("Stops usage reports to Telegram, like how long you read each channel post and what "
                            + "you tap on Premium screens. Messages and calls work as before."))));
                // Ghost mode and its parts: each part needs Ghost mode on, which starts off.
                if (PatchFamily.Capability.GHOST_MODE.installed()) {
                    privacy.addPreference(toggle(context, Settings.GHOST_MODE, L10n.t("Ghost mode"),
                            L10n.t("Read chats and watch stories without anyone being told. Sending a message in a chat still marks "
                                    + "it read, and your other devices keep showing it unread.")));
                    privacy.addPreference(toggle(context, Settings.GHOST_READS, L10n.t("No read receipts"),
                            L10n.t("Messages you read stay unread for the people who sent them, in private chats, groups and secret "
                                    + "chats, and voice messages you play stay unplayed. Works with Ghost mode on.")));
                    privacy.addPreference(toggle(context, Settings.GHOST_STORIES, L10n.t("View stories anonymously"),
                            L10n.t("Stories you watch don't add you to their viewer list. Works with Ghost mode on.")));
                    privacy.addPreference(toggle(context, Settings.GHOST_TYPING, L10n.t("Hide typing"),
                            L10n.t("Other people don't see that you're typing, recording or sending a file. Works with Ghost mode on.")));
                    privacy.addPreference(toggle(context, Settings.GHOST_ONLINE, L10n.t("Hide online status"),
                            L10n.t("Telegram isn't told that you're online while you use it. Going offline still goes out. Works with Ghost mode on.")));
                }
            }
            if (build.contains(PatchFamily.DISABLE_CALL_DEBUG)) {
                privacy.addPreference(toggle(context, Settings.DISABLE_CALL_DEBUG, L10n.t("Stop call diagnostics"),
                        PatchFamily.DISABLE_CALL_DEBUG.coverageSummary(L10n.t("Stops your phone from automatically sending call problem reports and log files "
                                + "when Telegram's server asks for them."))));
                // Off as shipped: saving a call is the user's choice, and the other person isn't asked.
                if (PatchFamily.Capability.CALL_RECORDING.installed()) {
                    privacy.addPreference(toggle(context, Settings.RECORD_CALLS, L10n.t("Record calls"),
                            L10n.f("Saves both sides of each call to %1$s on this phone. The other person isn't told.",
                                    L10n.isolate(CallRecorder.folder()))));
                }
                if (PatchFamily.Capability.CALL_RECORD_BUTTON.installed()) {
                    privacy.addPreference(toggle(context, Settings.RECORD_CALL_BUTTON, L10n.t("Record button on calls"),
                            L10n.t("A button on the call screen records just that call, or stops recording it when Record calls is on.")));
                }
            }
            if (build.contains(PatchFamily.DISABLE_DRAFT_PREVIEWS)) {
                privacy.addPreference(toggle(context, Settings.DISABLE_DRAFT_PREVIEWS, L10n.t("No previews before sending"),
                        PatchFamily.DISABLE_DRAFT_PREVIEWS.coverageSummary(L10n.t("Telegram doesn't look up link previews for messages you haven't sent yet, "
                                + "including shares, polls, story links and bots. Sent messages still get one."))));
                if (PatchFamily.Capability.LOCAL_DRAFTS.installed()) {
                    privacy.addPreference(toggle(context, Settings.LOCAL_DRAFTS, L10n.t("Keep drafts on this phone"),
                            L10n.t("A message you start but don't send stays on this phone and stops syncing to your other "
                                    + "devices. Clearing a draft still clears it there.") + " "
                                    + L10n.t("This covers every account in this Telegram app.")));
                }
                if (PatchFamily.Capability.LOCAL_SEARCH.installed()) {
                    privacy.addPreference(toggle(context, Settings.LOCAL_SEARCH, L10n.t("Keep searches on this phone"),
                            L10n.t("What you type in the main search isn't sent to Telegram, except in the Posts tab. The "
                                    + "Chats tab finds your chats and contacts on this phone, plus recent searches, but not "
                                    + "messages or public accounts. Channels, Apps, the media tabs and chat or date filters "
                                    + "don't search for typed text. Search inside a chat still goes to Telegram.")));
                }
            }
            if (build.contains(PatchFamily.GALLERY_CAMERA_ON_TAP)) {
                privacy.addPreference(toggle(context, Settings.GALLERY_CAMERA_ON_TAP, L10n.t("Camera only on tap"),
                        PatchFamily.GALLERY_CAMERA_ON_TAP.coverageSummary(L10n.t("Opening the attachment gallery doesn't start the camera or ask for camera "
                                + "access. Tap the camera tile to start it."))));
            }
        }
        if (build.contains(PatchFamily.HIDE_PHONE_NUMBER)) {
            on(pages, PatchFamily.HIDE_PHONE_NUMBER).addPreference(toggle(context, Settings.HIDE_PHONE_NUMBER, L10n.t("Hide phone number"),
                    PatchFamily.HIDE_PHONE_NUMBER.coverageSummary(L10n.t("Your own phone number shows as dots in Settings and your profile,"
                            + " which helps with screenshots. Others' numbers stay visible."))));
            if (PatchFamily.Capability.SHARE_NUMBER_UNTICKED.installed()) {
                on(pages, PatchFamily.HIDE_PHONE_NUMBER).addPreference(toggle(context, Settings.SHARE_NUMBER_UNTICKED,
                        L10n.t("Don't share my number by default"),
                        L10n.t("When you add someone as a contact from their chat, Telegram ticks the box that shares your phone "
                                + "number with them. With this on, the box starts clear and your number goes only if you tick it.")));
            }
        }
    }

    /** Links, in every build: the link switches, Supported links and how t.me links get here. */
    private void addLinksPage(Context context, PreferenceScreen screen, Set<PatchFamily> build) {
        // In every build: Telegram's own links are never verified for an app, so Android opens them
        // here only for the addresses selected on the app's Open by default page.
        PreferenceCategory links = category(screen, L10n.t("Links"));
        if (build.contains(PatchFamily.OPEN_EXTERNAL_LINKS)) {
            links.addPreference(mark(toggle(context, Settings.OPEN_EXTERNAL_LINKS, L10n.t("Open links externally"),
                    PatchFamily.OPEN_EXTERNAL_LINKS.coverageSummary(L10n.t("Opens normal web links in your browser. Telegram links, sign-in and payment pages "
                            + "keep working the way they did."))), SettingsIcons.LINKS));
            if (PatchFamily.Capability.MINI_APP_LOCATION.installed()) {
                links.addPreference(toggle(context, Settings.MINI_APP_LOCATION_OFF, L10n.t("Keep your location from Mini Apps"),
                        L10n.t("Mini Apps are told your phone's location isn't available, and web pages opened in Telegram are "
                                + "refused it. A page that already had it keeps it until you close it. Sites can still guess a "
                                + "rough area from your connection. Sending your location in a chat works as before.")));
            }
        }
        if (build.contains(PatchFamily.STRIP_LINK_TRACKING)) {
            links.addPreference(toggle(context, Settings.STRIP_LINK_TRACKING, L10n.t("Remove link tracking tags"),
                    PatchFamily.STRIP_LINK_TRACKING.coverageSummary(L10n.t("Removes tracking tags like utm_source, gclid and fbclid from links you open or "
                            + "share. A link with any other tag is left unchanged."))));
            if (PatchFamily.Capability.SKIP_AUTOLOGIN.installed()) {
                links.addPreference(toggle(context, Settings.SKIP_AUTOLOGIN, L10n.t("No automatic sign-in on Telegram's sites"),
                        L10n.t("Telegram adds a sign-in token for your account to links to some of its own websites. With this on, "
                                + "those links open without it, and you can sign in there yourself.")));
            }
        }
        links.addPreference(mark(supportedLinksRow(context), SettingsIcons.LINKS));
        // An explanation, not a control: the info mark says so, as it does for Version on About.
        links.addPreference(mark(info(context, L10n.t("Selecting links by hand"),
                L10n.t("Android opens t.me links in this Telegram app only if you select their addresses on its Open by "
                        + "default page. Other link settings don't change.")),
                SettingsIcons.ABOUT));
    }

    /** Updates: Telegram's own update check, the HushTelegram release check and Check now. */
    private void addUpdatesPage(Context context, PreferenceScreen screen, Set<PatchFamily> build) {
        // In every build: the release check is the settings entry's own, not a patch's. Its switch
        // is one Pause turns off, so it sits above the Pause row with the rest.
        PreferenceCategory updates = category(screen, L10n.t("Updates"));
        if (build.contains(PatchFamily.DISABLE_UPDATE_CHECKS)) {
            updates.addPreference(toggle(context, Settings.DISABLE_UPDATE_CHECKS, L10n.t("Turn off Telegram's update checks"),
                    L10n.t("Telegram stops offering updates from telegram.org. Those can't install over this patched "
                            + "build, so patch each new version in Morphe Manager instead.")));
        }
        updates.addPreference(toggle(context, Settings.CHECK_FOR_RELEASES, L10n.t("Check for new HushTelegram releases"),
                L10n.t("Once a day, when Telegram starts, checks GitHub for a newer HushTelegram and shows it at"
                        + " the top of these settings. Nothing is downloaded.")));
        updates.addPreference(mark(checkNowRow(context), SettingsIcons.UPDATES));
        ReleaseCheck.watch(this);
    }

    /**
     * Ways in (#29): which of the four ways open these settings. The last one on can't be turned off,
     * and the settings lock holds these switches like the rest. None of them needs a restart.
     */
    private void addRoutesPage(Context context, PreferenceScreen screen) {
        PreferenceCategory ways = category(screen, L10n.t("Ways in"));
        ways.addPreference(info(context, L10n.t("Ways to open these settings"),
                L10n.t("One way always stays on, so you can always get back here.")));
        ways.addPreference(routeToggle(context, SettingsRoutes.SETTINGS_ROW, L10n.t("Row in Telegram's Settings"),
                L10n.t("Adds a HushTelegram row to Telegram's Settings page.")));
        ways.addPreference(routeToggle(context, SettingsRoutes.TITLE_PRESS, L10n.t("Long press on the chat list title"),
                L10n.t("Hold the Telegram title at the top of your chats.")));
        ways.addPreference(routeToggle(context, SettingsRoutes.SIDE_MENU_ROW, L10n.t("Row in the side menu"),
                L10n.t("Adds a HushTelegram row to the side menu, which has its own switch.")));
        ways.addPreference(routeToggle(context, SettingsRoutes.SHORTCUT, L10n.t("Home screen shortcut"),
                L10n.t("Adds HushTelegram to the menu you get from holding Telegram's icon.")));
    }

    private static SwitchPreference routeToggle(Context context, BooleanSetting way, String title, String summary) {
        SwitchPreference preference = toggle(context, way, title, summary);
        preference.setOnPreferenceChangeListener((row, value) -> {
            if (Boolean.FALSE.equals(value) && SettingsRoutes.wouldBeTheLast(way)) {
                // The switch goes back on its own when the change is refused.
                Utils.showToastLong(L10n.t("Keep one way into HushTelegram settings"));
                return false;
            }
            if (way == SettingsRoutes.SHORTCUT) {
                // Once the switch is saved, so the launcher follows what it says.
                Utils.runOnMainThreadDelayed(() -> SettingsEntry.syncShortcut(context), 0);
            }
            return true;
        });
        return preference;
    }

    /** Pause, what it can't reach in this build, and the settings lock, which holds Pause too. */
    private void addPausePage(Context context, PreferenceScreen screen, Set<PatchFamily> build) {
        PreferenceCategory pause = category(screen, L10n.t("Pause"));
        pause.addPreference(mark(toggle(context, BaseSettings.PAUSED, L10n.t("Pause HushTelegram"),
                L10n.t("After Telegram restarts, every switch except Debug logging acts as if it were off. Your "
                        + "choices stay saved. Edits made when you patched stay in.")), SettingsIcons.PATCHED));
        String stays = PatchFamily.staysWhilePausedSummary(build);
        if (stays != null) pause.addPreference(mark(info(context, L10n.t(STAYS_WHILE_PAUSED), stays), SettingsIcons.ABOUT));
        pause.addPreference(mark(new LockRow(context), SettingsIcons.PRIVACY));
    }

    /** Settings backup: the switches to a file and back. */
    private void addBackupPage(Context context, PreferenceScreen screen, Set<PatchFamily> build) {
        PreferenceCategory backup = category(screen, L10n.t("Settings backup"));
        // Morphe Manager can export the patch choices and the signing key, not these switches.
        backup.addPreference(mark(new BackupRow(this, context, SettingsBackupPreference.EXPORT,
                L10n.t("Export settings"), exportSummary(build)),
                SettingsIcons.EXPORT));
        // The preview gives the count of the switches and each one by name.
        backup.addPreference(mark(new BackupRow(this, context, SettingsBackupPreference.IMPORT,
                L10n.t("Import settings"),
                L10n.t("Loads your switches, filter lists and sticker size from a saved file. You see what will "
                        + "change before anything is applied. It applies to all accounts.")), SettingsIcons.DOWNLOADS));
        backup.addPreference(mark(quickSetupsRow(context), SettingsIcons.TOOLS));
        if (!PatchFamily.Page.LOOK.inBuild(build)) backup.addPreference(settingsLookRow(context));
    }

    /**
     * What Export settings says it saves and what it leaves out. The left-out list follows
     * SettingsBackup's own decisions and names only what this build has, so the row never promises
     * a backup of Telegram itself or names a switch that isn't there.
     */
    static String exportSummary(Set<PatchFamily> build) {
        List<String> leftOut = new ArrayList<>(Arrays.asList(L10n.t("Pause HushTelegram"), L10n.t("Debug logging"),
                L10n.t("Check for new HushTelegram releases"), L10n.t("Lock HushTelegram settings"),
                L10n.t("Settings look")));
        if (build.contains(PatchFamily.UNIFIED_PUSH)) leftOut.add(L10n.t("UnifiedPush notifications"));
        if (build.contains(PatchFamily.CHAT_TYPE_FOLDERS)) leftOut.add(L10n.t("Folders by chat type"));
        if (build.contains(PatchFamily.OUTSIDE_TRANSLATE)) {
            leftOut.add(L10n.t("the translation service, its key and the chats you turned translation on for"));
        }
        return L10n.t("Saves your switches, filter lists, sticker size and chat list emoji to a file, for all the accounts "
                + "in this Telegram app. Your chats, drafts and kept messages aren't in it.") + " "
                + L10n.f("Left out of the file: %1$s.", L10n.join(leftOut));
    }

    /** Opens Quick setups: a set of switches in one tap, or every switch back the way it started. */
    private Preference quickSetupsRow(Context context) {
        Row row = new Row(context);
        row.setKey(SettingsNavigation.QUICK_SETUPS);
        row.setTitle(L10n.t("Quick setups"));
        row.setSummary(L10n.t("Turn on a set of switches in one tap, or put every switch back the way it started."));
        row.setPersistent(false);
        row.setOnPreferenceClickListener(ignored -> { showQuickSetups(); return true; });
        return row;
    }

    /**
     * Switches these pages between cards and plain rows with a thin line between them (#18). The
     * new summary redraws the list, and every row is painted again as it's drawn.
     */
    private static Preference settingsLookRow(Context context) {
        Row row = new Row(context);
        row.setKey(SettingsNavigation.SETTINGS_LOOK);
        row.setTitle(L10n.t("Settings look"));
        row.setSummary(settingsLookSummary());
        row.setPersistent(false);
        row.actsAtOnce = true;
        row.setOnPreferenceClickListener(p -> {
            SettingsNavigation.PLAIN_ROWS.save(!SettingsNavigation.PLAIN_ROWS.get());
            p.setSummary(settingsLookSummary());
            return true;
        });
        return row;
    }

    static String settingsLookSummary() {
        return SettingsNavigation.PLAIN_ROWS.get() ? L10n.t("Plain rows. Tap for cards.") : L10n.t("Cards. Tap for plain rows.");
    }

    /** Diagnostics: Debug logging, the report, and clearing what a report would hold. */
    private void addDiagnosticsPage(Context context, PreferenceScreen screen) {
        PreferenceCategory diagnostics = category(screen, L10n.t("Diagnostics"));
        // Debug logging also fills the exported report and turns on error toasts (Logger).
        diagnostics.addPreference(mark(toggle(context, BaseSettings.DEBUG, L10n.t("Debug logging"),
                L10n.t("Records what HushTelegram does and shows error messages, to help with a bug report. "
                        + "Leave it off for everyday use.")), SettingsIcons.BUG));
        // Both rows come without a title of their own: Hushfeed's gave them one from string
        // resources that Telegram's APK doesn't have, and untitled they showed as blank rows.
        ExportDiagnosticReportPreference export = new ExportRow(this, context);
        export.setTitle(L10n.t("Export diagnostic report"));
        export.setSummary(L10n.t("Copy a short report or save the full one to a file. The saved location is shown afterward. Links, IDs and sign-in details are "
                + "left out. Look it over before sharing."));
        diagnostics.addPreference(mark(export, SettingsIcons.LICENSE));
        ClearLogBufferPreference clear = new ClearRow(this, context);
        clear.setTitle(L10n.t("Clear diagnostic data"));
        clear.setClearAndUndoSummaries(L10n.t("Clears the activity log and patch checks that a report would include."),
                L10n.t("Diagnostic data cleared. Tap again to put it back."));
        diagnostics.addPreference(mark(clear, SettingsIcons.DELETE));
    }

    /** About: the version, accounts, source code and licenses. */
    private void addAboutPage(Context context, PreferenceScreen screen) {
        PreferenceCategory about = category(screen, L10n.t("About"));
        about.addPreference(mark(info(context, L10n.t("Version"), L10n.f("HushTelegram %1$s on Telegram %2$s",
                L10n.isolate(Utils.getPatchesReleaseVersion()), L10n.isolate(Utils.getAppVersionName()))), SettingsIcons.ABOUT));
        // Switches live in one application-wide store, while Telegram can hold several accounts.
        about.addPreference(mark(info(context, L10n.t("Accounts"), L10n.t("Every switch here applies to all the "
                + "accounts in this Telegram app, not only the one you have open.") + " "
                + L10n.t("A few things belong to the account you have open instead, and their descriptions say so.")),
                SettingsIcons.ABOUT));

        Preference source = new Row(context);
        source.setTitle(L10n.t("Source code and issues"));
        source.setSummary(SOURCE_ADDRESS);
        source.setPersistent(false);
        source.setOnPreferenceClickListener(p -> {
            try {
                startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(SOURCE_URL)));
            } catch (ActivityNotFoundException | SecurityException missing) {
                // No browser, or none switched on. Uncaught, Android's exception closed Telegram.
                Logger.printInfo(() -> "No app opened the source code link");
                Utils.showToastLong(L10n.f("Can't open the link. Go to %1$s.",
                        L10n.isolate(SOURCE_ADDRESS)));
            }
            return true;
        });
        about.addPreference(mark(source, SettingsIcons.OPENING));

        // Section 7b asks that its notice reach the person using the software, and a file in the
        // repository does not reach them.
        Preference licenses = new Row(context);
        licenses.setTitle(L10n.t("Licenses"));
        licenses.setSummary(L10n.t("The GPL-3.0 license, and credits for the projects HushTelegram is built on"));
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
    @Nullable
    private AlertDialog show(AlertDialog.Builder builder) {
        Activity activity = getActivity();
        if (getView() == null || activity == null || activity.isFinishing() || activity.isDestroyed()) return null;
        AlertDialog dialog = builder.show();
        ScreenColors.dialog(dialog);
        own(dialog);
        return dialog;
    }

    private void own(Dialog dialog) {
        shownDialogs.add(dialog);
        dialog.setOnDismissListener(shownDialogs::remove);
    }

    /** The dialogs with a save still on its way. Read and written on the main thread only. */
    private static final Set<Dialog> SAVING = Collections.newSetFromMap(new WeakHashMap<>());

    /**
     * Runs [write], the save one of [dialog]'s actions asked for, off the main thread and behind
     * every save asked for before it, then hands [then] whether it was saved. Until the answer is
     * back the dialog's actions wait dimmed and it can't be closed, so a second tap starts nothing.
     * A dialog that went with its page in the meantime is told nothing: there's no row left to show
     * it on. A save the worker has no room for counts as not saved.
     *
     * <p>While a settings import is writing, nothing is saved and the dialog stays as it is: the
     * import runs on another worker, so a save in between could be written over after it said it
     * was saved.
     *
     * @return whether the save started; false when it was held back for an import or one is already on its way
     */
    static boolean save(AlertDialog dialog, BooleanSupplier write, Consumer<Boolean> then) {
        if (AbstractPreferenceFragment.settingImportInProgress) {
            Utils.showToastLong(L10n.t("Wait for the settings import to finish, then save again."));
            return false;
        }
        if (!SAVING.add(dialog)) return false;
        reach(dialog, false);
        Consumer<Boolean> finish = saved -> {
            SAVING.remove(dialog);
            if (!dialog.isShowing()) return;
            reach(dialog, true);
            then.accept(saved);
        };
        boolean queued = Utils.runInOrderOnBackgroundThread(() -> {
            boolean saved = false;
            try {
                saved = write.getAsBoolean();
            } finally {
                boolean result = saved;
                Utils.runOnMainThread(() -> finish.accept(result));
            }
        });
        if (!queued) finish.accept(false);
        return true;
    }

    /** Puts [dialog]'s buttons and list, and the way out of it, in or out of reach. */
    private static void reach(AlertDialog dialog, boolean inReach) {
        dialog.setCancelable(inReach);
        for (View control : new View[]{dialog.getButton(AlertDialog.BUTTON_POSITIVE),
                dialog.getButton(AlertDialog.BUTTON_NEUTRAL), dialog.getButton(AlertDialog.BUTTON_NEGATIVE),
                dialog.getListView()}) {
            if (control == null) continue;
            control.setEnabled(inReach);
            // A dialog's actions are painted one colour whatever their state, so a waiting one is dimmed.
            control.setAlpha(inReach ? 1f : 0.5f);
        }
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
     * The first row: whether HushTelegram is on, and why not when it isn't. Paused by safe mode or
     * the marker file, a tap turns it back on from the next start.
     */
    private Preference statusCard(Context context) {
        Row card = new Row(context);
        card.setPersistent(false);
        boolean paused = HushTelegramPause.isPaused();
        ScreenColors palette = ScreenColors.DEFAULT;
        card.setIcon(SettingsIcons.icon(context, paused ? SettingsIcons.PAUSE : SettingsIcons.PATCHED,
                paused ? palette.summary : palette.heading));
        statusCard = card;
        if (!paused) {
            card.setTitle(L10n.t("HushTelegram is on"));
            card.setSelectable(false);
            showStatus(card, context);
            return card;
        }
        card.setTitle(L10n.t("HushTelegram is paused"));
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
        HushTelegramPause.Reason still = HushTelegramPause.turnBackOn(context);
        // The switch shows what was kept. Setting it to off here would write off through the
        // preference itself when the store had just refused to.
        Preference pause = findPreference(BaseSettings.PAUSED.key);
        if (pause instanceof SwitchPreference) ((SwitchPreference) pause).setChecked(BaseSettings.PAUSED.savedValue());
        if (still == HushTelegramPause.Reason.MARKER_FILE) {
            String file = L10n.isolate(HushTelegramPause.MARKER_FILE_NAME);
            String folder = L10n.isolate(markerFolder(context.getPackageName()));
            // The switches stay as they were until the file goes, so say when they still pause.
            String left = BaseSettings.PAUSED.savedValue() || BaseSettings.SAFE_MODE.savedValue()
                    ? L10n.f("The file %1$s couldn't be removed. Delete it from %2$s, then tap Resume again.", file, folder)
                    : L10n.f("The file %1$s couldn't be removed. Delete it from %2$s to turn HushTelegram back on.",
                    file, folder);
            statusCard.setSummary(left);
            // Resume can be tapped on a category page too, where the card isn't in view. The toast
            // holds the file name only, since the card has the folder.
            Utils.showToastLong(L10n.f("Couldn't remove %1$s. Delete it by hand.", file));
            return;
        }
        if (still != HushTelegramPause.Reason.NONE) {
            Utils.showToastLong(L10n.t("Couldn't turn HushTelegram back on. Try again."));
        }
        showStatus(statusCard, context);
    }

    /**
     * The card's line under its title: this start's state, and the next start's when a change on
     * this screen makes it differ. Pause switched on said "HushTelegram is on" and nothing more,
     * and Pause switched back on after a tap on the card still said it turns back on at restart.
     * A newer release the release check found goes on a line of its own under that, paused or
     * not: a newer release can be the fix for what a pause is working around.
     */
    private void showStatus(Preference card, Context context) {
        boolean pausedNext = HushTelegramPause.pausesNextStart(context);
        String status;
        if (!HushTelegramPause.isPaused()) {
            // The version lives on the About page. Here it pushed the line that matters below it.
            status = pausedNext ? L10n.t("HushTelegram pauses when Telegram restarts.")
                    : restartPending.isEmpty() ? L10n.t("Your switches are working.")
                    : L10n.t("A change here applies after Telegram restarts.");
        } else if (pausedNext) {
            status = pausedSummary(HushTelegramPause.reason(), context.getPackageName())
                    + " " + L10n.t("Tap to turn it back on.");
        } else {
            status = L10n.t("HushTelegram turns back on when Telegram restarts.");
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
     * The way out of Keep deleted messages: a tap hands every message it kept, in every signed-in
     * account, to Telegram's own deletion and says how many are on their way, then again how many
     * went once Telegram has deleted them. The tap is the whole request, so nothing asks first and
     * nothing opens.
     */
    private static Preference clearKeptRow(Context context) {
        Row row = new Row(context);
        row.setKey(CLEAR_KEPT);
        row.setPersistent(false);
        row.setTitle(L10n.t("Clear kept messages"));
        row.setSummary(L10n.t("Deletes the messages this phone kept after others deleted them, in every account, the way "
                + "Telegram would have."));
        row.actsAtOnce = true;
        row.setOnPreferenceClickListener(p -> {
            Utils.showToastLong(KeepDeleted.clearedMessage(KeepDeleted.clear()));
            return true;
        });
        return row;
    }

    /** Forgets every earlier text Keep edit history kept, in every account, and says how many messages had some. */
    private static Preference clearEditsRow(Context context) {
        Row row = new Row(context);
        row.setKey(CLEAR_EDITS);
        row.setPersistent(false);
        row.setTitle(L10n.t("Clear edit history"));
        row.setSummary(L10n.t("Forgets the earlier text this phone kept for edited messages, in every account."));
        row.actsAtOnce = true;
        row.setOnPreferenceClickListener(p -> {
            Utils.showToastLong(KeepEdits.clearedMessage(KeepEdits.clear()));
            return true;
        });
        return row;
    }

    /** The size stickers show at: the row says the one picked, and a tap lists the others. */
    private Preference stickerSizeRow(Context context) {
        Row row = new Row(context);
        row.setKey(STICKER_SIZE_ROW);
        row.setTitle(L10n.t("Sticker size"));
        row.setPersistent(false);
        row.setSummary(stickerSizeSummary());
        row.setOnPreferenceClickListener(p -> {
            showStickerSizes(context, p);
            return true;
        });
        return row;
    }

    /**
     * The choices with the saved one checked. A tap saves it and the list closes once it's saved;
     * a pick that can't be saved, or is held back while a settings import writes, leaves the list
     * open with what's saved by then checked again, which an import may have changed.
     */
    void showStickerSizes(Context context, Preference row) {
        if (SettingsLock.refuses()) return;
        CharSequence[] labels = new CharSequence[StickerSize.CHOICES.length];
        for (int i = 0; i < labels.length; i++) labels[i] = percent(StickerSize.CHOICES[i]);
        show(new AlertDialog.Builder(context)
                .setTitle(L10n.t("Sticker size"))
                .setSingleChoiceItems(labels, savedStickerChoice(), (dialog, which) -> {
                    boolean started = save((AlertDialog) dialog,
                            () -> Settings.STICKER_SIZE.saveCommitted(StickerSize.CHOICES[which]), landed -> {
                                if (landed) {
                                    row.setSummary(stickerSizeSummary());
                                    dialog.dismiss();
                                } else {
                                    checkSavedStickerSize((AlertDialog) dialog);
                                    Utils.showToastLong(L10n.t("Couldn't save the size. Try again in a moment."));
                                }
                            });
                    if (!started) checkSavedStickerSize((AlertDialog) dialog);
                })
                .setNegativeButton(L10n.t("Cancel"), null));
    }

    /** Where the saved sticker size sits among the choices. One that's none of them reads as the default. */
    static int savedStickerChoice() {
        int saved = StickerSize.percent(Settings.STICKER_SIZE.savedValue());
        for (int i = 0; i < StickerSize.CHOICES.length; i++) {
            if (StickerSize.CHOICES[i] == saved) return i;
        }
        return -1;
    }

    /** Checks the size saved now, read at the moment a pick is refused rather than when the list opened. */
    private static void checkSavedStickerSize(AlertDialog dialog) {
        dialog.getListView().setItemChecked(savedStickerChoice(), true);
    }

    static String stickerSizeSummary() {
        return L10n.f("%1$s of Telegram's size", percent(StickerSize.percent(Settings.STICKER_SIZE.savedValue())));
    }

    /** Where Save to gallery puts photos and videos: the row names the folders, and a tap lists the others. */
    private Preference galleryFolderRow(Context context) {
        Row row = new Row(context);
        row.setKey(GALLERY_FOLDER_ROW);
        row.setTitle(L10n.t("Gallery folder"));
        row.setPersistent(false);
        row.setSummary(galleryFolderSummary());
        row.setOnPreferenceClickListener(p -> {
            showGalleryFolders(context, p);
            return true;
        });
        return row;
    }

    /** The folder choices with the saved one checked, saved and closed the way the sticker sizes are. */
    void showGalleryFolders(Context context, Preference row) {
        if (SettingsLock.refuses()) return;
        CharSequence[] labels = new CharSequence[GalleryFolder.CHOICES.size()];
        for (int i = 0; i < labels.length; i++) labels[i] = galleryFolderLabel(GalleryFolder.CHOICES.get(i));
        show(new AlertDialog.Builder(context)
                .setTitle(L10n.t("Gallery folder"))
                .setSingleChoiceItems(labels, savedGalleryChoice(), (dialog, which) -> {
                    boolean started = save((AlertDialog) dialog,
                            () -> Settings.GALLERY_FOLDER.saveCommitted(GalleryFolder.CHOICES.get(which)), landed -> {
                                if (landed) {
                                    row.setSummary(galleryFolderSummary());
                                    dialog.dismiss();
                                } else {
                                    checkSavedGalleryFolder((AlertDialog) dialog);
                                    Utils.showToastLong(L10n.t("Couldn't save the folder. Try again in a moment."));
                                }
                            });
                    if (!started) checkSavedGalleryFolder((AlertDialog) dialog);
                })
                .setNegativeButton(L10n.t("Cancel"), null));
    }

    /** Where the saved folder choice sits in the list. One that's none of them reads as Telegram's. */
    static int savedGalleryChoice() {
        String saved = Settings.GALLERY_FOLDER.savedValue();
        return GalleryFolder.CHOICES.indexOf(GalleryFolder.allowed(saved) ? saved : GalleryFolder.TELEGRAM);
    }

    private static void checkSavedGalleryFolder(AlertDialog dialog) {
        dialog.getListView().setItemChecked(savedGalleryChoice(), true);
    }

    /**
     * A choice as the list, the row and an import preview name it, with anything that isn't one read
     * as Telegram's. The folder names are the ones on the phone and stay as they are.
     */
    static String galleryFolderLabel(String choice) {
        if (GalleryFolder.DCIM.equals(choice)) return "DCIM/Telegram";
        if (GalleryFolder.DCIM_APART.equals(choice)) return L10n.join(Arrays.asList("DCIM/Telegram/Photos", "DCIM/Telegram/Videos"));
        return L10n.t("Pictures/Telegram and Movies/Telegram (Telegram's own)");
    }

    static String galleryFolderSummary() {
        return L10n.f("Photos and videos you save to the gallery go to %1$s. Camera photos and automatic saving keep"
                + " Telegram's folders.", galleryFolderLabel(Settings.GALLERY_FOLDER.savedValue()));
    }

    /** The folder the chat list opens on for the account shown now: the row says which, and a tap lists the others. */
    private Preference launchFolderRow(Context context) {
        Row row = new Row(context);
        row.setKey(LAUNCH_FOLDER_ROW);
        row.setTitle(L10n.t("Folder to open"));
        row.setPersistent(false);
        row.setSummary(launchFolderSummary());
        row.setOnPreferenceClickListener(p -> {
            showLaunchFolders(context, p);
            return true;
        });
        return row;
    }

    /**
     * All Chats and the account's folders, with its pick checked. A tap saves it and the list closes
     * once it's saved; a pick that can't be saved leaves the list open with the saved one checked.
     */
    void showLaunchFolders(Context context, Preference row) {
        if (SettingsLock.refuses()) return;
        LaunchFolder.Shown shown = LaunchFolder.shown();
        if (shown == null) {
            Utils.showToastLong(L10n.t("Couldn't read your folders."));
            return;
        }
        if (shown.user == 0) {
            Utils.showToastLong(L10n.t("Sign in to Telegram first."));
            return;
        }
        List<LaunchFolder.Folder> folders = shown.folders;
        if (folders.isEmpty()) {
            Utils.showToastLong(L10n.t("You don't have any folders yet."));
            return;
        }
        CharSequence[] labels = new CharSequence[folders.size() + 1];
        labels[0] = L10n.t("All Chats");
        for (int i = 0; i < folders.size(); i++) labels[i + 1] = folders.get(i).name;
        show(new AlertDialog.Builder(context)
                .setTitle(L10n.t("Folder to open"))
                .setSingleChoiceItems(labels, shown.choice(), (dialog, which) -> {
                    LaunchFolder.Folder folder = which == 0 ? null : folders.get(which - 1);
                    boolean started = save((AlertDialog) dialog, () -> LaunchFolder.pick(shown.user, folder), landed -> {
                        if (landed) {
                            row.setSummary(launchFolderSummary());
                            dialog.dismiss();
                        } else {
                            ((AlertDialog) dialog).getListView().setItemChecked(savedChoice(shown), true);
                            Utils.showToastLong(L10n.t("Couldn't save the folder. Try again in a moment."));
                        }
                    });
                    if (!started) ((AlertDialog) dialog).getListView().setItemChecked(savedChoice(shown), true);
                })
                .setNegativeButton(L10n.t("Cancel"), null));
    }

    /** Where the saved pick sits in the list [shown] drew, read again after a pick that didn't land. */
    private static int savedChoice(LaunchFolder.Shown shown) {
        return shown.choiceOf(LaunchFolder.picked(shown.user));
    }

    /** The picked folder's name for the account shown now, or All Chats, for a pick that's gone too. */
    static String launchFolderSummary() {
        LaunchFolder.Shown shown = LaunchFolder.shown();
        int choice = shown == null ? 0 : shown.choice();
        return choice == 0 ? L10n.t("All Chats") : shown.folders.get(choice - 1).name;
    }

    /** What Hide All Chats does, and with it on, why the chat list kept All Chats when it did. */
    static String hideAllChatsSummary() {
        String summary = L10n.t("The folder tabs leave out All Chats, so the chat list opens on the folder picked above or "
                + "your first one. Archived Chats moves to the chat list's menu, and to the side menu when "
                + "that's on. Tabs can't be dragged into a new order while this is on. Restart Telegram to "
                + "see the change.");
        LaunchFolder.Kept kept = Settings.HIDE_ALL_CHATS.get() ? LaunchFolder.kept() : null;
        if (kept == null) return summary;
        String why;
        if (kept == LaunchFolder.Kept.NO_ARCHIVE) {
            // With the side menu in the build, it's off: Disable pull to archive is the other way in.
            why = PatchFamily.Capability.SIDE_MENU.installed()
                    ? L10n.t("All Chats is still showing because it holds your only way to Archived Chats. Turn on the "
                            + "side menu to give the archive another way in.")
                    : L10n.t("All Chats is still showing because it holds your only way to Archived Chats. Patch again "
                            + "with Disable pull to archive to give the archive another way in.");
        } else if (kept == LaunchFolder.Kept.NO_FOLDER) {
            why = L10n.t("All Chats is still showing because this account has no folder of its own to open, or each "
                    + "one is locked.");
        } else {
            why = L10n.t("All Chats is still showing because the folder tabs couldn't be read. The diagnostic report "
                    + "has the details.");
        }
        return summary + " " + why;
    }

    /** The chats hidden for the account shown now: the row names them, and a tap lists every chat to tick. */
    private Preference hiddenChatsRow(Context context) {
        Row row = new Row(context);
        row.setKey(HIDDEN_CHATS_ROW);
        row.setTitle(L10n.t("Chats to hide"));
        row.setPersistent(false);
        row.setSummary(hiddenChatsSummary(HiddenChats.shown()));
        row.setOnPreferenceClickListener(p -> {
            showHiddenChats(context, p);
            return true;
        });
        return row;
    }

    /**
     * The account's chats, archived ones too, with the hidden ones ticked. Save writes the ticks and
     * the list closes once they're saved; ticks that can't be saved leave the list open as it was.
     */
    void showHiddenChats(Context context, Preference row) {
        if (SettingsLock.refuses()) return;
        HiddenChats.Shown shown = HiddenChats.shown();
        if (shown == null) {
            Utils.showToastLong(L10n.t("Couldn't read your chats."));
            return;
        }
        if (shown.user == 0) {
            Utils.showToastLong(L10n.t("Sign in to Telegram first."));
            return;
        }
        List<HiddenChats.Chat> chats = shown.chats;
        if (chats.isEmpty()) {
            Utils.showToastLong(L10n.t("You don't have any chats yet."));
            return;
        }
        CharSequence[] labels = new CharSequence[chats.size()];
        for (int i = 0; i < chats.size(); i++) labels[i] = chats.get(i).name;
        boolean[] ticked = shown.ticked();
        AlertDialog dialog = show(new AlertDialog.Builder(context)
                .setTitle(L10n.t("Chats to hide"))
                .setMultiChoiceItems(labels, ticked, (d, which, checked) -> ticked[which] = checked)
                .setPositiveButton(L10n.t("Save"), null)
                .setNegativeButton(L10n.t("Cancel"), null));
        if (dialog == null) return;
        // Set here rather than on the builder, so a tap waits for the save instead of closing the list.
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            Set<Long> hide = new LinkedHashSet<>();
            for (int i = 0; i < ticked.length; i++) {
                if (ticked[i]) hide.add(chats.get(i).id);
            }
            save(dialog, () -> HiddenChats.hide(shown.user, hide), landed -> {
                if (landed) {
                    HiddenChats.refresh(shown.account);
                    row.setSummary(hiddenChatsSummary(HiddenChats.shown()));
                    dialog.dismiss();
                } else {
                    Utils.showToastLong(L10n.t("Couldn't save the chats. Try again in a moment."));
                }
            });
        });
    }

    /** The hidden chats' names for the account shown now, or that there are none. */
    static String hiddenChatsSummary(@Nullable HiddenChats.Shown shown) {
        List<String> names = new ArrayList<>();
        if (shown != null) {
            for (HiddenChats.Chat chat : shown.chats) {
                if (shown.hidden.contains(chat.id)) names.add(chat.name);
            }
        }
        return names.isEmpty() ? L10n.t("No chats hidden yet.") : TextUtils.join(", ", names);
    }

    /** What the Data Saver switch does, then what Android reports right now, read when the page opens. */
    static String dataSaverSummary(DataSaverDownloads.Status status) {
        String saver;
        switch (status.dataSaver) {
            case ON:
                saver = L10n.t("Android's Data Saver is on.");
                break;
            case OFF:
                saver = L10n.t("Android's Data Saver is off.");
                break;
            case ALLOWED:
                saver = L10n.t("Android's Data Saver is on, but Telegram may use data freely.");
                break;
            default:
                saver = L10n.t("Android doesn't say whether Data Saver is on.");
                break;
        }
        String metered = status.metered == null
                ? L10n.t("Android doesn't say whether this network is metered.")
                : status.metered ? L10n.t("This network is metered.") : L10n.t("This network isn't metered.");
        return L10n.t("While Android's Data Saver is on and the network is metered, Telegram doesn't start photos, videos,"
                + " files, voice messages, music or stories downloading on its own, and stops the ones in its download queue."
                + " What you tap still downloads.") + "\n" + saver + " " + metered;
    }

    /** A percent the way this language writes one. */
    private static String percent(int value) {
        return NumberFormat.getPercentInstance(L10n.locale()).format(value / 100.0);
    }

    /** One list of message filters: the row says how many it holds, and a tap opens the list to edit. */
    private Preference filtersRow(Context context, StringSetting list, String key, String title) {
        Row row = new Row(context);
        row.setKey(key);
        row.setTitle(title);
        row.setPersistent(false);
        row.setSummary(FilterEditor.summary(list));
        row.setOnPreferenceClickListener(p -> {
            Activity activity = getActivity();
            if (SettingsLock.refuses()) return true;
            if (activity != null && !activity.isFinishing() && !activity.isDestroyed()) own(FilterEditor.open(activity, p, list, title));
            return true;
        });
        return row;
    }

    /** The text beside the chat list's title: the row shows it, and a tap opens its editor. */
    private Preference titleEmojiRow(Context context) {
        Row row = new Row(context);
        row.setKey(TitleEmojiEditor.KEY);
        row.setTitle(L10n.t("Emoji next to the chat list title"));
        row.setPersistent(false);
        row.setSummary(TitleEmojiEditor.summary(Settings.TITLE_EMOJI.savedValue()));
        row.setOnPreferenceClickListener(p -> {
            Activity activity = getActivity();
            if (SettingsLock.refuses()) return true;
            if (activity != null && !activity.isFinishing() && !activity.isDestroyed()) {
                own(TitleEmojiEditor.open(activity, p, before -> titleEmojiSaved(activity, before)));
            }
            return true;
        });
        return row;
    }

    /** The chat list builds its title once, so a new text waits for a restart unless it's the one running. */
    private void titleEmojiSaved(Context context, String before) {
        if (noteRestartPending(Settings.TITLE_EMOJI, before)) showRestartDialog(context);
        else Utils.showToastShort(L10n.t("Saved."));
    }

    /** Where the outside translate sends text: the row names the service, and a tap opens its editor. */
    private Preference translateServiceRow(Context context) {
        Row row = new Row(context);
        row.setKey(TranslateServiceEditor.KEY);
        row.setTitle(L10n.t("Translation service"));
        row.setPersistent(false);
        row.setSummary(TranslateServiceEditor.summary(OutsideTranslate.service()));
        row.setOnPreferenceClickListener(p -> {
            Activity activity = getActivity();
            if (SettingsLock.refuses()) return true;
            if (activity != null && !activity.isFinishing() && !activity.isDestroyed()) own(TranslateServiceEditor.open(activity, p));
            return true;
        });
        return row;
    }

    /** The language the outside translate writes in: the row names it, and a tap lists every one with a search. */
    private Preference translateTargetRow(Context context) {
        Row row = new Row(context);
        row.setKey(TranslateTargetPicker.KEY);
        row.setTitle(L10n.t("Translate into"));
        row.setPersistent(false);
        row.setSummary(TranslateTargetPicker.summary(Settings.TRANSLATE_TARGET.savedValue()));
        row.setOnPreferenceClickListener(p -> {
            Activity activity = getActivity();
            if (SettingsLock.refuses()) return true;
            if (activity != null && !activity.isFinishing() && !activity.isDestroyed()) own(TranslateTargetPicker.open(activity, p));
            return true;
        });
        return row;
    }

    /**
     * The push app can end the sign-up, or be removed, while Telegram is in the background, so the
     * row reads its state again on the way back.
     */
    private void showPushApp() {
        if (getPreferenceScreen() == null) return;
        Preference row = findPreference(UnifiedPushPicker.KEY);
        if (row != null) row.setSummary(UnifiedPush.status(row.getContext(), Settings.UNIFIED_PUSH.savedValue()));
    }

    /** Which UnifiedPush app the sign-up goes to, and how it's going. Tapping it picks another app. */
    private Preference pushAppRow(Context context) {
        Row row = new Row(context);
        row.setKey(UnifiedPushPicker.KEY);
        row.setTitle(L10n.t("Push app"));
        row.setPersistent(false);
        row.setSummary(UnifiedPush.status(context, Settings.UNIFIED_PUSH.savedValue()));
        row.setOnPreferenceClickListener(p -> {
            Activity activity = getActivity();
            if (SettingsLock.refuses()) return true;
            if (activity != null && !activity.isFinishing() && !activity.isDestroyed()) {
                AlertDialog picker = UnifiedPushPicker.open(activity, p);
                if (picker != null) own(picker);
            }
            return true;
        });
        return row;
    }

    /**
     * What Android says about sending Telegram's web addresses here, and the way to its page for
     * them (Morphe Manager #1028). The page opens over Telegram, so the row reads the state again
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
        Utils.showToastLong(L10n.t("App settings didn't open. Try App info, then Open by default."));
    }

    /** The Ko-fi page, for a browser, in a task of its own so it never opens inside Telegram's. */
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
            // No browser, or none switched on. Uncaught, Android's exception closed Telegram.
            Logger.printInfo(() -> "No app opened the support link");
            Utils.showToastLong(L10n.f("Can't open the link. Go to %1$s.",
                    L10n.isolate(SUPPORT_ADDRESS)));
        }
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
     * Quick setups: Quiet, Privacy or Back to defaults, each changing its switches at once
     * ({@link QuickSetupKeys}), then a toast saying how many changed. A switch that needs a restart
     * brings up the restart row the way a tap on it would. After a choice that changed something,
     * a last card names those switches and puts them back ({@link QuickSetups#undo}).
     */
    void showQuickSetups() {
        Context context = getContext();
        if (context == null || SettingsLock.refuses()) return;
        List<Map<BooleanSetting, Boolean>> choices = Arrays.asList(
                QuickSetupKeys.quiet(), QuickSetupKeys.privacy(), QuickSetupKeys.defaults());
        List<CharSequence> names = new ArrayList<>(Arrays.asList(
                L10n.t("Quiet"), L10n.t("Privacy"), L10n.t("Back to defaults")));
        List<CharSequence> details = new ArrayList<>(Arrays.asList(
                L10n.t("Hides ads, suggestions, stories, promotions and nags."),
                L10n.t("Stops usage reports, strips tracking from links and covers your own phone number on screen."),
                L10n.t("Puts every feature switch back the way it started.")));
        QuickSetups.Outcome last = QuickSetups.last();
        PreferenceScreen screen = getPreferenceScreen();
        if (last != null && screen != null) {
            names.add(L10n.t("Undo the last setup"));
            details.add(undoDetail(screen, last, QuickSetups.writtenSince()));
        }
        AlertDialog dialog = show(new AlertDialog.Builder(themed(context))
                .setTitle(L10n.t("Quick setups"))
                .setAdapter(new ChoiceCards(ScreenColors.DEFAULT, names.toArray(new CharSequence[0]),
                                details.toArray(new CharSequence[0])),
                        (shown, which) -> {
                            if (which < choices.size()) applyQuickSetup(choices.get(which));
                            else undoQuickSetup();
                        })
                .setNegativeButton(L10n.t("Cancel"), null));
        ListView list = dialog == null ? null : dialog.getListView();
        if (list != null) {
            // The cards bring their own spacing and press ripple, as in the diagnostic report's choices.
            list.setDivider(null);
            list.setSelector(ChoiceCards.Card.focusRing(dialog.getContext(), ScreenColors.DEFAULT));
            list.setDrawSelectorOnTop(true);
        }
    }

    /**
     * Applies one Quick setups choice to the switches on this page and says how many changed,
     * pointing at the undo when something did, how many couldn't change when nothing did, or that
     * they were already set that way.
     */
    int applyQuickSetup(Map<BooleanSetting, Boolean> values) {
        PreferenceScreen screen = getPreferenceScreen();
        if (screen == null || SettingsLock.refuses()) return 0;
        QuickSetups.Outcome outcome = QuickSetups.apply(screen, values);
        int changed = outcome.changed.size();
        if (changed > 0) {
            Utils.showToastLong(L10n.quantity(changed, "Changed %1$d setting. Undo it from Quick setups.",
                    "Changed %1$d settings. Undo them from Quick setups.", changed));
        } else if (outcome.refused > 0) {
            Utils.showToastLong(L10n.quantity(outcome.refused, "Nothing changed. %1$d switch couldn't change now.",
                    "Nothing changed. %1$d switches couldn't change now.", outcome.refused));
        } else {
            // "Changed 0 settings" read like something had failed.
            Utils.showToastLong(L10n.t("Already set that way."));
        }
        return changed;
    }

    /** Puts back what the last Quick setups choice changed, through the rows, and says how many went back. */
    int undoQuickSetup() {
        PreferenceScreen screen = getPreferenceScreen();
        if (screen == null || SettingsLock.refuses()) return 0;
        int back = QuickSetups.undo(screen);
        Utils.showToastLong(L10n.quantity(back, "Put back %1$d switch", "Put back %1$d switches", back));
        return back;
    }

    /**
     * The undo card's text: what the last choice turned on and off, by the rows' titles, how many it
     * found set already or couldn't change, how many were changed again since, and that only switches
     * go back.
     */
    static String undoDetail(PreferenceGroup screen, QuickSetups.Outcome last, int writtenSince) {
        List<String> on = new ArrayList<>();
        List<String> off = new ArrayList<>();
        for (Map.Entry<BooleanSetting, Boolean> change : last.changed.entrySet()) {
            Preference row = screen.findPreference(change.getKey().key);
            if (row == null || row.getTitle() == null) continue;
            (change.getValue() ? on : off).add(String.valueOf(row.getTitle()));
        }
        List<String> parts = new ArrayList<>();
        if (!on.isEmpty()) parts.add(L10n.f("Turned on: %1$s.", L10n.join(on)));
        if (!off.isEmpty()) parts.add(L10n.f("Turned off: %1$s.", L10n.join(off)));
        if (last.already > 0) {
            parts.add(L10n.quantity(last.already, "%1$d other switch was already set.",
                    "%1$d other switches were already set.", last.already));
        }
        if (last.refused > 0) {
            parts.add(L10n.quantity(last.refused, "%1$d switch couldn't change.",
                    "%1$d switches couldn't change.", last.refused));
        }
        if (writtenSince > 0) {
            parts.add(L10n.quantity(writtenSince, "%1$d switch you changed since stays as you set it.",
                    "%1$d switches you changed since stay as you set them.", writtenSince));
        }
        parts.add(L10n.t("Only switches go back. Anything a switch already cleared, like chats' translate "
                + "choices, stays cleared."));
        return String.join(" ", parts);
    }

    /**
     * Why this start runs paused, what a pause does and doesn't reach, and that nothing the reader
     * saved has changed.
     */
    static String pausedSummary(HushTelegramPause.Reason reason, String packageName) {
        String why;
        switch (reason) {
            case CRASH_LOOP:
                // Only a crash, a native crash or a hang counts toward safe mode (HushTelegramPause).
                why = L10n.t("Telegram crashed or froze within a minute of starting three times in a row, so "
                        + "HushTelegram paused itself.");
                break;
            case MARKER_FILE:
                why = L10n.f("A file named %1$s in %2$s paused HushTelegram.",
                        L10n.isolate(HushTelegramPause.MARKER_FILE_NAME), L10n.isolate(markerFolder(packageName)));
                break;
            default:
                why = L10n.t("You paused HushTelegram.");
                break;
        }
        return why + " " + L10n.t("Every switch except Debug logging acts as if it were off. Your choices stay saved. "
                + "Edits made when you patched stay in.");
    }

    /**
     * Where the marker file goes, the way a file manager shows it: the app's own files folder, not
     * the folder above it, which is the one a person finds first.
     */
    static String markerFolder(String packageName) {
        return "Android/data/" + packageName + "/files";
    }

    /**
     * The theme every row and dialog on this screen is built with, over Telegram's own: dark
     * Material, which the black page reads on whatever the host activity's theme is.
     */
    static Context themed(Context base) {
        // Telegram mirrors its own widgets and disables framework RTL in its manifest. Only
        // these platform settings views opt in; the host's ApplicationInfo stays untouched.
        return new ContextThemeWrapper(base, ScreenColors.THEME) {
            private final android.content.pm.ApplicationInfo info =
                    new android.content.pm.ApplicationInfo(base.getApplicationInfo());
            { info.flags |= android.content.pm.ApplicationInfo.FLAG_SUPPORTS_RTL; }
            @Override public android.content.pm.ApplicationInfo getApplicationInfo() { return info; }
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

    /** The page is black in every Telegram theme (the AMOLED rule), so a confirm over it is dark too. */
    @Override
    protected boolean alwaysDark() {
        return true;
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

    /** The page a family's rows go on: only asked for a family in this build, so its page is drawn. */
    private static PreferenceCategory on(Map<PatchFamily.Page, PreferenceCategory> pages, PatchFamily family) {
        return pages.get(PatchFamily.Page.of(family));
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
     * Long words break where their language hyphenates them.
     */
    static void showAllText(View row) {
        TextView title = row.findViewById(android.R.id.title);
        if (title != null) {
            title.setSingleLine(false);
            title.setMaxLines(Integer.MAX_VALUE);
            L10n.hyphenate(title);
        }
        TextView summary = row.findViewById(android.R.id.summary);
        if (summary != null) {
            summary.setMaxLines(Integer.MAX_VALUE);
            L10n.hyphenate(summary);
        }
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
    static class Row extends Preference implements ImmediateAction {
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
     * The settings lock's row on the Pause page (#17). Its title and line are read from the lock
     * each time they're asked for, so the page, search and the time left always say where it
     * stands. A tap locks, starts the unlock's wait or cancels it, and a note says which.
     */
    static final class LockRow extends Row {
        LockRow(Context context) {
            super(context);
            setKey(SettingsNavigation.LOCK);
            setPersistent(false);
            // A tap does what the title says at once, so the row goes without a chevron.
            actsAtOnce = true;
            setOnPreferenceClickListener(ignored -> {
                Utils.showToastLong(SettingsLock.advance());
                // The page draws again, with the new title and line.
                notifyChanged();
                return true;
            });
        }

        @Override
        public CharSequence getTitle() {
            return SettingsLock.title(SettingsLock.state());
        }

        @Override
        public CharSequence getSummary() {
            return SettingsLock.summary(SettingsLock.state());
        }
    }

    /** A switch row, which a screen reader calls a switch and reads as on or off. */
    static final class Toggle extends SwitchPreference {
        Toggle(Context context) {
            super(context);
        }

        @Override
        protected View onCreateView(ViewGroup parent) {
            return ScreenColors.switchRow(getContext());
        }

        /**
         * A tap on the row or its switch asks here first. While the settings are locked the switch
         * stays as it is and a note says why, with two exceptions ({@link SettingsLock#exempts}).
         */
        @Override
        protected boolean callChangeListener(Object newValue) {
            if (!SettingsLock.exempts(getKey(), newValue) && SettingsLock.refuses()) return false;
            return super.callChangeListener(newValue);
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            View icon = view.findViewById(android.R.id.icon);
            if (icon != null && icon.getParent() instanceof View) {
                ((View) icon.getParent()).setVisibility(getIcon() == null ? View.GONE : View.VISIBLE);
            }
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Switch.class));
        }
    }

    static final class ExportRow extends ExportDiagnosticReportPreference {
        private final HushTelegramPreferenceFragment page;

        ExportRow(HushTelegramPreferenceFragment page, Context context) {
            super(context);
            this.page = page;
        }

        @Override
        protected boolean canStartExport() {
            Activity activity = page.getActivity();
            return page.getView() != null && activity != null && !activity.isFinishing() && !activity.isDestroyed();
        }

        /** The three choices as cards, each saying what it does under its name. */
        @Override
        protected ListAdapter choices(Context dialogContext) {
            ScreenColors colors = ScreenColors.DEFAULT;
            return new ChoiceCards(colors,
                    new CharSequence[]{L10n.t(getContext(), "Copy quick report"),
                            L10n.t(getContext(), "Save full report"), L10n.t(getContext(), "Preview the report")},
                    new CharSequence[]{L10n.t(getContext(), "Copy a short report to the clipboard."),
                            L10n.t(getContext(), "Save the full report to a file. The saved location is shown afterward."),
                            L10n.t(getContext(), "See the report first and leave out any part you'd rather not share, "
                                    + "then copy or save it.")});
        }

        /**
         * The screen's colours, before the dialog is shown so its first layout measures them. The
         * cards bring their own spacing and press ripple, so the list draws no divider and, under
         * a finger, no highlight of its own over them. A keyboard's place shows as a ring. The
         * preview's text and boxes take the screen's colours too.
         */
        @Override
        protected void onDialogCreated(AlertDialog dialog) {
            page.own(dialog);
            ListView list = dialog.getListView();
            if (list != null) {
                list.setDivider(null);
                list.setSelector(ChoiceCards.Card.focusRing(dialog.getContext(), ScreenColors.DEFAULT));
                list.setDrawSelectorOnTop(true);
            }
            ScreenColors.dialog(dialog);
            View preview = dialog.getWindow() == null ? null
                    : dialog.getWindow().getDecorView().findViewWithTag(ExportDiagnosticReportPreference.PREVIEW_TAG);
            if (preview instanceof ViewGroup) paintPreview((ViewGroup) preview, ScreenColors.DEFAULT);
        }

        private static void paintPreview(ViewGroup preview, ScreenColors colors) {
            for (int i = 0; i < preview.getChildCount(); i++) {
                View child = preview.getChildAt(i);
                if (child instanceof android.widget.CheckBox) {
                    ((android.widget.CheckBox) child).setTextColor(colors.title);
                    ((android.widget.CheckBox) child).setButtonTintList(android.content.res.ColorStateList.valueOf(colors.accent));
                } else if (child instanceof TextView) {
                    ((TextView) child).setTextColor(colors.summary);
                }
            }
        }

        @Override
        protected void onBindView(View view) {
            super.onBindView(view);
            showAllText(view);
            ScreenColors.row(view, this);
            view.setAccessibilityDelegate(new RowSemantics(this, Button.class));
            // While a report is built a screen reader hears the row as unavailable, and this says
            // why. Older versions read the summary, which shows the same line.
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.R) {
                view.setStateDescription(isBusy() ? getSummary() : null);
            }
        }
    }

    static final class ClearRow extends ClearLogBufferPreference {
        private final HushTelegramPreferenceFragment page;

        ClearRow(HushTelegramPreferenceFragment page, Context context) {
            super(context);
            this.page = page;
        }

        @Override
        protected boolean isOwned() {
            Activity activity = page.getActivity();
            return page.getView() != null && activity != null && !activity.isFinishing() && !activity.isDestroyed();
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
        BackupRow(HushTelegramPreferenceFragment page, Context context, int action, String title, String summary) {
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
     * A dialog's choice card has no preference behind it, and is always there to tap.
     */
    static class RowSemantics extends View.AccessibilityDelegate {
        @Nullable private final Preference preference;
        private final Class<? extends View> role;

        RowSemantics(@Nullable Preference preference, Class<? extends View> role) {
            this.preference = preference;
            this.role = role;
        }

        private boolean tappable() {
            return preference == null || preference.isEnabled();
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
            if (tappable() && !info.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK)) {
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
            if (action == AccessibilityNodeInfo.ACTION_CLICK && list != null && tappable()) {
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
        return L10n.t(context, "HushTelegram settings couldn't open");
    }
}
