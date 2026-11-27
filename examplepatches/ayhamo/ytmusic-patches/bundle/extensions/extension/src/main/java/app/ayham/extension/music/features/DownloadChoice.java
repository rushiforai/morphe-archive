package app.ayham.extension.music.features;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Switch;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/**
 * The download popup. Every download tap (a song, an album or a playlist) asks first:
 * <ul>
 *   <li>Lossless: the song's lossless file from the user's addons at the quality picked (Best,
 *   Hi-Res, CD; each steps down to the next, then to YouTube's), saved with YT's download;</li>
 *   <li>YouTube: YT's download alone;</li>
 * </ul>
 * and, either way, whether its lyrics, animated art and canvas are saved for offline too.
 * YT's own download always happens: the tap's command runs once the popup is answered.
 *
 * <p>The hook sits in YT's command resolver after Morphe's download rewrite, so it sees the save
 * command Morphe made of an upsell, and the save commands of accounts allowed to download.
 */
public final class DownloadChoice {
    private static final String TAG = "AyhamDownloads";
    private static final int VIDEO_ENDPOINT = 73080600, PLAYLIST_ENDPOINT = 73082583;
    private static final int ACTION_ADD = 1;
    /** A playlist's songs are saved over minutes: its answer holds for them this long. */
    private static final long PLAYLIST_MS = 30 * 60_000L, SONG_MS = 10 * 60_000L;

    /** One answer of the popup. */
    public static final class Choice {
        public boolean lossless, lyrics = true, art = true, canvas = true;
        public String tier = app.ayham.extension.music.addons.AddonDownloads.BEST;
        long until;
        /** For a playlist's answer: the playlist, whose songs alone it is for. */
        String playlistId;

        @Override
        public String toString() {
            return (lossless ? "Lossless " + tier : "YouTube") + ", lyrics " + lyrics + ", art " + art + ", canvas " + canvas;
        }
    }

    private static final Map<String, Choice> songs = new HashMap<>();
    /** Each playlist answered, newest last: two albums tapped one after the other keep their own answers. */
    private static final java.util.List<Choice> playlists = new java.util.ArrayList<>();
    /** A playlist's answer also holds for its songs saved later than PLAYLIST_MS (a big playlist), up to this, when YT lists them in it. */
    private static final long PLAYLIST_LISTED_MS = 12 * 3600_000L;
    private static WeakReference<Activity> activity = new WeakReference<>(null);
    /** Set while the answered command runs again, so it goes through. */
    private static volatile boolean passing;
    private static volatile String asking;
    private static volatile long askedAt;

    private DownloadChoice() {
    }

    static void onActivity(Activity a) {
        activity = new WeakReference<>(a);
    }

    /**
     * Injection point: YT's command resolver, after Morphe's download rewrite. Returns true when the
     * command is a download that waits for the popup (the resolver then returns at once).
     */
    public static boolean onCommand(Object resolver, Object command, Map<?, ?> map) {
        try {
            if (passing || command == null || resolver == null) return false;
            // the popup off (Fork settings): YT's download as it is
            if (!"1".equals(Features.props().getProperty("native"))) return false;
            byte[] bytes = (byte[]) command.getClass().getMethod("toByteArray").invoke(command);
            if (bytes == null || bytes.length == 0) return false;
            ProtoWire c = new ProtoWire(bytes);
            String id = null;
            boolean isPlaylist = false;
            if (c.has(VIDEO_ENDPOINT)) {
                ProtoWire e = c.message(VIDEO_ENDPOINT);
                if (e.varint(2, 0) != ACTION_ADD) return false;
                id = e.string(1);
            } else if (c.has(PLAYLIST_ENDPOINT)) {
                ProtoWire e = c.message(PLAYLIST_ENDPOINT);
                // INFER_AUTOMATICALLY (9) also removes a saved playlist: left to YT
                if (e.varint(2, 0) != ACTION_ADD) return false;
                id = e.string(1);
                isPlaylist = true;
            }
            if (id == null || id.isEmpty()) return false;
            Activity a = activity.get();
            if (a == null || a.isFinishing()) return false;
            // already downloaded (its tick tapped): YT's own handling, no popup
            if (OfflineIndex.inYt(a, id, isPlaylist)) {
                Log.i(TAG, "download tap on " + id + ": already downloaded, left to YT");
                return false;
            }
            // the resolve method that called us, to run the command again when answered
            StackTraceElement caller = new Throwable().getStackTrace()[1];
            Method resolve = null;
            for (Method m : resolver.getClass().getDeclaredMethods()) {
                Class<?>[] p = m.getParameterTypes();
                if (m.getName().equals(caller.getMethodName()) && p.length == 2 && p[1] == Map.class && p[0].isInstance(command)) {
                    resolve = m;
                    break;
                }
            }
            if (resolve == null) {
                Log.w(TAG, "download popup: the resolver's method " + caller.getMethodName() + " not found, no popup");
                return false;
            }
            long now = System.currentTimeMillis();
            // one tap can resolve the command twice
            if (id.equals(asking) && now - askedAt < 3000) return true;
            asking = id;
            askedAt = now;
            final String fid = id;
            final boolean fpl = isPlaylist;
            final Method fresolve = resolve;
            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    if (a.isFinishing() || a.isDestroyed()) throw new IllegalStateException("the activity is gone");
                    show(a, fid, fpl, resolver, fresolve, command, map);
                } catch (Throwable t) {
                    // no popup: the tap goes on as YT's own download
                    Log.w(TAG, "download popup could not show, YT's download goes on: " + t);
                    asking = null;
                    passing = true;
                    try {
                        fresolve.setAccessible(true);
                        fresolve.invoke(resolver, command, map);
                    } catch (Throwable e) {
                        Log.w(TAG, "download of " + fid + ": YT's command failed", e);
                    } finally {
                        passing = false;
                    }
                }
            });
            Log.i(TAG, "download tap on " + (isPlaylist ? "playlist " : "song ") + id + ": popup");
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "download popup failed, YT's download goes on", t);
            return false;
        }
    }

    private static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences("morphe_prefs", Context.MODE_PRIVATE);
    }

    private static void show(Activity a, String id, boolean isPlaylist, Object resolver, Method resolve, Object command, Map<?, ?> map) {
        SharedPreferences sp = prefs(a);
        boolean haveAddons = !app.ayham.extension.music.addons.AddonSettings.links(a).isEmpty();
        float dp = a.getResources().getDisplayMetrics().density;
        int pad = (int) (20 * dp);

        LinearLayout box = new LinearLayout(a);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(pad, (int) (8 * dp), pad, 0);

        RadioGroup source = new RadioGroup(a);
        RadioButton lossless = radio(a, "Lossless", 1);
        RadioButton youtube = radio(a, "YouTube", 2);
        source.addView(lossless);
        source.addView(note(a, haveAddons ? "The lossless file from your addons, saved with YouTube's download. Not on your addons: YouTube's download only." : "Add your addon links in Fork settings first.", dp));
        source.addView(youtube);
        source.addView(note(a, "YouTube's download only.", dp));
        lossless.setEnabled(haveAddons);
        boolean wantLossless = haveAddons && sp.getBoolean("ayham_dl_lossless", true);
        source.check(wantLossless ? 1 : 2);
        box.addView(source);

        TextView qLabel = label(a, "Quality", dp);
        RadioGroup quality = new RadioGroup(a);
        quality.setOrientation(LinearLayout.HORIZONTAL);
        // Atmos only with the Dolby Atmos switch on (and a decoder): it steps down to Best
        boolean atmos = app.ayham.extension.music.addons.AddonSettings.atmosSwitch(a);
        String[] tiers = atmos
                ? new String[]{app.ayham.extension.music.addons.AddonDownloads.BEST, app.ayham.extension.music.addons.AddonDownloads.HIRES, app.ayham.extension.music.addons.AddonDownloads.CD, app.ayham.extension.music.addons.AddonDownloads.ATMOS}
                : new String[]{app.ayham.extension.music.addons.AddonDownloads.BEST, app.ayham.extension.music.addons.AddonDownloads.HIRES, app.ayham.extension.music.addons.AddonDownloads.CD};
        String[] names = {"Best", "Hi-Res", "CD", "Atmos"};
        String tierWas = sp.getString("ayham_dl_tier", tiers[0]);
        for (int i = 0; i < tiers.length; i++) {
            RadioButton r = radio(a, names[i], 10 + i);
            quality.addView(r);
            if (tiers[i].equals(tierWas)) quality.check(10 + i);
        }
        if (quality.getCheckedRadioButtonId() == -1) quality.check(10);
        View qNote = note(a, "Not available: one step down, then YouTube's.", dp);
        box.addView(qLabel);
        box.addView(quality);
        box.addView(qNote);
        Runnable showQuality = () -> {
            int v = source.getCheckedRadioButtonId() == 1 ? View.VISIBLE : View.GONE;
            qLabel.setVisibility(v);
            quality.setVisibility(v);
            qNote.setVisibility(v);
        };
        showQuality.run();
        source.setOnCheckedChangeListener((g, checked) -> showQuality.run());

        box.addView(label(a, "Also save for offline", dp));
        Switch lyrics = toggle(a, "Lyrics", sp.getBoolean("ayham_dl_lyrics", true));
        Switch art = toggle(a, "Animated art", sp.getBoolean("ayham_dl_art", true));
        Switch canvas = toggle(a, "Canvas", sp.getBoolean("ayham_dl_canvas", true));
        box.addView(lyrics);
        box.addView(art);
        box.addView(canvas);

        new AlertDialog.Builder(a, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                .setTitle(isPlaylist ? "Download all" : "Download")
                .setView(box)
                .setNegativeButton(android.R.string.cancel, (d, w) -> asking = null)
                .setOnCancelListener(d -> asking = null)
                .setPositiveButton("Download", (d, w) -> {
                    Choice ch = new Choice();
                    ch.lossless = source.getCheckedRadioButtonId() == 1;
                    ch.tier = tiers[Math.max(0, quality.getCheckedRadioButtonId() - 10)];
                    ch.lyrics = lyrics.isChecked();
                    ch.art = art.isChecked();
                    ch.canvas = canvas.isChecked();
                    sp.edit().putBoolean("ayham_dl_lossless", ch.lossless).putString("ayham_dl_tier", ch.tier)
                            .putBoolean("ayham_dl_lyrics", ch.lyrics).putBoolean("ayham_dl_art", ch.art)
                            .putBoolean("ayham_dl_canvas", ch.canvas).apply();
                    answered(id, isPlaylist, ch);
                    asking = null;
                    passing = true;
                    try {
                        resolve.setAccessible(true);
                        resolve.invoke(resolver, command, map);
                        Log.i(TAG, "download of " + id + ": " + ch + "; YT's download started");
                    } catch (Throwable t) {
                        Log.w(TAG, "download of " + id + ": YT's command failed", t);
                    } finally {
                        passing = false;
                    }
                })
                .show();
    }

    private static synchronized void answered(String id, boolean isPlaylist, Choice ch) {
        long now = System.currentTimeMillis();
        if (isPlaylist) {
            ch.until = now + PLAYLIST_MS;
            ch.playlistId = id;
            playlists.removeIf(p -> id.equals(p.playlistId) || p.until + PLAYLIST_LISTED_MS - PLAYLIST_MS < now);
            playlists.add(ch);
        } else {
            ch.until = now + SONG_MS;
            songs.put(id, ch);
        }
    }

    /**
     * The popup's answer for a song YT is saving now: its own, else its playlist's (a playlist's
     * songs are saved one by one after the tap), else null (no popup was answered: saved some other way).
     */
    static synchronized Choice choiceFor(String videoId) {
        long now = System.currentTimeMillis();
        Choice c = songs.remove(videoId);
        if (c != null && c.until > now) return c;
        // a song of an answered playlist, not one smart downloads saves meanwhile: YT lists it in the
        // playlist; within PLAYLIST_MS, a playlist not listed yet counts too (the newest such one)
        Context a = Features.appContext;
        Choice unknown = null;
        for (int i = playlists.size() - 1; i >= 0; i--) {
            Choice p = playlists.get(i);
            if (p.until + PLAYLIST_LISTED_MS - PLAYLIST_MS < now) continue;
            Boolean in = a == null ? null : OfflineIndex.inPlaylist(a, p.playlistId, videoId);
            if (Boolean.TRUE.equals(in)) return p;
            if (in == null && p.until > now && unknown == null) unknown = p;
        }
        if (unknown != null) return unknown;
        if (!playlists.isEmpty()) Log.i(TAG, videoId + " is in no answered playlist: no popup answer");
        return null;
    }

    private static RadioButton radio(Context c, String text, int id) {
        RadioButton r = new RadioButton(c);
        r.setId(id);
        r.setText(text);
        r.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        return r;
    }

    private static TextView note(Context c, String text, float dp) {
        TextView t = new TextView(c);
        t.setText(text);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        t.setTextColor(Color.argb(170, 255, 255, 255));
        t.setPadding((int) (32 * dp), 0, 0, (int) (6 * dp));
        return t;
    }

    private static TextView label(Context c, String text, float dp) {
        TextView t = new TextView(c);
        t.setText(text);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        t.setTextColor(Color.WHITE);
        t.setPadding(0, (int) (12 * dp), 0, (int) (4 * dp));
        return t;
    }

    private static Switch toggle(Context c, String text, boolean on) {
        Switch s = new Switch(c);
        s.setText(text);
        s.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        s.setChecked(on);
        return s;
    }
}
