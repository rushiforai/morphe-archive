package io.github.sabopura.morphe.extension.twitch.chat;

import java.util.*;

public final class HistoryMessage {
    private static final String COMMAND = " PRIVMSG #";
    private static final String ACTION = "\u0001ACTION ";

    public final String id, room, user, login, userId, text;
    /** The message's IRC "emotes" tag, or "": where Twitch's own emotes are in {@link #text}. */
    public final String emotes;
    public final long time;

    public HistoryMessage(
            String id, String room, String user, String login, String text, long time, String userId) {
        this(id, room, user, login, text, time, userId, "");
    }

    public HistoryMessage(
            String id, String room, String user, String login, String text, long time, String userId, String emotes) {
        this.id = id;
        this.room = room == null ? "" : room;
        this.user = user == null ? "" : user;
        this.login = login == null ? "" : login;
        this.userId = userId == null ? "" : userId;
        this.text = text;
        this.time = time;
        this.emotes = emotes == null ? "" : emotes;
    }

    /**
     * The text of a PRIVMSG line as it was sent, a "/me" still in its wrapper; null for any other
     * line. IRC lets the last parameter drop its colon when it holds no space, and a log may send
     * either form: most Japanese messages have no space.
     */
    public static String ircText(String line) {
        int command = line == null ? -1 : line.indexOf(COMMAND);
        int space = command < 0 ? -1 : line.indexOf(' ', command + COMMAND.length());
        if (space < 0) return null;
        return line.substring(line.startsWith(":", space + 1) ? space + 2 : space + 1);
    }

    /** The words of a "/me" message, or null for an ordinary one. */
    public static String action(String text) {
        return text.startsWith(ACTION) && text.endsWith("\u0001")
                ? text.substring(ACTION.length(), text.length() - 1)
                : null;
    }

    public static HistoryMessage parseIrc(String line) {
        if (line == null || line.length() > 16000) return null;
        String text = ircText(line);
        if (text == null) return null;
        int command = line.indexOf(COMMAND);
        String channel = line.substring(command + COMMAND.length(), line.indexOf(' ', command + COMMAND.length()));
        if (!channel.matches("[A-Za-z0-9_]{1,25}")) return null;
        Map<String, String> tags = new HashMap<>();
        int source = 0;
        if (line.startsWith("@")) {
            int end = line.indexOf(' ');
            for (String tag : line.substring(1, end).split(";")) {
                int equal = tag.indexOf('=');
                if (equal > 0)
                    tags.put(tag.substring(0, equal), unescape(tag.substring(equal + 1)));
            }
            source = end + 1;
        }
        // ":login!user@host" stands in front of the command.
        int bang = line.indexOf('!', source);
        String login = line.startsWith(":", source) && bang > source + 1 && bang < command
                ? line.substring(source + 1, bang)
                : "";
        String user = tags.get("display-name");
        if (user == null || user.isEmpty()) user = login;
        String action = action(text);
        if (action != null) text = "/me " + action;
        long time = 0;
        try {
            time =
                    Long.parseLong(
                            tags.getOrDefault(
                                    "tmi-sent-ts", tags.getOrDefault("rm-received-ts", "0")));
        } catch (NumberFormatException ignored) {
        }
        return new HistoryMessage(
                tags.getOrDefault("id", line),
                channel,
                user,
                login,
                text,
                time,
                tags.getOrDefault("user-id", ""));
    }

    public static String unescape(String s) {
        StringBuilder b = new StringBuilder();
        boolean escape = false;
        for (char c : s.toCharArray()) {
            if (escape) {
                b.append(c == 's' ? ' ' : c == ':' ? ';' : c == 'r' ? '\r' : c == 'n' ? '\n' : c);
                escape = false;
            } else if (c == '\\') escape = true;
            else b.append(c);
        }
        return b.toString();
    }
}
