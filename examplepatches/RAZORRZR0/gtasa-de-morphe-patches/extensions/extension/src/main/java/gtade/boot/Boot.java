package gtade.boot;

import android.app.Application;
import android.content.res.AssetManager;
import android.util.Log;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * GameActivity's static init calls start() right after loadLibrary("UE4") (Mod loader patch).
 * The mod patches put their files in assets/gtade/{mods,configs,cleo}/. After each (re)patch this copies them to
 * Android/data/<game>/{mods,configs,cleo}, where AML and CLEO load them, then loads AML. An existing .ini is rebuilt from
 * the new one with the user's values kept (mergeIni), so renamed or removed settings never leave stale keys or labels. With the Rubbish-DE patch it also builds
 * that mod's model pak into paks/ from the game's own data (RubbishPak). Mod libraries and paks from an earlier patch
 * that are no longer included are deleted.
 */
public final class Boot {
    private static final String TAG = "GTADEBoot";
    private static final String STATE = "mods/.gtade_patched";  // line 1: APK update time; then installed mod paths
    private static final String RUBBISH_PAK = "904-Rubbish-DE_P.pak";

    public static void start() {
        try {
            sync();
        } catch (Throwable t) {
            Log.w(TAG, "mod sync failed, starting with the current mods", t);
        }
        System.loadLibrary("AML");
    }

    private static void sync() throws Exception {
        Application app = (Application) Class.forName("android.app.ActivityThread")
                .getMethod("currentApplication").invoke(null);
        File root = app.getExternalFilesDir(null).getParentFile();  // Android/data/<game>
        String stamp = Long.toString(app.getPackageManager().getPackageInfo(app.getPackageName(), 0).lastUpdateTime);
        File state = new File(root, STATE);
        List<String> old = new ArrayList<>();
        if (state.exists()) {
            try (BufferedReader r = new BufferedReader(new InputStreamReader(new FileInputStream(state)))) {
                for (String l; (l = r.readLine()) != null; ) old.add(l);
            }
        }
        if (!old.isEmpty() && old.get(0).equals(stamp)) return;  // already synced for this APK

        AssetManager assets = app.getAssets();
        List<String> now = new ArrayList<>();
        for (String dir : new String[]{"mods", "configs", "cleo"}) {
            String[] names = assets.list("gtade/" + dir);
            if (names == null) continue;
            for (String n : names) {
                String path = dir + "/" + n;
                File dst = new File(root, path);
                if (dir.equals("mods")) now.add(path);
                if (n.endsWith(".ini") && dst.exists()) {
                    String user = readFile(dst), merged = mergeIni(user, readAsset(assets, "gtade/" + path));
                    if (!merged.equals(user)) {
                        writeAtomic(dst, merged.getBytes(StandardCharsets.UTF_8));
                        Log.i(TAG, "updated settings in " + path);
                    }
                    continue;
                }
                dst.getParentFile().mkdirs();
                File tmp = new File(dst.getPath() + ".tmp");
                try (InputStream in = assets.open("gtade/" + path); OutputStream out = new FileOutputStream(tmp)) {
                    byte[] buf = new byte[1 << 16];
                    for (int k; (k = in.read(buf)) > 0; ) out.write(buf, 0, k);
                }
                if (!tmp.renameTo(dst)) throw new IllegalStateException("cannot write " + dst);
                Log.i(TAG, "installed " + path);
            }
        }
        String rubbishSlots = readAsset(assets, "gtade/rubbish/slots.json");
        if (rubbishSlots != null) {  // Rubbish-DE patch: its model pak is built from this device's game data
            String path = "paks/" + RUBBISH_PAK;
            try {
                List<String> apks = new ArrayList<>();
                apks.add(app.getApplicationInfo().sourceDir);
                if (app.getApplicationInfo().splitSourceDirs != null)
                    apks.addAll(java.util.Arrays.asList(app.getApplicationInfo().splitSourceDirs));
                File dst = new File(root, path);
                dst.getParentFile().mkdirs();
                RubbishPak.writeFile(dst, RubbishPak.build(apks, rubbishSlots));
                now.add(path);
                Log.i(TAG, "built " + path);
            } catch (Throwable t) {
                Log.w(TAG, "Rubbish-DE pak not built: litter stays invisible", t);
            }
        }
        for (String p : old.subList(Math.min(1, old.size()), old.size())) {
            if (!now.contains(p) && new File(root, p).delete()) Log.i(TAG, "removed " + p);
        }
        state.getParentFile().mkdirs();
        try (OutputStream out = new FileOutputStream(state)) {
            out.write((stamp + "\n").getBytes("UTF-8"));
            for (String p : now) out.write((p + "\n").getBytes("UTF-8"));
        }
    }

    private static String readAsset(AssetManager assets, String name) {
        try (InputStream in = assets.open(name)) {
            java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
            byte[] buf = new byte[1 << 16];
            for (int k; (k = in.read(buf)) > 0; ) out.write(buf, 0, k);
            return out.toString("UTF-8");
        } catch (IOException e) {
            return null;  // not bundled: its patch was not selected
        }
    }

    private static String readFile(File f) throws IOException {
        try (InputStream in = new FileInputStream(f)) {
            java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
            byte[] buf = new byte[1 << 16];
            for (int k; (k = in.read(buf)) > 0; ) out.write(buf, 0, k);
            return out.toString("UTF-8");
        }
    }

    private static void writeAtomic(File dst, byte[] data) throws IOException {
        File tmp = new File(dst.getPath() + ".tmp");
        try (FileOutputStream out = new FileOutputStream(tmp)) {
            out.write(data);
            out.getFD().sync();
        }
        if (!tmp.renameTo(dst)) throw new IOException("cannot write " + dst);
    }

    /**
     * The bundled ini (current keys, comments and labels) with the user's value for every key it still has. User
     * sections the bundled ini does not have (their own additions) are kept at the end; keys it dropped are removed.
     */
    static String mergeIni(String user, String bundled) {
        java.util.Map<String, String> values = new java.util.HashMap<>();
        java.util.Map<String, StringBuilder> sections = new java.util.LinkedHashMap<>();
        String section = "";
        for (String l : user.split("\n", -1)) {
            String t = l.trim();
            if (t.startsWith("[")) {
                section = t;
                if (!sections.containsKey(t)) sections.put(t, new StringBuilder());
            }
            if (sections.containsKey(section)) sections.get(section).append(l).append('\n');
            int eq = t.indexOf('=');
            if (eq > 0 && !t.startsWith(";") && !t.startsWith("#"))
                values.put(section + "\n" + t.substring(0, eq).trim(), t.substring(eq + 1).trim());
        }
        StringBuilder out = new StringBuilder();
        section = "";
        String[] lines = bundled.split("\n", -1);
        for (int i = 0; i < lines.length; i++) {
            String l = lines[i], t = l.trim();
            if (t.startsWith("[")) {
                section = t;
                sections.remove(t);
            }
            int eq = l.indexOf('=');
            String v = eq > 0 && !t.startsWith(";") && !t.startsWith("#")
                    ? values.get(section + "\n" + l.substring(0, eq).trim()) : null;
            out.append(v != null ? l.substring(0, eq + 1) + v : l);
            if (i < lines.length - 1) out.append('\n');
        }
        for (StringBuilder s : sections.values()) {
            while (out.length() > 0 && Character.isWhitespace(out.charAt(out.length() - 1))) out.setLength(out.length() - 1);
            out.append("\n\n").append(s.toString().replaceAll("\\s+$", "")).append('\n');
        }
        return out.toString();
    }
}
