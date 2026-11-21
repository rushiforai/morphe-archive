package app.morphe.extension.maps.patches;

import android.app.Activity;
import android.app.AppComponentFactory;
import android.app.Application;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.channels.FileLock;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import dalvik.system.DexClassLoader;

/**
 * Runs the MicroG-RE copy embedded in Maps NMAX (tools/embed-gms). MicroG's components live in their own
 * processes (:gms, :persistent, :ui, :unstable); there this factory swaps Maps' class loader for one over
 * MicroG's dex (assets/nmaxgms/gms.jar), because 455 class names exist in both apps with different code.
 * Maps' own processes keep androidx's CoreComponentFactory, which the manifest named before.
 */
@SuppressWarnings("unused")
public final class EmbeddedGmsFactory extends AppComponentFactory {
    private static final String TAG = "NmaxGms";
    /** EmbedGms prefixes MicroG components whose names Maps already uses. */
    private static final String ALIAS = "nmaxgms.";
    private static final String GMS_APPLICATION = "org.microg.gms.ui.updater.UpdaterApplication";
    private static final String STARTUP_PROVIDER = "androidx.startup.InitializationProvider";
    private static final String[] GMS_PROCESSES = {":gms", ":persistent", ":ui", ":unstable"};

    private final AppComponentFactory maps = mapsFactory();
    private boolean gms;

    private static AppComponentFactory mapsFactory() {
        try {
            return (AppComponentFactory) Class.forName("androidx.core.app.CoreComponentFactory")
                    .getDeclaredConstructor().newInstance();
        } catch (ReflectiveOperationException e) {
            return new AppComponentFactory();
        }
    }

    static boolean isGmsProcess(String process) {
        if (process == null) return false;
        for (String suffix : GMS_PROCESSES) if (process.endsWith(suffix)) return true;
        return false;
    }

    @Override
    public ClassLoader instantiateClassLoader(ClassLoader cl, ApplicationInfo info) {
        gms = isGmsProcess(Application.getProcessName());
        if (!gms) return maps.instantiateClassLoader(cl, info);
        try {
            return gmsLoader(info, cl.getParent());
        } catch (IOException e) {
            throw new IllegalStateException("Could not load embedded MicroG", e);
        }
    }

    @Override
    public Application instantiateApplication(ClassLoader cl, String className)
            throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        if (!gms) return maps.instantiateApplication(cl, className);
        // Maps and MicroG share one data directory; WebView refuses two processes on one WebView folder.
        String process = Application.getProcessName();
        try {
            android.webkit.WebView.setDataDirectorySuffix("nmaxgms_" + process.substring(process.lastIndexOf(':') + 1));
        } catch (RuntimeException e) {
            Log.w(TAG, "WebView data directory", e);
        }
        return (Application) newInstance(cl, GMS_APPLICATION);
    }

    @Override
    public Activity instantiateActivity(ClassLoader cl, String className, Intent intent)
            throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        if (!gms) return maps.instantiateActivity(cl, className, intent);
        return (Activity) newInstance(cl, className);
    }

    @Override
    public Service instantiateService(ClassLoader cl, String className, Intent intent)
            throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        if (!gms) return maps.instantiateService(cl, className, intent);
        return (Service) newInstance(cl, className);
    }

    @Override
    public BroadcastReceiver instantiateReceiver(ClassLoader cl, String className, Intent intent)
            throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        if (!gms) return maps.instantiateReceiver(cl, className, intent);
        return (BroadcastReceiver) newInstance(cl, className);
    }

    @Override
    public ContentProvider instantiateProvider(ClassLoader cl, String className)
            throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        if (!gms) return maps.instantiateProvider(cl, className);
        if (className.equals(ALIAS + STARTUP_PROVIDER)) return new StartupProvider(cl);
        try {
            return (ContentProvider) newInstance(cl, className);
        } catch (ClassNotFoundException e) {
            // Maps' multiprocess providers also start here; their classes are not in MicroG's dex.
            Log.i(TAG, "Maps provider stubbed in MicroG process: " + className);
            return new StubProvider();
        }
    }

    private static Object newInstance(ClassLoader cl, String className)
            throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        String name = className.startsWith(ALIAS) ? className.substring(ALIAS.length()) : className;
        try {
            return cl.loadClass(name).getDeclaredConstructor().newInstance();
        } catch (ReflectiveOperationException e) {
            if (e instanceof ClassNotFoundException) throw (ClassNotFoundException) e;
            InstantiationException ie = new InstantiationException(name);
            ie.initCause(e);
            throw ie;
        }
    }

    /** Extracts MicroG's dex and native libraries once per installed APK, then loads them apart from Maps. */
    private static ClassLoader gmsLoader(ApplicationInfo info, ClassLoader parent) throws IOException {
        File apk = new File(info.sourceDir);
        String stamp = Integer.toHexString(info.sourceDir.hashCode()) + "-" + apk.length();
        File dir = new File(info.dataDir, "code_cache/nmaxgms");
        File jar = new File(dir, "gms-" + stamp + ".jar");
        File libs = new File(dir, "lib-" + stamp);
        if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("mkdir " + dir);
        // MicroG's processes can start together; one extracts, the others wait on the lock.
        try (RandomAccessFile lockFile = new RandomAccessFile(new File(dir, "lock"), "rw");
             FileLock ignored = lockFile.getChannel().lock()) {
            if (!jar.exists()) extract(apk, dir, jar, libs, stamp);
        }
        return new DexClassLoader(jar.getPath(), null, libs.getPath(), parent);
    }

    private static void extract(File apk, File dir, File jar, File libs, String stamp) throws IOException {
        long start = System.currentTimeMillis();
        File[] old = dir.listFiles();
        if (old != null) for (File f : old) if (!f.getName().contains(stamp) && !f.getName().equals("lock")) delete(f);
        if (!libs.isDirectory() && !libs.mkdirs()) throw new IOException("mkdir " + libs);
        try (ZipFile zip = new ZipFile(apk)) {
            Enumeration<? extends ZipEntry> entries = zip.entries();
            while (entries.hasMoreElements()) {
                ZipEntry e = entries.nextElement();
                if (e.getName().startsWith("assets/nmaxgms/lib/")) {
                    copy(zip, e, new File(libs, e.getName().substring("assets/nmaxgms/lib/".length())));
                }
            }
            ZipEntry dex = zip.getEntry("assets/nmaxgms/gms.jar");
            if (dex == null) throw new IOException("assets/nmaxgms/gms.jar missing");
            File tmp = new File(dir, "gms.tmp");
            copy(zip, dex, tmp);
            // Android 14+ refuses to load writable dex files.
            if (!tmp.setReadOnly() || !tmp.renameTo(jar)) throw new IOException("could not finish " + jar);
        }
        Log.i(TAG, "Extracted embedded MicroG in " + (System.currentTimeMillis() - start) + " ms");
    }

    private static void copy(ZipFile zip, ZipEntry entry, File to) throws IOException {
        try (InputStream in = zip.getInputStream(entry); OutputStream out = new FileOutputStream(to)) {
            byte[] buffer = new byte[1 << 16];
            for (int n; (n = in.read(buffer)) > 0; ) out.write(buffer, 0, n);
        }
    }

    private static void delete(File f) {
        File[] children = f.listFiles();
        if (children != null) for (File c : children) delete(c);
        //noinspection ResultOfMethodCallIgnored
        f.delete();
    }

    /**
     * MicroG's androidx-startup provider, renamed because Maps declares (and disables) the same class: androidx
     * finds its initializers under the real class name, so this reads them from the renamed entry instead.
     */
    public static final class StartupProvider extends StubProvider {
        private final ClassLoader gmsLoader;

        StartupProvider(ClassLoader gmsLoader) {
            this.gmsLoader = gmsLoader;
        }

        @Override
        public boolean onCreate() {
            android.content.Context context = getContext();
            try {
                android.content.pm.ProviderInfo info = context.getPackageManager().getProviderInfo(
                        new android.content.ComponentName(context, ALIAS + STARTUP_PROVIDER),
                        android.content.pm.PackageManager.GET_META_DATA);
                Class<?> initializer = gmsLoader.loadClass("androidx.startup.AppInitializer");
                Object appInitializer = initializer.getMethod("getInstance", android.content.Context.class).invoke(null, context);
                // What AppInitializer.discoverAndInitialize does: mark each one discovered (eager), then initialize.
                java.lang.reflect.Field discoveredField = initializer.getDeclaredField("mDiscovered");
                discoveredField.setAccessible(true);
                @SuppressWarnings("unchecked")
                java.util.Set<Class<?>> discovered = (java.util.Set<Class<?>>) discoveredField.get(appInitializer);
                java.util.List<Class<?>> components = new java.util.ArrayList<>();
                if (info.metaData != null) for (String key : info.metaData.keySet()) {
                    if ("androidx.startup".equals(info.metaData.getString(key))) components.add(gmsLoader.loadClass(key));
                }
                discovered.addAll(components);
                java.lang.reflect.Method init = initializer.getMethod("initializeComponent", Class.class);
                for (Class<?> component : components) init.invoke(appInitializer, component);
            } catch (Exception e) {
                throw new IllegalStateException("MicroG startup initializers failed", e);
            }
            return true;
        }
    }

    /** Stands in for a Maps provider that Android starts in a MicroG process. */
    public static class StubProvider extends ContentProvider {
        @Override public boolean onCreate() { return true; }
        @Override public Cursor query(Uri u, String[] p, String s, String[] a, String o) { return null; }
        @Override public String getType(Uri u) { return null; }
        @Override public Uri insert(Uri u, ContentValues v) { return null; }
        @Override public int delete(Uri u, String s, String[] a) { return 0; }
        @Override public int update(Uri u, ContentValues v, String s, String[] a) { return 0; }
    }
}
