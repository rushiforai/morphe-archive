/*
 * Forked from:
 * https://github.com/SysAdminDoc/hushfeed/blob/bcc57ee555f4346c4eb1cbdae9f6ca8a3fa6fef4/extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/SettingsBackup.java
 * Copyright 2026 Hushfeed contributors (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026: an exact list of the switches in place of every
 * setting, no Feature Gate Lab, reset, undo or journal, an import read into a preview before
 * anything is written, and a refusal of its own for a name given twice.
 */
package app.morphe.extension.facebook.settings;

import android.os.Bundle;

import androidx.annotation.Nullable;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;

import app.morphe.extension.facebook.comments.CommentOrder;
import app.morphe.extension.facebook.download.DownloadQuality;
import app.morphe.extension.facebook.download.FileNameTemplate;
import app.morphe.extension.facebook.download.SaveFolder;
import app.morphe.extension.facebook.download.SaveTo;
import app.morphe.extension.facebook.download.SendLink;
import app.morphe.extension.facebook.feed.PostWords;
import app.morphe.extension.facebook.media.PlaybackQuality;
import app.morphe.extension.facebook.navigation.StartTab;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.EnumSetting;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.SettingsJson;
import app.morphe.extension.shared.settings.StringSetting;

/**
 * Hushfacebook's switches as a file, and back.
 *
 * <p>Morphe Manager can export the patches that were picked and the signing key. It can't see the
 * switches, which live in Facebook's own data, so a reinstall or a new phone started them all
 * over. This writes them to a JSON file the person chooses and reads one back.
 *
 * <p>Only the switches in {@link #ALLOWLIST} and the settings in {@link #VALUES} (the word
 * filter's two lists, the top folder saves go to, the save folder, the save quality, the video
 * file name, what a tap on Download does, the app links go to, the tab Facebook opens on, the
 * order comments open in and the quality videos play at) go out or come in. Pause, safe mode, the
 * debug settings, the app language and the counters Hushfacebook keeps for itself stay out, and so
 * do the log, the diagnostic data and anything about the person or the phone: a file is a format
 * name, a version number, one true or false per switch, two word lists, one top folder, one folder
 * name, one save quality, one file name template, one download action, one package name or none,
 * one tab, one comment order and one playback quality. The word lists go only into the file the
 * person picks, with the rest. An import applies what it read in one preference commit. A file
 * that is too large, isn't JSON, names something twice, holds a value of the wrong type, a word
 * list that isn't one clean list, a folder or a template that isn't one clean name, an app that
 * isn't a package name, or a top folder, quality, download action, tab or comment order this build
 * doesn't offer, or comes from a newer version changes nothing.
 * <p>The release check stays out of the file: it puts the phone online, so it's switched on
 * from the phone's own screen, never by a file.
 *
 * <p>Call the file and preference work on a worker thread.
 */
public final class SettingsBackup {
    /** Far more than a settings file needs: one is a few hundred bytes. */
    public static final int MAX_BYTES = 64 * 1024;
    public static final String FORMAT = "hushfacebook-settings";
    /** The file shape this build writes and the newest it reads. A file declaring more is refused. */
    static final int SCHEMA = 1;

    static final String FORMAT_NAME = "format";
    static final String SCHEMA_NAME = "schema";
    static final String SETTINGS_NAME = "settings";

    /**
     * The switches a file carries, and the only settings an import can write: every feature
     * switch, and nothing of Hushfacebook's own. A switch added to {@link Settings} stays out
     * until someone decides it belongs here, and SettingsBackupTest fails until they do.
     */
    static final List<BooleanSetting> ALLOWLIST = Collections.unmodifiableList(Arrays.asList(
            Settings.HIDE_SPONSORED_POSTS,
            Settings.HIDE_PROMOTED_POSTS,
            Settings.HIDE_SUGGESTED_POSTS,
            Settings.HIDE_SUGGESTED_FOR_YOU,
            Settings.HIDE_PEOPLE_YOU_MAY_KNOW,
            Settings.HIDE_SUGGESTED_GROUPS,
            Settings.HIDE_STORIES_YOU_MIGHT_LIKE,
            Settings.HIDE_STORIES_TRAY,
            Settings.HIDE_FEED_REELS,
            Settings.BLOCK_RETURN_REFRESH,
            Settings.RETURN_REFRESH_NO_LIMIT,
            Settings.HIDE_AI_DETECTED_POSTS,
            Settings.HIDE_AI_LABELLED_POSTS,
            Settings.HIDE_AI_DETECTED_REELS,
            Settings.HIDE_POSTS_WITH_WORDS,
            Settings.HIDE_POST_PROMPTS,
            Settings.HIDE_META_AI_QUESTIONS,
            Settings.KEEP_POST_DATES,
            Settings.HIDE_FEEDS_HEADER,
            Settings.HIDE_SPONSORED_STORIES,
            Settings.HIDE_SUGGESTED_STORIES,
            Settings.HIDE_CONTACT_IMPORT_CARD,
            Settings.BLOCK_STORY_AUTO_ADVANCE,
            Settings.VIEW_STORIES_ANONYMOUSLY,
            Settings.HIDE_SPONSORED_REELS,
            Settings.HIDE_SPONSORED_SEARCH_RESULTS,
            Settings.HIDE_SPONSORED_PROFILE_POSTS,
            Settings.HIDE_SPONSORED_MARKETPLACE_LISTINGS,
            Settings.HIDE_AFFILIATE_LINKS,
            Settings.HIDE_REEL_CHIPS,
            Settings.HIDE_REEL_FOLLOW_BUTTON,
            Settings.HIDE_REEL_SOCIAL_FOOTER,
            Settings.DONT_SEND_REEL_WATCH_HISTORY,
            Settings.TURN_OFF_DOUBLE_TAP_LIKE,
            Settings.KEEP_REEL_SPEED,
            Settings.HOLD_REEL_FOR_2X,
            Settings.DEFAULT_COMMENT_ORDER,
            Settings.TAG_SUGGESTIONS_ONLY_AFTER_AT,
            Settings.TAP_TO_PLAY,
            Settings.RESUME_LONG_VIDEOS,
            Settings.DEFAULT_PLAYBACK_QUALITY,
            Settings.USE_SYSTEM_FONT,
            Settings.USE_SYSTEM_EMOJI,
            Settings.OPEN_LINKS_EXTERNALLY,
            Settings.SANITIZE_SHARING_LINKS,
            Settings.STOP_UPDATE_PROMPTS,
            Settings.DOWNLOAD_STORIES,
            Settings.DOWNLOAD_REELS,
            Settings.DOWNLOAD_VIDEOS,
            Settings.DOWNLOAD_COMPATIBLE,
            Settings.OPEN_ON_CHOSEN_TAB,
            Settings.MARKETPLACE_ONLY,
            Settings.MARKETPLACE_QUIET_NOTIFICATIONS,
            Settings.MARKETPLACE_SKIP_FEED_PREFETCH,
            Settings.HIDE_REELS_TAB,
            Settings.HIDE_REELS_TAB_DOT,
            Settings.BOTTOM_TAB_BAR,
            Settings.HIDE_REEL_PROMPTS,
            Settings.HIDE_GET_MESSENGER_CARD,
            Settings.OPEN_MESSENGER_APP,
            Settings.HIDE_MENU_UPGRADES,
            Settings.HIDE_MENU_ALSO_FROM_META,
            Settings.HIDE_META_AI_IN_SEARCH,
            Settings.BLOCK_TRENDING_VIDEO_NOTIFICATIONS,
            Settings.BLOCK_MEMORY_NOTIFICATIONS,
            Settings.BLOCK_BIRTHDAY_NOTIFICATIONS,
            Settings.BLOCK_HIGHLIGHT_NOTIFICATIONS,
            Settings.BLOCK_PEOPLE_YOU_MAY_KNOW_NOTIFICATIONS,
            Settings.BLOCK_NEARBY_NOTIFICATIONS));

    /**
     * The word filter's two lists, held in a file exactly as the settings row stores them: one
     * phrase per line within {@link PostWords}' bounds. A value {@link PostWords#clean} would change
     * refuses the whole file, as a switch that isn't true or false does, so a file can't slip in a
     * list longer or looser than the row allows.
     */
    static final StringSetting HIDDEN = Settings.HIDDEN_WORDS;
    static final StringSetting KEPT = Settings.KEPT_WORDS;

    /**
     * The top folder saves go to, held in a file as its {@link SaveTo#fileValue}. Anything else
     * refuses the whole file, as a quality does. Saves already made stay where they are.
     */
    static final EnumSetting<SaveTo> TO = Settings.SAVE_TO;

    /**
     * The one setting a file carries that isn't a switch: the folder saves go to. A file holds it
     * as the clean folder name the saves use, and an import takes nothing else there. A value
     * {@link SaveFolder#sanitize} would change refuses the whole file, as a switch that isn't true
     * or false does, so a file can't point the saves at a path. A character this phone doesn't know
     * yet, from a newer Android, counts as an ordinary one ({@link SaveFolder#isImportable}), and
     * the folder taken is the name the saves here will use.
     */
    static final StringSetting FOLDER = Settings.SAVE_FOLDER;

    /**
     * The quality video saves ask for, held in a file as its {@link DownloadQuality#fileValue}.
     * Anything but one of those refuses the whole file, as a switch that isn't true or false does.
     */
    static final EnumSetting<DownloadQuality> QUALITY = Settings.DOWNLOAD_QUALITY;

    /**
     * The name saved videos get, held in a file as the clean template the saves use and taken back
     * only as one, like the folder ({@link FileNameTemplate#isImportable}).
     */
    static final StringSetting FILE_NAME = Settings.FILENAME_TEMPLATE;

    /**
     * What a tap on Download does, held in a file as its {@link SendLink.Action#fileValue}.
     * Anything else refuses the whole file, as a quality does.
     */
    static final EnumSetting<SendLink.Action> ACTION = Settings.DOWNLOAD_ACTION;

    /**
     * The app links are sent to, held in a file as the package name they really go to, or blank
     * for Android's chooser ({@link SendLink#fileApp}), and taken back only as one of those, so a
     * file can't slip in a name the row would turn down.
     */
    static final StringSetting APP = Settings.SEND_TO_APP;

    /**
     * The tab a start from the launcher icon opens on, held in a file as its
     * {@link StartTab#fileValue}. Anything else refuses the whole file, as a quality does.
     */
    static final EnumSetting<StartTab> START = Settings.START_TAB;

    /**
     * The order comment sheets ask for, held in a file as its {@link CommentOrder#fileValue}.
     * Anything else refuses the whole file, as a tab does.
     */
    static final EnumSetting<CommentOrder> ORDER = Settings.COMMENT_ORDER;

    /**
     * The quality videos play at, held in a file as its {@link PlaybackQuality#fileValue}. Anything
     * else refuses the whole file, as a comment order does.
     */
    static final EnumSetting<PlaybackQuality> PLAYBACK = Settings.PLAYBACK_QUALITY;

    /** The settings a file carries that aren't switches, in the order Settings declares them. */
    static final List<Setting<?>> VALUES = Collections.unmodifiableList(
            Arrays.<Setting<?>>asList(HIDDEN, KEPT, TO, FOLDER, QUALITY, FILE_NAME, ACTION, APP, START, ORDER,
                    PLAYBACK));

    /** The longest name or value a file holds that isn't a word list, far past a package name. */
    private static final int MAX_OTHER_CHARS = 1024;

    /**
     * The longest string a file can hold, in Java chars: a word list at its longest, which a file
     * carries whole, or any other name or value.
     */
    static final int MAX_STRING_CHARS = Math.max(PostWords.MAX_STORED_CHARS, MAX_OTHER_CHARS);

    /**
     * Bounds for the parser. A string may be as long as the longest this class writes, and the
     * rest are well past anything it writes, so a file built to be expensive to read is refused
     * before it is.
     */
    private static final SettingsJson.Limits LIMITS = new SettingsJson.Limits(8, 1024, MAX_STRING_CHARS, 256, MAX_BYTES);

    /** Written by some editors at the start of a UTF-8 file. It isn't part of the JSON. */
    private static final String BYTE_ORDER_MARK = String.valueOf((char) 0xFEFF);

    private SettingsBackup() {
    }

    /**
     * Why a file was refused. Each one reaches the person as its own sentence: a download that
     * stopped halfway, a file from a newer Hushfacebook and a photo picked by mistake call for
     * different things.
     */
    public enum Reason {
        /** Larger than any settings file. */
        SIZE,
        /** Not UTF-8 text at all. */
        ENCODING,
        /** Text that isn't one JSON object, which is what a part-finished download is. */
        DAMAGED,
        /** A name given twice in one object, so which of its values was meant can't be told. */
        DUPLICATE,
        /** JSON, but not a Hushfacebook settings file, or one whose version isn't a version. */
        FORMAT,
        /** A settings file from a newer Hushfacebook, in a shape this build doesn't know. */
        SCHEMA,
        /** A switch whose value isn't true or false. */
        VALUE,
        /** The file couldn't be opened or read to the end. */
        UNREADABLE
    }

    /** A file refused before anything was written. */
    public static final class Rejected extends Exception {
        public final Reason reason;

        Rejected(Reason reason, String message) {
            super(message);
            this.reason = reason;
        }
    }

    /** A write that failed. Whether the switches are all back as they were is known and said. */
    public static final class ApplyFailed extends Exception {
        public final boolean rolledBack;

        ApplyFailed(boolean rolledBack, Throwable cause) {
            super(cause.getClass().getSimpleName(), cause);
            this.rolledBack = rolledBack;
        }
    }

    /**
     * What a file says: a value for each switch it names, the folder, the quality, the file name,
     * the start tab, the comment order, the playback quality, the download action, the app links go
     * to and the top folder when it names them, and how many other names it holds.
     */
    public static final class Snapshot {
        private static final String SWITCHES = "switches";
        private static final String UNKNOWN = "unknown";
        private static final String FOLDER_NAME = "folder";
        private static final String QUALITY_NAME = "quality";
        private static final String FILE_NAME_NAME = "file_name";
        private static final String START_NAME = "start_tab";
        private static final String ORDER_NAME = "comment_order";
        private static final String HIDDEN_NAME = "hidden_words";
        private static final String KEPT_NAME = "kept_words";
        private static final String PLAYBACK_NAME = "playback_quality";
        private static final String ACTION_NAME = "download_action";
        private static final String APP_NAME = "send_to_app";
        private static final String TO_NAME = "save_to";

        /** In {@link #ALLOWLIST} order, and only the switches the file named. */
        final Map<BooleanSetting, Boolean> values;
        /** The clean folder name the file holds, or null when it names none. */
        @Nullable
        final String folder;
        /** The save quality the file holds, or null when it names none. */
        @Nullable
        final DownloadQuality quality;
        /** The clean file name template the file holds, or null when it names none. */
        @Nullable
        final String fileName;
        /** The tab Facebook opens on that the file holds, or null when it names none. */
        @Nullable
        final StartTab start;
        /** The order comments open in that the file holds, or null when it names none. */
        @Nullable
        final CommentOrder order;
        /** The clean list of words to hide the file holds, or null when it names none. */
        @Nullable
        final String hidden;
        /** The clean list of words that keep a post the file holds, or null when it names none. */
        @Nullable
        final String kept;
        /** The quality videos play at that the file holds, or null when it names none. */
        @Nullable
        final PlaybackQuality playback;
        /** What a tap on Download does that the file holds, or null when it names none. */
        @Nullable
        final SendLink.Action action;
        /** The package name links go to that the file holds, blank for Android's chooser, or null when it names none. */
        @Nullable
        final String app;
        /** The top folder saves go to that the file holds, or null when it names none. */
        @Nullable
        final SaveTo to;
        /** Names the file holds that aren't settings this build knows. They're left out. */
        final int unknown;

        Snapshot(Map<BooleanSetting, Boolean> values, @Nullable String folder, @Nullable DownloadQuality quality,
                 @Nullable String fileName, @Nullable StartTab start, @Nullable CommentOrder order, int unknown) {
            this(values, folder, quality, fileName, start, order, null, null, unknown);
        }

        Snapshot(Map<BooleanSetting, Boolean> values, @Nullable String folder, @Nullable DownloadQuality quality,
                 @Nullable String fileName, @Nullable StartTab start, @Nullable CommentOrder order,
                 @Nullable String hidden, @Nullable String kept, int unknown) {
            this(values, folder, quality, fileName, start, order, hidden, kept, null, unknown);
        }

        Snapshot(Map<BooleanSetting, Boolean> values, @Nullable String folder, @Nullable DownloadQuality quality,
                 @Nullable String fileName, @Nullable StartTab start, @Nullable CommentOrder order,
                 @Nullable String hidden, @Nullable String kept, @Nullable PlaybackQuality playback, int unknown) {
            this(values, folder, quality, fileName, start, order, hidden, kept, playback, null, null, unknown);
        }

        Snapshot(Map<BooleanSetting, Boolean> values, @Nullable String folder, @Nullable DownloadQuality quality,
                 @Nullable String fileName, @Nullable StartTab start, @Nullable CommentOrder order,
                 @Nullable String hidden, @Nullable String kept, @Nullable PlaybackQuality playback,
                 @Nullable SendLink.Action action, @Nullable String app, int unknown) {
            this(values, folder, quality, fileName, start, order, hidden, kept, playback, action, app, null, unknown);
        }

        Snapshot(Map<BooleanSetting, Boolean> values, @Nullable String folder, @Nullable DownloadQuality quality,
                 @Nullable String fileName, @Nullable StartTab start, @Nullable CommentOrder order,
                 @Nullable String hidden, @Nullable String kept, @Nullable PlaybackQuality playback,
                 @Nullable SendLink.Action action, @Nullable String app, @Nullable SaveTo to, int unknown) {
            this.values = Collections.unmodifiableMap(values);
            this.folder = folder;
            this.quality = quality;
            this.fileName = fileName;
            this.start = start;
            this.order = order;
            this.hidden = hidden;
            this.kept = kept;
            this.playback = playback;
            this.action = action;
            this.app = app;
            this.to = to;
            this.unknown = unknown;
        }

        /**
         * The settings whose saved value this file changes, the switches first. Saved, not what a
         * paused Facebook is answered: a file holds what the person chose.
         */
        Map<Setting<?>, Object> changes() {
            Map<Setting<?>, Object> changes = new LinkedHashMap<>();
            for (Map.Entry<BooleanSetting, Boolean> entry : values.entrySet()) {
                if (!entry.getValue().equals(entry.getKey().savedValue())) {
                    changes.put(entry.getKey(), entry.getValue());
                }
            }
            SaveTo toChange = toChange();
            if (toChange != null) changes.put(TO, toChange);
            String folderChange = folderChange();
            if (folderChange != null) changes.put(FOLDER, folderChange);
            DownloadQuality qualityChange = qualityChange();
            if (qualityChange != null) changes.put(QUALITY, qualityChange);
            String fileNameChange = fileNameChange();
            if (fileNameChange != null) changes.put(FILE_NAME, fileNameChange);
            StartTab startChange = startChange();
            if (startChange != null) changes.put(START, startChange);
            CommentOrder orderChange = orderChange();
            if (orderChange != null) changes.put(ORDER, orderChange);
            String hiddenChange = hiddenChange();
            if (hiddenChange != null) changes.put(HIDDEN, hiddenChange);
            String keptChange = keptChange();
            if (keptChange != null) changes.put(KEPT, keptChange);
            PlaybackQuality playbackChange = playbackChange();
            if (playbackChange != null) changes.put(PLAYBACK, playbackChange);
            SendLink.Action actionChange = actionChange();
            if (actionChange != null) changes.put(ACTION, actionChange);
            String appChange = appChange();
            if (appChange != null) changes.put(APP, appChange);
            return changes;
        }

        /** How many switches this file changes, the number the preview and the toast give. */
        int switchChanges() {
            int count = 0;
            for (Map.Entry<BooleanSetting, Boolean> entry : values.entrySet()) {
                if (!entry.getValue().equals(entry.getKey().savedValue())) count++;
            }
            return count;
        }

        /**
         * The folder name this file moves the saves to, or null when it names none or the one the
         * saves already use.
         */
        @Nullable
        String folderChange() {
            if (folder == null) return null;
            return folder.equals(SaveFolder.sanitize(FOLDER.savedValue())) ? null : folder;
        }

        /** The quality this file sets, or null when it names none or the one saves already use. */
        @Nullable
        DownloadQuality qualityChange() {
            return quality == null || quality == QUALITY.savedValue() ? null : quality;
        }

        /** The template this file sets, or null when it names none or the one saves already use. */
        @Nullable
        String fileNameChange() {
            if (fileName == null) return null;
            return fileName.equals(FileNameTemplate.sanitize(FILE_NAME.savedValue())) ? null : fileName;
        }

        /** The start tab this file sets, or null when it names none or the one already set. */
        @Nullable
        StartTab startChange() {
            return start == null || start == START.savedValue() ? null : start;
        }

        /** The comment order this file sets, or null when it names none or the one already set. */
        @Nullable
        CommentOrder orderChange() {
            return order == null || order == ORDER.savedValue() ? null : order;
        }

        /** The playback quality this file sets, or null when it names none or the one already set. */
        @Nullable
        PlaybackQuality playbackChange() {
            return playback == null || playback == PLAYBACK.savedValue() ? null : playback;
        }

        /** The top folder this file sends saves to, or null when it names none or the one already set. */
        @Nullable
        SaveTo toChange() {
            return to == null || to == TO.savedValue() ? null : to;
        }

        /** The download action this file sets, or null when it names none or the one already set. */
        @Nullable
        SendLink.Action actionChange() {
            return action == null || action == ACTION.savedValue() ? null : action;
        }

        /**
         * The app this file sends links to, blank for Android's chooser, or null when it names none
         * or the one links already go to.
         */
        @Nullable
        String appChange() {
            if (app == null) return null;
            return app.equals(SendLink.fileApp(APP.savedValue())) ? null : app;
        }

        /** The list of words to hide this file sets, or null when it names none or the one already set. */
        @Nullable
        String hiddenChange() {
            return listChange(hidden, HIDDEN);
        }

        /** The list of words that keep a post this file sets, or null when it names none or the one already set. */
        @Nullable
        String keptChange() {
            return listChange(kept, KEPT);
        }

        @Nullable
        private static String listChange(@Nullable String list, StringSetting setting) {
            if (list == null) return null;
            return list.equals(PostWords.clean(setting.savedValue())) ? null : list;
        }

        /** For the settings page's saved state, so a preview outlives the page being rebuilt. */
        Bundle toBundle() {
            Bundle switches = new Bundle();
            for (Map.Entry<BooleanSetting, Boolean> entry : values.entrySet()) {
                switches.putBoolean(entry.getKey().key, entry.getValue());
            }
            Bundle state = new Bundle();
            state.putBundle(SWITCHES, switches);
            if (folder != null) state.putString(FOLDER_NAME, folder);
            if (quality != null) state.putString(QUALITY_NAME, quality.fileValue);
            if (fileName != null) state.putString(FILE_NAME_NAME, fileName);
            if (start != null) state.putString(START_NAME, start.fileValue);
            if (order != null) state.putString(ORDER_NAME, order.fileValue);
            if (hidden != null) state.putString(HIDDEN_NAME, hidden);
            if (kept != null) state.putString(KEPT_NAME, kept);
            if (playback != null) state.putString(PLAYBACK_NAME, playback.fileValue);
            if (action != null) state.putString(ACTION_NAME, action.fileValue);
            if (app != null) state.putString(APP_NAME, app);
            if (to != null) state.putString(TO_NAME, to.fileValue);
            state.putInt(UNKNOWN, unknown);
            return state;
        }

        /**
         * The snapshot a page saved, or null when there's none or it isn't one. Only switches on
         * the list come back, whatever the bundle holds.
         */
        @Nullable
        @SuppressWarnings("deprecation") // Bundle.get is how a value's type is checked below API 33.
        static Snapshot fromBundle(@Nullable Bundle state) {
            if (state == null) return null;
            Bundle switches = state.getBundle(SWITCHES);
            int unknown = state.getInt(UNKNOWN, -1);
            if (switches == null || unknown < 0) return null;
            Map<BooleanSetting, Boolean> values = new LinkedHashMap<>();
            for (BooleanSetting setting : ALLOWLIST) {
                Object value = switches.get(setting.key);
                if (value instanceof Boolean) values.put(setting, (Boolean) value);
            }
            Object folder = state.get(FOLDER_NAME);
            Object fileName = state.get(FILE_NAME_NAME);
            Object hidden = state.get(HIDDEN_NAME);
            Object kept = state.get(KEPT_NAME);
            Object app = state.get(APP_NAME);
            return new Snapshot(values, folder instanceof String && SaveFolder.isClean((String) folder)
                    ? (String) folder : null, DownloadQuality.fromFile(state.get(QUALITY_NAME)),
                    fileName instanceof String && FileNameTemplate.isClean((String) fileName) ? (String) fileName : null,
                    StartTab.fromFile(state.get(START_NAME)), CommentOrder.fromFile(state.get(ORDER_NAME)),
                    hidden instanceof String && PostWords.isClean((String) hidden) ? (String) hidden : null,
                    kept instanceof String && PostWords.isClean((String) kept) ? (String) kept : null,
                    PlaybackQuality.fromFile(state.get(PLAYBACK_NAME)), SendLink.Action.fromFile(state.get(ACTION_NAME)),
                    SendLink.isFileApp(app) ? (String) app : null, SaveTo.fromFile(state.get(TO_NAME)), unknown);
        }
    }

    /**
     * The file for the switches as they're saved now. Saved rather than what a paused Facebook is
     * answered, so exporting while paused keeps what the person chose.
     */
    public static String create() throws JSONException {
        JSONObject switches = new JSONObject();
        for (BooleanSetting setting : ALLOWLIST) {
            switches.put(setting.key, setting.savedValue().booleanValue());
        }
        switches.put(TO.key, TO.savedValue().fileValue);
        // The name the saves use, so a file never carries one an import would refuse.
        switches.put(FOLDER.key, SaveFolder.sanitize(FOLDER.savedValue()));
        switches.put(QUALITY.key, QUALITY.savedValue().fileValue);
        switches.put(FILE_NAME.key, FileNameTemplate.sanitize(FILE_NAME.savedValue()));
        switches.put(START.key, START.savedValue().fileValue);
        switches.put(ORDER.key, ORDER.savedValue().fileValue);
        switches.put(PLAYBACK.key, PLAYBACK.savedValue().fileValue);
        switches.put(ACTION.key, ACTION.savedValue().fileValue);
        // The app links really go to, so a file never carries a name an import would refuse.
        switches.put(APP.key, SendLink.fileApp(APP.savedValue()));
        // The lists the filter reads, so a file never carries one an import would refuse.
        switches.put(HIDDEN.key, PostWords.clean(HIDDEN.savedValue()));
        switches.put(KEPT.key, PostWords.clean(KEPT.savedValue()));
        return new JSONObject()
                .put(FORMAT_NAME, FORMAT)
                .put(SCHEMA_NAME, SCHEMA)
                .put(SETTINGS_NAME, switches)
                .toString(2);
    }

    /**
     * A file as text, read no further than {@link #MAX_BYTES}, so a huge file or a stream that
     * never ends is refused without being held in memory.
     */
    static String read(@Nullable InputStream input) throws Rejected {
        if (input == null) throw new Rejected(Reason.UNREADABLE, "No stream to read");
        byte[] bytes;
        try (InputStream stream = input; ByteArrayOutputStream buffered = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            int count;
            while ((count = stream.read(buffer)) != -1) {
                if (buffered.size() + count > MAX_BYTES) {
                    throw new Rejected(Reason.SIZE, "Larger than " + MAX_BYTES + " bytes");
                }
                buffered.write(buffer, 0, count);
            }
            bytes = buffered.toByteArray();
        } catch (IOException | RuntimeException error) {
            // A provider's stream can fail with a runtime exception as readily as an IOException.
            // The class only: a provider's message can carry the document's name or address.
            throw new Rejected(Reason.UNREADABLE, error.getClass().getSimpleName());
        }
        try {
            return StandardCharsets.UTF_8.newDecoder()
                    .onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT)
                    .decode(ByteBuffer.wrap(bytes)).toString();
        } catch (CharacterCodingException error) {
            throw new Rejected(Reason.ENCODING, "Not UTF-8");
        }
    }

    /** What a file's text says, or why it's refused. Nothing is written here. */
    static Snapshot parse(@Nullable String text) throws Rejected {
        if (text == null) throw new Rejected(Reason.UNREADABLE, "No text");
        if (text.getBytes(StandardCharsets.UTF_8).length > MAX_BYTES) {
            throw new Rejected(Reason.SIZE, "Larger than " + MAX_BYTES + " bytes");
        }
        if (text.startsWith(BYTE_ORDER_MARK)) text = text.substring(1);
        JSONObject root;
        try {
            root = SettingsJson.parseObject(text, LIMITS);
        } catch (SettingsJson.DuplicateNameException duplicate) {
            throw new Rejected(Reason.DUPLICATE, "A name appears twice");
        } catch (IOException | JSONException error) {
            // The parser reports a document that simply stops as an IOException, not a
            // JSONException, and a download cut off halfway is exactly that.
            throw new Rejected(Reason.DAMAGED, "Not one JSON object");
        }
        if (!FORMAT.equals(root.opt(FORMAT_NAME))) {
            throw new Rejected(Reason.FORMAT, "Not a Hushfacebook settings file");
        }
        // A version is a whole number this build wrote or a later one. A later one is refused
        // rather than read field by field, which could land half of a file this build doesn't
        // understand. Anything else in its place was never written by Hushfacebook.
        Object schema = root.opt(SCHEMA_NAME);
        if (!(schema instanceof Integer) || (Integer) schema < 1) {
            throw new Rejected(Reason.FORMAT, "No version number");
        }
        if ((Integer) schema > SCHEMA) {
            throw new Rejected(Reason.SCHEMA, "Version " + schema + " is newer than " + SCHEMA);
        }
        Object settings = root.opt(SETTINGS_NAME);
        if (!(settings instanceof JSONObject)) {
            throw new Rejected(Reason.FORMAT, "No settings");
        }

        int unknown = 0;
        for (Iterator<String> names = root.keys(); names.hasNext(); ) {
            String name = names.next();
            if (!FORMAT_NAME.equals(name) && !SCHEMA_NAME.equals(name) && !SETTINGS_NAME.equals(name)) {
                unknown++;
            }
        }
        Map<String, BooleanSetting> known = new HashMap<>();
        for (BooleanSetting setting : ALLOWLIST) known.put(setting.key, setting);
        Map<BooleanSetting, Boolean> found = new HashMap<>();
        String folder = null;
        DownloadQuality quality = null;
        String fileName = null;
        StartTab start = null;
        CommentOrder order = null;
        String hidden = null;
        String kept = null;
        PlaybackQuality playback = null;
        SendLink.Action action = null;
        String app = null;
        SaveTo to = null;
        JSONObject values = (JSONObject) settings;
        for (Iterator<String> names = values.keys(); names.hasNext(); ) {
            String name = names.next();
            if (FOLDER.key.equals(name)) {
                Object value = values.opt(name);
                if (!(value instanceof String) || !SaveFolder.isImportable((String) value)) {
                    throw new Rejected(Reason.VALUE, "Not one clean folder name: " + name);
                }
                // A newer phone's name can hold characters this one doesn't know yet, which the
                // saves here drop, so the folder taken is the one they'll really use.
                folder = SaveFolder.sanitize((String) value);
                continue;
            }
            if (QUALITY.key.equals(name)) {
                quality = DownloadQuality.fromFile(values.opt(name));
                if (quality == null) throw new Rejected(Reason.VALUE, "Not a save quality: " + name);
                continue;
            }
            if (FILE_NAME.key.equals(name)) {
                Object value = values.opt(name);
                if (!(value instanceof String) || !FileNameTemplate.isImportable((String) value)) {
                    throw new Rejected(Reason.VALUE, "Not one clean file name: " + name);
                }
                fileName = FileNameTemplate.sanitize((String) value);
                continue;
            }
            if (START.key.equals(name)) {
                start = StartTab.fromFile(values.opt(name));
                if (start == null) throw new Rejected(Reason.VALUE, "Not a start tab: " + name);
                continue;
            }
            if (ORDER.key.equals(name)) {
                order = CommentOrder.fromFile(values.opt(name));
                if (order == null) throw new Rejected(Reason.VALUE, "Not a comment order: " + name);
                continue;
            }
            if (PLAYBACK.key.equals(name)) {
                playback = PlaybackQuality.fromFile(values.opt(name));
                if (playback == null) throw new Rejected(Reason.VALUE, "Not a playback quality: " + name);
                continue;
            }
            if (TO.key.equals(name)) {
                to = SaveTo.fromFile(values.opt(name));
                if (to == null) throw new Rejected(Reason.VALUE, "Not a save location: " + name);
                continue;
            }
            if (ACTION.key.equals(name)) {
                action = SendLink.Action.fromFile(values.opt(name));
                if (action == null) throw new Rejected(Reason.VALUE, "Not a download action: " + name);
                continue;
            }
            if (APP.key.equals(name)) {
                Object value = values.opt(name);
                // The setting's name only, as for the word lists: what was typed stays out of a refusal.
                if (!SendLink.isFileApp(value)) throw new Rejected(Reason.VALUE, "Not one package name: " + name);
                app = (String) value;
                continue;
            }
            if (HIDDEN.key.equals(name) || KEPT.key.equals(name)) {
                Object value = values.opt(name);
                // The setting's name only: a list's words stay out of what a refusal says.
                if (!(value instanceof String) || !PostWords.isClean((String) value)) {
                    throw new Rejected(Reason.VALUE, "Not one clean word list: " + name);
                }
                if (HIDDEN.key.equals(name)) hidden = (String) value;
                else kept = (String) value;
                continue;
            }
            BooleanSetting setting = known.get(name);
            if (setting == null) {
                // A name this build doesn't know, Pause and the debug settings included: left
                // out and counted, so the preview can say so.
                unknown++;
                continue;
            }
            Object value = values.opt(name);
            if (!(value instanceof Boolean)) {
                throw new Rejected(Reason.VALUE, "Not true or false: " + name);
            }
            found.put(setting, (Boolean) value);
        }
        Map<BooleanSetting, Boolean> ordered = new LinkedHashMap<>();
        for (BooleanSetting setting : ALLOWLIST) {
            Boolean value = found.get(setting);
            if (value != null) ordered.put(setting, value);
        }
        return new Snapshot(ordered, folder, quality, fileName, start, order, hidden, kept, playback, action, app, to,
                unknown);
    }

    /**
     * Writes the switches and the other settings a file changes, all of them in one preference
     * commit. A setting the file doesn't name is left as it is.
     *
     * @return how many settings changed, each setting that isn't a switch counted as one.
     * @throws ApplyFailed when the commit failed. {@link Setting#saveAll} puts the switches
     *                     back, live and stored; {@link ApplyFailed#rolledBack} says whether that
     *                     worked for every one of them.
     */
    static int apply(Snapshot snapshot) throws ApplyFailed {
        Map<Setting<?>, Object> changes = snapshot.changes();
        if (changes.isEmpty()) return 0;
        try {
            Setting.saveAll(changes);
            return changes.size();
        } catch (Setting.BatchFailed failed) {
            throw new ApplyFailed(failed.restored, failed);
        } catch (IOException | RuntimeException refused) {
            // Refused before anything was written.
            throw new ApplyFailed(true, refused);
        }
    }
}
