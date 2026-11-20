package app.aidan.extension.adobescan;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.io.File;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class ScanFileAdapter {

    private static final String TAG = "ScanFileAdapter";
    private static ScanFileAdapter sInstance;

    public static synchronized ScanFileAdapter getInstance() {
        if (sInstance == null) {
            sInstance = new ScanFileAdapter();
        }
        return sInstance;
    }

    public static synchronized void setInstance(final ScanFileAdapter adapter) {
        sInstance = adapter;
    }

    public long getDatabaseId(final Object scanFileObj) {
        if (scanFileObj == null) return -1;
        try {
            final Method m = scanFileObj.getClass().getMethod("i");
            return (Long) m.invoke(scanFileObj);
        } catch (final Throwable t) {
            Log.e(TAG, "Failed to get database ID from ScanFile", t);
            return -1;
        }
    }

    public File getFile(final Object scanFileObj) {
        if (scanFileObj == null) return null;
        try {
            final Method m = scanFileObj.getClass().getMethod("k");
            return (File) m.invoke(scanFileObj);
        } catch (final Throwable t) {
            Log.e(TAG, "Failed to get File from ScanFile", t);
            return null;
        }
    }

    public long getFileSize(final Object scanFileObj) {
        if (scanFileObj == null) return -1;
        try {
            final Method m = scanFileObj.getClass().getMethod("z");
            return (Long) m.invoke(scanFileObj);
        } catch (final Throwable t) {
            Log.e(TAG, "Failed to get file size from ScanFile", t);
            return -1;
        }
    }

    public int getProtectionStatus(final Object scanFileObj) {
        if (scanFileObj == null) return 1;
        try {
            final Method m = scanFileObj.getClass().getMethod("x");
            return (Integer) m.invoke(scanFileObj);
        } catch (final Throwable t) {
            Log.e(TAG, "Failed to get protection status from ScanFile", t);
            return 1;
        }
    }

    public String getDisplayName(final Object scanFileObj) {
        if (scanFileObj == null) return "Scan";

        // 1. Try m0.p() -> ScanFile.Name (m0$e)
        try {
            final Method p = scanFileObj.getClass().getMethod("p");
            final Object nameObj = p.invoke(scanFileObj);
            if (nameObj != null) {
                // Field 'b': display title without extension
                final String title = extractStringProperty(nameObj, "b");
                if (isValidDisplayName(title)) {
                    return title.trim();
                }
                // Field 'a': full filename with extension
                String filename = extractStringProperty(nameObj, "a");
                if (filename != null) {
                    if (filename.toLowerCase().endsWith(".pdf")) {
                        filename = filename.substring(0, filename.length() - 4);
                    }
                    if (isValidDisplayName(filename)) {
                        return filename.trim();
                    }
                }
            }
        } catch (final Throwable ignored) {}

        // 2. Try SQLite query if database ID is available
        final long dbId = getDatabaseId(scanFileObj);
        if (dbId > 0) {
            final String dbName = queryDisplayNameFromDb(dbId);
            if (isValidDisplayName(dbName)) {
                return dbName.trim();
            }
        }

        // 3. Fallback to underlying File name
        final File file = getFile(scanFileObj);
        if (file != null) {
            String name = file.getName();
            if (name.toLowerCase().endsWith(".pdf")) {
                name = name.substring(0, name.length() - 4);
            }
            if (isValidDisplayName(name)) {
                return name.trim();
            }
        }

        return "Scan";
    }

    private static boolean isValidDisplayName(final String name) {
        return name != null && !name.trim().isEmpty() && !name.trim().startsWith("urn:aaid:sc:");
    }

    private static String extractStringProperty(final Object target, final String propertyName) {
        if (target == null) return null;
        try {
            final Field f = target.getClass().getDeclaredField(propertyName);
            f.setAccessible(true);
            final Object val = f.get(target);
            if (val instanceof String) return (String) val;
        } catch (final Throwable ignored) {}
        try {
            final Method m = target.getClass().getMethod(propertyName);
            final Object val = m.invoke(target);
            if (val instanceof String) return (String) val;
        } catch (final Throwable ignored) {}
        try {
            final String getter = "get" + Character.toUpperCase(propertyName.charAt(0)) + propertyName.substring(1);
            final Method m = target.getClass().getMethod(getter);
            final Object val = m.invoke(target);
            if (val instanceof String) return (String) val;
        } catch (final Throwable ignored) {}
        return null;
    }

    private String queryDisplayNameFromDb(final long databaseId) {
        try {
            final Class<?> dbCompanionClass = Class.forName("com.adobe.scan.android.file.ScanFileRoomDatabase$l");
            final Method aMethod = dbCompanionClass.getMethod("a");
            final Object database = aMethod.invoke(null);

            final Class<?> s9bClass = Class.forName("s9.b");
            Method cMethod = null;
            for (final Method m : s9bClass.getDeclaredMethods()) {
                if ("c".equals(m.getName()) && m.getParameterTypes().length == 4) {
                    cMethod = m;
                    break;
                }
            }
            if (cMethod == null) return null;

            final Class<?> z90lClass = cMethod.getParameterTypes()[3];
            final String[] result = new String[1];

            final InvocationHandler handler = new InvocationHandler() {
                @Override
                public Object invoke(final Object proxy, final Method method, final Object[] args) throws Throwable {
                    if (!"invoke".equals(method.getName()) || args == null || args.length == 0) {
                        return null;
                    }
                    final Object connection = args[0];
                    final Method w1Method = connection.getClass().getMethod("w1", String.class);
                    final Object selectStmt = w1Method.invoke(
                            connection,
                            "SELECT local_filename FROM ScanFilePersistentData WHERE database_id=?");
                    try {
                        bindLong(selectStmt, 1, databaseId);
                        if (step(selectStmt)) {
                            result[0] = getString(selectStmt, 0);
                        }
                    } finally {
                        closeQuietly(selectStmt);
                    }
                    return null;
                }
            };

            final Object lambdaProxy = Proxy.newProxyInstance(
                    z90lClass.getClassLoader(),
                    new Class<?>[]{z90lClass},
                    handler);

            cMethod.invoke(null, database, true, true, lambdaProxy);

            String name = result[0];
            if (name != null && name.toLowerCase().endsWith(".pdf")) {
                name = name.substring(0, name.length() - 4);
            }
            return name;
        } catch (final Throwable t) {
            Log.d(TAG, "Failed to query display name from database for id=" + databaseId, t);
            return null;
        }
    }

    private static String getString(final Object stmt, final int index) {
        try {
            final Method m = stmt.getClass().getMethod("getText", int.class);
            return (String) m.invoke(stmt, index);
        } catch (final Throwable ignored) {}
        try {
            final Method m = stmt.getClass().getMethod("getString", int.class);
            return (String) m.invoke(stmt, index);
        } catch (final Throwable ignored) {}
        return null;
    }

    public boolean isProtected(final Object scanFileObj) {
        if (scanFileObj == null) return false;
        if (getProtectionStatus(scanFileObj) == 2) return true;
        try {
            final Method jMethod = scanFileObj.getClass().getMethod("j");
            final Object cache = jMethod.invoke(scanFileObj);
            if (cache != null) {
                final Field bField = cache.getClass().getField("b");
                if (bField.getBoolean(cache)) return true;
            }
        } catch (final Throwable ignored) {}
        try {
            final Method oMethod = scanFileObj.getClass().getMethod("O");
            if ((Boolean) oMethod.invoke(scanFileObj)) return true;
        } catch (final Throwable ignored) {}
        return false;
    }
    public static Object getDetectedProtection(final Object scanFileObj) {
        if (scanFileObj == null) return null;
        try {
            final Field kField = scanFileObj.getClass().getField("K");
            final Object kVal = kField.get(scanFileObj);
            final Method getValue = kVal.getClass().getMethod("getValue");
            Object cacheObj = getValue.invoke(kVal);

            final Method xMethod = scanFileObj.getClass().getMethod("x");
            final int status = (Integer) xMethod.invoke(scanFileObj);
            if (status == 2) {
                boolean forOpen = false;
                if (cacheObj != null) {
                    final Field bField = cacheObj.getClass().getField("b");
                    forOpen = bField.getBoolean(cacheObj);
                }
                if (!forOpen) {
                    final Class<?> m0bClass = Class.forName("com.adobe.scan.android.file.m0$b");
                    final Constructor<?> ctor = m0bClass.getConstructor(
                            String.class, boolean.class, boolean.class, boolean.class, boolean.class);
                    cacheObj = ctor.newInstance("Standard", true, true, true, true);
                    final Method setValue = kVal.getClass().getMethod("setValue", Object.class);
                    setValue.invoke(kVal, cacheObj);
                }
            }
            return cacheObj;
        } catch (final Throwable t) {
            Log.e(TAG, "Error in getDetectedProtection", t);
            return null;
        }
    }

    public void notifyFileObservers(final long databaseId) {
        try {
            final Class<?> v0Class = Class.forName("com.adobe.scan.android.file.v0");
            final Field nField = v0Class.getField("N");
            final Object nVal = nField.get(null);
            if (nVal == null) return;
            final Field aField = nVal.getClass().getField("a");
            final Iterable<?> listeners = (Iterable<?>) aField.get(nVal);
            if (listeners == null) return;
            for (final Object listener : listeners) {
                if (listener != null) {
                    final Method aMethod = listener.getClass().getMethod("a", long.class, boolean.class);
                    aMethod.invoke(listener, databaseId, true);
                }
            }
        } catch (final Throwable t) {
            Log.w(TAG, "Failed to notify v0.N listeners for databaseId: " + databaseId, t);
        }
    }

    public void refreshLibrary() {
        try {
            final Class<?> v0Class = Class.forName("com.adobe.scan.android.file.v0");
            final Method sMethod = v0Class.getMethod("S", boolean.class);
            sMethod.invoke(null, true);
        } catch (final Throwable t) {
            Log.e(TAG, "Failed to refresh library via v0.S(true)", t);
        }
    }

    public String resolveUniqueDisplayName(final String baseName) {
        if (baseName == null || baseName.trim().isEmpty()) {
            return "Scan";
        }
        try {
            final Class<?> v0Class = Class.forName("com.adobe.scan.android.file.v0");
            final Method aMethod = v0Class.getMethod("A", String.class);
            final String unique = (String) aMethod.invoke(null, baseName.trim());
            if (unique != null && !unique.trim().isEmpty()) {
                String name = unique.trim();
                if (name.toLowerCase().endsWith(".pdf")) {
                    name = name.substring(0, name.length() - 4);
                }
                return name;
            }
        } catch (final Throwable t) {
            Log.w(TAG, "Failed to resolve unique display name via v0.A", t);
        }
        return baseName.trim();
    }

    public Object createLocalDocument(final File pdfFile, final String displayName, final int pageCount) {
        if (pdfFile == null || !pdfFile.exists() || !pdfFile.isFile()) {
            Log.e(TAG, "Cannot create local document: invalid PDF file");
            return null;
        }
        try {
            final String uniqueName = resolveUniqueDisplayName(displayName);
            final Class<?> v0Class = Class.forName("com.adobe.scan.android.file.v0");
            final Method lMethod = v0Class.getMethod("l", File.class, String.class, String.class, String.class);
            final Object scanFile = lMethod.invoke(null, pdfFile, uniqueName, uniqueName, null);
            if (scanFile == null) {
                Log.e(TAG, "v0.l returned null ScanFile");
                return null;
            }

            // Persist the scan file into the library
            boolean persisted = false;
            try {
                // Tier 1: Coroutine persistence via w0 + na0.g.f (runBlocking)
                final Class<?> w0Class = Class.forName("com.adobe.scan.android.file.w0");
                Constructor<?> w0Constructor = null;
                for (Constructor<?> c : w0Class.getDeclaredConstructors()) {
                    final Class<?>[] pTypes = c.getParameterTypes();
                    if (pTypes.length == 2 && pTypes[0].isAssignableFrom(scanFile.getClass())) {
                        w0Constructor = c;
                        break;
                    }
                }
                if (w0Constructor == null) {
                    final Class<?> continuationClass = Class.forName("p90.d");
                    w0Constructor = w0Class.getConstructor(scanFile.getClass(), continuationClass);
                }
                w0Constructor.setAccessible(true);
                final Object w0Instance = w0Constructor.newInstance(scanFile, null);

                final Class<?> na0gClass = Class.forName("na0.g");
                Method runBlockingMethod = null;
                for (Method m : na0gClass.getDeclaredMethods()) {
                    if ("f".equals(m.getName()) && m.getParameterTypes().length == 1) {
                        runBlockingMethod = m;
                        break;
                    }
                }
                if (runBlockingMethod == null) {
                    final Class<?> function2Class = Class.forName("z90.p");
                    runBlockingMethod = na0gClass.getMethod("f", function2Class);
                }
                runBlockingMethod.setAccessible(true);
                runBlockingMethod.invoke(null, w0Instance);
                persisted = true;
            } catch (final Throwable t1) {
                Log.w(TAG, "Tier 1 coroutine persistence failed, falling back to direct synchronous persistence", t1);
            }

            if (!persisted) {
                try {
                    // Tier 2: Direct synchronous persistence via v0.r + v0.R + v0.z
                    Method rMethod = null;
                    Method capitalRMethod = null;
                    Method zMethod = null;
                    for (Method m : v0Class.getDeclaredMethods()) {
                        final Class<?>[] pts = m.getParameterTypes();
                        if ("r".equals(m.getName()) && pts.length == 2
                                && pts[0].isAssignableFrom(scanFile.getClass())
                                && (pts[1] == boolean.class || pts[1] == Boolean.class)) {
                            rMethod = m;
                        } else if ("R".equals(m.getName()) && pts.length == 1
                                && pts[0].isAssignableFrom(scanFile.getClass())) {
                            capitalRMethod = m;
                        } else if ("z".equals(m.getName()) && pts.length == 1
                                && pts[0].isAssignableFrom(scanFile.getClass())) {
                            zMethod = m;
                        }
                    }
                    if (rMethod == null) {
                        rMethod = v0Class.getMethod("r", scanFile.getClass(), boolean.class);
                    }
                    if (capitalRMethod == null) {
                        capitalRMethod = v0Class.getMethod("R", scanFile.getClass());
                    }
                    if (zMethod == null) {
                        zMethod = v0Class.getMethod("z", scanFile.getClass());
                    }
                    rMethod.setAccessible(true);
                    capitalRMethod.setAccessible(true);
                    zMethod.setAccessible(true);

                    rMethod.invoke(null, scanFile, true);
                    capitalRMethod.invoke(null, scanFile);
                    zMethod.invoke(null, scanFile);
                    persisted = true;
                } catch (final Throwable t2) {
                    Log.w(TAG, "Tier 2 direct synchronous persistence failed", t2);
                }
            }
            // Verify durable registration by checking v0.B()
            try {
                final Method bMethod = v0Class.getMethod("B");
                final java.util.Collection<?> loaded = (java.util.Collection<?>) bMethod.invoke(null);
                if (loaded != null) {
                    for (Object item : loaded) {
                        File f = getFile(item);
                        if (f != null && (f.getAbsolutePath().equals(pdfFile.getAbsolutePath()) ||
                                f.getName().equals(uniqueName + ".pdf"))) {
                            return item;
                        }
                    }
                }
            } catch (final Throwable t) {
                Log.w(TAG, "Failed to read loaded documents via v0.B()", t);
            }

            if (!persisted) {
                return null;
            }
            return scanFile;
        } catch (final Throwable t) {
            Log.e(TAG, "Failed to create and persist local document", t);
            return null;
        }
    }

    public Object getScanFileById(final long databaseId) {
        try {
            final Class<?> v0Class = Class.forName("com.adobe.scan.android.file.v0");
            final Method uMethod = v0Class.getMethod("u", long.class);
            return uMethod.invoke(null, databaseId);
        } catch (final Throwable t) {
            Log.e(TAG, "Failed to reacquire ScanFile by ID: " + databaseId, t);
            return null;
        }
    }

    public void updateModel(
            final Object scanFileObj,
            final int newProtectionStatus,
            final long newFileSize,
            final boolean isProtected) {
        if (scanFileObj == null) return;

        final Runnable r = new Runnable() {
            @Override
            public void run() {
                try {
                    // 1. Immediately update conservative in-memory security cache
                    setConservativeSecurityCache(scanFileObj, isProtected);

                    // 2. Update in-memory file size and protection status
                    final Method h0 = scanFileObj.getClass().getMethod("h0", long.class);
                    h0.invoke(scanFileObj, newFileSize);

                    final Method g0 = scanFileObj.getClass().getMethod("g0", int.class);
                    g0.invoke(scanFileObj, newProtectionStatus);

                    // 3. Delete cached thumbnail so lock thumbnail renders immediately
                    if (isProtected) {
                        try {
                            final Method vMethod = scanFileObj.getClass().getMethod("V");
                            vMethod.invoke(scanFileObj);
                        } catch (final Throwable ignored) {}
                        try {
                            final Method cMethod = scanFileObj.getClass().getMethod("C");
                            final File thumb = (File) cMethod.invoke(scanFileObj);
                            if (thumb != null && thumb.exists()) {
                                thumb.delete();
                            }
                        } catch (final Throwable ignored) {}
                    }

                    // 4. Invalidate thumbnail / viewer token via v0.b0
                    refreshViewer(scanFileObj);

                    // 5. Notify all v0.N file update observers (file cards, list items, previews)
                    final long docId = getDatabaseId(scanFileObj);
                    if (docId > 0) {
                        notifyFileObservers(docId);
                    }

                    // 6. Refresh library caches and reload file lists via v0.S(true)
                    refreshLibrary();

                } catch (final Throwable t) {
                    Log.e(TAG, "Failed to update in-memory ScanFile model", t);
                }
            }
        };

        if (Looper.myLooper() == Looper.getMainLooper()) {
            r.run();
        } else {
            new Handler(Looper.getMainLooper()).post(r);
        }
    }

    public void refreshSecurityCache(final Object scanFileObj, final boolean isProtected) {
        if (scanFileObj == null) return;
        if (Looper.myLooper() == Looper.getMainLooper()) {
            Log.w(TAG, "refreshSecurityCache called on main looper; setting conservative cache to prevent blocking UI");
            setConservativeSecurityCache(scanFileObj, isProtected);
            return;
        }
        try {
            final Class<?> m0Class = scanFileObj.getClass();
            final Class<?> m0dClass = Class.forName("com.adobe.scan.android.file.m0$d");
            final Method dMethod = m0Class.getMethod("d", boolean.class, m0dClass);

            final CountDownLatch latch = new CountDownLatch(1);
            final Object callbackProxy = Proxy.newProxyInstance(
                    m0dClass.getClassLoader(),
                    new Class<?>[]{m0dClass},
                    new InvocationHandler() {
                        @Override
                        public Object invoke(final Object proxy, final Method method, final Object[] args) {
                            if ("a".equals(method.getName())) {
                                latch.countDown();
                            }
                            return null;
                        }
                    });

            dMethod.invoke(scanFileObj, true, callbackProxy);
            latch.await(500, TimeUnit.MILLISECONDS);

            // Verify cache state via j()
            boolean cacheMatches = false;
            try {
                final Method jMethod = m0Class.getMethod("j");
                final Object cache = jMethod.invoke(scanFileObj);
                if (cache != null) {
                    final Field bField = cache.getClass().getField("b");
                    cacheMatches = (bField.getBoolean(cache) == isProtected);
                }
            } catch (final Throwable ignored) {
            }

            if (!cacheMatches) {
                // Manually set m0.K via m0.X(m0$b)
                setConservativeSecurityCache(scanFileObj, isProtected);
            }
        } catch (final Throwable t) {
            Log.w(TAG, "Error refreshing security cache via probe; falling back to explicit cache", t);
            setConservativeSecurityCache(scanFileObj, isProtected);
        }
    }

    public void setConservativeSecurityCache(final Object scanFileObj, final boolean isProtected) {
        if (scanFileObj == null) return;
        try {
            final Class<?> m0bClass = Class.forName("com.adobe.scan.android.file.m0$b");
            final Constructor<?> ctor = m0bClass.getConstructor(
                    String.class, boolean.class, boolean.class, boolean.class, boolean.class);
            final Object cacheObj = ctor.newInstance(
                    isProtected ? "Standard" : "",
                    isProtected,
                    isProtected,
                    isProtected,
                    isProtected);

            try {
                final Method xMethod = scanFileObj.getClass().getMethod("X", m0bClass);
                xMethod.invoke(scanFileObj, cacheObj);
            } catch (final NoSuchMethodException e) {
                // Fallback to setting field K directly
                final Field kField = scanFileObj.getClass().getField("K");
                final Object kVal = kField.get(scanFileObj);
                final Method setValue = kVal.getClass().getMethod("setValue", Object.class);
                setValue.invoke(kVal, cacheObj);
            }
        } catch (final Throwable t) {
            Log.e(TAG, "Failed to set conservative security cache on ScanFile", t);
        }
    }

    public void refreshViewer(final Object scanFileObj) {
        if (scanFileObj == null) return;
        try {
            final Class<?> v0Class = Class.forName("com.adobe.scan.android.file.v0");
            final Method b0Method = v0Class.getMethod("b0", Class.forName("com.adobe.scan.android.file.m0"));
            b0Method.invoke(null, scanFileObj);
        } catch (final Throwable t) {
            Log.e(TAG, "Failed to refresh viewer via v0.b0", t);
        }
    }

    public void updateMetadata(
            final long databaseId,
            final int newProtectionStatus,
            final long newFileSize,
            final int expectedOldStatus,
            final long expectedOldSize) throws Exception {

        final Class<?> dbCompanionClass = Class.forName("com.adobe.scan.android.file.ScanFileRoomDatabase$l");
        final Method aMethod = dbCompanionClass.getMethod("a");
        final Object database = aMethod.invoke(null);

        final Class<?> s9bClass = Class.forName("s9.b");
        Method cMethod = null;
        for (final Method m : s9bClass.getDeclaredMethods()) {
            if ("c".equals(m.getName()) && m.getParameterTypes().length == 4) {
                cMethod = m;
                break;
            }
        }

        if (cMethod == null) {
            throw new NoSuchMethodException("s9.b.c method not found");
        }

        final Class<?> z90lClass = cMethod.getParameterTypes()[3];

        final InvocationHandler handler = new InvocationHandler() {
            @Override
            public Object invoke(final Object proxy, final Method method, final Object[] args) throws Throwable {
                if (!"invoke".equals(method.getName()) || args == null || args.length == 0) {
                    return null;
                }

                final Object connection = args[0];
                final Method w1Method = connection.getClass().getMethod("w1", String.class);

                // 1. SELECT current values
                final Object selectStmt = w1Method.invoke(
                        connection,
                        "SELECT protection_status, file_size FROM ScanFilePersistentData WHERE database_id=?");
                long currentStatus = -1;
                long currentSize = -1;
                boolean hasRow = false;
                try {
                    bindLong(selectStmt, 1, databaseId);
                    hasRow = step(selectStmt);
                    if (hasRow) {
                        currentStatus = getLong(selectStmt, 0);
                        currentSize = getLong(selectStmt, 1);
                    }
                } finally {
                    closeQuietly(selectStmt);
                }

                if (!hasRow) {
                    throw new IllegalStateException("ScanFilePersistentData not found for database_id: " + databaseId);
                }

                // Idempotent success check
                if (currentStatus == newProtectionStatus && currentSize == newFileSize) {
                    return null;
                }

                // 2. UPDATE row
                final Object updateStmt = w1Method.invoke(
                        connection,
                        "UPDATE ScanFilePersistentData SET protection_status=?, file_size=? WHERE database_id=? AND protection_status=? AND file_size=?");
                try {
                    bindLong(updateStmt, 1, (long) newProtectionStatus);
                    bindLong(updateStmt, 2, newFileSize);
                    bindLong(updateStmt, 3, databaseId);
                    bindLong(updateStmt, 4, currentStatus);
                    bindLong(updateStmt, 5, currentSize);
                    step(updateStmt);
                } finally {
                    closeQuietly(updateStmt);
                }

                // 3. VERIFY readback
                final Object verifyStmt = w1Method.invoke(
                        connection,
                        "SELECT protection_status, file_size FROM ScanFilePersistentData WHERE database_id=?");
                boolean verifyHasRow = false;
                long verifiedStatus = -1;
                long verifiedSize = -1;
                try {
                    bindLong(verifyStmt, 1, databaseId);
                    verifyHasRow = step(verifyStmt);
                    if (verifyHasRow) {
                        verifiedStatus = getLong(verifyStmt, 0);
                        verifiedSize = getLong(verifyStmt, 1);
                    }
                } finally {
                    closeQuietly(verifyStmt);
                }
                if (!verifyHasRow || verifiedStatus != newProtectionStatus || verifiedSize != newFileSize) {
                    throw new IllegalStateException(
                            "Failed to verify updated metadata in ScanFilePersistentData for database_id: " + databaseId);
                }

                return null;
            }
        };

        final Object lambdaProxy = Proxy.newProxyInstance(
                z90lClass.getClassLoader(),
                new Class<?>[]{z90lClass},
                handler);

        cMethod.invoke(null, database, false, true, lambdaProxy);
    }

    private static void closeQuietly(final Object closeable) {
        if (closeable == null) return;
        try {
            final Method m = closeable.getClass().getMethod("close");
            m.invoke(closeable);
        } catch (final Throwable ignored) {
        }
    }

    private static void bindLong(final Object stmt, final int index, final long value) throws Exception {
        final Method m = stmt.getClass().getMethod("w", int.class, long.class);
        m.invoke(stmt, index, value);
    }

    private static boolean step(final Object stmt) throws Exception {
        final Method m = stmt.getClass().getMethod("r1");
        return (Boolean) m.invoke(stmt);
    }

    private static long getLong(final Object stmt, final int index) throws Exception {
        final Method m = stmt.getClass().getMethod("getLong", int.class);
        return (Long) m.invoke(stmt, index);
    }
}
