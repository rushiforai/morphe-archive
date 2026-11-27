package app.ayham.extension.music.features;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import java.util.Locale;

/**
 * "Jump to the most replayed part" (Prism's BestPart): seeks the playing song to where YouTube's
 * "Most replayed" curve rises to its peak, the same pick the canvas makes for its loop.
 */
final class BestPart {
    private static final String TAG = "Ayham";
    private static final Handler main = new Handler(Looper.getMainLooper());

    private BestPart() {
    }

    private static void toast(Activity a, String s) {
        // the app's context: this may come after a search, when the page is gone
        Toast.makeText(a.getApplicationContext(), s, Toast.LENGTH_SHORT).show();
    }

    /**
     * The chorus from time-synced lyrics (canvas.md §6 rule 11, Prism's BestPart.chorusMs): the start
     * of the first line holding the most repeated line (keys: lower case, letters and digits, 4 or
     * more), from 5000 on and not in the last 30 000, pulled back over up to 4 lines before it that
     * repeat at least twice and at least (most - 1) times. Null for a song under 60 s, fewer than 4
     * timed lines, or nothing repeated.
     */
    static Long chorusMs(long durationMs, long[] startMs, String[] text) {
        if (durationMs < 60_000 || startMs == null || text == null) return null;
        java.util.List<Long> at = new java.util.ArrayList<>();
        java.util.List<String> keys = new java.util.ArrayList<>();
        for (int i = 0; i < startMs.length && i < text.length; i++) {
            if (text[i] == null || text[i].trim().isEmpty()) continue;   // gaps and blank lines
            at.add(startMs[i]);
            keys.add(key(text[i]));
        }
        if (at.size() < 4) return null;
        java.util.Map<String, Integer> count = new java.util.HashMap<>();
        for (String k : keys) if (k.length() >= 4) count.merge(k, 1, Integer::sum);
        int most = 0;
        for (int c : count.values()) most = Math.max(most, c);
        if (most < 2) return null;
        int first = -1;
        for (int i = 0; i < keys.size() && first < 0; i++) {
            Integer c = count.get(keys.get(i));
            if (c != null && c == most && at.get(i) >= 5000 && at.get(i) <= durationMs - 30_000) first = i;
        }
        if (first < 0) return null;
        int start = first;
        for (int j = first - 1; j >= Math.max(0, first - 4); j--) {
            Integer c = count.get(keys.get(j));
            if (c == null || c < 2 || c < most - 1 || at.get(j) < 5000) break;
            start = j;
        }
        return at.get(start);
    }

    private static String key(String text) {
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < text.length(); ) {
            int cp = text.codePointAt(i);
            if (Character.isLetterOrDigit(cp)) b.appendCodePoint(Character.toLowerCase(cp));
            i += Character.charCount(cp);
        }
        return b.toString();
    }

    // ---------------------------------------------------------------------------------------------
    // canvas.md §14: Best part (Prism's BestParts)

    /**
     * Rule 2, the snap: the lyric line starting within 4000 before to 1500 after the target that is
     * nearest (a line after counts 1500 farther), at its start - 250; else the bar line before the
     * target on a steady beat grid (4 beats a bar); else 1000 before. Never below 0.
     */
    static long snap(long targetMs, long[] lineStarts, Double bpm, boolean steady, long firstBeatMs) {
        long best = -1, bestD = Long.MAX_VALUE;
        if (lineStarts != null) for (long s : lineStarts) {
            long d = s - targetMs;
            if (d < -4000 || d > 1500) continue;
            long cost = d < 0 ? -d : d + 1500;
            if (cost < bestD) {
                bestD = cost;
                best = s;
            }
        }
        if (best >= 0) return Math.max(0, best - 250);
        if (bpm != null && bpm > 0 && steady) {
            double bar = 4 * 60_000.0 / bpm;
            if (targetMs >= firstBeatMs) {
                long k = (long) Math.floor((targetMs - firstBeatMs) / bar);
                long at = Math.round(firstBeatMs + k * bar);
                if (at >= targetMs) at = Math.round(firstBeatMs + (k - 1) * bar);
                if (at >= 0) return at;
            }
        }
        return Math.max(0, targetMs - 1000);
    }

    /** Rule 3: the button is up while the part is over 3000 ahead and the song before min(max(30 s, known + 15 s), 45 s). */
    static boolean shows(long atMs, long startMs, long knownAtMs) {
        return startMs - atMs > 3000 && atMs < Math.min(Math.max(30_000, knownAtMs + 15_000), 45_000);
    }

    /** The playing song's best part: its id, the part (ms, -1 none yet), whether it is the listener's, when it became known. */
    private static volatile String forId;
    private static volatile long partMs = -1, autoMs = -1, knownAtMs;
    private static volatile boolean mine, asking;
    /** The automatic part before its snap, and whether the snap had the lyrics (rule 2). */
    private static volatile long autoTarget = -1, resnapAt;
    private static volatile boolean snappedToLines;

    static long partMs(String id) {
        return id != null && id.equals(forId) ? partMs : -1;
    }

    static boolean mine(String id) {
        return id != null && id.equals(forId) && mine;
    }

    static long knownAtMs() {
        return knownAtMs;
    }

    /**
     * Each tick of the player screen: the song's best part is worked out once (the listener's own, else
     * the most replayed stretch, else the chorus, then snapped), and the next song's curve fetched ahead.
     */
    static void tick(String id, long posMs, long durMs) {
        if (id == null) return;
        if (!id.equals(forId)) {
            forId = id;
            partMs = -1;
            autoMs = -1;
            mine = false;
            asking = false;
            autoTarget = -1;
            snappedToLines = false;
        }
        if (partMs >= 0 || asking) {
            // the lyrics can arrive after the part was worked out without them: snapped again once
            long now = android.os.SystemClock.uptimeMillis();
            if (partMs >= 0 && !snappedToLines && autoTarget >= 0 && now - resnapAt > 1000) {
                resnapAt = now;
                Object[] lyr = LyricTiming.syncedFor(id);
                if (lyr != null) {
                    snappedToLines = true;
                    autoMs = snap(autoTarget, (long[]) lyr[0], null, false, 0);
                    if (!mine) partMs = autoMs;
                    Log.i(TAG, String.format(Locale.US, "best part: %s snapped to its lyrics: %.1f s", id, autoMs / 1000.0));
                }
            }
            return;
        }
        asking = true;
        final long at = posMs;
        new Thread(() -> {
            try {
                long auto = auto(id, durMs);
                long own = own(id);
                if (!id.equals(forId)) return;
                autoMs = auto;
                mine = own >= 0;
                partMs = own >= 0 ? own : auto;
                knownAtMs = at;
                Log.i(TAG, "best part: " + id + " " + (partMs < 0 ? "none" : String.format(Locale.US, "%.1f s", partMs / 1000.0))
                        + (mine ? " (yours)" : ""));
            } catch (Throwable t) {
                Log.w(TAG, "best part: " + id + " failed: " + t);
            } finally {
                // asked again in 20 s, this song only: the next song's own lookup keeps its flag
                if (id.equals(forId) && partMs < 0) main.postDelayed(() -> {
                    if (id.equals(forId)) asking = false;
                }, 20_000);
            }
            String next = app.ayham.extension.music.automix.Automix.nextId();
            if (next != null && !next.equals(id)) curve(next);   // rule 7: the next song's ahead
        }, "ayham-bestpart").start();
    }

    /** The most replayed stretch, else the chorus, snapped; -1 for none. */
    private static long auto(String id, long durMs) {
        double[] heat = curve(id);
        long target = -1;
        if (heat != null && heat.length >= 3) {
            int n = heat.length / 3;
            double dur = heat[(n - 1) * 3] + heat[(n - 1) * 3 + 1];
            double at = VideoCanvas.partStart(heat, dur);
            if (at >= 0) target = Math.round(at * 1000);
        }
        Object[] lyr = LyricTiming.syncedFor(id);
        if (target < 0 && lyr != null) {
            Long c = chorusMs(durMs, (long[]) lyr[0], (String[]) lyr[1]);
            if (c != null) target = c;
        }
        Log.i(TAG, "best part: " + id + " curve " + (heat == null ? "none" : heat.length / 3 + " points") + ", synced lyrics "
                + (lyr == null ? "none" : ((long[]) lyr[0]).length + " lines") + ", target " + target);
        if (target < 0) return -1;
        autoTarget = target;
        snappedToLines = lyr != null;
        return snap(target, lyr == null ? null : (long[]) lyr[0], null, false, 0);
    }

    // rule 7: curves kept 30 days, a song without one 7

    private static final long CURVE_DAYS = 30, NONE_DAYS = 7;

    static double[] curve(String id) {
        java.io.File f = curveFile(id);
        try {
            if (f != null && f.exists()) {
                String[] p = new String(java.nio.file.Files.readAllBytes(f.toPath()), java.nio.charset.StandardCharsets.UTF_8).trim().split(" ");
                long age = System.currentTimeMillis() - f.lastModified();
                if ("nocurve".equals(p[0]) && age < NONE_DAYS * 86_400_000L) {
                    Log.i(TAG, "best part: " + id + " curve: none, kept " + age / 60_000 + " min ago");
                    return null;
                }
                if (!"nocurve".equals(p[0]) && !"none".equals(p[0]) && age < CURVE_DAYS * 86_400_000L) {
                    double[] h = new double[p.length];
                    for (int i = 0; i < p.length; i++) h[i] = Double.parseDouble(p[i]);
                    // a damaged file (not whole points) is fetched again below
                    if (h.length >= 3 && h.length % 3 == 0) return h;
                }
            }
        } catch (Throwable ignored) {
        }
        double[] h = VideoCanvas.heatmap(id);
        Log.i(TAG, "best part: " + id + " curve fetched: " + (h == null ? "none" : h.length / 3 + " points"));
        // a failed fetch is not kept: asked again on the next try
        if (f != null && (h != null || VideoCanvas.answered(id))) {
            try (java.io.FileWriter w = new java.io.FileWriter(f)) {
                if (h == null) w.write("nocurve");
                else {
                    StringBuilder b = new StringBuilder();
                    for (double v : h) b.append(v).append(' ');
                    w.write(b.toString().trim());
                }
            } catch (Throwable ignored) {
            }
        }
        return h;
    }

    private static java.io.File curveFile(String id) {
        android.content.Context c = Features.appContext;
        if (c == null || id == null) return null;
        java.io.File d = new java.io.File(c.getCacheDir(), "bestpart");
        if (!d.isDirectory() && !d.mkdirs()) return null;
        return new java.io.File(d, id.replaceAll("[^A-Za-z0-9_-]", "_"));
    }

    // rule 5: the listener's own, per song and kept

    private static android.content.SharedPreferences store() {
        android.content.Context c = Features.appContext;
        return c == null ? null : c.getSharedPreferences("ayham_bestpart", android.content.Context.MODE_PRIVATE);
    }

    static long own(String id) {
        android.content.SharedPreferences s = store();
        return s == null ? -1 : s.getLong(id, -1);
    }

    private static void saveOwn(String id, long ms) {
        android.content.SharedPreferences s = store();
        if (s == null) return;
        if (ms < 0) s.edit().remove(id).apply();
        else s.edit().putLong(id, ms).apply();
        if (id.equals(forId)) {
            mine = ms >= 0;
            partMs = ms >= 0 ? ms : autoMs;
        }
    }

    /** Rule 3: the button's click (and the menu's Play from the best part, rule 6). */
    static void play(Activity a) {
        final String id = app.ayham.extension.music.automix.Automix.currentId();
        if (id == null) return;
        if (partMs(id) >= 0) {
            playAt(a, id);
            return;
        }
        // rule 6: 5000 allowed to find it
        tick(id, app.ayham.extension.music.automix.Automix.positionMs(), app.ayham.extension.music.automix.Automix.durationMs());
        new Thread(() -> {
            for (int i = 0; i < 25 && partMs(id) < 0; i++) {
                try {
                    Thread.sleep(200);
                } catch (InterruptedException e) {
                    return;
                }
            }
            main.post(() -> playAt(a, id));
        }, "ayham-bestpart-play").start();
    }

    private static void playAt(Activity a, String id) {
        if (!id.equals(app.ayham.extension.music.automix.Automix.currentId())) return;
        long at = partMs(id);
        if (at < 0) {
            seek(0);
            toast(a, "This song has no best part: from the start");
            Log.i(TAG, "best part: " + id + " none, from the start");
            return;
        }
        seek(at);
        Log.i(TAG, String.format(Locale.US, "best part: %s played from %.1f s", id, at / 1000.0));
    }

    private static void seek(long ms) {
        try {
            Object p = PlayerTap.current();
            if (p instanceof SeekAccess) ((SeekAccess) p).ayham_seekTo(Math.max(0, ms));
        } catch (Exception ignored) {
        }
    }

    /** Rule 5: Your best part: a bar, -5 s, +5 s, Now, Listen from here, Save; Forget when one is saved. */
    static void yours(Activity a) {
        if (a == null || a.isFinishing() || a.isDestroyed()) return;
        final String id = app.ayham.extension.music.automix.Automix.currentId();
        if (id == null) return;
        final long dur = app.ayham.extension.music.automix.Automix.durationMs();
        if (dur <= 0) return;
        long start = own(id) >= 0 ? own(id) : autoMs >= 0 && id.equals(forId) ? autoMs : Math.max(0, app.ayham.extension.music.automix.Automix.positionMs());
        final long[] at = {Math.min(start, dur)};
        android.widget.LinearLayout col = new android.widget.LinearLayout(a);
        col.setOrientation(android.widget.LinearLayout.VERTICAL);
        int pad = Math.round(20 * a.getResources().getDisplayMetrics().density);
        col.setPadding(pad, pad / 2, pad, 0);
        final android.widget.TextView time = new android.widget.TextView(a);
        time.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, 18);
        time.setGravity(android.view.Gravity.CENTER);
        final android.widget.SeekBar bar = new android.widget.SeekBar(a);
        bar.setMax((int) (dur / 100));
        final Runnable show = () -> {
            time.setText(String.format(Locale.US, "%d:%02d", at[0] / 60_000, at[0] / 1000 % 60));
            bar.setProgress((int) (at[0] / 100));
        };
        bar.setOnSeekBarChangeListener(new android.widget.SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(android.widget.SeekBar s, int v, boolean user) {
                if (!user) return;
                at[0] = v * 100L;
                time.setText(String.format(Locale.US, "%d:%02d", at[0] / 60_000, at[0] / 1000 % 60));
            }

            @Override
            public void onStartTrackingTouch(android.widget.SeekBar s) {
            }

            @Override
            public void onStopTrackingTouch(android.widget.SeekBar s) {
            }
        });
        col.addView(time);
        col.addView(bar);
        android.widget.LinearLayout row = new android.widget.LinearLayout(a);
        row.setGravity(android.view.Gravity.CENTER);
        android.widget.LinearLayout row2 = new android.widget.LinearLayout(a);
        row2.setGravity(android.view.Gravity.CENTER);
        String[] labels = {"−5 s", "+5 s", "Now", "Listen from here"};
        for (int i = 0; i < labels.length; i++) {
            final int k = i;
            android.widget.Button b = new android.widget.Button(a, null, android.R.attr.borderlessButtonStyle);
            b.setText(labels[i]);
            b.setAllCaps(false);
            b.setMinWidth(0);
            b.setMinimumWidth(0);
            b.setOnClickListener(v -> {
                if (k == 0) at[0] = Math.max(0, at[0] - 5000);
                else if (k == 1) at[0] = Math.min(dur, at[0] + 5000);
                else if (k == 2) at[0] = Math.max(0, app.ayham.extension.music.automix.Automix.positionMs());
                else seek(at[0]);
                show.run();
            });
            // Listen from here on a row of its own: four in one row squeezed it into a column
            (k < 3 ? row : row2).addView(b);
        }
        col.addView(row);
        col.addView(row2);
        show.run();
        android.app.AlertDialog.Builder d = new android.app.AlertDialog.Builder(a)
                .setTitle("Your best part")
                .setView(col)
                .setPositiveButton("Save", (x, w) -> {
                    saveOwn(id, at[0]);
                    Log.i(TAG, String.format(Locale.US, "best part: %s yours at %.1f s", id, at[0] / 1000.0));
                })
                .setNegativeButton("Cancel", null);
        if (own(id) >= 0) d.setNeutralButton(autoMs >= 0 && id.equals(forId) ? "Back to the part people replay" : "Forget", (x, w) -> {
            saveOwn(id, -1);
            Log.i(TAG, "best part: " + id + " yours forgotten");
        });
        d.show();
    }
}
