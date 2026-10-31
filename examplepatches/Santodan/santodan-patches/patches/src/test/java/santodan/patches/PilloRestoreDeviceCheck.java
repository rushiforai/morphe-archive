package santodan.patches;

import android.content.Context;
import android.content.ContextWrapper;
import java.io.File;
import java.lang.reflect.InvocationTargetException;
import dalvik.system.DexClassLoader;

/** app_process fixture: only an isolated staged copy is opened; no app installation/data access. */
public final class PilloRestoreDeviceCheck {
    public static void main(String[] args) throws Exception {
        try { run(args); }
        catch (Throwable error) { error.printStackTrace(); System.exit(1); }
    }
    private static void run(String[] args) throws Exception {
        if (args.length != 4 && args.length != 5) throw new IllegalArgumentException("original APK, extension DEX, staged database, source version, optional archive required");
        File requestedDatabase = new File(args[2]).getAbsoluteFile();
        File database = requestedDatabase.getCanonicalFile();
        if (!database.getPath().startsWith("/data/local/tmp/pillo-restore-check/"))
            throw new IllegalArgumentException("Database must be inside the isolated verification directory");
        if (android.os.Looper.getMainLooper() == null) android.os.Looper.prepareMainLooper();
        Object thread = Class.forName("android.app.ActivityThread").getMethod("systemMain").invoke(null);
        Context system = (Context) thread.getClass().getMethod("getSystemContext").invoke(thread);
        Context shell = system.createPackageContext("com.android.shell", 0);
        java.lang.reflect.Field systemContext = thread.getClass().getDeclaredField("mSystemContext");
        systemContext.setAccessible(true); systemContext.set(thread, shell);
        // app_process has no bound application for SQLite's Settings lookup. Initialize
        // its compatibility flags to framework defaults; production uses its real app context.
        java.lang.reflect.Method flags = Class.forName("android.database.sqlite.SQLiteCompatibilityWalFlags")
            .getDeclaredMethod("init", String.class);
        flags.setAccessible(true); flags.invoke(null, "");
        Context isolated = new ContextWrapper(shell) {
            @Override public Context getApplicationContext() { return this; }
            @Override public File getDatabasePath(String name) {
                try {
                    File requested = new File(name).getCanonicalFile();
                    if (!requested.equals(database)) throw new IllegalArgumentException("Unexpected database path");
                    return database;
                } catch (java.io.IOException error) { throw new IllegalStateException(error); }
            }
        };
        ClassLoader loader = new DexClassLoader(args[0] + File.pathSeparator + args[1], database.getParent(), null,
            PilloRestoreDeviceCheck.class.getClassLoader());
        try {
            if (args.length == 5) {
                File archive = new File(args[4]).getCanonicalFile();
                if (!archive.getPath().startsWith("/data/local/tmp/pillo-restore-check/")
                    || !requestedDatabase.getName().equals("database") || !requestedDatabase.getParentFile().getName().equals("data"))
                    throw new IllegalArgumentException("Archive fixture must use the isolated sandbox and standard staged layout");
                Object manifest = loader.loadClass("software.santodan.extension.pillobackup.LocalArchive")
                    .getMethod("extract", File.class, File.class, String.class, String.class)
                    .invoke(null, archive, requestedDatabase.getParentFile().getParentFile(), "0.6.27", "0.6.20");
                if (!args[3].equals(manifest.getClass().getMethod("getString", String.class).invoke(manifest, "appVersion")))
                    throw new IllegalStateException("Unexpected fixture version");
                System.out.println("PASS: complete original archive extracted and checksummed through the requested staging path");
            }
            loader.loadClass("software.santodan.extension.pillobackup.PilloRestoreMigration627")
                .getMethod("prepare", Context.class, File.class, String.class).invoke(null, isolated, requestedDatabase, args[3]);
        } catch (InvocationTargetException error) {
            throw new IllegalStateException("Staged migration verification failed", error.getCause());
        }
        System.out.println("PASS: real Android SQLite and Pillo 0.6.27 Room migrations/validation completed on isolated staged database");
        System.exit(0);
    }
}
