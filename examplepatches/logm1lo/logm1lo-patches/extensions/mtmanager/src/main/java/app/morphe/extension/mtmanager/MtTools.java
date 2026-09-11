package app.morphe.extension.mtmanager;

import android.content.Context;

import java.io.File;

/**
 * Entry points injected into MT Manager's native tool dispatch sites.
 *
 * MT Manager 2.26.8 relies on `libmtprotect.so` natives for its conversion
 * tools (Dex2Smali, Dex2Jar, Sign, Dex Editor parser). Those natives are
 * absent on re-signed builds (the Morphe patch stubs all `l.*` natives), which
 * leaves the tools "hollow" — they open but never produce output.
 *
 * This extension re-implements the tool kernels in pure Java:
 *   - {@link #dex2Smali} — baksmali (dexlib2)
 *   - {@link #dex2Jar}   — dex2jar (d2j)
 *   - {@link #signApk}   — apksig
 *
 * The Morphe patch injects `invoke-static` calls to these methods at the
 * native dispatch sites so the app's own (broken) native path is bypassed and
 * the conversion is performed by this code instead.
 */
public final class MtTools {

    private MtTools() {
    }

    /** Initialized by the injected call site (app Context). */
    private static volatile Context context;

    /** Set once the file list has been seeded (avoids repeated reflection cost). */
    private static volatile boolean fileListSeeded = false;

    /**
     * Called by the patch once at startup to let the extension cache the app
     * context (used for keystore access and temp dirs).
     */
    @SuppressWarnings("unused")
    public static void attach(Context ctx) {
        context = ctx != null ? ctx.getApplicationContext() : null;
    }

    public static Context getContext() {
        return context;
    }

    /**
     * Reimplements the Dex2Smali tool: converts a .dex file to a .zip
     * containing the disassembled smali sources (baksmali layout).
     *
     * @param dexPath  absolute path of the input .dex file
     * @param zipPath  absolute path of the output .zip file
     * @return true on success, false on failure (logs the error)
     */
    @SuppressWarnings("unused")
    public static boolean dex2Smali(String dexPath, String zipPath) {
        try {
            return Dex2SmaliConverter.convert(dexPath, zipPath);
        } catch (Throwable t) {
            android.util.Log.e("MtTools", "dex2Smali failed", t);
            return false;
        }
    }

    /**
     * Reimplements the Dex2Jar tool: converts a .dex file to a .jar of
     * .class files (dex2jar translation).
     *
     * @param dexPath absolute path of the input .dex file
     * @param jarPath absolute path of the output .jar file
     * @return true on success, false on failure
     */
    @SuppressWarnings("unused")
    public static boolean dex2Jar(String dexPath, String jarPath) {
        try {
            return Dex2JarConverter.convert(dexPath, jarPath);
        } catch (Throwable t) {
            android.util.Log.e("MtTools", "dex2Jar failed", t);
            return false;
        }
    }

    /**
     * Reimplements the Sign tool: signs an APK with the bundled
     * MT-Extension keystore (V1+V2+V3).
     *
     * @param apkIn  absolute path of the unsigned input APK
     * @param apkOut absolute path of the signed output APK
     * @return true on success, false on failure
     */
    @SuppressWarnings("unused")
    public static boolean signApk(String apkIn, String apkOut) {
        try {
            return MtApkSigner.sign(apkIn, apkOut);
        } catch (Throwable t) {
            android.util.Log.e("MtTools", "signApk failed", t);
            return false;
        }
    }

    /**
     * Convenience: derives a sibling output path from an input path by
     * replacing the extension (e.g. /a/b.dex + ".zip" -> /a/b.zip).
     */
    @SuppressWarnings("unused")
    public static String siblingPath(String inputPath, String newExt) {
        if (inputPath == null) return null;
        int dot = inputPath.lastIndexOf('.');
        String base = dot > inputPath.lastIndexOf('/') ? inputPath.substring(0, dot) : inputPath;
        return base + newExt;
    }

    /**
     * Dispatch entry point injected at the conversion bridge
     * `Ll/᩸ۖ֡;->۟(Ll/᩸ۖ֡;Ljava/lang/String;Ljava/lang/String;Ll/ܺܽܺ;)V`.
     *
     * Both the Dex2Smali task (`l/ۙۖ֡`) and the Dex2Jar task (`l/ۛۖ֡`) funnel
     * through that bridge with the resolved input/output paths. The output
     * extension tells us which tool was requested:
     *   - ".jar"  -> Dex2Jar
     *   - ".zip"  -> Dex2Smali
     *   - ".apk"  -> Sign (input must also be an apk)
     *
     * Returns true when this extension handled the conversion, in which case
     * the patch skips the broken native flow.
     */
    @SuppressWarnings("unused")
    public static boolean dispatch(String inputPath, String outputPath) {
        try {
            if (inputPath == null || outputPath == null) return false;
            String in = inputPath.toLowerCase();
            String out = outputPath.toLowerCase();

            // Dex2Jar: input must be a dex file, output a jar.
            if (in.endsWith(".dex") && out.endsWith(".jar")) return dex2Jar(inputPath, outputPath);
            // Dex2Smali: input must be a dex file, output a zip (smali.zip).
            if (in.endsWith(".dex") && out.endsWith(".zip")) return dex2Smali(inputPath, outputPath);
            // Sign: only act when BOTH input and output are apks (file dispatcher
            // passes path==path). Output equal to input -> sibling _signed.apk.
            if (in.endsWith(".apk") && out.endsWith(".apk")) {
                String signOut = outputPath.equals(inputPath) ? siblingPath(inputPath, "_signed.apk") : outputPath;
                return signApk(inputPath, signOut);
            }
            return false;
        } catch (Throwable t) {
            android.util.Log.e("MtTools", "dispatch failed", t);
            return false;
        }
    }

    /**
     * Dispatch entry point injected at the tool runner `Ll/ᩴۜܶ;->ܳ()V`.
     *
     * The runner is constructed with a tool descriptor (`Ll/۫ۜܶ;`) stored in
     * the obfuscated field `ۤ`. All field/method names are resolved by
     * reflection so the injected smali stays clean (no obfuscated references).
     * See {@link #dispatchByOutput} for the actual routing.
     *
     * @param runner the `l/ᩴۜܶ` tool-runner instance
     * @return true when the extension handled the tool
     */
    @SuppressWarnings("unused")
    public static boolean dispatchRunner(Object runner) {
        try {
            if (runner == null) return false;
            Object descriptor = getField(runner, "\u06e4"); // ۤ
            if (descriptor == null) return false;
            Object fileNode = callObject(descriptor, "\u06df"); // ۟()
            if (fileNode == null) return false;
            String outputPath = callString(fileNode, "\u05ab\u06df"); // ֫۟()
            if (outputPath == null || outputPath.isEmpty()) return false;
            return dispatchByOutput(outputPath);
        } catch (Throwable t) {
            android.util.Log.e("MtTools", "dispatchRunner failed", t);
            return false;
        }
    }

    /**
     * Routes a conversion by MT Manager's output-path convention.
     * The input file is derived from the output path by scanning the same
     * directory for a dex source.
     */
    @SuppressWarnings("unused")
    public static boolean dispatchByOutput(String outputPath) {
        try {
            if (outputPath == null) return false;
            String out = outputPath.toLowerCase();

            if (out.endsWith("_smali.zip")) {
                String input = findDexInput(outputPath);
                if (input == null) return false;
                return dex2Smali(input, outputPath);
            }
            if (out.endsWith(".jar")) {
                String input = findDexInput(outputPath);
                if (input == null) return false;
                return dex2Jar(input, outputPath);
            }
            if (out.endsWith(".apk")) {
                return signApk(outputPath, siblingPath(outputPath, "_signed.apk"));
            }
            return false;
        } catch (Throwable t) {
            android.util.Log.e("MtTools", "dispatchByOutput failed", t);
            return false;
        }
    }

    /**
     * Finds the source dex for a conversion output path. MT Manager names
     * outputs after the input: `test.dex.bak` -> `test.dex_smali.zip`, so we
     * strip the `_smali.zip`/`.jar` suffix and look for a sibling dex/bak.
     */
    private static String findDexInput(String outputPath) {
        File out = new File(outputPath);
        File dir = out.getParentFile();
        if (dir == null) dir = new File(".");
        String name = out.getName().toLowerCase();
        String base = name;
        if (base.endsWith("_smali.zip")) base = base.substring(0, base.length() - "_smali.zip".length());
        else if (base.endsWith(".zip")) base = base.substring(0, base.length() - ".zip".length());
        else if (base.endsWith(".jar")) base = base.substring(0, base.length() - ".jar".length());

        File[] files = dir.listFiles();
        if (files == null) return null;
        for (File f : files) {
            if (!f.isFile()) continue;
            String fn = f.getName().toLowerCase();
            if (fn.startsWith(base) && (fn.endsWith(".dex") || fn.endsWith(".bak") || fn.endsWith(".apk"))) {
                return f.getAbsolutePath();
            }
        }
        // Fall back: any single .dex/.bak in the directory
        java.util.List<String> candidates = new java.util.ArrayList<>();
        for (File f : files) {
            if (!f.isFile()) continue;
            String fn = f.getName().toLowerCase();
            if (fn.endsWith(".dex") || fn.endsWith(".bak")) candidates.add(f.getAbsolutePath());
        }
        if (candidates.size() == 1) return candidates.get(0);
        return null;
    }

    private static Object getField(Object target, String name) {
        Class<?> c = target.getClass();
        while (c != null) {
            try {
                java.lang.reflect.Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(target);
            } catch (NoSuchFieldException e) {
                c = c.getSuperclass();
            } catch (Exception e) {
                return null;
            }
        }
        return null;
    }

    private static String callString(Object target, String name) {
        Object v = callObject(target, name);
        return v instanceof String ? (String) v : null;
    }

    private static Object callObject(Object target, String name) {
        Class<?> c = target.getClass();
        while (c != null) {
            try {
                for (java.lang.reflect.Method m : c.getDeclaredMethods()) {
                    if (m.getName().equals(name) && m.getParameterTypes().length == 0) {
                        m.setAccessible(true);
                        return m.invoke(target);
                    }
                }
            } catch (Exception e) {
                return null;
            }
            c = c.getSuperclass();
        }
        return null;
    }


    /**
     * Sign-tool dispatch entry injected at `Ll/ܿۜܶ;->۟(...)`. Empirically
     * (frida): arg0 = the OUTPUT apk path ("..._sign.apk"), arg1 = the
     * SigningKey options object. The input apk is the sibling without the
     * "_sign" suffix (test.apk -> test_sign.apk). We derive it and sign.
     */
    @SuppressWarnings("unused")
    public static boolean dispatchSign(Object arg0, Object arg1) {
        try {
            String out = null;
            if (arg0 instanceof String) out = (String) arg0;
            else if (arg0 != null) out = callString(arg0, "\u05ab\u06df"); // ֫۟()
            if (out == null || !out.toLowerCase().endsWith(".apk")) return false;
            String in = out.replaceAll("_sign\\.apk$", ".apk");
            if (in.equals(out)) in = out.replaceAll("\\.apk$", ".apk");
            if (!new File(in).isFile()) {
                // Fall back to sibling scan
                in = null;
                File dir = new File(out).getParentFile();
                if (dir != null) {
                    File[] files = dir.listFiles();
                    if (files != null) {
                        for (File f : files) {
                            if (!f.isFile()) continue;
                            String fn = f.getName().toLowerCase();
                            if (fn.endsWith(".apk") && !fn.contains("_sign")) {
                                in = f.getAbsolutePath();
                                break;
                            }
                        }
                    }
                }
            }
            if (in == null) return false;
            return signApk(in, out);
        } catch (Throwable t) {
            android.util.Log.e("MtTools", "dispatchSign failed", t);
            return false;
        }
    }

    /**
     * Self-healing file-list feeder.
     *
     * MT Manager's native file-index is absent on re-signed builds, so the
     * visible file panes stay empty. This method (a) resolves the active file
     * source ({@code l/۠ۛܳ.ۘ()}), (b) lists the current directory from the real
     * filesystem, (c) converts each entry to the pane's item type
     * ({@code l/ܿۛܳ}) and (d) stores the items into the file source so the
     * adapter's getItemCount()/getItem() finally see them.
     *
     * Idempotent: once the source has items it does nothing (returns 0).
     * All obfuscated classes/methods are reached by reflection using the
     * extension's own class loader (the app's protected class loader would
     * otherwise reject cross-dex references), matching the existing tools
     * dispatch pattern.
     *
     * @return number of items seeded, 0 if already populated, -1 on failure
     */
    @SuppressWarnings("unused")
    public static int feedFileList(String dirPath) {
        if (fileListSeeded) return 0;
        // Populate SYNCHRONOUSLY (no background delay). This method is injected
        // into the file-source count method l/֡ۛܳ.ܶ()I which the ListView's
        // getCount() calls during layout. A delayed background fill mutated the
        // list AFTER getCount() was sampled -> "content of the adapter has
        // changed but ListView did not receive a notification" IllegalState
        // crash on the next touch. Synchronous fill keeps getCount/getView
        // consistent: feedFileList returns the list size and the count call
        // returns it immediately, so the adapter is always in sync.
        final String base = dirPath != null && !dirPath.isEmpty() ? dirPath : "/storage/emulated/0";
        try {
            return doFeedFileList(base);
        } catch (Throwable t) {
            android.util.Log.e("MtTools", "feedFileList failed", t);
            return -1;
        }
    }

    /** Performs the actual directory listing + file-source fill. */
    private static int doFeedFileList(String base) {
        try {
            ClassLoader cl = MtTools.class.getClassLoader();
            File dir = new File(base);
            if (!dir.isDirectory()) return -1;

            // Resolve the registry l/۠ۛܳ.ۘ() -> active file source
            Class<?> regCls = Class.forName("l.\u06e0\u06db\u0733", true, cl); // l/۠ۛܳ
            Object src = callStaticNoArg(regCls, "\u06d8"); // ۘ()
            if (src == null) return -1;

            // Get the internal item list via l/֡ۛܳ.ۧ()ArrayList
            Object list = callObject(src, "\u06e7"); // ۧ()
            if (!(list instanceof java.util.List)) return -1;
            @SuppressWarnings("unchecked")
            java.util.List<Object> l = (java.util.List<Object>) list;
            if (!l.isEmpty()) { fileListSeeded = true; return 0; } // already seeded — keep it idempotent

            File[] children = dir.listFiles();
            if (children == null) return -1;

            // Resolve the item class + constructor (name, path)
            Class<?> itemCls = Class.forName("l.\u073f\u06db\u0733", true, cl); // l/ܿۛܳ
            java.lang.reflect.Constructor<?> itemCtor = itemCls.getConstructor(String.class, String.class);

            // Resolve the is-directory setter ۟(Z)V (one-arg boolean on l/ܿۛܳ)
            java.lang.reflect.Method setDir = findMethod(itemCls, boolean.class);

            // Resolve the friendly-name helper l/۬ܿ۬.۟(String)String
            Class<?> nameCls = Class.forName("l.\u06ec\u073f\u06ec", true, cl); // l/۬ܿ۬
            java.lang.reflect.Method friendly = null;
            for (java.lang.reflect.Method m : nameCls.getDeclaredMethods()) {
                if (m.getName().equals("\u06df") && m.getParameterTypes().length == 1
                        && m.getParameterTypes()[0] == String.class
                        && m.getReturnType() == String.class) {
                    m.setAccessible(true);
                    friendly = m;
                    break;
                }
            }

            for (File f : children) {
                String path = f.getAbsolutePath();
                String name = friendly != null ? (String) friendly.invoke(null, path) : f.getName();
                Object item = itemCtor.newInstance(name, path);
                if (setDir != null) {
                    try { setDir.invoke(item, f.isDirectory()); } catch (Throwable ignored) { }
                }
                l.add(item);
            }

            fileListSeeded = true;
            android.util.Log.i("MtTools", "feedFileList: " + l.size() + " items from " + base);
            notifyBrowserAdapters();
            return l.size();
        } catch (Throwable t) {
            android.util.Log.e("MtTools", "doFeedFileList failed", t);
            return -1;
        }
    }

    /**
     * Builds the status-bar item list for a directory.
     *
     * The file browser's status bar (l/ۤۚܳ.ܺ۟()) counts "Folders / Files"
     * from `this.᩷()`. That list is normally fed by the native loader; on
     * re-signed builds it stays empty -> "Folders: 0 Files: 0". This method
     * lists the real directory and returns a {@code List} of the counter's
     * item type {@code l/᩶᩺ܳ} (implemented by {@code l/ۘ֫ܳ}) built via its
     * public constructor (String name, String path, String parent,
     * long size, long time, boolean isDirectory).
     *
     * @param dirPath directory to list (e.g. "/storage/emulated/0")
     * @return a List of l/᩶᩺ܳ items (possibly empty), or null on failure
     */
    @SuppressWarnings("unused")
    /** Cached feedStatusItems result — keeps the adapter count stable across
     *  repeated getCount()/getItem() calls (a fresh list each call made the
     *  ListView throw "adapter content changed without notification"). */
    private static volatile java.util.List<Object> statusItemsCache = null;

    public static java.util.List<Object> feedStatusItems(String dirPath) {
        try {
            // Return the cached list so the adapter sees a stable count.
            java.util.List<Object> cached = statusItemsCache;
            if (cached != null) return cached;
            ClassLoader cl = MtTools.class.getClassLoader();
            File dir = new File(dirPath != null && !dirPath.isEmpty() ? dirPath : "/storage/emulated/0");
            if (!dir.isDirectory()) return java.util.Collections.emptyList();
            File[] children = dir.listFiles();
            if (children == null) return java.util.Collections.emptyList();

            Class<?> itemCls = Class.forName("l.\u06d8\u05ab\u0733", true, cl); // l/ۘ֫ܳ
            java.lang.reflect.Constructor<?> ctor = itemCls.getConstructor(
                String.class, String.class, String.class, long.class, long.class, boolean.class);

            java.util.List<Object> out = new java.util.ArrayList<>(children.length);
            for (File f : children) {
                try {
                    String name = f.getName();
                    String path = f.getAbsolutePath();
                    long size = f.isDirectory() ? 0 : f.length();
                    long time = f.lastModified();
                    out.add(ctor.newInstance(name, path, "/", size, time, f.isDirectory()));
                } catch (Throwable ignored) { }
            }
            statusItemsCache = out;
            return out;
        } catch (Throwable t) {
            android.util.Log.e("MtTools", "feedStatusItems failed", t);
            return null;
        }
    }

    /**
     * Builds the slide-panel file list item list for a directory.
     *
     * The visible file browser (slide panel l/ۗ᩺ܰ, with History/Bookmarks tabs)
     * renders its list from a file source (l/֡ۛܳ) whose items are
     * {@code l/ܿۛܳ} (name + path constructor). On re-signed builds that source
     * only contains the breadcrumb, so the panel renders a white page.
     *
     * This method lists the real directory and returns a {@code List} of
     * {@code l/ܿۛܳ} items built via its public constructor
     * {@code (String name, String path)} — no file-type required (the row
     * binding falls back to a plain folder/path presentation).
     *
     * @param dirPath directory to list (e.g. "/storage/emulated/0")
     * @return a List of l/ܿۛܳ items (possibly empty), or null on failure
     */
    @SuppressWarnings("unused")
    public static java.util.List<Object> feedFileItems(String dirPath) {
        try {
            ClassLoader cl = MtTools.class.getClassLoader();
            // Empty path (browser path field not yet populated at startup) -> default to internal storage root.
            File dir = new File(dirPath != null && !dirPath.isEmpty() ? dirPath : "/storage/emulated/0");
            if (!dir.isDirectory()) return java.util.Collections.emptyList();
            File[] children = dir.listFiles();
            if (children == null) return java.util.Collections.emptyList();

            Class<?> itemCls = Class.forName("l.\u073f\u06db\u0733", true, cl); // l/ܿۛܳ
            java.lang.reflect.Constructor<?> ctor = itemCls.getConstructor(
                String.class, String.class);

            java.util.List<Object> out = new java.util.ArrayList<>(children.length);
            for (File f : children) {
                try {
                    out.add(ctor.newInstance(f.getName(), f.getAbsolutePath()));
                } catch (Throwable ignored) { }
            }
            return out;
        } catch (Throwable t) {
            android.util.Log.e("MtTools", "feedFileItems failed", t);
            return null;
        }
    }

    /**
     * Feeds the FLAT file browser's item list (l/ۜ۫ܶ -> l/ۤ۫ܶ items) with the
     * real directory listing.
     *
     * The flat browser (genuine layout, no History/Bookmarks slide panel) uses
     * `l/ۤ۫ܶ` items (public ctor: (String name, int flags, String path,
     * boolean isDirectory)) and its click handler `l/ۜ۫ܶ.onItemClick`
     * check-casts items to that type. The `feedFileItems()` helper creates
     * `l/ܿۛܳ` (slide-panel type) — wrong for the flat browser. This helper
     * creates the correct `l/ۤ۫ܶ` type so row clicks (folder navigation) work.
     *
     * @param dirPath directory to list (empty -> /storage/emulated/0)
     * @return List of l/ۤ۫ܶ items, or null on failure
     */
    @SuppressWarnings("unused")
    public static java.util.List<Object> feedFlatFileItems(String dirPath) {
        try {
            android.util.Log.i("MtTools", "feedFlatFileItems called path=" + dirPath);
            ClassLoader cl = MtTools.class.getClassLoader();
            File dir = new File(dirPath != null && !dirPath.isEmpty() ? dirPath : "/storage/emulated/0");
            if (!dir.isDirectory()) {
                android.util.Log.i("MtTools", "feedFlatFileItems NOT a dir");
                return java.util.Collections.emptyList();
            }
            File[] children = dir.listFiles();
            if (children == null) {
                android.util.Log.i("MtTools", "feedFlatFileItems listFiles null");
                return java.util.Collections.emptyList();
            }

            // l/ۤ۫ܶ (click-handler item type) — public ctor (String,int,String,boolean)
            Class<?> itemCls = Class.forName("l.\u06e4\u06eb\u0736", true, cl);
            java.lang.reflect.Constructor<?> ctor = itemCls.getConstructor(
                String.class, int.class, String.class, boolean.class);

            java.util.List<Object> out = new java.util.ArrayList<>(children.length);
            int flags = 0;
            for (File f : children) {
                try {
                    // flags: 0 = file, 1 = directory (index into the item-type table)
                    out.add(ctor.newInstance(f.getName(), f.isDirectory() ? 1 : 0,
                        f.getAbsolutePath(), f.isDirectory()));
                } catch (Throwable ignored) { }
            }
            android.util.Log.i("MtTools", "feedFlatFileItems returning " + out.size() + " items");
            return out;
        } catch (Throwable t) {
            android.util.Log.e("MtTools", "feedFlatFileItems failed", t);
            return null;
        }
    }

    /**
     * Notifies the file-browser ListView adapter after the file list is seeded.
     *
     * The flat browser renders rows through a ListView (class l/ܳۚܰ) whose
     * adapter wraps the file source. When the feed mutates the source's list
     * from a delayed handler, the ListView throws "The content of the adapter
     * has changed but ListView did not receive a notification" on the next
     * touch. After seeding we must call notifyDataSetChanged() on the browser
     * adapter. We find it by walking the activity decor for the ListView that
     * has a non-empty adapter, then invoke notifyDataSetChanged() on the main
     * thread (layout-safe, same pattern as the deferred feed).
     */
    private static void notifyBrowserAdapters() {
        try {
            final android.os.Handler h = new android.os.Handler(android.os.Looper.getMainLooper());
            h.postDelayed(new Runnable() {
                @Override
                public void run() {
                    try {
                        android.app.Activity a = currentActivity();
                        if (a == null) return;
                        android.view.ViewGroup decor = (android.view.ViewGroup) a.getWindow().getDecorView();
                        notifyListViews(decor);
                    } catch (Throwable ignored) { }
                }
            }, 500L);
        } catch (Throwable ignored) { }
    }

    /** Walks a view tree, calling notifyDataSetChanged on every ListView adapter. */
    private static void notifyListViews(android.view.View v) {
        try {
            if (v instanceof android.widget.AbsListView) {
                android.widget.Adapter a = ((android.widget.AbsListView) v).getAdapter();
                if (a instanceof android.widget.BaseAdapter) {
                    try { ((android.widget.BaseAdapter) a).notifyDataSetChanged(); } catch (Throwable ignored) { }
                }
            }
            if (v instanceof android.view.ViewGroup) {
                android.view.ViewGroup g = (android.view.ViewGroup) v;
                for (int i = 0; i < g.getChildCount(); i++) {
                    notifyListViews(g.getChildAt(i));
                }
            }
        } catch (Throwable ignored) { }
    }

    /** Returns the current resumed activity via reflection on ActivityThread. */
    private static android.app.Activity currentActivity() {
        try {
            Class<?> at = Class.forName("android.app.ActivityThread");
            java.lang.reflect.Method cur = at.getMethod("currentActivityThread");
            Object thread = cur.invoke(null);
            java.lang.reflect.Field acts = at.getDeclaredField("mActivities");
            acts.setAccessible(true);
            Object map = acts.get(thread);
            java.util.ArrayList<?> all = new java.util.ArrayList<>(
                ((java.util.Map<?, ?>) map).values());
            for (int i = all.size() - 1; i >= 0; i--) {
                Object rec = all.get(i);
                try {
                    java.lang.reflect.Field actF = rec.getClass().getDeclaredField("activity");
                    actF.setAccessible(true);
                    android.app.Activity act = (android.app.Activity) actF.get(rec);
                    if (act != null && !act.isFinishing()) return act;
                } catch (Throwable ignored) { }
            }
        } catch (Throwable ignored) { }
        return null;
    }

    /**
     * Feeds the FLAT browser's native file-index store (l/ᩴܿ᩶ -> l/ۚܶܶ) with the
     * real directory listing so the dual-pane browser renders real rows.
     *
     * The flat browser adapter l/ۤۨܶ.getCount()/getView() read
     * l/֡ۨܶ.ܳ (l/ᩴܿᶩ index) -> .ܳ (l/ۚܶܶ store) -> ܿ(I)String for row text.
     * On splice builds the native index isn't rebuilt, so the store holds stale
     * placeholder items ("Android" x42). This helper reaches the store via the
     * fragment's state field and adds one l/᩺ܶܶ item per real file entry using
     * the store's add-by-name method (String, [l/᩶ܳܶ)I.
     *
     * @param fragment the l/ܰۨܶ flat-browser fragment instance
     * @return number of items added, -1 on failure
     */
    @SuppressWarnings("unused")
    public static int feedFlatIndex(Object fragment) {
        try {
            ClassLoader cl = MtTools.class.getClassLoader();
            if (fragment == null) { android.util.Log.i("MtTools", "feedFlatIndex: fragment null"); return -1; }
            android.util.Log.i("MtTools", "feedFlatIndex: fragment=" + fragment.getClass().getName());

            // l/ܰۨܶ -> field ۚܿ (l/֡ۨܶ state)
            java.lang.reflect.Field stateF = findField(fragment.getClass(), "\u06da\u073f"); // ۚܿ
            if (stateF == null) { android.util.Log.i("MtTools", "feedFlatIndex: no state field"); return -1; }
            Object state = stateF.get(fragment);
            if (state == null) { android.util.Log.i("MtTools", "feedFlatIndex: state null"); return -1; }

            // state.ܳ -> l/ᩴܿ᩶ index
            java.lang.reflect.Field indexF = findField(state.getClass(), "\u0733"); // ܳ
            if (indexF == null) { android.util.Log.i("MtTools", "feedFlatIndex: no index field"); return -1; }
            Object index = indexF.get(state);
            if (index == null) { android.util.Log.i("MtTools", "feedFlatIndex: index null"); return -1; }

            // index.ܳ -> l/ۚܶܶ store
            java.lang.reflect.Field storeF = findField(index.getClass(), "\u0733"); // ܳ
            if (storeF == null) { android.util.Log.i("MtTools", "feedFlatIndex: no store field"); return -1; }
            Object store = storeF.get(index);
            if (store == null) { android.util.Log.i("MtTools", "feedFlatIndex: store null"); return -1; }

            // store.ܶ()I -> size; if already populated (native loader worked) skip
            Object sizeObj = callNoArg(store, "\u0736"); // ܶ
            int existing = sizeObj instanceof Number ? ((Number) sizeObj).intValue() : -1;
            android.util.Log.i("MtTools", "feedFlatIndex: store size=" + existing);
            if (existing > 0) return 0;

            File dir = new File("/storage/emulated/0");
            if (!dir.isDirectory()) return -1;
            File[] children = dir.listFiles();
            if (children == null) return -1;

            // store.۟(String, [l/᩶ܳܶ;)Ll/᩺ܶܶ — add item by name
            java.lang.reflect.Method add = findMethod(store.getClass(), "\u06df"); // ۟
            if (add == null) { android.util.Log.i("MtTools", "feedFlatIndex: no add method"); return -1; }
            int added = 0;
            for (File f : children) {
                try {
                    add.invoke(store, f.getName(), null);
                    added++;
                } catch (Throwable ignored) { }
            }
            android.util.Log.i("MtTools", "feedFlatIndex: added " + added + " items to store");
            return added;
        } catch (Throwable t) {
            android.util.Log.e("MtTools", "feedFlatIndex failed", t);
            return -1;
        }
    }

    /** Finds a field by name, walking superclasses. */
    private static java.lang.reflect.Field findField(Class<?> cls, String name) {
        Class<?> c = cls;
        while (c != null) {
            try {
                java.lang.reflect.Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException e) {
                c = c.getSuperclass();
            } catch (Exception e) {
                return null;
            }
        }
        return null;
    }

    /** Invokes a no-arg method returning Object, walking superclasses. */
    private static Object callNoArg(Object target, String name) {
        Class<?> c = target.getClass();
        while (c != null) {
            try {
                for (java.lang.reflect.Method m : c.getDeclaredMethods()) {
                    if (m.getName().equals(name) && m.getParameterTypes().length == 0) {
                        m.setAccessible(true);
                        return m.invoke(target);
                    }
                }
            } catch (Exception e) {
                return null;
            }
            c = c.getSuperclass();
        }
        return null;
    }

    /** Finds a method by name with one String + array-or-null second param. */
    private static java.lang.reflect.Method findMethod(Class<?> cls, String name) {
        Class<?> c = cls;
        while (c != null) {
            for (java.lang.reflect.Method m : c.getDeclaredMethods()) {
                if (m.getName().equals(name) && m.getParameterTypes().length == 2) {
                    m.setAccessible(true);
                    return m;
                }
            }
            c = c.getSuperclass();
        }
        return null;
    }

    /** Finds a method with a single boolean param. */    private static java.lang.reflect.Method findMethod(Class<?> cls, Class<?> retType) {
        for (java.lang.reflect.Method m : cls.getDeclaredMethods()) {
            if (m.getParameterTypes().length == 1 && m.getParameterTypes()[0] == boolean.class) {
                m.setAccessible(true);
                return m;
            }
        }
        return null;
    }

    /** Invokes a static no-arg method returning Object, walking superclasses. */
    private static Object callStaticNoArg(Class<?> cls, String name) {
        Class<?> c = cls;
        while (c != null) {
            try {
                for (java.lang.reflect.Method m : c.getDeclaredMethods()) {
                    if (m.getName().equals(name) && m.getParameterTypes().length == 0) {
                        if (!java.lang.reflect.Modifier.isStatic(m.getModifiers())) continue;
                        m.setAccessible(true);
                        return m.invoke(null);
                    }
                }
            } catch (Exception e) {
                return null;
            }
            c = c.getSuperclass();
        }
        return null;
    }

    /** Creates a temp directory under the app cache (fallback to java.io.tmpdir). */
    static File tempDir(String prefix) {
        File cache = context != null ? context.getCacheDir() : new File(System.getProperty("java.io.tmpdir", "/data/local/tmp"));
        File dir = new File(cache, prefix + System.nanoTime());
        if (!dir.mkdirs()) dir = new File(System.getProperty("java.io.tmpdir", "/data/local/tmp"), prefix + System.nanoTime());
        return dir;
    }

    static void deleteRecursive(File file) {
        if (file == null) return;
        if (file.isDirectory()) {
            File[] children = file.listFiles();
            if (children != null) for (File c : children) deleteRecursive(c);
        }
        //noinspection ResultOfMethodCallIgnored
        file.delete();
    }
}
