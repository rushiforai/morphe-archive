// SPDX-License-Identifier: GPL-3.0-only
package io.github.pengusto.patches.komikku.tests;

import android.app.Instrumentation;
import android.content.Context;
import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.*;
import android.os.*;
import java.io.*;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.*;
import java.util.zip.*;
import org.json.*;

/** Calls the real installed APK predicate and seeds only disposable data.
 * R8 inlines the parser: full parser acceptance is performed through app UI.
 */
public final class LocalSearch extends Instrumentation {
    Bundle args;
    Context target;
    static Field field(Class<?> c, String name) throws Exception {
        for (; c != null; c = c.getSuperclass()) try {
            Field f = c.getDeclaredField(name); f.setAccessible(true); return f;
        } catch (NoSuchFieldException ignored) {}
        throw new NoSuchFieldException(name);
    }
    static void put(Object o, String name, Object value) throws Exception { field(o.getClass(), name).set(o, value); }
    static Object allocate(String name) throws Exception {
        Class<?> u = Class.forName("sun.misc.Unsafe");
        Object unsafe = field(u, "theUnsafe").get(null);
        return u.getMethod("allocateInstance", Class.class).invoke(unsafe, Class.forName(name));
    }
    static Method method(Object o, String name, int count) {
        for (Method m : o.getClass().getDeclaredMethods()) if (m.getName().equals(name) && m.getParameterCount() == count) {
            m.setAccessible(true); return m;
        }
        throw new IllegalArgumentException(name);
    }
    static String hash(byte[] data) throws Exception {
        StringBuilder s = new StringBuilder();
        for (byte b : MessageDigest.getInstance("SHA-256").digest(data)) s.append(String.format("%02x", b & 255));
        return s.toString();
    }
    boolean matches(String query, long source, String title, List<String> genres) throws Exception {
        Object manga = allocate("tachiyomi.domain.manga.model.Manga");
        put(manga, "source", source); put(manga, "ogTitle", title); put(manga, "ogGenre", genres);
        Object library = allocate("tachiyomi.domain.library.model.LibraryManga"); put(library, "manga", manga);
        Object text = Class.forName("exh.search.Text").getDeclaredConstructor().newInstance();
        put(text, "excluded", query.startsWith("-"));
        Object component = Class.forName("exh.search.StringTextComponent").getDeclaredConstructor(String.class)
            .newInstance(query.startsWith("-") ? query.substring(1) : query);
        @SuppressWarnings("unchecked") List<Object> components = (List<Object>) field(text.getClass(), "components").get(text);
        components.add(component);
        Object queries = Collections.singletonList(text);
        Object model = allocate("eu.kanade.tachiyomi.ui.library.LibraryScreenModel");
        return (Boolean) method(model, "filterManga", 8).invoke(model, queries, library, null, null, true, null, null, Collections.emptyMap());
    }
    void seed() throws Exception {
        File dbFile = target.getDatabasePath("tachiyomi.db");
        SQLiteDatabase db = SQLiteDatabase.openDatabase(dbFile.getPath(), null, SQLiteDatabase.OPEN_READWRITE);
        try {
            try (var c = db.rawQuery("SELECT count(*) FROM mangas WHERE _id NOT BETWEEN 9900000001 AND 9900000003", null)) {
                c.moveToFirst(); if (c.getLong(0) != 0) throw new AssertionError("Non-fixture manga present");
            }
            String[] names = {"Orion", "Meteor", "Lyra"};
            for (int i = 0; i < names.length; i++) {
                long id = 9900000001L + i;
                ContentValues m = new ContentValues(); m.put("_id", id); m.put("source", i == 2 ? 42L : 0L);
                m.put("url", names[i]); m.put("title", names[i]); m.put("author", "Penguin fixture"); m.put("genre", "Space");
                m.put("status", 2); m.put("favorite", 1); m.put("initialized", 1); m.put("viewer", 0);
                m.put("chapter_flags", 0); m.put("cover_last_modified", 1793318400000L); m.put("date_added", 1793318400000L);
                m.put("notes", "Penguin synthetic fixture");
                db.insertOrThrow("mangas", null, m);
                ContentValues c = new ContentValues(); c.put("_id", id); c.put("manga_id", id); c.put("url", "Chapter 1.cbz");
                c.put("name", "Chapter 1"); c.put("read", i == 0 ? 1 : 0); c.put("bookmark", i == 0 ? 1 : 0);
                c.put("last_page_read", i == 0 ? 3 : 0); c.put("chapter_number", 1); c.put("source_order", 0);
                c.put("date_fetch", 1793318400000L); c.put("date_upload", 1793318400000L);
                db.insertOrThrow("chapters", null, c);
                File covers = target.getExternalFilesDir("covers/custom"); covers.mkdirs();
                StringBuilder key = new StringBuilder();
                for (byte b : MessageDigest.getInstance("MD5").digest(Long.toString(id).getBytes(StandardCharsets.UTF_8))) key.append(String.format("%02x", b & 255));
                Bitmap art = Bitmap.createBitmap(480, 680, Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(art); canvas.drawColor(new int[]{0xff173f57, 0xff673d35, 0xff304b45}[i]);
                Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG); paint.setColor(0xffbbd9df); canvas.drawCircle(350, 130, 95, paint);
                paint.setColor(Color.WHITE); paint.setTextSize(57); paint.setFakeBoldText(true); canvas.drawText(names[i].toUpperCase(), 34, 440, paint);
                paint.setTextSize(23); paint.setFakeBoldText(false); canvas.drawText("Penguin test library", 34, 500, paint);
                try (var out = new FileOutputStream(new File(covers, key.toString()))) { art.compress(Bitmap.CompressFormat.PNG, 100, out); }
                if (i < 2) {
                    File dir = new File(target.getFilesDir(), "penguin-search-fixture/local/" + names[i]); dir.mkdirs();
                    try (var zip = new ZipOutputStream(new FileOutputStream(new File(dir, "Chapter 1.cbz")))) {
                        zip.putNextEntry(new ZipEntry("001.png")); art.compress(Bitmap.CompressFormat.PNG, 100, zip); zip.closeEntry();
                    }
                }
            }
        } finally { db.close(); }
        target.getSharedPreferences("app.komikku_preferences", Context.MODE_PRIVATE).edit()
            .putBoolean("__APP_STATE_onboarding_complete", true)
            .putString("__APP_STATE_storage_dir", "file://" + new File(target.getFilesDir(), "penguin-search-fixture"))
            .putString("pref_display_mode_library", "COMFORTABLE_GRID").commit();
    }
    @Override public void onCreate(Bundle a) { super.onCreate(a); args = a; start(); }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            if (!"true".equals(args.getString("disposable")) || !"ranchu".equals(Build.HARDWARE)) throw new AssertionError("Disposable AVD required");
            target = getTargetContext(); if (!"app.komikku".equals(target.getPackageName())) throw new AssertionError("Wrong target");
            File root = new File(target.getFilesDir(), "penguin-search-fixture"); root.mkdirs();
            File owner = new File(root, ".owner"); String marker = "PenguinKomikkuSearchFixture-2026-10-30";
            if (owner.exists() && !new String(java.nio.file.Files.readAllBytes(owner.toPath()), StandardCharsets.UTF_8).equals(marker)) throw new AssertionError("Foreign fixture");
            java.nio.file.Files.write(owner.toPath(), marker.getBytes(StandardCharsets.UTF_8));
            // Match the source regression's explicit DI boundary. Instrumentation
            // can start before UI-owned registration; use the real application.
            Object scope = Class.forName("uy.kohesive.injekt.InjektKt").getDeclaredMethod("getInjekt").invoke(null);
            Constructor<?> keyConstructor = Class.forName("eu.kanade.tachiyomi.ui.library.LibraryScreenModel$filterManga$$inlined$get$1").getDeclaredConstructor();
            keyConstructor.setAccessible(true);
            method(scope, "addSingleton", 2).invoke(scope, keyConstructor.newInstance(), target.getApplicationContext());
            if ("seed".equals(args.getString("mode"))) seed();
            String[] queries = {"-meteor", "-orion", "-space", "-0", "-42", "-43", "orion", "meteor"};
            boolean[] expected = {true, false, false, true, false, true, true, false};
            JSONArray cases = new JSONArray(); int failures = 0;
            for (int i = 0; i < queries.length; i++) {
                boolean actual = matches(queries[i], i == 4 || i == 5 ? 42L : 0L, "Orion", i == 2 ? List.of("Space") : List.of());
                if (actual != expected[i]) failures++;
                cases.put(new JSONObject().put("query", queries[i]).put("expected", expected[i]).put("actual", actual).put("passed", actual == expected[i]));
            }
            JSONObject report = new JSONObject().put("cases", cases).put("failures", failures)
                .put("apkSha256", hash(java.nio.file.Files.readAllBytes(new File(target.getApplicationInfo().sourceDir).toPath())));
            java.nio.file.Files.write(new File(target.getCacheDir(), "penguin-search-results.json").toPath(), report.toString(2).getBytes(StandardCharsets.UTF_8));
            result.putString("stream", report.toString(2) + "\n"); finish(failures == 0 ? -1 : 0, result);
        } catch (Throwable t) {
            StringWriter s = new StringWriter(); t.printStackTrace(new PrintWriter(s)); result.putString("stream", s.toString()); finish(0, result);
        }
    }
}
