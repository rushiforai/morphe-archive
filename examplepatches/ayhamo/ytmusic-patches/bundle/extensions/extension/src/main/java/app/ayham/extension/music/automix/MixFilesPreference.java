package app.ayham.extension.music.automix;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.net.Uri;
import android.preference.Preference;
import android.util.AttributeSet;
import android.util.Log;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * The settings' "Mix files" (spec/automix/mix-file.md rule 9): Import… a mix file (.json) (a saved
 * edit is replaced only after a confirm that lists what changes), Export this pair, Export all. The
 * result of the last one is the row's summary (rule 7). After an import, Play these mixes queues the
 * file's songs after the playing one and plays them, also from the row for the last imported file. The file pickers answer
 * a small fragment.
 */
@SuppressWarnings("deprecation")
public class MixFilesPreference extends Preference {
    private static final String TAG = "AyhamMixFiles";
    private static final String DEFAULT = "Import a mix file (.json, from the PC extension, BitChord, this phone, or a Spotify mix export), or export your edited pairs to one.";
    private static String last;
    /**
     * The dialogs' theme: the settings screen's own gave the menu a black sheet with dark items,
     * so only the pressed row showed (the phone, 2026-11-26); DownloadChoice and the overview use it too.
     */
    private static final int THEME = android.R.style.Theme_DeviceDefault_Dialog_Alert;
    /** The last imported file's songs, in its order, for "Play these mixes" from the row. */
    private static List<String> lastImported;

    public MixFilesPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        refresh();
    }

    public MixFilesPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        refresh();
    }

    public MixFilesPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        refresh();
    }

    public MixFilesPreference(Context context) {
        super(context);
        refresh();
    }

    private void refresh() {
        setTitle("Mix files");
        setSummary(last != null ? last : DEFAULT);
    }

    private static Activity activityOf(Context c) {
        while (c instanceof ContextWrapper) {
            if (c instanceof Activity) return (Activity) c;
            c = ((ContextWrapper) c).getBaseContext();
        }
        return null;
    }

    /** The result line of the last import or export, or null (the overview's Mix files row shows it). */
    public static String lastResult() {
        return last;
    }

    /** Told on the main thread when the result line changes (the overview's row). */
    public static volatile Runnable changed;

    /** The Mix files menu from the Automix overview's foot (rule 9: the same row as the settings'). */
    public static void showMenu(Activity a) {
        if (gone(a)) return;
        new MixFilesPreference(a).menu(a);
    }

    @Override
    protected void onClick() {
        menu(activityOf(getContext()));
    }

    private void menu(Activity a) {
        if (gone(a)) return;
        if (!Automix.ready()) {
            say(a, "Open the player once first: the mixes are read when the app starts.");
            return;
        }
        List<String> played = lastImported;
        String[] items = played != null
                ? new String[]{"Import…", "Export this pair", "Export all", "Play these mixes (the last imported file)"}
                : new String[]{"Import…", "Export this pair", "Export all"};
        new AlertDialog.Builder(a, THEME)
                .setTitle("Mix files")
                .setItems(items, (d, which) -> {
                    if (which == 0) Picker.open(a, this);
                    else if (which == 3) play(a, played);
                    else export(a, which == 1);
                })
                .show();
    }

    private void result(String text) {
        last = text;
        setSummary(text);
        Runnable r = changed;
        if (r != null) r.run();
    }

    /** No window to show a dialog on: none, finishing or destroyed. */
    private static boolean gone(Activity a) {
        return a == null || a.isFinishing() || a.isDestroyed();
    }

    private void say(Activity a, String text) {
        result(text);
        Toast.makeText(a, text, Toast.LENGTH_LONG).show();
        Log.i(TAG, text);
    }

    // ---- import (rules 3 to 7)

    /** A file read (off the main thread, MixFile.read), on the main thread. */
    void imported(Activity a, MixFile.Read r) {
        if (r.refused != null) {
            say(a, "Not imported: " + r.refused + ".");
            return;
        }
        if (!MixFile.playQueue(r).isEmpty()) lastImported = MixFile.playQueue(r);
        MixFile.Plan p = MixFile.plan(r.mixes, Automix.savedOverrides());
        if (p.replace.isEmpty()) {
            save(a, r, p, false);
            return;
        }
        StringBuilder b = new StringBuilder();
        b.append(p.replace.size() == 1 ? "One pair already has" : p.replace.size() + " pairs already have").append(" an edit. Replace with the file's?");
        for (MixFile.Mix m : p.replace) {
            b.append("\n\n").append(name(m.from)).append(" → ").append(name(m.to)).append(':');
            for (String c : m.changes) b.append("\n  ").append(c);
        }
        if (!p.add.isEmpty()) b.append("\n\n(").append(p.add.size()).append(p.add.size() == 1 ? " new pair is" : " new pairs are").append(" added either way.)");
        if (gone(a)) return;
        new AlertDialog.Builder(a, THEME)
                .setTitle("Replace saved mixes?")
                .setMessage(b.toString())
                .setPositiveButton("Replace", (d, w) -> save(a, r, p, true))
                .setNegativeButton("Keep saved", (d, w) -> save(a, r, p, false))
                .setOnCancelListener(d -> save(a, r, p, false))
                .show();
    }

    private static String name(MixFile.Song s) {
        return s.title != null ? s.title : s.videoId;
    }

    private void save(Activity a, MixFile.Read r, MixFile.Plan p, boolean replace) {
        List<MixFile.Mix> go = new ArrayList<>(p.add);
        if (replace) go.addAll(p.replace);
        int saved = 0;
        List<String> refused = new ArrayList<>(), notes = new ArrayList<>();
        for (MixFile.Mix m : go) {
            String why = Automix.setOverride(m.key, m.override.copy());
            if (why != null) {
                refused.add(m.key + ": " + why);
                continue;
            }
            saved++;
            // beats taken as they are (rule 4): A's tempo when it is analysed already
            String note = MixOverride.foldNote(m.override, bpmOf(a, m.from.videoId));
            if (note != null) notes.add(name(m.from) + ": " + note);
        }
        String text = MixFile.summary(r, p, saved, replace ? 0 : p.replace.size(), refused, notes);
        List<String> queue = MixFile.playQueue(r);
        if (queue.isEmpty()) {
            say(a, text);
            return;
        }
        // the result with "Play these mixes" (rule 9)
        result(text);
        Log.i(TAG, text);
        if (gone(a)) return;
        new AlertDialog.Builder(a, THEME)
                .setTitle("Mix files")
                .setMessage(text)
                .setPositiveButton("Play these mixes", (d, w) -> play(a, queue))
                .setNegativeButton("Close", null)
                .show();
    }

    // ---- play these mixes (rule 9)

    /**
     * A fresh queue of the file's songs in its order (MixFile.playQueue, rule 7): the queue before it
     * replaced, and the first plays (Automix.playNext). With nothing playing they play as a list of
     * their own: YouTube makes a temporary list of the videos (watch_videos), opened as a link.
     */
    private void play(Activity a, List<String> ids) {
        if (ids.isEmpty()) return;
        String n = ids.size() + (ids.size() == 1 ? " song" : " songs");
        // (one by one, so YT keeps their order: a long playlist takes a while)
        if (ids.size() > 2) Toast.makeText(a, "Starting a fresh queue of " + n + "…", Toast.LENGTH_LONG).show();
        Automix.playNext(ids, why -> {
            if (why == null) {
                Toast.makeText(a, "Playing these mixes: a fresh queue of " + n + ".", Toast.LENGTH_SHORT).show();
                Log.i(TAG, "play next: " + n);
            } else if (why.equals(Automix.NOTHING_PLAYING)) playAsList(a, ids);
            else say(a, "Not all played: " + why + ".");
        });
    }

    private void playAsList(Activity a, List<String> all) {
        List<String> ids = all.size() > MixFile.PLAY_MAX ? all.subList(0, MixFile.PLAY_MAX) : all;
        Toast.makeText(a, "Queueing " + ids.size() + (ids.size() == 1 ? " song" : " songs") + "…", Toast.LENGTH_SHORT).show();
        new Thread(() -> {
            String list = ids.size() > 1 ? tempList(ids) : null;
            String url = "https://music.youtube.com/watch?v=" + ids.get(0) + (list != null ? "&list=" + list : "");
            a.runOnUiThread(() -> {
                if (a.isFinishing() || a.isDestroyed()) return;
                try {
                    a.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)).setPackage(a.getPackageName()));
                    if (ids.size() > 1 && list == null) say(a, "Could not queue the songs (offline?): playing the first one.");
                    else Log.i(TAG, "playing " + ids.size() + " songs");
                } catch (Throwable t) {
                    say(a, "Could not start playing: " + t.getClass().getSimpleName() + ".");
                }
            });
        }, "MixFiles-play").start();
    }

    /** The id of YouTube's temporary list of these videos in this order (watch_videos' redirect), or null. */
    private static String tempList(List<String> ids) {
        java.net.HttpURLConnection h = null;
        try {
            h = (java.net.HttpURLConnection) new java.net.URL("https://www.youtube.com/watch_videos?video_ids=" + String.join(",", ids)).openConnection();
            h.setInstanceFollowRedirects(false);
            h.setConnectTimeout(5000);
            h.setReadTimeout(5000);
            String to = h.getResponseCode() / 100 == 3 ? h.getHeaderField("Location") : null;
            String list = to != null ? Uri.parse(to).getQueryParameter("list") : null;
            return list != null && list.matches("[A-Za-z0-9_-]+") ? list : null;
        } catch (Throwable t) {
            Log.w(TAG, "no queue: " + t.getClass().getSimpleName());
            return null;
        } finally {
            if (h != null) h.disconnect();
        }
    }

    // ---- export (rule 8)

    private void export(Activity a, boolean onlyThis) {
        Map<String, MixOverride> saved = Automix.savedOverrides();
        List<String> keys = new ArrayList<>();
        if (onlyThis) {
            String k = Automix.overview().pairKey;
            if (k != null && saved.containsKey(k)) keys.add(k);
        } else keys.addAll(saved.keySet());
        if (keys.isEmpty()) {
            say(a, onlyThis ? "These two songs have no edit to export." : "No edited pairs to export.");
            return;
        }
        Toast.makeText(a, "Exporting " + keys.size() + (keys.size() == 1 ? " mix" : " mixes") + "…", Toast.LENGTH_SHORT).show();
        // the songs' titles and artists are looked up off the main thread (rule 8: as the PC does)
        new Thread(() -> {
            List<MixFile.Mix> entries = new ArrayList<>();
            java.util.Map<String, MixFile.Song> songs = new java.util.HashMap<>();
            for (String k : keys) {
                String[] ids = k.split(">", 2);
                if (ids.length < 2) continue;
                MixOverride o = saved.get(k);
                o = MixFile.forExport(o, o.gridBpm > 0 ? Double.NaN : bpmOf(a, ids[0]));
                entries.add(new MixFile.Mix(song(songs, ids[0]), song(songs, ids[1]), o));
            }
            Map<String, Object> file = MixFile.write(entries);
            int n = ((List<?>) file.get("mixes")).size();
            String name = MixFile.fileName(file, new SimpleDateFormat("yyyy-MM-dd", Locale.ROOT).format(new Date()));
            String text = MixFile.text(file);
            a.runOnUiThread(() -> {
                if (a.isFinishing() || a.isDestroyed()) return;
                if (n == 0) say(a, "Nothing to export: no valid edit.");
                else Picker.create(a, this, name, text, n);
            });
        }, "MixFiles-export").start();
    }

    /** This app's tempo for A (its end grid, editorGrid), NaN when A isn't analysed. */
    private static double bpmOf(Context c, String id) {
        double[] g = Automix.editorGrid(Analyzer.get(c.getApplicationContext(), id), true);
        return g != null ? g[2] : Double.NaN;
    }

    /** A song with its title and artist: known from this session, else YT Music's own (4 s at most); the id alone when neither. */
    private static MixFile.Song song(java.util.Map<String, MixFile.Song> seen, String id) {
        MixFile.Song s = seen.get(id);
        if (s != null) return s;
        String[] t = Automix.names(id);
        if (t == null || t[0] == null) t = lookUp(id);
        s = new MixFile.Song(id, t != null ? t[0] : null, t != null ? t[1] : null);
        seen.put(id, s);
        return s;
    }

    /** {title, artist} from YT Music's player data for the video, or null (offline, a timeout). */
    private static String[] lookUp(String id) {
        java.net.HttpURLConnection h = null;
        try {
            org.json.JSONObject body = new org.json.JSONObject().put("videoId", id).put("context", new org.json.JSONObject()
                    .put("client", new org.json.JSONObject().put("clientName", "WEB_REMIX").put("clientVersion", "1.20251101.01.00")
                            .put("hl", "en").put("gl", "US")));
            h = (java.net.HttpURLConnection) new java.net.URL("https://music.youtube.com/youtubei/v1/player?prettyPrint=false").openConnection();
            h.setConnectTimeout(4000);
            h.setReadTimeout(4000);
            h.setDoOutput(true);
            h.setRequestProperty("Content-Type", "application/json");
            try (OutputStream out = h.getOutputStream()) {
                out.write(body.toString().getBytes(StandardCharsets.UTF_8));
            }
            String text;
            try (InputStream in = h.getInputStream()) {
                text = readCapped(in, 4 * 1024 * 1024);
            }
            org.json.JSONObject d = text == null ? null : new org.json.JSONObject(text).optJSONObject("videoDetails");
            if (d == null || !id.equals(d.optString("videoId"))) return null;
            String title = d.optString("title", ""), artist = d.optString("author", "");
            if (artist.endsWith(" - Topic")) artist = artist.substring(0, artist.length() - 8);
            return title.isEmpty() ? null : new String[]{title, artist.isEmpty() ? null : artist};
        } catch (Throwable t) {
            Log.w(TAG, "no title for " + id + ": " + t.getClass().getSimpleName());
            return null;
        } finally {
            if (h != null) h.disconnect();
        }
    }

    void exported(Activity a, String name, int n, boolean ok) {
        say(a, ok ? "Exported " + n + " mix" + (n == 1 ? "" : "es") + " to " + name + "." : "Not exported: the file could not be written.");
    }

    /**
     * The system file pickers' answers (no activity of our own in the manifest): a headless
     * fragment on the settings activity asks and reads them. A picker left open across a rotation
     * loses its answer.
     */
    public static final class Picker extends Fragment {
        private static final String TAG_FRAGMENT = "ayham_mix_files";
        private static final int OPEN = 7101, CREATE = 7102;
        private static MixFilesPreference pref;
        private static String pendingName, pendingText;
        private static int pendingCount;

        public Picker() {
        }

        private static Picker on(Activity a) {
            FragmentManager fm = a.getFragmentManager();
            Picker p = (Picker) fm.findFragmentByTag(TAG_FRAGMENT);
            if (p == null) {
                p = new Picker();
                fm.beginTransaction().add(p, TAG_FRAGMENT).commitNow();
            }
            return p;
        }

        static void open(Activity a, MixFilesPreference from) {
            pref = from;
            Intent i = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            i.addCategory(Intent.CATEGORY_OPENABLE);
            i.setType("*/*");
            start(a, i, OPEN);
        }

        static void create(Activity a, MixFilesPreference from, String name, String text, int n) {
            pref = from;
            pendingName = name;
            pendingText = text;
            pendingCount = n;
            Intent i = new Intent(Intent.ACTION_CREATE_DOCUMENT);
            i.addCategory(Intent.CATEGORY_OPENABLE);
            i.setType("application/json");
            i.putExtra(Intent.EXTRA_TITLE, name);
            start(a, i, CREATE);
        }

        /** The system file picker; with none on the device, said so and nothing held. */
        private static void start(Activity a, Intent i, int request) {
            MixFilesPreference from = pref;
            try {
                on(a).startActivityForResult(i, request);
            } catch (Throwable t) {
                Log.w(TAG, "no file picker", t);
                clear();
                if (from != null) from.say(a, "No file picker on this device.");
            }
        }

        private static void clear() {
            pref = null;
            pendingName = null;
            pendingText = null;
        }

        @Override
        public void onDestroy() {
            super.onDestroy();
            // the settings screen closed with the picker open: not held (a rotation keeps them for the answer)
            Activity a = getActivity();
            if (a == null || a.isFinishing()) clear();
        }

        @Override
        public void onActivityResult(int requestCode, int resultCode, Intent data) {
            Activity a = getActivity();
            MixFilesPreference p = pref;
            String name = pendingName, out = pendingText;
            int count = pendingCount;
            // the settings screen is not held past its answer
            clear();
            Uri uri = data != null ? data.getData() : null;
            if (a == null || p == null || resultCode != Activity.RESULT_OK || uri == null) return;
            android.content.ContentResolver cr = a.getContentResolver();
            // the file read or written, and a mix file parsed, off the main thread (a cloud file, a 300-mix export)
            if (requestCode == OPEN) {
                new Thread(() -> {
                    String text = null, why = null;
                    MixFile.Read r = null;
                    try (InputStream in = cr.openInputStream(uri)) {
                        text = readCapped(in, MixFile.MAX_BYTES);
                    } catch (Throwable t) {
                        why = "Not imported: the file could not be read.";
                    }
                    if (why == null && text == null) why = "Not imported: the file is over 2 MB, not a mix file.";
                    if (why == null) {
                        try {
                            r = MixFile.read(text);
                        } catch (Throwable t) {
                            Log.w(TAG, "import failed", t);
                            why = "Not imported: the file could not be read.";
                        }
                    }
                    String said = why;
                    MixFile.Read read = r;
                    a.runOnUiThread(() -> {
                        if (gone(a)) return;
                        if (said != null) p.say(a, said);
                        else p.imported(a, read);
                    });
                }, "MixFiles-import").start();
            } else if (requestCode == CREATE && out != null) {
                new Thread(() -> {
                    boolean ok;
                    try (OutputStream o = cr.openOutputStream(uri, "wt")) {
                        o.write(out.getBytes(StandardCharsets.UTF_8));
                        ok = true;
                    } catch (Throwable t) {
                        Log.w(TAG, "export failed", t);
                        ok = false;
                    }
                    boolean done = ok;
                    a.runOnUiThread(() -> {
                        if (!gone(a)) p.exported(a, name, count, done);
                    });
                }, "MixFiles-write").start();
            }
        }

    }

    /** The stream's text, or null past [cap] bytes. */
    static String readCapped(InputStream in, int cap) throws java.io.IOException {
        ByteArrayOutputStream b = new ByteArrayOutputStream();
        byte[] buf = new byte[16384];
        int n;
        while ((n = in.read(buf)) > 0) {
            b.write(buf, 0, n);
            if (b.size() > cap) return null;
        }
        return new String(b.toByteArray(), StandardCharsets.UTF_8);
    }
}
