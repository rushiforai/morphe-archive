package app.ayham.extension.music.features;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

/** canvas.md §15: one song's canvas, from the player's song menu. */
final class CanvasSongMenu {
    private static final String TAG = "Ayham";
    private static final Handler main = new Handler(Looper.getMainLooper());

    private CanvasSongMenu() {
    }

    /** The playing song as the menu sees it. */
    private static final class Now {
        String vid, title, artist, showing, showingSrc;
        String[] info;
        Properties p;
        CanvasChoices.Song ch;
        boolean[] rows;
        boolean spotifySwitch, appleSwitch, hasSpotify, hasApple, hasLoop;
    }

    private static Now now() {
        String vid = app.ayham.extension.music.automix.Automix.currentId();
        String[] cur = AnimatedCover.current;
        if (vid == null || cur == null || cur[0] == null) return null;
        Now n = new Now();
        n.vid = vid;
        n.title = cur[0];
        n.artist = cur[1];
        n.p = Features.props();
        n.ch = CanvasChoices.get(vid);
        n.showing = AnimatedCover.showing();
        n.showingSrc = AnimatedCover.sourceOf(n.showing);
        n.info = CanvasSettings.VIDEO.equals(n.showingSrc) ? VideoCanvas.infoOf(n.showing) : null;
        boolean loopOff = n.ch.off.contains(CanvasSettings.VIDEO);
        n.hasLoop = CanvasSettings.VIDEO.equals(n.showingSrc) || has(AnimatedCover.loopKey(vid, n.ch));
        n.rows = CanvasChoices.rows(Features.switchOn("canvasSpotify"), CanvasSettings.on(n.p, CanvasSettings.VIDEO),
                !VideoCanvas.notSongs.contains(vid), n.hasLoop, loopOff, n.info != null);
        // rule 2: the same switch for Spotify's canvas and the animated cover, each while its source is on
        n.hasSpotify = CanvasSettings.SPOTIFY.equals(n.showingSrc) || has(CanvasCache.spotifyKey(n.title, n.artist));
        n.hasApple = CanvasSettings.APPLE.equals(n.showingSrc) || has(AnimatedCover.appleKeyNow(n.title, n.artist));
        n.spotifySwitch = CanvasSettings.on(n.p, CanvasSettings.SPOTIFY) && (n.hasSpotify || n.ch.off.contains(CanvasSettings.SPOTIFY));
        n.appleSwitch = CanvasSettings.on(n.p, CanvasSettings.APPLE) && (n.hasApple || n.ch.off.contains(CanvasSettings.APPLE));
        return n;
    }

    private static boolean has(String key) {
        String v = CanvasCache.lookup(key);
        return v != null && !v.isEmpty() && (v.contains("://") || new File(v).length() > 0);
    }

    /** Whether the song menu has anything to offer for the playing song. */
    static boolean offers() {
        try {
            Now n = now();
            if (n == null) return false;
            for (boolean r : n.rows) if (r) return true;
            return n.spotifySwitch || n.appleSwitch;
        } catch (Throwable t) {
            return false;
        }
    }

    static void show(Activity a) {
        final Now n = now();
        if (n == null) {
            Toast.makeText(a, "No song's canvas yet", Toast.LENGTH_SHORT).show();
            return;
        }
        List<CharSequence> labels = new ArrayList<>();
        List<Runnable> acts = new ArrayList<>();
        if (n.rows[0]) {
            labels.add(perSong(box(!n.ch.off.contains(CanvasSettings.VIDEO)) + "Music video on this song", "Canvas"));
            acts.add(() -> toggle(a, n, CanvasSettings.VIDEO));
        }
        if (n.spotifySwitch) {
            labels.add(perSong(box(!n.ch.off.contains(CanvasSettings.SPOTIFY) && !(n.hasLoop && CanvasSettings.VIDEO.equals(n.showingSrc))) + "Spotify canvas on this song", "Canvas"));
            acts.add(() -> toggle(a, n, CanvasSettings.SPOTIFY));
        }
        if (n.appleSwitch) {
            labels.add(perSong(box(!n.ch.off.contains(CanvasSettings.APPLE) && (n.showingSrc == null || CanvasSettings.APPLE.equals(n.showingSrc))) + "Animated cover on this song", "Animated covers"));
            acts.add(() -> toggle(a, n, CanvasSettings.APPLE));
        }
        // rule 7: Use, for a song with a loop and another clip, neither switched off
        if (n.hasLoop && !n.ch.off.contains(CanvasSettings.VIDEO) && n.showingSrc != null) {
            for (String src : new String[]{CanvasSettings.VIDEO, CanvasSettings.SPOTIFY, CanvasSettings.APPLE}) {
                boolean there = CanvasSettings.VIDEO.equals(src) || (CanvasSettings.SPOTIFY.equals(src) ? n.hasSpotify : n.hasApple);
                if (src.equals(n.showingSrc) || !there || n.ch.off.contains(src) || !CanvasSettings.on(n.p, src)) continue;
                labels.add("Use the " + name(src) + " for this song");
                acts.add(() -> {
                    n.ch.use = src;
                    save(n, "use " + src);
                });
            }
        }
        if (n.rows[2]) {
            labels.add("Pick another part");
            acts.add(() -> pickPart(a, n));
        }
        if (n.rows[1]) {
            labels.add("Pick another video");
            acts.add(() -> pickVideo(a, n));
        }
        if (n.rows[3]) {
            labels.add("Not this video");
            acts.add(() -> notThis(a, n));
        }
        // rule 10, the way back: every choice above for this song forgotten (its switches, Use, picks
        // and turned-away videos), so the settings decide again
        if (CanvasChoices.hasChoice(n.ch)) {
            labels.add("Reset this song's canvas");
            acts.add(() -> {
                n.ch = new CanvasChoices.Song();
                save(n, "reset");
                Toast.makeText(a, "This song's canvas follows the settings again", Toast.LENGTH_SHORT).show();
            });
        }
        if (labels.isEmpty()) {
            Toast.makeText(a, "Nothing to choose for this song's canvas", Toast.LENGTH_SHORT).show();
            return;
        }
        new AlertDialog.Builder(a).setTitle("This song only")
                .setItems(labels.toArray(new CharSequence[0]), (d, i) -> acts.get(i).run())
                .show();
    }

    /**
     * A per-song switch's row (canvas.md §15, the user 2026-11-26): its name, then a smaller line
     * saying it touches this song only and which of the menu's switches is for all songs.
     */
    static CharSequence perSong(String label, String global) {
        android.text.SpannableStringBuilder b = new android.text.SpannableStringBuilder(label).append("\n");
        int at = b.length();
        b.append(perSongNote(global));
        b.setSpan(new android.text.style.RelativeSizeSpan(0.8f), at, b.length(), android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        b.setSpan(new android.text.style.ForegroundColorSpan(0xB3FFFFFF), at, b.length(), android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return b;
    }

    static String perSongNote(String global) {
        return "Off hides it for this song only. " + global + " in the menu is for all songs.";
    }

    private static String box(boolean on) {
        return on ? "☑  " : "☐  ";
    }

    private static String name(String src) {
        return CanvasSettings.VIDEO.equals(src) ? "music video loop" : CanvasSettings.SPOTIFY.equals(src) ? "Spotify canvas" : "animated cover";
    }

    private static void save(Now n, String what) {
        CanvasChoices.put(n.vid, n.ch);
        Log.i(TAG, "canvas choice: " + n.vid + " " + what);
        AnimatedCover.relook();
    }

    /** Rules 1-2: the song's switch for a source; turning one on makes it the song's choice. */
    private static void toggle(Activity a, Now n, String src) {
        boolean wasOff = n.ch.off.contains(src);
        boolean showsNow = src.equals(n.showingSrc);
        if (wasOff) {
            n.ch.off.remove(src);
            n.ch.use = src;
        } else if (!showsNow && !CanvasSettings.VIDEO.equals(src) && n.showingSrc != null) {
            // checked only for the one that shows: switching the other "on" makes it the choice
            n.ch.use = src;
        } else {
            n.ch.off.add(src);
            if (src.equals(n.ch.use)) n.ch.use = null;
        }
        save(n, (n.ch.off.contains(src) ? "off " : "on ") + src);
    }

    /** Rules 3-4: the part playing and up to 4 others, each by its time. */
    private static void pickPart(Activity a, Now n) {
        final long start;
        final List<Long> parts = new ArrayList<>();
        try {
            start = Long.parseLong(n.info[1]);
            parts.add(start);
            for (String s : n.info[2].split(",")) if (!s.isEmpty() && parts.size() < 5) parts.add(Long.parseLong(s));
        } catch (Throwable t) {
            Toast.makeText(a, "No other parts for this video", Toast.LENGTH_SHORT).show();
            return;
        }
        String[] labels = new String[parts.size()];
        for (int i = 0; i < labels.length; i++) labels[i] = time(parts.get(i)) + (i == 0 ? "  (playing)" : "");
        new AlertDialog.Builder(a).setTitle("Pick another part")
                .setItems(labels, (d, i) -> {
                    n.ch.partMs = parts.get(i);
                    n.ch.partVideo = n.info[0];
                    save(n, "part " + n.info[0] + " at " + parts.get(i) / 1000.0 + " s");
                })
                .show();
    }

    private static String time(long ms) {
        return String.format(Locale.US, "%d:%02d", ms / 60_000, ms / 1000 % 60);
    }

    /** Rules 5-6: up to 10 videos, the one in use marked; a pick goes through the gate as the song's own. */
    private static void pickVideo(Activity a, Now n) {
        Toast.makeText(a, "Looking for videos", Toast.LENGTH_SHORT).show();
        new Thread(() -> {
            List<String[]> found;
            try {
                found = VideoCanvas.searchVideos(n.title, n.artist);
            } catch (Throwable t) {
                Log.w(TAG, "canvas choice: video search failed: " + t);
                found = new ArrayList<>();
            }
            List<String> ids = new ArrayList<>();
            for (String[] v : found) ids.add(v[0]);
            // YouTube's pairing needs a signed-in request: none here (§5 rule 6, signed out)
            List<String> offer = CanvasChoices.videoChoices(null, ids, n.ch.rejected);
            List<String[]> rows = new ArrayList<>();
            for (String id : offer)
                for (String[] v : found)
                    if (v[0].equals(id)) {
                        rows.add(v);
                        break;
                    }
            Log.i(TAG, "canvas choice: " + rows.size() + " videos offered for '" + n.title + "'");
            main.post(() -> videoDialog(a, n, rows));
        }, "ayham-canvas-videos").start();
    }

    private static void videoDialog(Activity a, Now n, List<String[]> rows) {
        if (rows.isEmpty()) {
            Toast.makeText(a.getApplicationContext(), "No videos found for this song", Toast.LENGTH_SHORT).show();
            return;
        }
        // the search took a while: the page may be gone (a dialog on it would crash the app)
        if (a.isFinishing() || a.isDestroyed()) return;
        float dp = a.getResources().getDisplayMetrics().density;
        LinearLayout col = new LinearLayout(a);
        col.setOrientation(LinearLayout.VERTICAL);
        ScrollView sv = new ScrollView(a);
        sv.addView(col);
        AlertDialog dlg = new AlertDialog.Builder(a).setTitle("Pick another video").setView(sv).setNegativeButton("Cancel", null).create();
        String inUse = n.info != null ? n.info[0] : n.ch.video;
        for (String[] v : rows) {
            LinearLayout row = new LinearLayout(a);
            row.setGravity(Gravity.CENTER_VERTICAL);
            int pad = Math.round(8 * dp);
            row.setPadding(pad * 2, pad, pad * 2, pad);
            ImageView img = new ImageView(a);
            img.setScaleType(ImageView.ScaleType.CENTER_CROP);
            row.addView(img, new LinearLayout.LayoutParams(Math.round(96 * dp), Math.round(54 * dp)));
            TextView t = new TextView(a);
            t.setText((v[0].equals(inUse) ? "▶ " : "") + v[1] + "\n" + v[2]);
            t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            t.setMaxLines(3);
            t.setPadding(pad * 2, 0, 0, 0);
            row.addView(t, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1));
            row.setOnClickListener(x -> {
                dlg.dismiss();
                tryVideo(a, n, v[0], v[1]);
            });
            col.addView(row);
            new Thread(() -> {
                Bitmap b = thumb("https://i.ytimg.com/vi/" + v[0] + "/mqdefault.jpg");
                if (b != null) main.post(() -> img.setImageBitmap(b));
            }, "ayham-canvas-thumb").start();
        }
        dlg.show();
    }

    private static Bitmap thumb(String url) {
        try {
            HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
            c.setConnectTimeout(8000);
            c.setReadTimeout(8000);
            try (InputStream in = c.getInputStream()) {
                return BitmapFactory.decodeStream(in);
            } finally {
                c.disconnect();
            }
        } catch (Throwable t) {
            return null;
        }
    }

    /** Rule 6: the video tried before it is kept; one that can't make a loop leaves the song as it was. */
    private static void tryVideo(Activity a, Now n, String id, String title) {
        Toast.makeText(a, "Making a loop of that video", Toast.LENGTH_SHORT).show();
        new Thread(() -> {
            CanvasChoices.Song trial;
            try {
                trial = CanvasChoices.Song.of(n.ch.json());
            } catch (Throwable t) {
                trial = new CanvasChoices.Song();
            }
            trial.video = id;
            trial.only = true;
            trial.off.remove(CanvasSettings.VIDEO);
            trial.use = null;
            if (trial.partVideo != null && !trial.partVideo.equals(id)) {
                trial.partMs = -1;
                trial.partVideo = null;
            }
            File f = null;
            try {
                boolean[] none = {false};
                long songMs = app.ayham.extension.music.automix.Automix.durationMs();
                synchronized (VideoCanvas.class) {
                    f = VideoCanvas.clip(n.vid, n.title, n.artist, Math.max(0, songMs), AnimatedCover.cacheDir(), 1080, none,
                            CanvasSettings.ytHeight(n.p), CanvasSettings.fullVideo(n.p), trial);
                }
            } catch (Throwable t) {
                Log.w(TAG, "canvas choice: " + id + " failed: " + t);
            }
            if (f == null) {
                Log.i(TAG, "canvas choice: " + id + " can't make a loop: the song keeps what it had");
                main.post(() -> Toast.makeText(a.getApplicationContext(), "That video can't make a loop", Toast.LENGTH_SHORT).show());
                return;
            }
            CanvasCache.put(AnimatedCover.loopKey(n.vid, trial), f.getAbsolutePath());
            n.ch.video = trial.video;
            n.ch.off.remove(CanvasSettings.VIDEO);
            n.ch.use = null;
            n.ch.partMs = trial.partMs;
            n.ch.partVideo = trial.partVideo;
            save(n, "video " + id + " '" + title + "'");
        }, "ayham-canvas-pick").start();
    }

    /** Rule 8: the video turned away for good; its loop and files go; the next source shows. */
    private static void notThis(Activity a, Now n) {
        String id = n.info[0];
        String oldKey = AnimatedCover.loopKey(n.vid, n.ch);
        n.ch.rejected.add(id);
        if (id.equals(n.ch.video)) n.ch.video = null;
        if (id.equals(n.ch.partVideo)) {
            n.ch.partMs = -1;
            n.ch.partVideo = null;
        }
        CanvasCache.remove(oldKey);
        String base = n.showing.substring(0, n.showing.length() - 4);
        for (String ext : new String[]{".mp4", ".crop", ".info"}) {
            File f = new File(base + ext);
            if (f.exists() && !f.delete()) Log.w(TAG, "canvas choice: could not delete " + f.getName());
        }
        Toast.makeText(a, "That video won't be used for this song", Toast.LENGTH_SHORT).show();
        save(n, "not " + id);
    }
}
