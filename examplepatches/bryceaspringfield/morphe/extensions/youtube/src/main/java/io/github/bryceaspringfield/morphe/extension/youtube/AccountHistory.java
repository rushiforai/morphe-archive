package io.github.bryceaspringfield.morphe.extension.youtube;

import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * The signed-in account's watch history, the source of a feed's red progress bars: YouTube fills a bar from the
 * account's resume positions on the device, and the feed item's own data has no trace of it (checked on 2026-11-11 on
 * a search result fully watched: its three copies hold no progress, and the bar is a separate component of 48 or 82
 * bytes). Reads the first pages of the History page every 10 minutes while feeds load, and keeps each video's
 * percent watched and title. The last read is saved to the app's files and loaded at start, since the first feed
 * after a start lays out before the first read answers (tested on 2026-11-11: a Home video played 20 s was in the
 * history read, but Home had laid it out a few seconds earlier, unhidden).
 */
final class AccountHistory {

    private static final long REFRESH_MS = 10 * 60 * 1000;
    private static final int PAGES = 4;
    private static final Pattern VIDEO = Pattern.compile("\"videoId\":\"([A-Za-z0-9_-]{11})\"");
    private static final Pattern PERCENT = Pattern.compile(
            "\"(?:percentDurationWatched|startPercent|percent)\":(\\d+(?:\\.\\d+)?)");
    private static final Pattern TITLE = Pattern.compile("\"title\":\\{\"(?:runs\":\\[\\{\"text|simpleText|content)\":\"((?:[^\"\\\\]|\\\\.){3,200})\"");
    private static final Pattern TOKEN = Pattern.compile("\"continuationCommand\":\\{\"token\":\"([A-Za-z0-9_%=-]{20,})\"");

    /** Video ID to percent watched (100 when the history lists it with no bar). */
    private static final Map<String, Integer> PERCENT_BY_ID = new ConcurrentHashMap<>();
    /** Title, lowercase, to percent watched. */
    private static final Map<String, Integer> PERCENT_BY_TITLE = new ConcurrentHashMap<>();
    private static volatile long fetched;
    private static volatile boolean running;
    private static final String SAVED = "yx_account_history.json";

    static {
        try {
            File f = new File(Utils.getContext().getFilesDir(), SAVED);
            if (f.isFile()) {
                JSONObject o = new JSONObject(new String(java.nio.file.Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8));
                JSONObject ids = o.optJSONObject("ids"), titles = o.optJSONObject("titles");
                if (ids != null) for (java.util.Iterator<String> k = ids.keys(); k.hasNext(); ) {
                    String id = k.next();
                    PERCENT_BY_ID.put(id, ids.getInt(id));
                }
                if (titles != null) for (java.util.Iterator<String> k = titles.keys(); k.hasNext(); ) {
                    String t = k.next();
                    PERCENT_BY_TITLE.put(t, titles.getInt(t));
                }
            }
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: saved account history not read: " + t);
        }
    }

    private static void persist() {
        try {
            JSONObject o = new JSONObject().put("ids", new JSONObject(PERCENT_BY_ID)).put("titles", new JSONObject(PERCENT_BY_TITLE));
            File f = new File(Utils.getContext().getFilesDir(), SAVED);
            File tmp = new File(f.getPath() + ".part");
            try (FileOutputStream out = new FileOutputStream(tmp)) {
                out.write(o.toString().getBytes(StandardCharsets.UTF_8));
            }
            if (!tmp.renameTo(f)) Logger.printDebug(() -> "YouTube Extras: account history not saved");
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: account history not saved: " + t);
        }
    }

    private AccountHistory() {
    }

    /** After a video opens: the next feed reads the history again, at most once every 2 minutes. */
    static void soon() {
        if (System.currentTimeMillis() - fetched > 2 * 60 * 1000) fetched = 0;
    }

    /** Starts a refresh when the last one is older than 10 minutes. */
    static void refresh() {
        long now = System.currentTimeMillis();
        if (running || now - fetched < REFRESH_MS) return;
        running = true;
        fetched = now;
        Utils.runOnBackgroundThread(() -> {
            try {
                if (!Account.signedIn()) return;
                String token = null;
                int videos = 0, bars = 0;
                for (int page = 0; page < PAGES; page++) {
                    JSONObject body = token == null ? new JSONObject().put("browseId", "FEhistory")
                            : new JSONObject().put("continuation", token);
                    JSONObject r = Account.post("browse", body);
                    if (r == null) break;
                    String text = r.toString();
                    if (XSettings.DEBUG.get()) save(page, text);
                    int[] n = read(text);
                    videos += n[0];
                    bars += n[1];
                    Matcher t = TOKEN.matcher(text);
                    String next = null;
                    while (t.find()) next = t.group(1);
                    if (next == null || next.equals(token)) break;
                    token = next;
                }
                final int v = videos, b = bars;
                if (v > 0) persist();
                Logger.printDebug(() -> "YouTube Extras: account history read, " + v + " videos, " + b + " with a percent");
            } catch (Throwable t) {
                Logger.printDebug(() -> "YouTube Extras: account history failed: " + t);
            } finally {
                running = false;
            }
        });
    }

    /** Reads each video of a page in order: the percents and titles after a video ID belong to it. */
    private static int[] read(String text) {
        Matcher m = VIDEO.matcher(text);
        java.util.List<int[]> starts = new java.util.ArrayList<>();
        java.util.List<String> ids = new java.util.ArrayList<>();
        while (m.find()) {
            if (!ids.isEmpty() && ids.get(ids.size() - 1).equals(m.group(1))) continue;
            ids.add(m.group(1));
            starts.add(new int[]{m.start()});
        }
        int bars = 0;
        for (int i = 0; i < ids.size(); i++) {
            int from = starts.get(i)[0], to = i + 1 < ids.size() ? starts.get(i + 1)[0] : text.length();
            String part = text.substring(from, to);
            Matcher p = PERCENT.matcher(part);
            int percent = -1;
            if (p.find()) percent = (int) Math.round(Double.parseDouble(p.group(1)));
            if (percent >= 0) bars++;
            int value = percent >= 0 ? percent : 100;
            String id = ids.get(i);
            PERCENT_BY_ID.merge(id, value, Math::max);
            Matcher t = TITLE.matcher(part);
            if (t.find()) {
                String title = t.group(1).replace("\\\"", "\"").replace("\\\\", "\\").trim().toLowerCase();
                PERCENT_BY_TITLE.merge(title, value, Math::max);
            }
        }
        return new int[]{ids.size(), bars};
    }

    private static void save(int page, String text) {
        try {
            File dir = new File(Utils.getContext().getFilesDir(), "yx_buf");
            if (!dir.isDirectory() && !dir.mkdirs()) return;
            try (FileOutputStream o = new FileOutputStream(new File(dir, "history_" + page + ".json"))) {
                o.write(text.getBytes(StandardCharsets.UTF_8));
            }
        } catch (Throwable ignored) {
        }
    }

    /** Percent of the video the account watched, or -1 when its history (first pages) lacks the video. */
    static int percent(String videoId) {
        Integer p = videoId == null ? null : PERCENT_BY_ID.get(videoId);
        return p == null ? -1 : p;
    }

    /** Percent watched of the video with this title, or -1. */
    static int percentByTitle(String title) {
        Integer p = title == null ? null : PERCENT_BY_TITLE.get(title.trim().toLowerCase());
        return p == null ? -1 : p;
    }
}
