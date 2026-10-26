package io.github.pengusto.patches.tests;

import android.app.*;
import android.content.*;
import android.os.*;
import io.github.pengusto.patches.extension.filemanager.FavoritePaths;
import java.io.*;
import java.lang.reflect.*;
import java.nio.file.Files;
import java.util.*;
import java.util.concurrent.*;

/** Uses disposable fixtures only, and refuses to run on a physical device. */
public final class FavoritePathsInstrumentation extends Instrumentation {
    public interface Callback { Object invoke(Object success, Object format); }
    private int checks;
    private SharedPreferences prefs;
    private void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); checks++; }
    private Set<String> set(String... paths) { return new HashSet<>(Arrays.asList(paths)); }
    private Set<String> favorites() { return new HashSet<>(prefs.getStringSet("favorites", new HashSet<>())); }
    private void save(Set<String> values) { prefs.edit().putStringSet("favorites", values).commit(); }
    private void nativeRename(Activity activity, File from, File to, boolean multiple) throws Exception {
        Method rename = Arrays.stream(Class.forName("org.fossify.commons.extensions.ActivityKt").getMethods())
            .filter(m -> m.getName().equals("renameFile") && m.getParameterCount() == 5).findFirst().orElseThrow();
        Class<?> contract = rename.getParameterTypes()[4];
        CountDownLatch done = new CountDownLatch(1); boolean[] ok = {false}; int[] called = {0};
        Object callback = Proxy.newProxyInstance(contract.getClassLoader(), new Class<?>[]{contract}, (proxy, method, args) -> {
            if (args != null && args.length == 2) { ok[0] = Boolean.TRUE.equals(args[0]); called[0]++; done.countDown(); }
            return null;
        });
        runOnMainSync(() -> {
            try { rename.invoke(null, activity, from.getPath(), to.getPath(), multiple, callback); }
            catch (ReflectiveOperationException failure) { throw new RuntimeException(failure); }
        });
        check(done.await(15, TimeUnit.SECONDS), "rename callback delivered");
        check(ok[0] && called[0] == 1, "successful callback delivered exactly once");
        check(!from.exists() && to.isDirectory(), "original rename operation completed");
    }
    private void cleanup(File file) {
        File[] children = file.listFiles(); if (children != null) for (File child : children) cleanup(child);
        file.delete();
    }
    @Override public void onCreate(Bundle args) { super.onCreate(args); start(); }
    @Override public void onStart() {
        Bundle result = new Bundle(); Set<String> original = null; File fixture = null; Activity activity = null;
        try {
            if (!Build.HARDWARE.contains("ranchu") && !Build.HARDWARE.contains("goldfish")) throw new IllegalStateException("Use an isolated emulator");
            Context context = getTargetContext(); prefs = context.getSharedPreferences("Prefs", 0);
            activity = startActivitySync(new Intent().setClassName(context, "org.fossify.filemanager.activities.MainActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            waitForIdleSync(); original = favorites();
            Set<String> input = set("/Docs", "/Docs/Projects", "/Docs/Projects/Deep", "/DocsSibling", "/Notes");
            check(FavoritePaths.move(input, "/Docs", "/Docs2").equals(set("/Docs2", "/Docs2/Projects", "/Docs2/Projects/Deep", "/DocsSibling", "/Notes")), "exact + nested + prefix boundary");
            check(input.contains("/Docs/Projects"), "input set never mutated");
            check(FavoritePaths.move(input, "/Missing", "/Next").equals(input), "missing prefix no-op");
            check(FavoritePaths.move(input, "/Docs/", "/Docs2/").contains("/Docs2/Projects"), "trailing separators");
            check(FavoritePaths.move(input, "/Docs", "/Docs").equals(input), "same path no-op");
            check(FavoritePaths.move(input, "", "/Next").equals(input), "empty source ignored");
            check(FavoritePaths.move(input, "/", "/Next").equals(input), "root source ignored");
            check(FavoritePaths.move(input, "/Docs", "").equals(input), "empty destination ignored");
            check(FavoritePaths.move(set("/Docs/A", "/Docs2/A"), "/Docs", "/Docs2").equals(set("/Docs2/A")), "set deduplication");
            check(FavoritePaths.remove(input, "/Docs").equals(set("/DocsSibling", "/Notes")), "remove only exact subtree");
            check(FavoritePaths.remove(input, "").equals(input) && FavoritePaths.remove(input, "/").equals(input), "invalid remove ignored");
            save(input); int[] called = {0};
            Callback cb = (ok, format) -> { called[0]++; return null; };
            Callback wrapped = (Callback) FavoritePaths.wrapRename(context, "/Docs", "/Docs2", true, cb);
            wrapped.invoke(false, null);
            check(favorites().equals(input) && called[0] == 1, "failed callback preserves favorites and delegates");
            wrapped.invoke(true, null);
            check(favorites().contains("/Docs2/Projects") && called[0] == 2, "success updates before original callback");
            check(FavoritePaths.wrapRename(context, "/Docs", "/Docs2", false, null) == null, "null callback preserved");
            Callback throwing = (ok, format) -> { throw new IllegalArgumentException("callback fixture"); };
            try { ((Callback)FavoritePaths.wrapRename(context, "/Missing", "/Next", false, throwing)).invoke(false, null); throw new AssertionError("exception swallowed"); }
            catch (IllegalArgumentException expected) { check("callback fixture".equals(expected.getMessage()), "callback exception preserved"); }
            Class<?> configClass = Class.forName("org.fossify.filemanager.helpers.Config");
            Object config = configClass.getConstructor(Context.class).newInstance(context);
            save(input); configClass.getMethod("removeFavorite", String.class).invoke(config, "/Docs");
            check(favorites().contains("/Docs/Projects") && !favorites().contains("/Docs"), "ordinary unfavorite remains exact");
            save(input); FavoritePaths.removeSelected(context, "/Docs");
            check(favorites().equals(set("/DocsSibling", "/Notes")), "selected-deletion metadata cleanup");
            fixture = new File(Environment.getExternalStorageDirectory(), "PenguinRegression/" + System.nanoTime());
            File from = new File(fixture, "Docs"), to = new File(fixture, "Docs2");
            new File(from, "Projects").mkdirs();
            File marker = new File(from, "Projects/marker.txt"); Files.write(marker.toPath(), "Original synthetic content".getBytes(java.nio.charset.StandardCharsets.UTF_8));
            save(set(from.getPath(), new File(from, "Projects").getPath(), new File(fixture, "DocsSibling").getPath()));
            nativeRename(activity, from, to, false);
            check(favorites().contains(new File(to, "Projects").getPath()), "real single-rename hook updates nested favorite");
            check(new String(Files.readAllBytes(new File(to, "Projects/marker.txt").toPath()), java.nio.charset.StandardCharsets.UTF_8).equals("Original synthetic content"), "file content preserved");
            nativeRename(activity, to, new File(fixture, "Docs3"), true);
            check(favorites().contains(new File(fixture, "Docs3/Projects").getPath()), "real multiple-rename operation hook updates nested favorite");
            result.putString("stream", "PASS: " + checks + " favorite/path/callback/native-rename assertions against installed patched app\n");
            finish(-1, result);
        } catch (Throwable failure) { result.putString("stream", "FAIL: " + failure); finish(0, result); }
        finally {
            if (original != null) save(original);
            if (fixture != null) cleanup(fixture);
            if (activity != null) { final Activity close = activity; runOnMainSync(close::finish); }
        }
    }
}
