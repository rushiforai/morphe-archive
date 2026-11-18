package io.github.sabopura.morphe.extension.twitch.chat;

import android.content.Context;

import io.github.sabopura.morphe.extension.twitch.chat.emotes.TwitchEmotes;
import io.github.sabopura.morphe.extension.twitch.ui.HistoryRows;
import io.github.sabopura.morphe.extension.twitch.ui.HistorySheet;

import org.json.*;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.function.Consumer;

public final class ChatHistory {
    private static final LinkedHashMap<String, HistoryMessage> MESSAGES = new LinkedHashMap<>();
    private static boolean loaded, savePending;
    private static long generation;
    /** One thread, so saves, loads and deletes happen in the order they were asked for. */
    private static final java.util.concurrent.ThreadPoolExecutor IO =
            new java.util.concurrent.ThreadPoolExecutor(
                    1,
                    1,
                    30,
                    java.util.concurrent.TimeUnit.SECONDS,
                    new java.util.concurrent.LinkedBlockingQueue<>(),
                    r -> {
                        Thread t = new Thread(r, "ChatHistoryStorage");
                        t.setDaemon(true);
                        return t;
                    });

    static {
        IO.allowCoreThreadTimeOut(true);
    }

    private static final int LIMIT = 1000;
    private static final java.util.regex.Pattern COLOR = java.util.regex.Pattern.compile("color=#([0-9A-Fa-f]{6})");
    /** Saving rewrites the whole file, so it happens rarely. */
    private static final long SAVE_INTERVAL_MS = 30_000;

    public static synchronized void record(Context context, HistoryMessage m) {
        if (m.id == null || m.text == null || m.text.length() > 16000) return;
        boolean persist = ChatSettings.get(context).saveHistory;
        if (persist && !loaded) load(context.getApplicationContext(), () -> {});
        MESSAGES.put(m.room + ":" + m.id, m);
        trim();
        if (persist && !savePending) {
            savePending = true;
            Context app = context.getApplicationContext();
            long expected = generation;
            PublicApi.UI.postDelayed(
                    () -> {
                        savePending = false;
                        List<HistoryMessage> snapshot = snapshot(null);
                        IO.execute(() -> save(app, snapshot, expected));
                    },
                    SAVE_INTERVAL_MS);
        }
    }

    private static void trim() {
        while (MESSAGES.size() > LIMIT) MESSAGES.remove(MESSAGES.keySet().iterator().next());
    }

    private static synchronized List<HistoryMessage> snapshot(String room) {
        List<HistoryMessage> list = new ArrayList<>();
        for (HistoryMessage m : MESSAGES.values())
            if (room == null || room.equals(m.room)) list.add(m);
        return list;
    }

    /** Runs on the storage thread and holds no lock across the file sync: chat rows would wait on it. */
    private static void save(Context c, List<HistoryMessage> messages, long expected) {
        synchronized (ChatHistory.class) {
            if (expected != generation) return;
        }
        if (!ChatSettings.get(c).saveHistory) return;
        android.util.AtomicFile file =
                new android.util.AtomicFile(new File(c.getFilesDir(), "chat-history.json"));
        FileOutputStream out = null;
        try {
            JSONArray a = new JSONArray();
            for (HistoryMessage m : messages)
                a.put(
                        new JSONObject()
                                .put("id", m.id)
                                .put("room", m.room)
                                .put("user", m.user)
                                .put("login", m.login)
                                .put("userId", m.userId)
                                .put("text", m.text)
                                .put("time", m.time)
                                .put("emotes", m.emotes.isEmpty() ? null : m.emotes));
            byte[] bytes = a.toString().getBytes(StandardCharsets.UTF_8);
            if (bytes.length > 2 * 1024 * 1024) return;
            out = file.startWrite();
            out.write(bytes);
            file.finishWrite(out);
        } catch (Throwable ignored) {
            if (out != null) file.failWrite(out);
        }
    }

    private static void load(Context c, Runnable done) {
        if (loaded) {
            IO.execute(() -> PublicApi.UI.post(done));
            return;
        }
        loaded = true;
        long expected = generation;
        IO.execute(
                () -> {
                    try {
                        File file = new File(c.getFilesDir(), "chat-history.json");
                        if (file.length() > 2 * 1024 * 1024) return;
                        String value;
                        try (InputStream in = new FileInputStream(file);
                                ByteArrayOutputStream out = new ByteArrayOutputStream()) {
                            byte[] b = new byte[8192];
                            int n;
                            while ((n = in.read(b)) != -1) {
                                if (out.size() + n > 2 * 1024 * 1024) throw new IOException();
                                out.write(b, 0, n);
                            }
                            value = out.toString("UTF-8");
                        }
                        JSONArray a = new JSONArray(value);
                        synchronized (ChatHistory.class) {
                            if (expected != generation) return;
                            for (int i = 0; i < a.length() && i < LIMIT; i++) {
                                JSONObject o = a.getJSONObject(i);
                                // Older saves kept the whole rendered row, sender included.
                                String text = o.getString("text");
                                HistoryMessage m =
                                        new HistoryMessage(
                                                o.getString("id"),
                                                o.getString("room"),
                                                o.getString("user"),
                                                o.optString("login", o.getString("user")),
                                                o.has("login") ? text : ChatRules.body(text),
                                                o.getLong("time"),
                                                o.optString("userId", ""),
                                                o.optString("emotes", ""));
                                MESSAGES.putIfAbsent(m.room + ":" + m.id, m);
                            }
                            // Saved messages arrive after newer live ones, so restore time order first.
                            List<HistoryMessage> ordered = new ArrayList<>(MESSAGES.values());
                            ordered.sort(Comparator.comparingLong(m -> m.time));
                            MESSAGES.clear();
                            for (HistoryMessage m : ordered) MESSAGES.put(m.room + ":" + m.id, m);
                            trim();
                        }
                    } catch (Throwable ignored) {
                    } finally {
                        PublicApi.UI.post(done);
                    }
                });
    }

    public static void show(Context context, boolean recent) {
        HistorySheet.show(context, recent);
    }

    /**
     * The messages this device showed in {@code room} (in every room for null), oldest first and without
     * blocked ones, delivered on the main thread; null when they could not be read.
     */
    public static void loadSaved(Context context, String room, Consumer<List<HistoryRows.Row>> done) {
        ChatSettings settings = ChatSettings.get(context);
        load(context, () -> IO.execute(() -> {
            List<HistoryRows.Row> rows = null;
            try {
                List<HistoryRows.Row> all = new ArrayList<>();
                for (HistoryMessage m : snapshot(room))
                    all.add(new HistoryRows.Row(m, 0, TwitchEmotes.parse(m.emotes, m.text)));
                rows = visible(settings, all);
            } catch (Throwable ignored) {
            }
            List<HistoryRows.Row> result = rows;
            PublicApi.UI.post(() -> done.accept(result));
        }));
    }

    /**
     * robotty.de's public log of {@code channel}, oldest first and without blocked messages, delivered on
     * the main thread; null when it could not be read. False when too many requests already wait.
     */
    public static boolean fetchRecent(Context context, String channel, Consumer<List<HistoryRows.Row>> done) {
        ChatSettings settings = ChatSettings.get(context);
        return PublicApi.submit(() -> {
            List<HistoryRows.Row> rows = null;
            try {
                if (!channel.matches("[A-Za-z0-9_]{1,25}")) throw new IllegalArgumentException();
                JSONObject json = new JSONObject(PublicApi.get(
                        "https://recent-messages.robotty.de/api/v2/recent-messages/"
                                + channel.toLowerCase(Locale.ROOT)
                                + "?limit=500&hideModeratedMessages=true"));
                JSONArray a = json.optJSONArray("messages");
                Map<String, HistoryRows.Row> unique = new LinkedHashMap<>();
                if (a != null)
                    for (int i = 0; i < a.length(); i++) {
                        String line = a.optString(i);
                        HistoryMessage m = HistoryMessage.parseIrc(line);
                        if (m != null)
                            unique.put(m.id, new HistoryRows.Row(m, nameColor(line), TwitchEmotes.ofIrc(line)));
                    }
                rows = visible(settings, unique.values());
            } catch (Throwable ignored) {
            }
            List<HistoryRows.Row> result = rows;
            PublicApi.UI.post(() -> done.accept(result));
        });
    }

    private static List<HistoryRows.Row> visible(ChatSettings settings, Collection<HistoryRows.Row> rows) {
        List<HistoryRows.Row> list = new ArrayList<>();
        for (HistoryRows.Row row : rows) {
            HistoryMessage m = row.message;
            if (!settings.enabled || !settings.rules.blocks(m.text, m.login, m.userId)) list.add(row);
        }
        list.sort(Comparator.comparingLong(row -> row.message.time));
        return list;
    }

    /** The sender's chat colour from an IRC line's tags, or 0 when the line has none. */
    static int nameColor(String line) {
        int end = line == null || !line.startsWith("@") ? -1 : line.indexOf(' ');
        if (end < 0) return 0;
        for (String tag : line.substring(1, end).split(";")) {
            java.util.regex.Matcher color = COLOR.matcher(tag);
            if (color.matches()) return 0xFF000000 | Integer.parseInt(color.group(1), 16);
        }
        return 0;
    }

    /** Forgets the viewed messages of every room, in memory and in the saved file. */
    public static void clear(Context context) {
        synchronized (ChatHistory.class) {
            generation++;
            savePending = false;
            MESSAGES.clear();
        }
        File file = new File(context.getFilesDir(), "chat-history.json");
        IO.execute(() -> new android.util.AtomicFile(file).delete());
    }
}
