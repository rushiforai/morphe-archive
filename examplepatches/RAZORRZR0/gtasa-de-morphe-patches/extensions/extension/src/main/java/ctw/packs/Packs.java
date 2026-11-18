package ctw.packs;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.app.Fragment;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.provider.DocumentsContract;
import android.util.Log;
import android.widget.ProgressBar;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * Pack files for the "Load texture and radio packs" mod (libctwpacks.so), which reads them from
 * Android/data/com.rockstargames.gtactw/files/ when the game starts:
 * - "Download HD texture pack" patch: installHd() offers to download DXT.bin and CTWHD.bin from the ctw-packs
 *   release the first time the game screen opens without them. Interrupted downloads resume.
 * - The cheat menu's Packs tab: importRadio() imports radio stations from a zip or folder the player picks to
 *   files/radio/, converting the PSP's .AT3 to MP3 on the phone (libctwpacks.so); removeRadio() deletes them.
 *   No music is downloaded or shipped; the GTA IV radio mod for the PSP version also gets its names and logos.
 * Packs load at game start, so both end by asking to restart the game.
 */
public final class Packs {
    private static final String TAG = "CTWPacks";
    private static final String GAME_ACTIVITY = "com.rockstargames.gtactw.GameActivity";
    private static final String BASE = "https://github.com/RAZORRZR0/ctw-packs/releases/download/v1/";
    private static final String[] HD = {"DXT.bin", "CTWHD.bin"};
    private static final long[] HD_SIZE = {210906372L, 764235095L};
    private static final String[] STATIONS = {"radio1", "radio2", "radio3", "radio4", "radio5", "khalil", "tortoise",
            "wonderwheel", "anvil", "chinese", "dfa"};
    private static final List<String> EXTRAS = Arrays.asList("names.txt", "ss_radio.png", "radio_menu.png");
    // GTA IV radio mod for the PSP version by AshleyVT92: its two parts, told apart by RADIO1.AT3's size, and their
    // station names for the game's text entries (E_MAIN.gxt) of radio1-5, khalil, tortoise, wonderwheel.
    private static final long PSP_PART1 = 75275740L, PSP_PART2 = 15872252L;
    private static final String PSP_NAMES_1 = "0xe0=Vladivostok FM\n0xe1=Public Liberty Radio\n0xe2=San Juan Sounds\n"
            + "0xe3=Electro-Choc\n0xe4=The Classics 104.1\n0xe7=IF99\n0xe8=Tuff Gong Radio\n0xe9=Integrity 2.0\n";
    private static final String PSP_NAMES_2 = "0xe0=Massive B Soundsystem\n0xe1=K109 The Studio\n0xe2=Self-Actualization FM\n"
            + "0xe3=WKTT Talk Radio\n0xe4=Vice City FM\n0xe7=Liberty City Hardcore\n0xe8=The Journey\n0xe9=Fusion FM\n";
    private static boolean asked;

    static native String nativeConvertAt3(String in, String out, long[] progress);

    /** Called from GameNative's static init: offers the HD pack download when the game screen first opens. */
    public static void installHd() {
        try {
            Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                public void onActivityResumed(Activity a) {
                    if (asked || !GAME_ACTIVITY.equals(a.getClass().getName())) return;
                    asked = true;
                    long need = missingHd(a);
                    // A pack already there (also a player's own) is kept.
                    if (need > 0) new AlertDialog.Builder(a).setTitle("HD texture pack")
                            .setMessage("Download the HD textures (" + need / 1000000 + " MB)? Wi-Fi recommended. "
                                    + "You can hide the progress and keep playing.")
                            .setPositiveButton("Download", (d, w) -> downloadHd(a))
                            .setNegativeButton("Not now", null).show();
                }
                public void onActivityCreated(Activity a, Bundle b) {}
                public void onActivityStarted(Activity a) {}
                public void onActivityPaused(Activity a) {}
                public void onActivityStopped(Activity a) {}
                public void onActivitySaveInstanceState(Activity a, Bundle b) {}
                public void onActivityDestroyed(Activity a) {}
            });
        } catch (Throwable t) {
            Log.w(TAG, "HD download not installed", t);
        }
    }

    private static File dir(Activity a) {
        return a.getExternalFilesDir(null);
    }

    private static long missingHd(Activity a) {
        long need = 0;
        for (int i = 0; i < HD.length; i++) if (!new File(dir(a), HD[i]).exists()) need += HD_SIZE[i];
        return need;
    }

    private static void downloadHd(Activity a) {
        Progress p = new Progress(a, "HD textures");
        new Thread(() -> {
            try {
                long total = missingHd(a), done = 0;
                for (int i = 0; i < HD.length; i++) {
                    File out = new File(dir(a), HD[i]);
                    if (out.exists()) continue;
                    download(BASE + HD[i], out, HD_SIZE[i], done, total, p);
                    done += HD_SIZE[i];
                }
                p.dismiss();
                restart(a, "HD textures downloaded.");
            } catch (Exception e) {
                Log.w(TAG, "HD download failed", e);
                p.fail("Download failed: " + e.getMessage() + "\nRetry continues where it stopped.", () -> downloadHd(a));
            }
        }).start();
    }

    // Into <out>.part, resuming it with a Range request; renamed when complete.
    private static void download(String url, File out, long size, long base, long total, Progress p) throws IOException {
        File part = new File(out.getPath() + ".part");
        long have = part.length();
        HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
        c.setConnectTimeout(20000);
        c.setReadTimeout(30000);
        if (have > 0) c.setRequestProperty("Range", "bytes=" + have + "-");
        int code = c.getResponseCode();
        if (code != 200 && code != 206) throw new IOException("HTTP " + code);
        if (code == 200) have = 0;  // server ignored the range: start over
        try (InputStream in = c.getInputStream(); OutputStream o = new FileOutputStream(part, have > 0)) {
            byte[] buf = new byte[1 << 16];
            for (int n; (n = in.read(buf)) > 0; ) {
                o.write(buf, 0, n);
                have += n;
                p.set(base + have, total);
            }
        } finally {
            c.disconnect();
        }
        if (have != size) throw new IOException(out.getName() + " is " + have + " bytes, expected " + size);
        if (!part.renameTo(out)) throw new IOException("cannot rename " + part);
    }

    /** True when the pack loader is in this game, so the Packs tab is worth showing. */
    public static boolean loaderPresent(Activity a) {
        try {
            a.getAssets().open("gtade/mods/libctwpacks.so").close();
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    public static boolean hasRadio(Activity a) {
        return new File(dir(a), "radio").isDirectory();
    }

    /** Lets the player pick a zip (zip) or a folder, then imports its radio stations to files/radio/. */
    public static void importRadio(Activity a, boolean zip) {
        Picker f = new Picker();
        a.getFragmentManager().beginTransaction().add(f, "ctwRadioPicker").commitNow();
        Intent pick = zip ? new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*")
                .putExtra(Intent.EXTRA_MIME_TYPES, new String[]{"application/zip", "application/x-zip-compressed"})
                : new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);
        f.startActivityForResult(pick, zip ? 2 : 1);
    }

    public static void removeRadio(Activity a) {
        delete(new File(dir(a), "radio"));
        restart(a, "Radio pack removed.");
    }

    /** Headless fragment: the game's activity is not ours, so the picker's result arrives here. */
    public static final class Picker extends Fragment {
        @Override
        public void onActivityResult(int req, int res, Intent data) {
            Activity a = getActivity();
            getFragmentManager().beginTransaction().remove(this).commit();
            if (res == Activity.RESULT_OK && data != null && data.getData() != null && a != null)
                scan(a, data.getData(), req == 2);
        }
    }

    private interface Opener { InputStream open() throws IOException; }

    /** A radio file of the picked zip or folder: path inside it, its folder (dir) and its radio/ file name. */
    private static final class Item {
        final String path, dir, name;
        final long size;
        final Opener open;  // folder files; zip entries are read in one pass instead
        Item(String path, String name, long size, Opener open) {
            this.path = path;
            int slash = path.lastIndexOf('/');
            this.dir = slash < 0 ? "" : path.substring(0, slash);
            this.name = name;
            this.size = size;
            this.open = open;
        }
        boolean audio() { return name.endsWith(".mp3") || name.endsWith(".at3"); }
    }

    // radio/ name for a file name, or null: station audio (.mp3, or the PSP's .AT3 to convert) and the extras.
    private static String target(String file) {
        String f = file.toLowerCase(Locale.ROOT);
        if (f.startsWith("._")) return null;  // macOS metadata in zips
        if (EXTRAS.contains(f)) return f;
        int dot = f.lastIndexOf('.');
        if (dot < 0) return null;
        String stem = f.substring(0, dot), ext = f.substring(dot + 1);
        if (stem.equals("toth")) stem = "wonderwheel";  // the PSP version's name for it
        return Arrays.asList(STATIONS).contains(stem) && (ext.equals("mp3") || ext.equals("at3")) ? stem + "." + ext : null;
    }

    // Lists the radio files, lets the player choose when there are several sets (the PSP mod's zip has two parts).
    // Zips are streamed (a picked file has no path the game may open), once to list them and once to import.
    private static void scan(Activity a, Uri uri, boolean zip) {
        Progress p = new Progress(a, zip ? "Reading the zip" : "Reading the folder");
        new Thread(() -> {
            try {
                List<Item> items = new ArrayList<>();
                if (zip) {
                    try (ZipInputStream z = openZip(a, uri)) {
                        for (ZipEntry e; (e = z.getNextEntry()) != null; ) {
                            String path = e.getName(), name = target(path.substring(path.lastIndexOf('/') + 1));
                            if (e.isDirectory() || name == null || path.contains("__MACOSX")) continue;
                            z.closeEntry();  // reads it through, so its size is known
                            items.add(new Item(path, name, e.getSize(), null));
                        }
                    }
                } else {
                    walk(a, uri, DocumentsContract.getTreeDocumentId(uri), "", 0, items);
                }
                p.dismiss();
                Map<String, List<Item>> sets = new LinkedHashMap<>();
                for (Item i : items) sets.computeIfAbsent(i.dir, k -> new ArrayList<>()).add(i);
                sets.values().removeIf(s -> s.stream().noneMatch(Item::audio));
                if (sets.isEmpty()) throw new IOException("no stations found (radio1 … dfa, as .mp3 or the PSP's .AT3)");
                List<String> dirs = new ArrayList<>(sets.keySet());
                if (dirs.size() == 1) {
                    importSet(a, sets.get(dirs.get(0)), zip ? uri : null);
                    return;
                }
                String[] labels = labels(dirs);
                a.runOnUiThread(() -> new AlertDialog.Builder(a).setTitle("Which radio set?")
                        .setItems(labels, (d, w) -> new Thread(() -> importSet(a, sets.get(dirs.get(w)), zip ? uri : null)).start())
                        .setNegativeButton("Cancel", null).show());
            } catch (Exception e) {
                Log.w(TAG, "radio scan failed", e);
                p.fail("Import failed: " + e.getMessage(), null);
            }
        }).start();
    }

    private static ZipInputStream openZip(Activity a, Uri uri) throws IOException {
        InputStream in = a.getContentResolver().openInputStream(uri);
        if (in == null) throw new IOException("cannot open the zip");
        return new ZipInputStream(new BufferedInputStream(in, 1 << 16));
    }

    private static void walk(Activity a, Uri tree, String doc, String path, int depth, List<Item> out) {
        String[] cols = {DocumentsContract.Document.COLUMN_DOCUMENT_ID, DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                DocumentsContract.Document.COLUMN_MIME_TYPE, DocumentsContract.Document.COLUMN_SIZE};
        try (Cursor c = a.getContentResolver().query(DocumentsContract.buildChildDocumentsUriUsingTree(tree, doc), cols, null, null, null)) {
            while (c != null && c.moveToNext()) {
                String id = c.getString(0), file = c.getString(1), p = path.isEmpty() ? file : path + "/" + file;
                if (DocumentsContract.Document.MIME_TYPE_DIR.equals(c.getString(2))) {
                    if (depth < 8) walk(a, tree, id, p, depth + 1, out);
                    continue;
                }
                String name = target(file);
                Uri u = DocumentsContract.buildDocumentUriUsingTree(tree, id);
                if (name != null) out.add(new Item(p, name, c.getLong(3), () -> a.getContentResolver().openInputStream(u)));
            }
        }
    }

    // The first folder name that tells the sets apart, e.g. "Parte 1" / "Parte 2".
    private static String[] labels(List<String> dirs) {
        String[][] parts = new String[dirs.size()][];
        for (int i = 0; i < parts.length; i++) parts[i] = dirs.get(i).split("/");
        int common = 0;
        outer:
        for (; ; common++) {
            for (String[] p : parts) if (common >= p.length || !p[common].equals(parts[0][common])) break outer;
        }
        String[] out = new String[parts.length];
        for (int i = 0; i < parts.length; i++) out[i] = common < parts[i].length ? parts[i][common] : dirs.get(i);
        return out;
    }

    private static void importSet(Activity a, List<Item> set, Uri zip) {
        Progress p = new Progress(a, "Radio pack");
        File tmp = new File(dir(a), "radio.import"), radio = new File(dir(a), "radio");
        try {
            delete(tmp);
            if (!tmp.mkdirs()) throw new IOException("cannot create " + tmp);
            long total = 0;
            long[] done = {0};
            int psp = 0;
            List<String> names = new ArrayList<>();
            for (Item i : set) {
                total += i.name.endsWith(".at3") ? 2 * i.size : i.size;  // copy, then convert
                names.add(i.name);
                if (i.name.equals("radio1.at3")) psp = i.size == PSP_PART1 ? 1 : i.size == PSP_PART2 ? 2 : 0;
            }
            if (zip == null) {
                for (Item i : set) {
                    try (InputStream in = new BufferedInputStream(i.open.open(), 1 << 16)) {
                        add(i, in, tmp, done, total, p);
                    }
                }
            } else {
                Map<String, Item> byPath = new HashMap<>();
                for (Item i : set) byPath.put(i.path, i);
                try (ZipInputStream z = openZip(a, zip)) {
                    for (ZipEntry e; (e = z.getNextEntry()) != null; ) {
                        Item i = byPath.remove(e.getName());
                        if (i != null) add(i, z, tmp, done, total, p);
                    }
                }
                if (!byPath.isEmpty()) throw new IOException("the zip changed while importing");
            }
            // The GTA IV radio mod for the PSP version: its station names and logos, unless the set has its own.
            if (psp > 0 && !names.contains("names.txt")) {
                try (OutputStream o = new FileOutputStream(new File(tmp, "names.txt"))) {
                    o.write((psp == 1 ? PSP_NAMES_1 : PSP_NAMES_2).getBytes("UTF-8"));
                }
            }
            if (psp > 0 && !names.contains("ss_radio.png")) {
                for (String sheet : new String[]{"ss_radio.png", "radio_menu.png"}) {
                    try (InputStream in = a.getAssets().open("ctw/radio/gta4-psp-part" + psp + ".png")) {
                        copy(in, new File(tmp, sheet), false, new long[1], 0, null);
                    }
                }
            }
            delete(radio);
            if (!tmp.renameTo(radio)) throw new IOException("cannot rename " + tmp);
            p.dismiss();
            restart(a, "Radio pack imported" + (psp > 0 ? " (GTA IV radio, part " + psp + ")." : "."));
        } catch (Exception e) {
            Log.w(TAG, "radio import failed", e);
            delete(tmp);
            p.fail("Import failed: " + e.getMessage(), null);
        }
    }

    // One file into the import folder; .AT3 is converted to the station's .mp3.
    private static void add(Item i, InputStream in, File tmp, long[] done, long total, Progress p) throws IOException {
        File out = new File(tmp, i.name);
        copy(in.markSupported() ? in : new BufferedInputStream(in, 1 << 16), out, i.name.endsWith(".mp3"), done, total, p);
        if (i.name.endsWith(".at3")) convert(out, new File(tmp, i.name.replace(".at3", ".mp3")), done, total, p);
    }

    // Copies in (left open) to out; an MP3 loses a leading ID3 tag.
    private static void copy(InputStream in, File out, boolean mp3, long[] done, long total, Progress p) throws IOException {
        if (mp3) done[0] += skipId3(in);
        byte[] buf = new byte[1 << 16];
        try (OutputStream o = new FileOutputStream(out)) {
            for (int n; (n = in.read(buf)) > 0; ) {
                o.write(buf, 0, n);
                done[0] += n;
                if (p != null) p.set(done[0], total);
            }
        }
    }

    // .AT3 (ATRAC3plus) -> the game's MP3, in libctwpacks.so; the .AT3 is deleted afterwards.
    private static void convert(File at3, File mp3, long[] done, long total, Progress p) throws IOException {
        long[] progress = {0};
        long base = done[0], size = at3.length();
        Thread ticker = new Thread(() -> {
            while (!Thread.currentThread().isInterrupted()) {
                p.set(base + progress[0], total);
                try {
                    Thread.sleep(300);
                } catch (InterruptedException e) {
                    return;
                }
            }
        });
        ticker.start();
        String err;
        try {
            err = nativeConvertAt3(at3.getPath(), mp3.getPath(), progress);
        } catch (UnsatisfiedLinkError e) {
            err = "the converter is missing (patch with Load texture and radio packs)";
        } finally {
            ticker.interrupt();
        }
        at3.delete();
        if (err != null) throw new IOException(at3.getName() + ": " + err);
        done[0] = base + size;
    }

    // The game reads the first MP3 frame from byte 0 and plays a leading ID3v2 tag as static: drop it. Returns bytes skipped.
    private static long skipId3(InputStream in) throws IOException {
        if (!in.markSupported()) throw new IOException("cannot check the MP3's start");
        in.mark(10);
        byte[] h = new byte[10];
        int n = 0;
        for (int r; n < 10 && (r = in.read(h, n, 10 - n)) > 0; ) n += r;
        if (n < 10 || h[0] != 'I' || h[1] != 'D' || h[2] != '3') {
            in.reset();
            return 0;
        }
        long len = ((h[6] & 0x7f) << 21 | (h[7] & 0x7f) << 14 | (h[8] & 0x7f) << 7 | (h[9] & 0x7f)) + ((h[5] & 0x10) != 0 ? 10 : 0);
        for (long left = len; left > 0; ) {
            long s = in.skip(left);
            if (s <= 0) throw new IOException("truncated ID3 tag");
            left -= s;
        }
        return 10 + len;
    }

    private static void delete(File f) {
        File[] kids = f.listFiles();
        if (kids != null) for (File k : kids) delete(k);
        f.delete();
    }

    private static void restart(Activity a, String msg) {
        a.runOnUiThread(() -> new AlertDialog.Builder(a).setTitle("Packs").setCancelable(false)
                .setMessage(msg + "\nThe game loads packs when it starts: close it and open it again.")
                .setPositiveButton("Close game", (d, w) -> {
                    a.finishAffinity();
                    System.exit(0);
                })
                .setNegativeButton("Later", null).show());
    }

    /** Progress dialog; Hide dismisses it while the work goes on, which ends with its own dialog. */
    private static final class Progress {
        final Activity a;
        final String title;
        final ProgressBar bar;
        AlertDialog dialog;
        int shown = -1;

        Progress(Activity a, String title) {
            this.a = a;
            this.title = title;
            bar = new ProgressBar(a, null, android.R.attr.progressBarStyleHorizontal);
            bar.setMax(1000);
            int pad = (int) (20 * a.getResources().getDisplayMetrics().density);
            bar.setPadding(pad, pad, pad, pad);
            a.runOnUiThread(() -> dialog = new AlertDialog.Builder(a).setTitle(title).setView(bar)
                    .setNegativeButton("Hide", null).show());
        }

        void set(long done, long total) {
            int v = total > 0 ? (int) Math.min(1000, done * 1000 / total) : 0;
            if (v == shown) return;
            shown = v;
            a.runOnUiThread(() -> {
                bar.setProgress(v);
                if (dialog != null) dialog.setTitle(String.format(Locale.US, "%s: %.1f%%", title, v / 10f));
            });
        }

        void dismiss() {
            a.runOnUiThread(() -> { if (dialog != null) dialog.dismiss(); });
        }

        void fail(String msg, Runnable retry) {
            a.runOnUiThread(() -> {
                if (dialog != null) dialog.dismiss();
                AlertDialog.Builder b = new AlertDialog.Builder(a).setTitle("Packs").setMessage(msg).setNegativeButton("Close", null);
                if (retry != null) b.setPositiveButton("Retry", (d, w) -> retry.run());
                b.show();
            });
        }
    }
}
