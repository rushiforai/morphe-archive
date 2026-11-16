package io.github.jordanwoodson.extension.shared.twitch;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.Spanned;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;

import io.github.jordanwoodson.extension.shared.ChatFilter;
import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Chat keywords: highlights native chat lines that mention you, contain a highlight word or come from a highlighted
 * user or role (with that entry's own color, if it has one), and hides lines with a blocked word or from a blocked
 * user. The line builder marks each line's sender span with its verdict; the row
 * binders read the mark and tint or collapse the row. Live messages are also checked as they arrive, so blocked
 * ones never reach the chat list and highlighted ones can vibrate.
 */
@SuppressWarnings("unused")
public final class TwitchChatKeywords {
    static final String KEY = ChatFilter.KEY;
    static final String MENTIONS = ChatFilter.MENTIONS;
    static final String VIBRATE = ChatFilter.VIBRATE;

    static final int NONE = ChatFilter.NONE;
    static final int HIGHLIGHT = ChatFilter.HIGHLIGHT;
    static final int HIDE = ChatFilter.HIDE;

    /** Twitch purple at 30%: readable over both the dark and the light chat background. */
    static final int HIGHLIGHT_COLOR = 0x4D9147FF;

    /**
     * The verdict of a line, set on its sender span, with the row color of a highlighted user or role (0 for the
     * default). Spans of any class survive Twitch's copies of the line.
     */
    private static final class Mark {
        final int verdict;
        final int color;

        Mark(int verdict, int color) {
            this.verdict = verdict;
            this.color = color;
        }
    }

    private static final Mark HIGHLIGHTED = new Mark(HIGHLIGHT, 0);
    private static final Mark HIDDEN = new Mark(HIDE, 0);

    /** The sender's login while a line is being built; null when the line isn't checked. */
    private static final ThreadLocal<String> LINE = new ThreadLocal<>();
    /** The sender's badge names (Twitch's badge set IDs) while a line is being built. */
    private static final ThreadLocal<List<String>> LINE_BADGES = new ThreadLocal<>();
    /** Badge set IDs and the role names that also stand for them in the highlighted users. */
    private static final String[][] ROLE_ALIASES = {
            {"moderator", "mod"}, {"subscriber", "sub"}, {"founder", "sub"}, {"broadcaster", "streamer"},
            {"partner", "verified"},
    };
    /** The height each collapsed row had. */
    private static final Map<View, Integer> COLLAPSED = Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Class<?>, Field> TEXT_FIELDS = new ConcurrentHashMap<>();
    private static final Map<Class<?>, Field> LOGIN_FIELDS = new ConcurrentHashMap<>();
    private static final Map<Class<?>, Field> SOURCE_FIELDS = new ConcurrentHashMap<>();
    private static final Map<Class<?>, Field> NAME_FIELDS = new ConcurrentHashMap<>();
    private static final Field NO_FIELD;
    private static volatile SharedPreferences userPreferences;
    private static boolean loggedFailure;

    static {
        Field none = null;
        try {
            none = TwitchChatKeywords.class.getDeclaredField("loggedFailure");
        } catch (NoSuchFieldException ignored) {
            // Never: the field above exists.
        }
        NO_FIELD = none;
    }

    private TwitchChatKeywords() {
    }

    // ---------------------------------------------------------------------------------------------
    // Injection points

    /**
     * Injection point: the start of the chat line builder, with the line's sender (a model with a
     * {@code username=}) and its click configuration, whose source tells channel chat from whispers.
     */
    public static void beginLine(Object sender, Object config) {
        beginLine(sender, config, null);
    }

    /**
     * Injection point: as {@link #beginLine(Object, Object)}, with the line's badges (Twitch's badge view models,
     * each with a {@code name=}, the badge set ID).
     */
    public static void beginLine(Object sender, Object config, List<?> badges) {
        String login = null;
        List<String> names = null;
        try {
            if (enabled() && !isWhisper(config)) {
                login = login(sender);
                if (!lists().highlightRoles.isEmpty()) names = badgeNames(badges);
            }
        } catch (RuntimeException e) {
            fail(e);
        }
        LINE.set(login);
        LINE_BADGES.set(names);
    }

    /**
     * Injection point: the end of the chat line builder, with the line's sender, inline header and message
     * spans. Returns the sender spans, marked when the line is highlighted or hidden.
     */
    public static CharSequence markLine(CharSequence sender, CharSequence header, CharSequence message) {
        // Kept until the next line begins: Chat appearance asks hidden() for the same line.
        String login = LINE.get();
        if (login == null || sender == null || sender.length() == 0) return sender;
        try {
            List<String> badges = LINE_BADGES.get();
            int verdict = classify(login, badges, message == null ? "" : message.toString());
            if (verdict == NONE) return sender;
            int color = verdict == HIGHLIGHT ? userColor(login, badges, lists()) : 0;
            Mark mark = verdict == HIDE ? HIDDEN : color == 0 ? HIGHLIGHTED : new Mark(HIGHLIGHT, color);
            Spannable marked = sender instanceof Spannable ? (Spannable) sender : new SpannableString(sender);
            marked.setSpan(mark, 0, marked.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            return marked;
        } catch (RuntimeException e) {
            fail(e);
            return sender;
        }
    }

    /**
     * Injection point: a live message arriving at the native chat list, with its ID, sender and tokens. True drops
     * it (blocked); a highlighted message vibrates when that is switched on.
     */
    public static boolean onLiveMessage(String id, Object sender, List<?> tokens) {
        return onLiveMessage(id, sender, tokens, null);
    }

    /** Injection point: as {@link #onLiveMessage(String, Object, List)}, with the sender's badges. */
    public static boolean onLiveMessage(String id, Object sender, List<?> tokens, List<?> badges) {
        try {
            if (!enabled()) return false;
            String login = login(sender);
            List<String> names = lists().highlightRoles.isEmpty() ? null : badgeNames(badges);
            int verdict = classify(login, names, text(tokens));
            if (verdict == HIDE) return true;
            if (verdict == HIGHLIGHT && Settings.isEnabled(VIBRATE)
                    && !login.toLowerCase(Locale.ROOT).equals(lists().self)) {
                ChatFilter.vibrate(TwitchContext.application(), id);
            }
        } catch (ReflectiveOperationException | RuntimeException e) {
            fail(e);
        }
        return false;
    }

    /**
     * Injection point: a chat row once bound, in native chat and VOD chat replay. Collapses a hidden line's row and
     * tints a highlighted one's, unless Twitch shows it selected or pressed.
     */
    public static void bindRow(View row, TextView text) {
        try {
            if (row == null || text == null) return;
            CharSequence line = text.getText();
            int verdict = enabled() ? verdict(line) : NONE;
            collapse(row, verdict == HIDE);
            if (verdict == HIGHLIGHT && TwitchChatStyle.isStockBackground(row)) {
                int color = color(line);
                row.setBackgroundColor(color != 0 ? color : HIGHLIGHT_COLOR);
            }
        } catch (RuntimeException e) {
            fail(e);
        }
    }

    /**
     * Whether the line being built, or a live message, is hidden, so Chat appearance leaves it out of the
     * alternating rows. Works in either order of the two patches' hooks.
     */
    static boolean hidden(CharSequence sender, CharSequence message) {
        try {
            if (verdict(sender) == HIDE) return true;
            String login = LINE.get();
            return login != null && classify(login, message == null ? "" : message.toString()) == HIDE;
        } catch (RuntimeException e) {
            return false;
        }
    }

    /** Whether a live or history message (sender and tokens) is hidden. */
    static boolean hiddenLive(Object sender, List<?> tokens) {
        try {
            return enabled() && classify(login(sender), text(tokens)) == HIDE;
        } catch (ReflectiveOperationException | RuntimeException e) {
            return false;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Verdicts

    static boolean enabled() {
        return ChatFilter.enabled();
    }

    /** The verdict marked on a bound line, NONE when it has none. */
    static int verdict(CharSequence line) {
        if (!(line instanceof Spanned)) return NONE;
        Mark[] marks = ((Spanned) line).getSpans(0, line.length(), Mark.class);
        int verdict = NONE;
        for (Mark mark : marks) verdict = Math.max(verdict, mark.verdict);
        return verdict;
    }

    /** The row color a highlighted line's mark asks for, 0 for the default one. */
    static int color(CharSequence line) {
        if (!(line instanceof Spanned)) return 0;
        for (Mark mark : ((Spanned) line).getSpans(0, line.length(), Mark.class)) {
            if (mark.verdict == HIGHLIGHT && mark.color != 0) return mark.color;
        }
        return 0;
    }

    /**
     * Hidden for a blocked user or word, highlighted for a mention of you, a highlight word or a highlighted user.
     * Used where the sender's badges aren't known (React Native chat): roles don't match there.
     */
    static int classify(String login, String text) {
        return ChatFilter.classify(login, text, lists());
    }

    /** As {@link #classify(String, String)}, with the sender's badge set IDs for the highlighted roles. */
    static int classify(String login, List<String> badges, String text) {
        ChatFilter.Lists lists = lists();
        int verdict = ChatFilter.classify(login, text, lists);
        if (verdict == NONE && role(badges, lists) != null) return HIGHLIGHT;
        return verdict;
    }

    /**
     * The row color for a highlighted line: the sender's own entry's, else the first of its roles' with a color in
     * the order of the setting, else 0 (the default highlight).
     */
    static int userColor(String login, List<String> badges, ChatFilter.Lists lists) {
        Integer own = login == null ? null : lists.highlightUsers.get(login.toLowerCase(Locale.ROOT));
        if (own != null && own != 0) return own;
        if (badges == null || badges.isEmpty()) return 0;
        for (Map.Entry<String, Integer> role : lists.highlightRoles.entrySet()) {
            if (role.getValue() != 0 && hasRole(badges, role.getKey())) return role.getValue();
        }
        return 0;
    }

    /** The first highlighted role (in the order of the setting) among a sender's badges, or null. */
    static String role(List<String> badges, ChatFilter.Lists lists) {
        if (badges == null || badges.isEmpty()) return null;
        for (String role : lists.highlightRoles.keySet()) {
            if (hasRole(badges, role)) return role;
        }
        return null;
    }

    /** Whether one of the badge set IDs is {@code role}, or a set the role's name stands for ("mod", "sub"...). */
    static boolean hasRole(List<String> badges, String role) {
        for (String badge : badges) {
            if (badge.equals(role)) return true;
            for (String[] alias : ROLE_ALIASES) {
                if (alias[0].equals(badge) && alias[1].equals(role)) return true;
            }
        }
        return false;
    }

    /** The badge set IDs ("moderator", "subscriber"...) of a line's badge models, lowercase. */
    static List<String> badgeNames(List<?> badges) {
        if (badges == null || badges.isEmpty()) return Collections.emptyList();
        List<String> names = new ArrayList<>(badges.size());
        for (Object badge : badges) {
            if (badge == null) continue;
            String name = name(badge);
            if (!name.isEmpty()) names.add(name.toLowerCase(Locale.ROOT));
        }
        return names;
    }

    /** The lists for Twitch's signed-in account: its login, and its display name while mentions are on. */
    static ChatFilter.Lists lists() {
        boolean mentions = Settings.isEnabled(MENTIONS);
        return ChatFilter.lists(signedIn("name"), mentions ? signedIn("DisplayName") : "");
    }

    /** A value of the signed-in account from Twitch's own user preferences, lowercase; "" when signed out. */
    static String signedIn(String key) {
        try {
            SharedPreferences preferences = userPreferences;
            if (preferences == null) {
                Context context = TwitchContext.application();
                if (context == null) return "";
                userPreferences = preferences = context.getSharedPreferences("twitch_user_prefs", Context.MODE_PRIVATE);
            }
            String value = preferences.getString(key, null);
            return value == null ? "" : value.trim().toLowerCase(Locale.ROOT);
        } catch (RuntimeException e) {
            return "";
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Rows

    /** Gives a hidden line's row no height, and gives a reused row its height back. */
    private static void collapse(View row, boolean hide) {
        ViewGroup.LayoutParams params = row.getLayoutParams();
        if (hide) {
            if (!COLLAPSED.containsKey(row)) {
                COLLAPSED.put(row, params == null ? ViewGroup.LayoutParams.WRAP_CONTENT : params.height);
            }
            if (params == null) {
                params = new ViewGroup.MarginLayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0);
            } else {
                params.height = 0;
            }
            row.setLayoutParams(params);
            row.setVisibility(View.GONE);
        } else {
            Integer height = COLLAPSED.remove(row);
            if (height == null) return;
            if (params != null) {
                params.height = height;
                row.setLayoutParams(params);
            }
            row.setVisibility(View.VISIBLE);
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Models, read through their own toString labels (their field names are obfuscated)

    /** The sender's login ("username=" in its toString), or "" if there is none. */
    static String login(Object sender) {
        if (sender == null) return "";
        try {
            Field field = LOGIN_FIELDS.get(sender.getClass());
            if (field == null) {
                Field[] found = labelled(sender, "username=");
                if (found == null) return "";
                field = found[0];
                // Two fields can print the same value (login and display name alike): use it, but don't keep it.
                if (found.length == 1) LOGIN_FIELDS.put(sender.getClass(), field);
            }
            Object login = field.get(sender);
            return login instanceof String ? (String) login : "";
        } catch (ReflectiveOperationException e) {
            return "";
        }
    }

    /** A badge model's set ID ("name=" in its toString), or "". */
    static String name(Object badge) {
        try {
            Field field = NAME_FIELDS.get(badge.getClass());
            if (field == null) {
                Field[] found = labelled(badge, "name=");
                field = found == null ? NO_FIELD : found[0];
                NAME_FIELDS.put(badge.getClass(), field);
            }
            if (field == NO_FIELD) return "";
            Object name = field.get(badge);
            return name instanceof String ? (String) name : "";
        } catch (ReflectiveOperationException e) {
            return "";
        }
    }

    /** A message's tokens as plain text: text, mentions, links and emote codes. */
    static String text(List<?> tokens) throws ReflectiveOperationException {
        if (tokens == null) return "";
        StringBuilder text = new StringBuilder();
        for (Object token : tokens) {
            if (token == null) continue;
            Field field = TEXT_FIELDS.get(token.getClass());
            if (field == null) {
                Field[] found = labelled(token, "text=");
                if (found == null) found = labelled(token, "url=");
                field = found == null ? NO_FIELD : found[0];
                TEXT_FIELDS.put(token.getClass(), field);
            }
            if (field == NO_FIELD) continue;
            Object value = field.get(token);
            if (value instanceof String) text.append((String) value);
        }
        return text.toString();
    }

    /**
     * The String fields of {@code model} whose value its toString prints right after {@code label}, or null if
     * none does.
     */
    private static Field[] labelled(Object model, String label) throws ReflectiveOperationException {
        String described = model.toString();
        List<Field> found = new ArrayList<>();
        for (Class<?> type = model.getClass(); type != null && type != Object.class; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType() != String.class) continue;
                field.setAccessible(true);
                Object value = field.get(model);
                if (!(value instanceof String)) continue;
                String printed = label + value;
                int at = described.indexOf(printed);
                while (at >= 0) {
                    int end = at + printed.length();
                    if (end == described.length() || described.charAt(end) == ',' || described.charAt(end) == ')') {
                        found.add(field);
                        break;
                    }
                    at = described.indexOf(printed, at + 1);
                }
            }
        }
        return found.isEmpty() ? null : found.toArray(new Field[0]);
    }

    /** Whether a line's click configuration says it is shown in a whisper thread. */
    private static boolean isWhisper(Object config) {
        return "Whisper".equals(source(config));
    }

    /**
     * Where a line is shown, from its click configuration's one enum field: "Chat" (live chat and history),
     * "Whisper", "Other" (VOD chat replay), or null when it can't tell.
     */
    static String source(Object config) {
        if (config == null) return null;
        Class<?> type = config.getClass();
        Field field = SOURCE_FIELDS.get(type);
        if (field == null) {
            for (Field candidate : type.getDeclaredFields()) {
                if (!candidate.getType().isEnum() || Modifier.isStatic(candidate.getModifiers())) continue;
                if (field != null) {
                    field = NO_FIELD; // Ambiguous.
                    break;
                }
                field = candidate;
            }
            if (field == null) field = NO_FIELD;
            else if (field != NO_FIELD) field.setAccessible(true);
            SOURCE_FIELDS.put(type, field);
        }
        if (field == NO_FIELD) return null;
        try {
            Object source = field.get(config);
            return source instanceof Enum ? ((Enum<?>) source).name() : null;
        } catch (IllegalAccessException e) {
            return null;
        }
    }

    private static void fail(Exception e) {
        if (loggedFailure) return;
        loggedFailure = true;
        Logger.d("chat keywords: failed: " + e);
    }
}
