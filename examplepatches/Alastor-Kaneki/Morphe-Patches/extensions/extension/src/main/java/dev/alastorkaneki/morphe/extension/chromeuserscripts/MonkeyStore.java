package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Private JSON database, network installer, update checker, and settings. */
final class MonkeyStore {
    interface Callback { void done(boolean ok, String message, Userscript script); }
    private static final Object LOCK = new Object();
    private static final ExecutorService IO = Executors.newSingleThreadExecutor();
    private static final String PREFS = "dev.alastorkaneki.monkeyscript";
    private static List<Userscript> cache;
    private static long generation;

    static List<Userscript> list(Context context) {
        synchronized (LOCK) {
            ensureLoaded(context);
            List<Userscript> out = new ArrayList<>();
            for (Userscript s : cache) out.add(s.copy());
            Collections.sort(out, Comparator.comparingInt(a -> a.sortOrder));
            return out;
        }
    }

    static Userscript get(Context context, String id) {
        synchronized (LOCK) {
            ensureLoaded(context);
            for (Userscript s : cache) if (s.id.equals(id)) return s.copy();
            return null;
        }
    }

    static void save(Context context, Userscript script) throws Exception {
        synchronized (LOCK) {
            ensureLoaded(context);
            Userscript parsed = UserscriptMetadataParser.reparsePreservingState(script, script.source);
            parsed.id = script.id == null || script.id.isEmpty() ? parsed.id : script.id;
            parsed.enabled = script.enabled;
            parsed.installUrl = script.installUrl;
            parsed.requireSources.addAll(script.requireSources);
            boolean replaced = false;
            for (int i = 0; i < cache.size(); i++) {
                if (cache.get(i).id.equals(parsed.id)) { cache.set(i, parsed); replaced = true; break; }
            }
            if (!replaced) { parsed.sortOrder = cache.size(); cache.add(parsed); }
            write(context); generation++;
        }
    }

    static void remove(Context context, String id) throws Exception {
        synchronized (LOCK) { ensureLoaded(context); cache.removeIf(s -> s.id.equals(id)); write(context); generation++; }
    }

    static void setEnabled(Context context, String id, boolean enabled) throws Exception {
        synchronized (LOCK) {
            ensureLoaded(context);
            for (Userscript s : cache) if (s.id.equals(id)) s.enabled = enabled;
            write(context); generation++;
        }
    }

    static List<Userscript> matching(Context context, String url) {
        if (!globalEnabled(context) || hostDisabled(context, url)) return new ArrayList<>();
        List<Userscript> out = new ArrayList<>();
        for (Userscript s : list(context)) if (UrlPatternMatcher.matches(s, url)) out.add(s);
        return out;
    }

    static void importText(Context context, String source, String name, String installUrl, Callback callback) {
        IO.execute(() -> {
            try {
                Userscript s = UserscriptMetadataParser.parse(source, name, installUrl);
                loadRequires(s);
                synchronized (LOCK) {
                    ensureLoaded(context);
                    int at = -1;
                    for (int i = 0; i < cache.size(); i++) if (cache.get(i).id.equals(s.id)) {
                        at = i; s.installedAt = cache.get(i).installedAt; s.enabled = cache.get(i).enabled;
                    }
                    if (at >= 0) cache.set(at, s); else { s.sortOrder = cache.size(); cache.add(s); }
                    write(context); generation++;
                }
                callback.done(true, "Installed " + s.name, s.copy());
            } catch (Throwable e) { callback.done(false, safe(e), null); }
        });
    }

    static void installUrl(Context context, String url, Callback callback) {
        IO.execute(() -> {
            try {
                Userscript s = UserscriptMetadataParser.parse(fetch(url), fileName(url), url);
                loadRequires(s);
                synchronized (LOCK) {
                    ensureLoaded(context); int at = -1;
                    for (int i = 0; i < cache.size(); i++) if (cache.get(i).id.equals(s.id)) {
                        at = i; s.installedAt = cache.get(i).installedAt; s.enabled = cache.get(i).enabled;
                    }
                    if (at >= 0) cache.set(at, s); else { s.sortOrder = cache.size(); cache.add(s); }
                    write(context); generation++;
                }
                callback.done(true, "Installed " + s.name, s.copy());
            } catch (Throwable e) { callback.done(false, safe(e), null); }
        });
    }

    static void updateAll(Context context, Callback callback) {
        IO.execute(() -> {
            int changed = 0;
            try {
                for (Userscript old : list(context)) {
                    String url = old.effectiveUpdateUrl();
                    if (url.isEmpty()) continue;
                    try {
                        Userscript fresh = UserscriptMetadataParser.parse(fetch(url), fileName(url), url);
                        if (compareVersions(fresh.version, old.version) > 0 || !fresh.source.equals(old.source)) {
                            fresh.id = old.id; fresh.enabled = old.enabled; fresh.installedAt = old.installedAt;
                            fresh.sortOrder = old.sortOrder; loadRequires(fresh);
                            synchronized (LOCK) {
                                ensureLoaded(context);
                                for (int i = 0; i < cache.size(); i++) if (cache.get(i).id.equals(old.id)) cache.set(i, fresh);
                            }
                            changed++;
                        }
                    } catch (Throwable ignored) { }
                }
                synchronized (LOCK) { write(context); generation++; }
                callback.done(true, changed + " script(s) updated", null);
            } catch (Throwable e) { callback.done(false, safe(e), null); }
        });
    }

    static String backup(Context context) throws Exception {
        JSONObject root = new JSONObject(); root.put("format", "MonkeyScript-backup"); root.put("version", 1);
        JSONArray a = new JSONArray(); for (Userscript s : list(context)) a.put(s.toJson()); root.put("scripts", a);
        return root.toString(2);
    }

    static void restore(Context context, String text) throws Exception {
        JSONArray a = new JSONObject(text).getJSONArray("scripts"); List<Userscript> scripts = new ArrayList<>();
        for (int i = 0; i < a.length(); i++) scripts.add(Userscript.fromJson(a.getJSONObject(i)));
        synchronized (LOCK) { cache = scripts; write(context); generation++; }
    }

    static long generation() { synchronized (LOCK) { return generation; } }
    static SharedPreferences prefs(Context c) { return c.getSharedPreferences(PREFS, Context.MODE_PRIVATE); }
    static boolean globalEnabled(Context c) { return prefs(c).getBoolean("enabled", true); }
    static void globalEnabled(Context c, boolean v) { prefs(c).edit().putBoolean("enabled", v).apply(); generation++; }
    static boolean showButton(Context c) { return prefs(c).getBoolean("button", true); }
    static void showButton(Context c, boolean v) { prefs(c).edit().putBoolean("button", v).apply(); }
    static boolean amoled(Context c) { return prefs(c).getBoolean("amoled", false); }
    static void amoled(Context c, boolean v) { prefs(c).edit().putBoolean("amoled", v).apply(); }
    static boolean hostDisabled(Context c, String url) {
        String h = host(url); return !h.isEmpty() && prefs(c).getStringSet("disabled_hosts", Collections.emptySet()).contains(h);
    }
    static void hostDisabled(Context c, String url, boolean disabled) {
        java.util.Set<String> s = new java.util.HashSet<>(prefs(c).getStringSet("disabled_hosts", Collections.emptySet()));
        String h = host(url); if (h.isEmpty()) return; if (disabled) s.add(h); else s.remove(h);
        prefs(c).edit().putStringSet("disabled_hosts", s).apply(); generation++;
    }

    private static void ensureLoaded(Context c) {
        if (cache != null) return;
        cache = new ArrayList<>(); File f = new File(c.getFilesDir(), "monkeyscript/scripts.json"); if (!f.isFile()) return;
        try {
            JSONArray a = new JSONObject(readFile(f)).optJSONArray("scripts");
            if (a != null) for (int i = 0; i < a.length(); i++) cache.add(Userscript.fromJson(a.getJSONObject(i)));
        } catch (Throwable ignored) { cache.clear(); }
    }

    private static void write(Context c) throws Exception {
        File dir = new File(c.getFilesDir(), "monkeyscript");
        if (!dir.exists() && !dir.mkdirs()) throw new Exception("Cannot create script database");
        JSONArray a = new JSONArray(); for (Userscript s : cache) a.put(s.toJson()); JSONObject r = new JSONObject(); r.put("scripts", a);
        File tmp = new File(dir, "scripts.tmp"), out = new File(dir, "scripts.json");
        try (FileOutputStream f = new FileOutputStream(tmp)) { f.write(r.toString(2).getBytes(StandardCharsets.UTF_8)); }
        if (out.exists() && !out.delete()) throw new Exception("Cannot replace script database");
        if (!tmp.renameTo(out)) throw new Exception("Cannot save script database");
    }

    private static void loadRequires(Userscript s) {
        s.requireSources.clear(); for (String u : s.requires) try { s.requireSources.add(fetch(u)); } catch (Throwable ignored) { }
    }
    static String fetch(String value) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(value).openConnection();
        c.setConnectTimeout(15000); c.setReadTimeout(20000); c.setInstanceFollowRedirects(true);
        c.setRequestProperty("User-Agent", "Mozilla/5.0 Chrome Android MonkeyScript");
        int status = c.getResponseCode(); if (status < 200 || status >= 300) throw new Exception("HTTP " + status);
        try (InputStream in = c.getInputStream()) { return read(in, 4 * 1024 * 1024); } finally { c.disconnect(); }
    }
    static String read(InputStream in, int max) throws Exception {
        ByteArrayOutputStream o = new ByteArrayOutputStream(); byte[] b = new byte[8192]; int n, total = 0;
        while ((n = in.read(b)) != -1) { total += n; if (total > max) throw new Exception("File is too large"); o.write(b, 0, n); }
        return o.toString("UTF-8");
    }
    private static String readFile(File f) throws Exception { try (InputStream in = new FileInputStream(f)) { return read(in, 8 * 1024 * 1024); } }
    private static String fileName(String u) { String p = Uri.parse(u).getLastPathSegment(); return p == null ? "remote.user.js" : p; }
    private static String host(String u) { try { String h = Uri.parse(u).getHost(); return h == null ? "" : h.toLowerCase(Locale.US); } catch (Throwable e) { return ""; } }
    private static String safe(Throwable e) { return e.getMessage() == null ? e.getClass().getSimpleName() : e.getMessage(); }
    private static int compareVersions(String a, String b) {
        String[] x = a.split("[.-]"), y = b.split("[.-]");
        for (int i = 0; i < Math.max(x.length, y.length); i++) {
            String p = i < x.length ? x[i] : "0", q = i < y.length ? y[i] : "0";
            try { int d = Integer.parseInt(p) - Integer.parseInt(q); if (d != 0) return d; }
            catch (NumberFormatException e) { int d = p.compareToIgnoreCase(q); if (d != 0) return d; }
        }
        return 0;
    }
}
