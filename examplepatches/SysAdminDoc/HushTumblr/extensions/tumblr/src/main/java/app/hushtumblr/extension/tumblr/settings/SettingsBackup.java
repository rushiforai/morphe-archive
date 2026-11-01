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
 * Forked from:
 * https://github.com/SysAdminDoc/hushfeed/blob/bcc57ee555f4346c4eb1cbdae9f6ca8a3fa6fef4/extensions/tiktok/src/main/java/app/hushpinterest/extension/tiktok/settings/SettingsBackup.java
 * Copyright 2026 Hushfeed contributors (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026: an exact list of the switches in place of every
 * setting, no Feature Gate Lab, reset, undo or journal, an import read into a preview before
 * anything is written, and a refusal of its own for a name given twice.
 * Modified for HushPinterest (Pinterest), 2026: one-step import undo that keeps only the current
 * allowlisted switches and refuses to overwrite a later edit.
 */
package app.hushtumblr.extension.tumblr.settings;

import android.os.Bundle;
import android.content.SharedPreferences;

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

import org.json.JSONException;
import org.json.JSONObject;

import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.shared.settings.Setting;
import app.hushtumblr.extension.shared.settings.SettingsJson;
import app.hushtumblr.extension.shared.settings.StringSetting;
import app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushtumblr.extension.tumblr.ui.BottomBarTabs;

/**
 * HushTumblr's switches and text settings as a file, and back.
 *
 * <p>Morphe Manager can export the patches that were picked and the signing key. It can't see the
 * switches, which live in Tumblr's own data, so a reinstall or a new phone started them all over.
 * This writes them to a JSON file the person chooses and reads one back.
 *
 * <p>Only the switches in {@link #ALLOWLIST} and the text settings in {@link #TEXT_ALLOWLIST} go
 * out or come in. Pause, safe mode, the debug settings, the app language and the counters
 * HushTumblr keeps for itself stay out, and so do the log, the diagnostic data and anything about
 * the person or the phone: a file is a format name, a version number, one true or false per switch
 * and, since version 2, text choices. Version 3 adds word scopes and allowed words.
     * An import applies what it read in one
 * preference commit. A file that is too large, isn't JSON, names something twice, holds a switch
 * value of the wrong type or comes from a newer version changes nothing. A text value its settings
 * row could never have saved is left out and named in the preview, and the rest still imports.
 * <p>The release check stays out of the file: it puts the phone online, so it's switched on
 * from the phone's own screen, never by a file.
 *
 * <p>Call the file and preference work on a worker thread.
 */
public final class SettingsBackup {
    /** Maximum complete UTF-8 file, including its envelope and escaped text choices. */
    public static final int MAX_BYTES = 64 * 1024;
    public static final String FORMAT = "hushtumblr-settings";
    /**
     * The file shape this build writes and the newest it reads. A file declaring more is refused.
     * Version 1 carried switches only. Version 2 adds text. Version 3 preserves legacy word behavior.
     */
    static final int SCHEMA = 3;
    /** The first text section. Legacy word-filter imports also clear the new allowed-words list. */
    static final int TEXT_SCHEMA = 2;

    static final String FORMAT_NAME = "format";
    static final String SCHEMA_NAME = "schema";
    static final String SETTINGS_NAME = "settings";
    static final String TEXT_NAME = "text";

    /**
     * The switches a file carries, and the only settings an import can write: every feature
     * switch, and nothing of HushTumblr's own. A switch added to {@link Settings} stays out
     * until someone decides it belongs here, and SettingsBackupTest fails until they do.
     */
    static final List<BooleanSetting> ALLOWLIST = Collections.unmodifiableList(Arrays.asList(
            Settings.HIDE_ADS,
            Settings.HIDE_ADVERTISING_ID,
            Settings.DISABLE_ANALYTICS,
            Settings.HIDE_AD_FREE_BANNER,
            Settings.HIDE_TUMBLR_TV,
            Settings.HIDE_COMMUNITIES_TAB,
            Settings.HIDE_BLAZE_PROMPTS,
            Settings.SKIP_REVIEW_PROMPTS,
            Settings.HIDE_BLOG_NOTIFICATION_REMINDERS,
            Settings.HIDE_GIFT_MESSAGE_POPUPS,
            Settings.LINE_BETWEEN_POSTS,
            Settings.APP_FONT,
            Settings.TURN_OFF_SCREENSHOT_SHARING,
            Settings.DISABLE_UPDATE_PROMPTS,
            Settings.HIDE_SUGGESTED_BLOGS,
            Settings.HIDE_SUGGESTED_COMMUNITIES,
            Settings.HIDE_SUGGESTED_TAGS,
            Settings.HIDE_WATCH_IT_ROWS,
            Settings.HIDE_HASHTAGS,
            Settings.HIDE_FOLLOW_BUTTON,
            Settings.HIDE_TUMBLRMART,
            Settings.HIDE_NOTE_COUNTS,
            Settings.HIDE_LIKE_BUTTON,
            Settings.HIDE_REBLOG_BUTTON,
            Settings.HIDE_COMMENT_BUTTON,
            Settings.HIDE_SHARE_BUTTON,
            Settings.HIDE_SAVE_BUTTON,
            Settings.HIDE_DASHBOARD_COUNT,
            Settings.HIDE_COMMUNITIES_COUNT,
            Settings.HIDE_NOTIFICATIONS_COUNT,
            Settings.HIDE_REBLOGS,
            Settings.KEEP_TAGGED_REBLOGS,
            Settings.KEEP_REBLOGS_WITH_CONTENT,
            Settings.HIDE_NOTIFICATION_LIKES,
            Settings.HIDE_NOTIFICATION_REBLOGS,
            Settings.HIDE_NOTIFICATION_REPLIES,
            Settings.HIDE_NOTIFICATION_FOLLOWS,
            Settings.HIDE_NOTIFICATION_MENTIONS,
            Settings.HIDE_NOTIFICATION_ASKS,
            Settings.HIDE_NOTIFICATION_BOOPS,
            Settings.HIDE_VIDEO_POSTS,
            Settings.HIDE_PHOTO_POSTS,
            Settings.HIDE_TEXT_POSTS,
            Settings.HIDE_POSTS_WITH_WORDS,
            Settings.WORDS_CURRENT_TEXT,
            Settings.WORDS_REBLOG_TRAIL,
            Settings.WORDS_TAGS,
            Settings.WORDS_SUMMARY,
            Settings.HIDE_FILTERED_POSTS,
            Settings.SHOW_POST_TIMESTAMPS,
            Settings.SHOW_IMAGE_DESCRIPTIONS,
            Settings.MUTE_ROOT_POSTS,
            Settings.REVEAL_ALLOWED_MATURE_CONTENT,
            Settings.SHOW_MUTUAL_MARKERS,
            Settings.DARK_BACKGROUND,
            Settings.DARK_BACKGROUND_WALLPAPER,
            Settings.HIDE_EXPLORE_TAB,
            Settings.HIDE_NOTIFICATIONS_TAB,
            Settings.REORDER_TABS,
            Settings.FIX_PUSH_NOTIFICATIONS));

    /**
     * Version 2 carries hidden words and tab order; version 3 also carries allowed words.
     * An import checks each value by the rule its settings row saves by ({@link #textValue}).
     */
    static final List<StringSetting> TEXT_ALLOWLIST = Collections.unmodifiableList(Arrays.asList(
            TextSettings.HIDDEN_WORDS,
            TextSettings.ALLOWED_WORDS,
            TextSettings.TAB_ORDER));

    /**
     * Bounds for the parser, well past anything this class writes, so a file built to be
     * expensive to read is refused before it is. A string may run to the file's own size: the
     * words to hide are the person's own text, and their box sets no length.
     */
    private static final SettingsJson.Limits LIMITS = new SettingsJson.Limits(8, 1024, MAX_BYTES, 256, MAX_BYTES);

    /** Written by some editors at the start of a UTF-8 file. It isn't part of the JSON. */
    private static final String BYTE_ORDER_MARK = String.valueOf((char) 0xFEFF);

    private SettingsBackup() {
    }

    /**
     * Why a file was refused. Each one reaches the person as its own sentence: a download that
     * stopped halfway, a file from a newer HushTumblr and a photo picked by mistake call for
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
        /** JSON, but not a HushTumblr settings file, or one whose version isn't a version. */
        FORMAT,
        /** A settings file from a newer HushTumblr, in a shape this build doesn't know. */
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
     * What a file says: a value for each switch and text setting it names, the text settings whose
     * value failed its check, and how many other names it holds.
     */
    public static final class Snapshot {
        private static final String SWITCHES = "switches";
        private static final String UNKNOWN = "unknown";
        private static final String TEXTS = "texts";
        private static final String SKIPPED = "skipped";

        /** In {@link #ALLOWLIST} order, and only the switches the file named. */
        final Map<BooleanSetting, Boolean> values;
        /** In {@link #TEXT_ALLOWLIST} order, and only the text settings the file named with a usable value. */
        final Map<StringSetting, String> texts;
        /** Text settings the file named with a value their row could never have saved. They're left out. */
        final List<StringSetting> skipped;
        /** Names the file holds that aren't settings this build knows. They're left out. */
        final int unknown;

        Snapshot(Map<BooleanSetting, Boolean> values, Map<StringSetting, String> texts,
                 List<StringSetting> skipped, int unknown) {
            if (unknown < 0 || !ALLOWLIST.containsAll(values.keySet()) || values.containsValue(null)
                    || !TEXT_ALLOWLIST.containsAll(texts.keySet()) || texts.containsValue(null)
                    || !TEXT_ALLOWLIST.containsAll(skipped) || !Collections.disjoint(texts.keySet(), skipped)) {
                throw new IllegalArgumentException("Invalid settings snapshot");
            }
            Map<BooleanSetting, Boolean> ordered = new LinkedHashMap<>();
            for (BooleanSetting setting : ALLOWLIST) {
                if (values.containsKey(setting)) ordered.put(setting, values.get(setting));
            }
            Map<StringSetting, String> orderedTexts = new LinkedHashMap<>();
            List<StringSetting> orderedSkipped = new ArrayList<>();
            for (StringSetting setting : TEXT_ALLOWLIST) {
                if (texts.containsKey(setting)) orderedTexts.put(setting, texts.get(setting));
                if (skipped.contains(setting)) orderedSkipped.add(setting);
            }
            this.values = Collections.unmodifiableMap(ordered);
            this.texts = Collections.unmodifiableMap(orderedTexts);
            this.skipped = Collections.unmodifiableList(orderedSkipped);
            this.unknown = unknown;
        }

        /**
         * The switches, then the text settings, whose saved value this file changes. Saved, not what
         * a paused Tumblr is answered: a file holds what the person chose.
         */
        Map<Setting<?>, Object> changes() {
            Map<Setting<?>, Object> changes = new LinkedHashMap<>();
            for (Map.Entry<BooleanSetting, Boolean> entry : values.entrySet()) {
                if (!entry.getValue().equals(entry.getKey().persistedValue())) {
                    changes.put(entry.getKey(), entry.getValue());
                }
            }
            for (Map.Entry<StringSetting, String> entry : texts.entrySet()) {
                if (!entry.getValue().equals(entry.getKey().persistedValue())) {
                    changes.put(entry.getKey(), entry.getValue());
                }
            }
            return changes;
        }

        /**
         * How many saved settings this file changes, switches and text settings both. Zero means the
         * preview has nothing to import.
         */
        int switchChanges() {
            return changes().size();
        }

        /** For the settings page's saved state, so a preview outlives the page being rebuilt. */
        Bundle toBundle() {
            Bundle switches = new Bundle();
            for (Map.Entry<BooleanSetting, Boolean> entry : values.entrySet()) {
                switches.putBoolean(entry.getKey().key, entry.getValue());
            }
            Bundle text = new Bundle();
            for (Map.Entry<StringSetting, String> entry : texts.entrySet()) {
                text.putString(entry.getKey().key, entry.getValue());
            }
            ArrayList<String> left = new ArrayList<>();
            for (StringSetting setting : skipped) left.add(setting.key);
            Bundle state = new Bundle();
            state.putBundle(SWITCHES, switches);
            state.putInt(UNKNOWN, unknown);
            state.putBundle(TEXTS, text);
            state.putStringArrayList(SKIPPED, left);
            return state;
        }

        /**
         * The snapshot a page saved, or null when there's none or it isn't one. Only settings on
         * the lists come back, whatever the bundle holds, and a text value only as a file's check
         * would have kept it.
         */
        @Nullable
        @SuppressWarnings("deprecation") // Bundle.get is how a value's type is checked below API 33.
        static Snapshot fromBundle(@Nullable Bundle state) {
            if (state == null) return null;
            try {
                Object switchState = state.get(SWITCHES);
                Object unknownState = state.get(UNKNOWN);
                Object textState = state.get(TEXTS);
                Object skippedState = state.get(SKIPPED);
                if (!(switchState instanceof Bundle) || !(unknownState instanceof Integer)
                        || (Integer) unknownState < 0 || !(textState instanceof Bundle)
                        || !(skippedState instanceof ArrayList)) return null;
                Bundle switches = (Bundle) switchState;
                int unknown = (Integer) unknownState;
                Map<BooleanSetting, Boolean> values = new LinkedHashMap<>();
                for (BooleanSetting setting : ALLOWLIST) {
                    if (!switches.containsKey(setting.key)) continue;
                    Object value = switches.get(setting.key);
                    if (!(value instanceof Boolean)) return null;
                    values.put(setting, (Boolean) value);
                }
                Bundle text = (Bundle) textState;
                Map<StringSetting, String> texts = new LinkedHashMap<>();
                for (StringSetting setting : TEXT_ALLOWLIST) {
                    if (!text.containsKey(setting.key)) continue;
                    Object value = text.get(setting.key);
                    if (value == null || !value.equals(textValue(setting, value))) return null;
                    texts.put(setting, (String) value);
                }
                List<StringSetting> skipped = new ArrayList<>();
                for (Object key : (ArrayList<?>) skippedState) {
                    StringSetting setting = textSetting(key);
                    if (setting == null) return null;
                    skipped.add(setting);
                }
                return new Snapshot(values, texts, skipped, unknown);
            } catch (RuntimeException unreadable) {
                // A saved Bundle may fail to unmarshal. Never apply the readable portion of it.
                return null;
            }
        }
    }

    enum UndoState { NONE, AVAILABLE, EXPIRED }
    enum UndoResult { UNDONE, NOTHING, EXPIRED }

    /** Temporary process state. Neither snapshot is written to a file or a preference. */
    private static final class Undo {
        final Snapshot before;
        final Snapshot after;
        final SharedPreferences store;
        final Map<Setting<?>, Long> savedRevisions = new LinkedHashMap<>();

        Undo(Snapshot before, Snapshot after) {
            this.before = before;
            this.after = after;
            store = Setting.preferences.preferences;
            for (BooleanSetting setting : ALLOWLIST) savedRevisions.put(setting, setting.savedWriteRevision());
            for (StringSetting setting : TEXT_ALLOWLIST) savedRevisions.put(setting, setting.savedWriteRevision());
        }
    }

    // Read and written under the same lock as Setting.save/saveAll.
    @Nullable private static Undo pendingUndo;
    private static boolean undoExpired;

    private static Snapshot current() {
        Map<BooleanSetting, Boolean> values = new LinkedHashMap<>();
        for (BooleanSetting setting : ALLOWLIST) values.put(setting, setting.persistedValue());
        Map<StringSetting, String> texts = new LinkedHashMap<>();
        for (StringSetting setting : TEXT_ALLOWLIST) texts.put(setting, setting.persistedValue());
        return new Snapshot(values, texts, Collections.emptyList(), 0);
    }

    /** Later changes to excluded state, such as Pause or Debug, never invalidate this snapshot. */
    static UndoState undoState() {
        synchronized (Setting.class) {
            if (pendingUndo != null) {
                if (pendingUndo.store != Setting.preferences.preferences) {
                    discardUndo();
                } else if (!matches(pendingUndo)) {
                    pendingUndo = null;
                    undoExpired = true;
                }
            }
            return pendingUndo != null ? UndoState.AVAILABLE
                    : undoExpired ? UndoState.EXPIRED : UndoState.NONE;
        }
    }

    private static boolean matches(Undo undo) {
        try {
            for (Map.Entry<BooleanSetting, Boolean> entry : undo.after.values.entrySet()) {
                BooleanSetting setting = entry.getKey();
                if (setting.savedWriteRevision() != undo.savedRevisions.get(setting)) return false;
                boolean stored = Setting.preferences.preferences.getBoolean(setting.key, setting.defaultValue);
                if (stored != entry.getValue() || !entry.getValue().equals(setting.savedValue())) return false;
            }
            for (Map.Entry<StringSetting, String> entry : undo.after.texts.entrySet()) {
                StringSetting setting = entry.getKey();
                if (setting.savedWriteRevision() != undo.savedRevisions.get(setting)) return false;
                if (!entry.getValue().equals(setting.persistedValue()) || !entry.getValue().equals(setting.savedValue())) {
                    return false;
                }
            }
            return true;
        } catch (RuntimeException unreadable) {
            return false;
        }
    }

    static void discardUndo() {
        synchronized (Setting.class) {
            pendingUndo = null;
            undoExpired = false;
        }
    }

    /** Restores one import, provided no subsequent saved-switch edit would be overwritten. */
    static UndoResult undo() throws ApplyFailed {
        synchronized (Setting.class) {
            UndoState state = undoState();
            if (state != UndoState.AVAILABLE) {
                return state == UndoState.EXPIRED ? UndoResult.EXPIRED : UndoResult.NOTHING;
            }
            try {
                write(pendingUndo.before.changes());
            } catch (ApplyFailed failed) {
                // A recovered failure can be retried. A partial recovery can't safely be undone.
                undoState();
                throw failed;
            }
            discardUndo();
            return UndoResult.UNDONE;
        }
    }

    /**
     * The file for the switches and text settings as they're saved now. Saved rather than what a
     * paused Tumblr is answered, so exporting while paused keeps what the person chose.
     */
    public static String create() throws JSONException, Rejected {
        synchronized (Setting.class) {
            checkTextBudget(Collections.emptyMap());
            String file = serialize(Collections.emptyMap(), false);
            checkSize(file);
            Snapshot parsed = parse(new String(file.getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8));
            for (StringSetting setting : TEXT_ALLOWLIST) {
                if (!setting.persistedValue().equals(parsed.texts.get(setting))) {
                    throw new Rejected(Reason.VALUE, "Saved text does not round-trip");
                }
            }
            return file;
        }
    }

    /** Reserve the full envelope, every switch and the longest valid tab order before saving text. */
    static void checkTextBudget(StringSetting setting, String value) throws Rejected {
        checkTextBudget(Collections.singletonMap(setting, value));
    }

    /** A worker import cannot replace the other list between validation and this saved edit. */
    static boolean saveText(StringSetting setting, String value) throws Rejected {
        synchronized (Setting.class) {
            checkTextBudget(setting, value);
            return setting.save(value);
        }
    }

    private static void checkTextBudget(Map<StringSetting, String> replacements) throws Rejected {
        synchronized (Setting.class) {
            try {
                checkSize(serialize(replacements, true));
            } catch (JSONException failure) {
                throw new Rejected(Reason.VALUE, "Could not serialize settings");
            }
        }
    }

    private static void checkSize(String file) throws Rejected {
        if (file.getBytes(StandardCharsets.UTF_8).length > MAX_BYTES) {
            throw new Rejected(Reason.SIZE, "Larger than " + MAX_BYTES + " bytes");
        }
    }

    private static String serialize(Map<StringSetting, String> replacements, boolean reserve) throws JSONException {
        JSONObject switches = new JSONObject();
        for (BooleanSetting setting : ALLOWLIST) {
            switches.put(setting.key, reserve ? false : setting.persistedValue().booleanValue());
        }
        JSONObject texts = new JSONObject();
        for (StringSetting setting : TEXT_ALLOWLIST) {
            String value = replacements.containsKey(setting) ? replacements.get(setting) : setting.persistedValue();
            if (reserve && setting == TextSettings.TAB_ORDER) value = BottomBarTabs.join(BottomBarTabs.TABS);
            texts.put(setting.key, value);
        }
        String file = new JSONObject()
                .put(FORMAT_NAME, FORMAT)
                .put(SCHEMA_NAME, SCHEMA)
                .put(SETTINGS_NAME, switches)
                .put(TEXT_NAME, texts)
                .toString(2);
        // Android's JSON writer leaves lone UTF-16 surrogates literal. UTF-8 would replace them.
        // Escape only those code units, so both the byte budget and the written file preserve text.
        StringBuilder escaped = null;
        int start = 0;
        for (int index = 0; index < file.length(); index++) {
            char value = file.charAt(index);
            if (Character.isHighSurrogate(value) && index + 1 < file.length()
                    && Character.isLowSurrogate(file.charAt(index + 1))) {
                index++;
                continue;
            }
            if (!Character.isSurrogate(value)) continue;
            if (escaped == null) escaped = new StringBuilder(file.length());
            escaped.append(file, start, index).append("\\u").append(Integer.toHexString(value));
            start = index + 1;
        }
        return escaped == null ? file : escaped.append(file, start, file.length()).toString();
    }

    /** Whether a file carries the setting stored under [key], a switch or a text setting. */
    static boolean carries(@Nullable String key) {
        for (BooleanSetting setting : ALLOWLIST) {
            if (setting.key.equals(key)) return true;
        }
        return textSetting(key) != null;
    }

    /** The text setting a file names [key], or null when it carries none by that name. */
    @Nullable
    static StringSetting textSetting(@Nullable Object key) {
        for (StringSetting setting : TEXT_ALLOWLIST) {
            if (setting.key.equals(key)) return setting;
        }
        return null;
    }

    /**
     * [value] as the settings row for [setting] would have saved it, or null when that row never
     * could: anything but text, or for the tab order anything but nothing (Tumblr's order) or tab
     * names from Tumblr's tab list, comma separated, each once. The words to hide take any text,
     * trimmed as their box trims it.
     */
    @Nullable
    static String textValue(StringSetting setting, @Nullable Object value) {
        if (!(value instanceof String)) return null;
        String text = (String) value;
        if (setting == TextSettings.HIDDEN_WORDS || setting == TextSettings.ALLOWED_WORDS) return text.trim();
        if (setting == TextSettings.TAB_ORDER) {
            return text.isEmpty() || text.equals(BottomBarTabs.join(BottomBarTabs.parse(text))) ? text : null;
        }
        return null;
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
            throw new Rejected(Reason.FORMAT, "Not a HushTumblr settings file");
        }
        // A version is a whole number this build wrote or a later one. A later one is refused
        // rather than read field by field, which could land half of a file this build doesn't
        // understand. Anything else in its place was never written by HushTumblr.
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
        // A version 1 file has no text section, so the text settings stay as they are. A later
        // file may leave it out too, and then the same holds.
        boolean carriesText = (Integer) schema >= TEXT_SCHEMA;
        Object textSection = carriesText ? root.opt(TEXT_NAME) : null;
        if (textSection != null && !(textSection instanceof JSONObject)) {
            throw new Rejected(Reason.FORMAT, "No text settings");
        }

        int unknown = 0;
        for (Iterator<String> names = root.keys(); names.hasNext(); ) {
            String name = names.next();
            if (!FORMAT_NAME.equals(name) && !SCHEMA_NAME.equals(name) && !SETTINGS_NAME.equals(name)
                    && !(carriesText && TEXT_NAME.equals(name))) {
                unknown++;
            }
        }
        Map<String, BooleanSetting> known = new HashMap<>();
        for (BooleanSetting setting : ALLOWLIST) known.put(setting.key, setting);
        Map<BooleanSetting, Boolean> found = new HashMap<>();
        JSONObject values = (JSONObject) settings;
        for (Iterator<String> names = values.keys(); names.hasNext(); ) {
            String name = names.next();
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
        Map<StringSetting, String> texts = new LinkedHashMap<>();
        List<StringSetting> skipped = new ArrayList<>();
        if (textSection != null) {
            JSONObject named = (JSONObject) textSection;
            for (Iterator<String> names = named.keys(); names.hasNext(); ) {
                String name = names.next();
                StringSetting setting = textSetting(name);
                if (setting == null || (Integer) schema < 3 && setting == TextSettings.ALLOWED_WORDS) {
                    unknown++;
                    continue;
                }
                // Unlike a switch of the wrong type, a text value its row couldn't have saved
                // costs the rest of the file nothing: it's left out, and the preview says so.
                String value = textValue(setting, named.opt(name));
                if (value == null) skipped.add(setting);
                else texts.put(setting, value);
            }
        }
        if ((Integer) schema < 3 && ordered.containsKey(Settings.HIDE_REBLOGS)) {
            // Old Hide reblogs backups had no exceptions.
            ordered.put(Settings.KEEP_TAGGED_REBLOGS, false);
            ordered.put(Settings.KEEP_REBLOGS_WITH_CONTENT, false);
        }
        if ((Integer) schema < 3 && (ordered.containsKey(Settings.HIDE_POSTS_WITH_WORDS)
                || texts.containsKey(TextSettings.HIDDEN_WORDS))) {
            // Old word filters matched every field and had no exceptions.
            ordered.put(Settings.WORDS_CURRENT_TEXT, true);
            ordered.put(Settings.WORDS_REBLOG_TRAIL, true);
            ordered.put(Settings.WORDS_TAGS, true);
            ordered.put(Settings.WORDS_SUMMARY, true);
            texts.put(TextSettings.ALLOWED_WORDS, "");
        }
        return new Snapshot(ordered, texts, skipped, unknown);
    }

    /**
     * Writes the switches and text settings a file changes, all of them in one preference commit.
     * A setting the file doesn't name, or names with a value that failed its check, is left as it is.
     *
     * @return how many settings changed, including word lists and tab order, for result feedback.
     * @throws ApplyFailed when the commit failed. {@link Setting#saveAll} puts the switches
     *                     back, live and stored; {@link ApplyFailed#rolledBack} says whether that
     *                     worked for every one of them.
     */
    static int apply(Snapshot snapshot) throws ApplyFailed, Rejected {
        synchronized (Setting.class) {
            Map<Setting<?>, Object> changes = snapshot.changes();
            if (changes.isEmpty()) return 0;
            if (!snapshot.texts.isEmpty()) checkTextBudget(snapshot.texts);
            Snapshot before = current();
            write(changes);
            pendingUndo = new Undo(before, current());
            undoExpired = false;
            return changes.size();
        }
    }

    private static void write(Map<Setting<?>, Object> changes) throws ApplyFailed {
        Map<Setting<?>, Object> before = new LinkedHashMap<>();
        for (Setting<?> setting : changes.keySet()) before.put(setting, setting.persistedValue());
        try {
            Setting.saveAll(changes);
        } catch (Setting.BatchFailed failed) {
            throw new ApplyFailed(failed.restored, failed);
        } catch (IOException | RuntimeException refused) {
            // Refused before anything was written.
            throw new ApplyFailed(true, refused);
        }
        AbstractPreferenceFragment.recordRestartPendingChanges(before);
    }
}
