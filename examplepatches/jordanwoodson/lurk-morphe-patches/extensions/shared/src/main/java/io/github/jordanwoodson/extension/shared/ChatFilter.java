package io.github.jordanwoodson.extension.shared;

import android.content.Context;
import android.os.Build;
import android.os.SystemClock;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.os.VibratorManager;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Chat keywords, shared by the apps: the verdict on a chat message from the Lurk settings, whether it mentions
 * you or has a highlight word (highlight) or a blocked word or sender (hide). The apps supply the signed-in
 * account and do the marking, hiding and tinting.
 */
public final class ChatFilter {
    public static final String KEY = "chat_keywords";
    public static final String MENTIONS = "chat_highlight_mentions";
    public static final String HIGHLIGHT_WORDS = "chat_highlight_words";
    public static final String VIBRATE = "chat_highlight_vibrate";
    public static final String BLOCKED_WORDS = "chat_blocked_words";
    public static final String BLOCKED_USERS = "chat_blocked_users";
    /** Users (and, where the app knows them, roles) whose every message is highlighted. Registered by Twitch only. */
    public static final String HIGHLIGHT_USERS = "chat_highlight_users";

    public static final int NONE = 0;
    public static final int HIGHLIGHT = 1;
    public static final int HIDE = 2;

    private static final long VIBRATE_GAP_MS = 3000;

    private static final Set<String> vibrated = Collections.newSetFromMap(new LinkedHashMap<String, Boolean>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
            return size() > 64;
        }
    });
    private static long lastVibration;
    private static volatile Lists lists;

    private ChatFilter() {
    }

    /** The settings as patterns, rebuilt when one of them or the signed-in account changes. */
    public static final class Lists {
        final String rawBlockedWords;
        final String rawBlockedUsers;
        final String rawHighlightWords;
        final String rawHighlightUsers;
        final boolean mentions;
        /** The signed-in login, lowercase; "" when signed out. Its own messages are never mentions. */
        public final String self;
        final String selfName;
        final Pattern blockedWords;
        final Pattern highlightWords;
        final Pattern mention;
        final Set<String> blockedUsers;
        /**
         * Highlighted users: login (lowercase, without "@") to its own background color, 0 for the default one.
         * In the order of the setting.
         */
        public final Map<String, Integer> highlightUsers;
        /** The entries written with "@" (role names such as {@code mod} or {@code vip}), the same way. */
        public final Map<String, Integer> highlightRoles;
        /** {@link Settings#changes()} when the settings were read; -1 when changes can't be watched. */
        final long changes;

        Lists(String blockedWords, String blockedUsers, String highlightWords, String highlightUsers, boolean mentions,
              String self, String selfName, long changes) {
            this.changes = changes;
            this.blockedUsers = new HashSet<>();
            rawBlockedWords = blockedWords;
            rawBlockedUsers = blockedUsers;
            rawHighlightWords = highlightWords;
            rawHighlightUsers = highlightUsers;
            Map<String, Integer> users = new LinkedHashMap<>();
            Map<String, Integer> roles = new LinkedHashMap<>();
            for (String entry : entries(highlightUsers)) {
                int[] color = new int[1];
                String name = highlightName(entry, color);
                if (name == null) continue;
                if (entry.startsWith("@") && !roles.containsKey(name)) roles.put(name, color[0]);
                if (!users.containsKey(name)) users.put(name, color[0]);
            }
            this.highlightUsers = Collections.unmodifiableMap(users);
            this.highlightRoles = Collections.unmodifiableMap(roles);
            this.mentions = mentions;
            this.self = self;
            this.selfName = selfName;
            this.blockedWords = wordsPattern(entries(blockedWords));
            this.highlightWords = wordsPattern(entries(highlightWords));
            for (String user : entries(blockedUsers)) {
                while (user.startsWith("@")) user = user.substring(1);
                if (!user.isEmpty()) this.blockedUsers.add(user.toLowerCase(Locale.ROOT));
            }
            List<String> names = new ArrayList<>();
            if (mentions && !self.isEmpty()) {
                names.add(self);
                if (!selfName.isEmpty() && !selfName.equalsIgnoreCase(self)) names.add(selfName);
            }
            this.mention = wordsPattern(names);
        }

        /** The same lists, read again at {@code changes}: an unrelated setting changed. */
        private Lists(Lists same, long changes) {
            rawBlockedWords = same.rawBlockedWords;
            rawBlockedUsers = same.rawBlockedUsers;
            rawHighlightWords = same.rawHighlightWords;
            rawHighlightUsers = same.rawHighlightUsers;
            highlightUsers = same.highlightUsers;
            highlightRoles = same.highlightRoles;
            mentions = same.mentions;
            self = same.self;
            selfName = same.selfName;
            blockedWords = same.blockedWords;
            highlightWords = same.highlightWords;
            mention = same.mention;
            blockedUsers = same.blockedUsers;
            this.changes = changes;
        }

        boolean matches(String blockedWords, String blockedUsers, String highlightWords, String highlightUsers,
                        boolean mentions, String self, String selfName) {
            return rawBlockedWords.equals(blockedWords) && rawBlockedUsers.equals(blockedUsers)
                    && rawHighlightWords.equals(highlightWords) && rawHighlightUsers.equals(highlightUsers)
                    && this.mentions == mentions
                    && this.self.equals(self) && this.selfName.equals(selfName);
        }
    }

    /** Whether Chat keywords is on. */
    public static boolean enabled() {
        return Settings.isEnabled(KEY);
    }

    /**
     * The current lists for the signed-in account: {@code self} its login and {@code selfName} another name
     * that mentions it (a display name), both lowercase, "" when signed out or unknown. Called for every chat
     * message: the settings are only read again after one of the Lurk settings changed.
     */
    public static Lists lists(String self, String selfName) {
        long changes = Settings.changes();
        Lists current = lists;
        if (current != null && changes >= 0 && current.changes == changes && current.self.equals(self)
                && current.selfName.equals(selfName)) {
            return current;
        }
        String blockedWords = Settings.getText(BLOCKED_WORDS);
        String blockedUsers = Settings.getText(BLOCKED_USERS);
        String highlightWords = Settings.getText(HIGHLIGHT_WORDS);
        String highlightUsers = Settings.getText(HIGHLIGHT_USERS);
        boolean mentions = Settings.isEnabled(MENTIONS);
        if (current == null || !current.matches(blockedWords, blockedUsers, highlightWords, highlightUsers, mentions,
                self, selfName)) {
            current = new Lists(blockedWords, blockedUsers, highlightWords, highlightUsers, mentions, self, selfName,
                    changes);
        } else if (current.changes != changes) {
            current = new Lists(current, changes);
        }
        lists = current;
        return current;
    }

    /** Hidden for a blocked user or word, highlighted for a mention of you or a highlight word. */
    public static int classify(String login, String text, Lists current) {
        String sender = login == null ? "" : login.toLowerCase(Locale.ROOT);
        if (text == null) text = "";
        if (!sender.isEmpty() && current.blockedUsers.contains(sender)) return HIDE;
        if (current.blockedWords != null && current.blockedWords.matcher(text).find()) return HIDE;
        if (current.mention != null && !sender.equals(current.self) && current.mention.matcher(text).find()) {
            return HIGHLIGHT;
        }
        if (current.highlightWords != null && current.highlightWords.matcher(text).find()) return HIGHLIGHT;
        if (!sender.isEmpty() && current.highlightUsers.containsKey(sender)) return HIGHLIGHT;
        return NONE;
    }

    /**
     * One entry of the highlighted users: {@code name}, {@code @role}, either followed by {@code =#RRGGBB} (or
     * {@code =#AARRGGBB}, or without the "#"). Returns the name, lowercase and without "@", and puts the color in
     * {@code color[0]}: 0 for none, a six-digit color at the default highlight's 30% opacity so text stays
     * readable. Null for an entry that isn't a name.
     */
    static String highlightName(String entry, int[] color) {
        String name = entry;
        String value = null;
        int at = entry.indexOf('=');
        if (at >= 0) {
            name = entry.substring(0, at);
            value = entry.substring(at + 1).trim();
        }
        name = name.trim();
        while (name.startsWith("@")) name = name.substring(1);
        name = name.trim().toLowerCase(Locale.ROOT);
        if (name.isEmpty() || name.length() > 64) return null;
        color[0] = 0;
        if (value != null) {
            if (value.startsWith("#")) value = value.substring(1);
            if (value.matches("[0-9a-fA-F]{6}")) {
                color[0] = 0x4D000000 | Integer.parseInt(value, 16);
            } else if (value.matches("[0-9a-fA-F]{8}")) {
                color[0] = (int) Long.parseLong(value, 16);
            }
        }
        return name;
    }

    /** The entries of a comma- (or line-) separated list, trimmed, without empty ones. */
    public static List<String> entries(String list) {
        List<String> entries = new ArrayList<>();
        for (String entry : list.split("[,\n]")) {
            String trimmed = entry.trim();
            if (!trimmed.isEmpty()) entries.add(trimmed);
        }
        return entries;
    }

    /** Any of {@code words} as a whole word (not inside a longer word), in any case. Null for no words. */
    public static Pattern wordsPattern(List<String> words) {
        if (words.isEmpty()) return null;
        StringBuilder alternatives = new StringBuilder();
        for (String word : words) {
            if (alternatives.length() > 0) alternatives.append('|');
            alternatives.append(Pattern.quote(word));
        }
        return Pattern.compile("(?<![\\p{L}\\p{N}_])(?:" + alternatives + ")(?![\\p{L}\\p{N}_])",
                Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    }

    /**
     * A short vibration for a highlighted message, once per message {@code id} and at most every three
     * seconds. Only call it while the vibrate switch is on.
     */
    public static void vibrate(Context context, String id) {
        synchronized (vibrated) {
            if (id != null && !vibrated.add(id)) return;
            long now = SystemClock.elapsedRealtime();
            if (now - lastVibration < VIBRATE_GAP_MS) return;
            lastVibration = now;
        }
        if (context == null) return;
        try {
            Vibrator vibrator;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                VibratorManager manager = context.getSystemService(VibratorManager.class);
                vibrator = manager == null ? null : manager.getDefaultVibrator();
            } else {
                vibrator = context.getSystemService(Vibrator.class);
            }
            if (vibrator == null || !vibrator.hasVibrator()) return;
            vibrator.vibrate(VibrationEffect.createOneShot(120, VibrationEffect.DEFAULT_AMPLITUDE));
        } catch (SecurityException e) {
            // An app (or a clone) without the VIBRATE permission: highlights still show, silently.
            Logger.d("chat keywords: can't vibrate: " + e.getMessage());
        }
    }
}
