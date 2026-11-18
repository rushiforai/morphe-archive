package io.github.sabopura.morphe.extension.twitch.ui;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import io.github.sabopura.morphe.extension.twitch.chat.HistoryMessage;
import io.github.sabopura.morphe.extension.twitch.chat.emotes.TwitchEmotes;

/**
 * The history sheet's rows: every loaded message with its search text made once, and the ones the
 * search field keeps. Filtering a thousand rows per keystroke is then only {@code contains} calls.
 */
public final class HistoryRows {
    /** How far loading got. */
    enum Fetch { LOADING, NO_CHANNEL, FAILED, BUSY, DONE }

    /** What the list area shows. */
    enum Screen { LOADING, NO_CHANNEL, FAILED, BUSY, EMPTY, NO_MATCH, LIST }

    public static final class Row {
        public final HistoryMessage message;
        /** The sender's chat colour, or 0 when the source has none. */
        final int color;
        /** The Twitch emotes in the message, when the source says which words are emotes. */
        final TwitchEmotes emotes;
        /** Name, login and message, normalised like the words typed into the search field. */
        final String key;

        public Row(HistoryMessage message, int color) {
            this(message, color, TwitchEmotes.NONE);
        }

        public Row(HistoryMessage message, int color, TwitchEmotes emotes) {
            this.message = message;
            this.color = color;
            this.emotes = emotes;
            key = SearchText.normalize(message.user + " " + message.login + " " + message.text);
        }
    }

    /** A row as shown: the name, then the message, and the stretches the search matched. */
    static final class Line {
        final String text;
        final int nameEnd, bodyStart;
        /** A "/me" message, which reads as the sender doing something. */
        final boolean action;
        final List<int[]> marks;

        private Line(String text, int nameEnd, int bodyStart, boolean action, List<int[]> marks) {
            this.text = text;
            this.nameEnd = nameEnd;
            this.bodyStart = bodyStart;
            this.action = action;
            this.marks = marks;
        }

        String body() {
            return text.substring(bodyStart);
        }
    }

    private List<Row> all = Collections.emptyList();
    private final List<Row> shown = new ArrayList<>();
    private List<String> tokens = Collections.emptyList();

    void set(List<Row> rows) {
        all = rows;
        apply();
    }

    void filter(String query) {
        tokens = SearchText.tokens(query);
        apply();
    }

    private void apply() {
        shown.clear();
        for (Row row : all) if (matches(row)) shown.add(row);
    }

    private boolean matches(Row row) {
        for (String token : tokens) if (!row.key.contains(token)) return false;
        return true;
    }

    int total() {
        return all.size();
    }

    int size() {
        return shown.size();
    }

    Row get(int position) {
        return shown.get(position);
    }

    List<String> tokens() {
        return tokens;
    }

    boolean searching() {
        return !tokens.isEmpty();
    }

    static Screen screen(Fetch fetch, int total, int shown) {
        switch (fetch) {
            case LOADING:
                return Screen.LOADING;
            case NO_CHANNEL:
                return Screen.NO_CHANNEL;
            case FAILED:
                return Screen.FAILED;
            case BUSY:
                return Screen.BUSY;
            default:
                return total == 0 ? Screen.EMPTY : shown == 0 ? Screen.NO_MATCH : Screen.LIST;
        }
    }

    static Line line(String name, String text, List<String> tokens) {
        boolean action = text.startsWith("/me ");
        String body = action ? text.substring(4) : text;
        String joint = action ? " " : ": ";
        int bodyStart = name.length() + joint.length();
        List<int[]> marks = new ArrayList<>();
        if (!tokens.isEmpty()) {
            marks.addAll(SearchText.ranges(name, tokens));
            for (int[] range : SearchText.ranges(body, tokens))
                marks.add(new int[]{range[0] + bodyStart, range[1] + bodyStart});
        }
        return new Line(name + joint + body, name.length(), bodyStart, action, marks);
    }
}
