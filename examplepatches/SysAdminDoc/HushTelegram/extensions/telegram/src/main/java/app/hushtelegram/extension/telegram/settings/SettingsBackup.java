/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Forked from:
 * https://github.com/SysAdminDoc/hushfeed/blob/bcc57ee555f4346c4eb1cbdae9f6ca8a3fa6fef4/extensions/tiktok/src/main/java/app/hushtelegram/extension/tiktok/settings/SettingsBackup.java
 * Copyright 2026 Hushfeed contributors (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026: an exact list of the switches in place of every
 * setting, no Feature Gate Lab, reset, undo or journal, an import read into a preview before
 * anything is written, and a refusal of its own for a name given twice.
 */
package app.hushtelegram.extension.telegram.settings;

import android.os.Bundle;

import androidx.annotation.Nullable;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.shared.settings.IntegerSetting;
import app.hushtelegram.extension.shared.settings.Setting;
import app.hushtelegram.extension.shared.settings.SettingsJson;
import app.hushtelegram.extension.shared.settings.StringSetting;
import app.hushtelegram.extension.telegram.misc.DataSaverDownloads;
import app.hushtelegram.extension.telegram.misc.GalleryFolder;
import app.hushtelegram.extension.telegram.misc.MessageFilters;
import app.hushtelegram.extension.telegram.misc.OutsideTranslate;
import app.hushtelegram.extension.telegram.misc.StickerSize;
import app.hushtelegram.extension.telegram.misc.TitleEmoji;
import app.hushtelegram.extension.telegram.misc.TranslateTarget;

/**
 * HushTelegram's switches as a file, and back.
 *
 * <p>Morphe Manager can export the patches that were picked and the signing key. It can't see the
 * switches, which live in Telegram's own data, so a reinstall or a new phone started them all over.
 * This writes them to a JSON file the person chooses and reads one back.
 *
 * <p>Only the switches in {@link #ALLOWLIST} go out or come in. Pause, safe mode, the debug
 * settings, the app language and the counters HushTelegram keeps for itself stay out, and so do
 * the log, the diagnostic data and anything about the person or the phone: a file is a format
 * name, a version number, one true or false per switch, the sticker size the person picked, the
 * text they put beside the chat list's title and the message filters they wrote, one list of lines
 * for groups and one for channels. An import applies what it read in one
 * preference commit. A file that is too large, isn't JSON, names something twice, holds a value of
 * the wrong type or comes from a newer version changes nothing.
 * <p>The release check stays out of the file: it puts the phone online, so it's switched on
 * from the phone's own screen, never by a file. So does Folders by chat type: flipping it makes or
 * removes folders on your account, and an import would flip it without doing either.
 * The chats picked under Hide picked chats stay out too, though the switch goes in: they name the
 * account and the chats someone chose to hide, and settings files get passed around to help others.
 *
 * <p>Call the file and preference work on a worker thread.
 */
public final class SettingsBackup {
    /** Far more than a settings file needs: one is a few hundred bytes. */
    public static final int MAX_BYTES = 64 * 1024;
    public static final String FORMAT = "hushtelegram-settings";
    /** The file shape this build writes and the newest it reads. A file declaring more is refused. */
    static final int SCHEMA = 1;

    static final String FORMAT_NAME = "format";
    static final String SCHEMA_NAME = "schema";
    static final String SETTINGS_NAME = "settings";

    /**
     * The switches a file carries, and the only settings an import can write: the feature
     * switches, apart from the few SettingsBackupTest's STAYS_OUT names with a reason, and nothing
     * of HushTelegram's own. A switch added to {@link Settings} stays out until someone decides it
     * belongs here, and SettingsBackupTest fails until they do.
     */
    static final List<BooleanSetting> ALLOWLIST = Collections.unmodifiableList(Arrays.asList(
            Settings.HIDE_ADS,
            Settings.HIDE_STORIES,
            Settings.HIDE_RECOMMENDATIONS,
            Settings.HIDE_KEYBOARD_FEATURED,
            Settings.HIDE_COMMERCE,
            Settings.HIDE_EMOJI_STATUS,
            Settings.UNLOCK_PREMIUM_ICONS,
            Settings.LOCAL_EMOJI_STATUS,
            Settings.HIDE_PROMOTIONAL_BANNERS,
            Settings.HIDE_SPONSORED_PROXY,
            Settings.HIDE_POPULAR_APPS,
            Settings.SEARCH_ONLY_MY_CHATS,
            Settings.SEARCH_STYLED_NAMES,
            Settings.BLOCK_NEW_CHATS,
            Settings.HIDE_CONTACTS_BLOCK,
            Settings.HIDE_GREETING_STICKERS,
            Settings.DISABLE_CHAT_SWIPE,
            Settings.DISABLE_CHANNEL_PULL,
            Settings.DISABLE_TOPIC_PULL,
            Settings.NORMAL_PASTE,
            Settings.SHOW_LOCAL_IDS,
            Settings.PROFILE_DATA_CENTER,
            Settings.DISABLE_DOUBLE_TAP_REACTIONS,
            Settings.HIDE_REACTION_ROWS,
            Settings.HIDE_REACTION_PICKER,
            Settings.QUIET_CONTACTS_NAG,
            Settings.HOLIDAY_LOOK,
            Settings.USE_SYSTEM_FONT,
            Settings.AMOLED_BLACK,
            Settings.HIDE_TRANSLATE_BAR,
            Settings.EXACT_NUMBERS,
            Settings.REVEAL_SPOILERS,
            Settings.HIDE_KEYBOARD_ON_SCROLL,
            Settings.KEEP_VIDEOS_MUTED,
            Settings.VIDEO_EITHER_LANDSCAPE,
            Settings.VIDEO_ONLY_FROM_BUTTON,
            Settings.SWIPE_BACK_ON_PROFILES,
            Settings.HIDE_PHONE_NUMBER,
            Settings.SHARE_NUMBER_UNTICKED,
            Settings.MESSAGE_SECONDS,
            Settings.ALLOW_CHAT_BLUR,
            Settings.VOICE_ONE_AT_A_TIME,
            Settings.LOCKED_VOICE_GUARD,
            Settings.NO_HAPTICS,
            Settings.REACTION_EFFECTS_OFF,
            Settings.HIDE_FOLDER_COUNTERS,
            Settings.LAUNCH_FOLDER,
            Settings.HIDE_ALL_CHATS,
            Settings.HIDDEN_CHATS,
            Settings.FORWARD_HIDE_SENDER,
            Settings.VOICE_MUSIC_PLAYER,
            Settings.SILENCE_NON_CONTACTS,
            Settings.REACTION_ALERTS,
            Settings.REACTION_SOUND,
            Settings.DISABLE_ARCHIVE_PULL,
            Settings.REAR_CAMERA_FIRST,
            Settings.HIDE_GALLERY_CAMERA_TILE,
            Settings.HIDE_STICKER_TIME,
            Settings.CHANGE_STICKER_SIZE,
            Settings.IGNORE_MUTED_MENTIONS,
            Settings.HIDE_BLOCKED_IN_GROUPS,
            Settings.HIDE_BY_KEYWORD,
            Settings.HIDE_FEATURES_AND_INVITE,
            Settings.MESSAGE_MENU_REPEAT,
            Settings.KEEP_DELETED_MESSAGES,
            Settings.RED_DELETED_LABEL,
            Settings.KEEP_EDIT_HISTORY,
            Settings.KEEP_TIMED_MEDIA,
            Settings.ASK_BEFORE_STICKER,
            Settings.OUTSIDE_TRANSLATE,
            Settings.HIDE_CHANNEL_BUTTONS,
            Settings.HIDE_CHANNEL_MUTE,
            Settings.HIDE_CHANNEL_SHARE,
            Settings.HIDE_SEND_AS,
            Settings.HIDE_CONTACTS_TAB,
            Settings.COMPACT_TAB_BAR,
            Settings.SIDE_MENU,
            Settings.HIDE_NEW_MESSAGE,
            SettingsRoutes.SETTINGS_ROW,
            SettingsRoutes.TITLE_PRESS,
            SettingsRoutes.SIDE_MENU_ROW,
            SettingsRoutes.SHORTCUT,
            Settings.FASTER_DOWNLOADS,
            Settings.DATA_SAVER_DOWNLOADS,
            Settings.SAVE_DOWNLOADS,
            Settings.SAVE_RESTRICTED_DOWNLOADS,
            Settings.SAVE_TIMED_MEDIA,
            Settings.STORAGE_FOLDER,
            Settings.ASK_BEFORE_GIF,
            Settings.ASK_BEFORE_VOICE_VIDEO,
            Settings.ASK_BEFORE_CALL,
            Settings.MESSAGE_MENU_COPY_PHOTO,
            Settings.MESSAGE_MENU_DETAILS,
            Settings.MESSAGE_MENU_QUICK_FORWARD,
            Settings.MESSAGE_MENU_COPY_PROTECTED,
            Settings.MESSAGE_MENU_SAVE_PROTECTED,
            Settings.MESSAGE_MENU_FORWARD_COPY,
            Settings.DISABLE_ANALYTICS,
            Settings.GHOST_MODE,
            Settings.GHOST_READS,
            Settings.GHOST_STORIES,
            Settings.GHOST_TYPING,
            Settings.GHOST_ONLINE,
            Settings.DISABLE_CALL_DEBUG,
            Settings.RECORD_CALLS,
            Settings.RECORD_CALL_BUTTON,
            Settings.DISABLE_DRAFT_PREVIEWS,
            Settings.LOCAL_DRAFTS,
            Settings.LOCAL_SEARCH,
            Settings.GALLERY_CAMERA_ON_TAP,
            Settings.OPEN_EXTERNAL_LINKS,
            Settings.MINI_APP_LOCATION_OFF,
            Settings.STRIP_LINK_TRACKING,
            Settings.SKIP_AUTOLOGIN,
            Settings.DISABLE_UPDATE_CHECKS,
            Settings.REPAIR_FIREBASE_PUSH));

    /**
     * The text a file carries besides the switches: the message filters, each list as a JSON array
     * of its lines. A build from before them counts these names as unknown and leaves them out.
     */
    static final List<StringSetting> FILTER_LISTS = Collections.unmodifiableList(Arrays.asList(
            Settings.MESSAGE_FILTERS_GROUPS,
            Settings.MESSAGE_FILTERS_CHANNELS));

    /**
     * The numbers a file carries, each one of a few choices: today the sticker size. A build from
     * before them counts the name as unknown and leaves it out.
     */
    static final List<IntegerSetting> NUMBERS = Collections.singletonList(Settings.STICKER_SIZE);

    /**
     * The short texts a file carries as they're saved: the emoji beside the chat list's title, the
     * gallery folder choice and the translation language. A build from before them counts the name
     * as unknown and leaves it out.
     */
    static final List<StringSetting> TEXTS = Arrays.asList(Settings.TITLE_EMOJI, Settings.GALLERY_FOLDER,
            Settings.TRANSLATE_TARGET);

    /**
     * Bounds for the parser, well past anything this class writes, so a file built to be
     * expensive to read is refused before it is.
     */
    private static final SettingsJson.Limits LIMITS = new SettingsJson.Limits(8, 1024, 1024, 256, MAX_BYTES);

    /** Written by some editors at the start of a UTF-8 file. It isn't part of the JSON. */
    private static final String BYTE_ORDER_MARK = String.valueOf((char) 0xFEFF);

    private SettingsBackup() {
    }

    /**
     * Why a file was refused. Each one reaches the person as its own sentence: a download that
     * stopped halfway, a file from a newer HushTelegram and a photo picked by mistake call for
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
        /** JSON, but not a HushTelegram settings file, or one whose version isn't a version. */
        FORMAT,
        /** A settings file from a newer HushTelegram, in a shape this build doesn't know. */
        SCHEMA,
        /**
         * A switch whose value isn't true or false, a size that isn't one of its choices, a
         * filter list that isn't a short list of short lines, or title text the title can't show.
         */
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

    /** What a file says: a value for each switch and list it names, and how many other names it holds. */
    public static final class Snapshot {
        private static final String SWITCHES = "switches";
        private static final String LISTS = "lists";
        private static final String NUMBER_VALUES = "numbers";
        private static final String TEXT_VALUES = "texts";
        private static final String UNKNOWN = "unknown";

        /** In {@link #ALLOWLIST} order, and only the switches the file named. */
        final Map<BooleanSetting, Boolean> values;
        /** In {@link #FILTER_LISTS} order, each one's lines as they're saved, and only the lists the file named. */
        final Map<StringSetting, String> lists;
        /** In {@link #NUMBERS} order, and only the numbers the file named. */
        final Map<IntegerSetting, Integer> numbers;
        /** In {@link #TEXTS} order, and only the texts the file named. */
        final Map<StringSetting, String> texts;
        /** Names the file holds that aren't settings this build knows. They're left out. */
        final int unknown;

        Snapshot(Map<BooleanSetting, Boolean> values, Map<StringSetting, String> lists,
                 Map<IntegerSetting, Integer> numbers, Map<StringSetting, String> texts, int unknown) {
            this.values = Collections.unmodifiableMap(values);
            this.lists = Collections.unmodifiableMap(lists);
            this.numbers = Collections.unmodifiableMap(numbers);
            this.texts = Collections.unmodifiableMap(texts);
            this.unknown = unknown;
        }

        /**
         * The switches whose saved value this file changes. Saved, not what a paused Telegram is
         * answered: a file holds what the person chose.
         */
        Map<Setting<?>, Object> changes() {
            Map<Setting<?>, Object> changes = new LinkedHashMap<>();
            for (Map.Entry<BooleanSetting, Boolean> entry : values.entrySet()) {
                if (!entry.getValue().equals(entry.getKey().savedValue())) {
                    changes.put(entry.getKey(), entry.getValue());
                }
            }
            for (Map.Entry<StringSetting, String> entry : lists.entrySet()) {
                if (!entry.getValue().equals(entry.getKey().savedValue())) {
                    changes.put(entry.getKey(), entry.getValue());
                }
            }
            for (Map.Entry<IntegerSetting, Integer> entry : numbers.entrySet()) {
                if (!entry.getValue().equals(entry.getKey().savedValue())) {
                    changes.put(entry.getKey(), entry.getValue());
                }
            }
            for (Map.Entry<StringSetting, String> entry : texts.entrySet()) {
                if (!entry.getValue().equals(entry.getKey().savedValue())) {
                    changes.put(entry.getKey(), entry.getValue());
                }
            }
            keepAWayIn(changes);
            return changes;
        }

        /**
         * A file can't turn every way into these settings off, the same as the screen can't (#29).
         * When it would, the row on Telegram's Settings page stays on, so its switch shows what the
         * app does.
         */
        private static void keepAWayIn(Map<Setting<?>, Object> changes) {
            for (BooleanSetting way : SettingsRoutes.all()) {
                Object value = changes.containsKey(way) ? changes.get(way) : way.savedValue();
                if (Boolean.TRUE.equals(value)) return;
            }
            if (SettingsRoutes.SETTINGS_ROW.savedValue()) changes.remove(SettingsRoutes.SETTINGS_ROW);
            else changes.put(SettingsRoutes.SETTINGS_ROW, Boolean.TRUE);
        }

        /** How many switches this file changes, the number the preview and the toast give. */
        int switchChanges() {
            int count = 0;
            for (Setting<?> setting : changes().keySet()) if (setting instanceof BooleanSetting) count++;
            return count;
        }

        /** How many filter lists this file changes. */
        int listChanges() {
            int count = 0;
            for (Setting<?> setting : changes().keySet()) if (FILTER_LISTS.contains(setting)) count++;
            return count;
        }

        /** Whether this file changes the sticker size. */
        boolean sizeChanges() {
            return changes().containsKey(Settings.STICKER_SIZE);
        }

        /** Whether this file changes the text beside the chat list's title. */
        boolean titleEmojiChanges() {
            return changes().containsKey(Settings.TITLE_EMOJI);
        }

        /** Whether this file changes where Save to gallery puts photos and videos. */
        boolean galleryFolderChanges() {
            return changes().containsKey(Settings.GALLERY_FOLDER);
        }

        /** Whether this file changes the language the outside translate writes in. */
        boolean translateTargetChanges() {
            return changes().containsKey(Settings.TRANSLATE_TARGET);
        }

        /** For the settings page's saved state, so a preview outlives the page being rebuilt. */
        Bundle toBundle() {
            Bundle switches = new Bundle();
            for (Map.Entry<BooleanSetting, Boolean> entry : values.entrySet()) {
                switches.putBoolean(entry.getKey().key, entry.getValue());
            }
            Bundle texts = new Bundle();
            for (Map.Entry<StringSetting, String> entry : lists.entrySet()) {
                texts.putString(entry.getKey().key, entry.getValue());
            }
            Bundle sizes = new Bundle();
            for (Map.Entry<IntegerSetting, Integer> entry : numbers.entrySet()) {
                sizes.putInt(entry.getKey().key, entry.getValue());
            }
            Bundle shortTexts = new Bundle();
            for (Map.Entry<StringSetting, String> entry : this.texts.entrySet()) {
                shortTexts.putString(entry.getKey().key, entry.getValue());
            }
            Bundle state = new Bundle();
            state.putBundle(SWITCHES, switches);
            state.putBundle(LISTS, texts);
            state.putBundle(NUMBER_VALUES, sizes);
            state.putBundle(TEXT_VALUES, shortTexts);
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
            Map<StringSetting, String> lists = new LinkedHashMap<>();
            Bundle texts = state.getBundle(LISTS);
            if (texts != null) {
                for (StringSetting setting : FILTER_LISTS) {
                    Object value = texts.get(setting.key);
                    if (!(value instanceof String)) continue;
                    List<String> lines = MessageFilters.lines((String) value);
                    if (usable(lines)) lists.put(setting, MessageFilters.join(lines));
                }
            }
            Map<IntegerSetting, Integer> numbers = new LinkedHashMap<>();
            Bundle sizes = state.getBundle(NUMBER_VALUES);
            if (sizes != null) {
                for (IntegerSetting setting : NUMBERS) {
                    Object value = sizes.get(setting.key);
                    if (value instanceof Integer && allowed(setting, (Integer) value)) numbers.put(setting, (Integer) value);
                }
            }
            Map<StringSetting, String> written = new LinkedHashMap<>();
            Bundle shortTexts = state.getBundle(TEXT_VALUES);
            if (shortTexts != null) {
                for (StringSetting setting : TEXTS) {
                    Object value = shortTexts.get(setting.key);
                    if (value instanceof String && allowed(setting, (String) value)) written.put(setting, (String) value);
                }
            }
            return new Snapshot(values, lists, numbers, written, unknown);
        }
    }

    /**
     * The file for the switches as they're saved now. Saved rather than what a paused Telegram is
     * answered, so exporting while paused keeps what the person chose. A filter list the import
     * would refuse is left out, so the file is always one this build can read back.
     */
    public static String create() throws JSONException {
        JSONObject switches = new JSONObject();
        for (BooleanSetting setting : ALLOWLIST) {
            switches.put(setting.key, setting.savedValue().booleanValue());
        }
        for (IntegerSetting setting : NUMBERS) {
            switches.put(setting.key, setting.savedValue().intValue());
        }
        for (StringSetting setting : TEXTS) {
            if (allowed(setting, setting.savedValue())) switches.put(setting.key, setting.savedValue());
        }
        for (StringSetting setting : FILTER_LISTS) {
            List<String> lines = MessageFilters.lines(setting.savedValue());
            if (usable(lines)) switches.put(setting.key, new JSONArray(lines));
        }
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
            throw new Rejected(Reason.FORMAT, "Not a HushTelegram settings file");
        }
        // A version is a whole number this build wrote or a later one. A later one is refused
        // rather than read field by field, which could land half of a file this build doesn't
        // understand. Anything else in its place was never written by HushTelegram.
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
        Map<String, StringSetting> knownLists = new HashMap<>();
        for (StringSetting setting : FILTER_LISTS) knownLists.put(setting.key, setting);
        Map<String, IntegerSetting> knownNumbers = new HashMap<>();
        for (IntegerSetting setting : NUMBERS) knownNumbers.put(setting.key, setting);
        Map<String, StringSetting> knownTexts = new HashMap<>();
        for (StringSetting setting : TEXTS) knownTexts.put(setting.key, setting);
        Map<BooleanSetting, Boolean> found = new HashMap<>();
        Map<StringSetting, String> foundLists = new HashMap<>();
        Map<IntegerSetting, Integer> foundNumbers = new HashMap<>();
        Map<StringSetting, String> foundTexts = new HashMap<>();
        JSONObject values = (JSONObject) settings;
        for (Iterator<String> names = values.keys(); names.hasNext(); ) {
            String name = names.next();
            StringSetting list = knownLists.get(name);
            if (list != null) {
                foundLists.put(list, filterList(name, values.opt(name)));
                continue;
            }
            IntegerSetting number = knownNumbers.get(name);
            if (number != null) {
                Object value = values.opt(name);
                if (!(value instanceof Integer) || !allowed(number, (Integer) value)) {
                    throw new Rejected(Reason.VALUE, "Not one of its choices: " + name);
                }
                foundNumbers.put(number, (Integer) value);
                continue;
            }
            StringSetting shortText = knownTexts.get(name);
            if (shortText != null) {
                Object value = values.opt(name);
                if (!(value instanceof String) || !allowed(shortText, (String) value)) {
                    throw new Rejected(Reason.VALUE, "Not a value its row would save: " + name);
                }
                foundTexts.put(shortText, (String) value);
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
        Map<StringSetting, String> orderedLists = new LinkedHashMap<>();
        for (StringSetting setting : FILTER_LISTS) {
            String value = foundLists.get(setting);
            if (value != null) orderedLists.put(setting, value);
        }
        Map<IntegerSetting, Integer> orderedNumbers = new LinkedHashMap<>();
        for (IntegerSetting setting : NUMBERS) {
            Integer value = foundNumbers.get(setting);
            if (value != null) orderedNumbers.put(setting, value);
        }
        Map<StringSetting, String> orderedTexts = new LinkedHashMap<>();
        for (StringSetting setting : TEXTS) {
            String value = foundTexts.get(setting);
            if (value != null) orderedTexts.put(setting, value);
        }
        return new Snapshot(ordered, orderedLists, orderedNumbers, orderedTexts, unknown);
    }

    /** Whether a number is one of its setting's choices. */
    static boolean allowed(IntegerSetting setting, int value) {
        return setting == Settings.STICKER_SIZE && StickerSize.percent(value) == value;
    }

    /** Whether a short text is one its setting's row would save: clean and short enough, or one of the choices. */
    static boolean allowed(StringSetting setting, String value) {
        if (setting == Settings.GALLERY_FOLDER) return GalleryFolder.allowed(value);
        if (setting == Settings.TRANSLATE_TARGET) return TranslateTarget.allowed(value);
        return setting == Settings.TITLE_EMOJI && TitleEmoji.allowed(value);
    }

    /**
     * A filter list as it's saved, from its array of lines. Anything but an array of at most
     * {@link MessageFilters#MAX_FILTERS} strings, each one line of at most
     * {@link MessageFilters#MAX_FILTER_CHARS} characters, and no larger written out than
     * {@link MessageFilters#MAX_LIST_BYTES}, is refused. A line that isn't a filter that works,
     * such as an expression edited by hand, is kept: the editor shows it and the chat leaves it out.
     */
    private static String filterList(String name, Object value) throws Rejected {
        if (!(value instanceof JSONArray) || ((JSONArray) value).length() > MessageFilters.MAX_FILTERS) {
            throw new Rejected(Reason.VALUE, "Not a list of filters: " + name);
        }
        JSONArray array = (JSONArray) value;
        List<String> lines = new ArrayList<>();
        for (int i = 0; i < array.length(); i++) {
            Object line = array.opt(i);
            if (!(line instanceof String) || ((String) line).indexOf('\n') >= 0 || ((String) line).indexOf('\r') >= 0) {
                throw new Rejected(Reason.VALUE, "Not a list of filters: " + name);
            }
            lines.add((String) line);
        }
        List<String> saved = MessageFilters.lines(MessageFilters.join(lines));
        if (!usable(saved)) throw new Rejected(Reason.VALUE, "Not a list of filters: " + name);
        return MessageFilters.join(saved);
    }

    /**
     * Lines a list can hold: not too many, none too long or holding a line break, and small enough
     * written out that a file carrying it is one the import takes.
     */
    static boolean usable(List<String> lines) {
        if (lines.size() > MessageFilters.MAX_FILTERS) return false;
        for (String line : lines) {
            if (line.length() > MessageFilters.MAX_FILTER_CHARS || line.indexOf('\r') >= 0) return false;
        }
        return MessageFilters.fits(lines);
    }

    /**
     * Writes the switches a file changes, all of them in one preference commit. A switch the file
     * doesn't name is left as it is.
     *
     * @return how many switches changed.
     * @throws ApplyFailed when the commit failed. {@link Setting#saveAll} puts the switches
     *                     back, live and stored; {@link ApplyFailed#rolledBack} says whether that
     *                     worked for every one of them.
     */
    static int apply(Snapshot snapshot) throws ApplyFailed {
        Map<Setting<?>, Object> changes = snapshot.changes();
        if (changes.isEmpty()) return 0;
        try {
            Setting.saveAll(changes);
            // What the switch's row does as it goes off. A file skips the row, and the translator
            // would otherwise only notice at the next message drawn, after a second file might
            // have turned it back on.
            if (Boolean.FALSE.equals(changes.get(Settings.OUTSIDE_TRANSLATE))) OutsideTranslate.forgetChats();
            // What the Data Saver row does once saved, so Telegram's download queue follows now.
            if (changes.containsKey(Settings.DATA_SAVER_DOWNLOADS)) DataSaverDownloads.switched();
            return changes.size();
        } catch (Setting.BatchFailed failed) {
            throw new ApplyFailed(failed.restored, failed);
        } catch (IOException | RuntimeException refused) {
            // Refused before anything was written.
            throw new ApplyFailed(true, refused);
        }
    }
}
