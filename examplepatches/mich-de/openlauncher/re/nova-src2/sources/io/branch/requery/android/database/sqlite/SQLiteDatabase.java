package io.branch.requery.android.database.sqlite;

import android.annotation.SuppressLint;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabaseCorruptException;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteTransactionListener;
import android.os.CancellationSignal;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.text.TextUtils;
import android.util.EventLog;
import android.util.Log;
import android.util.Pair;
import android.util.Printer;
import b.c0;
import io.branch.requery.android.database.sqlite.SQLiteDebug;
import io.sentry.e3;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SuppressLint({"ShiftFlags"})
/* loaded from: classes4.dex */
public final class SQLiteDatabase extends b implements d7.a {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    public static final int CONFLICT_ABORT = 2;
    public static final int CONFLICT_FAIL = 3;
    public static final int CONFLICT_IGNORE = 4;
    public static final int CONFLICT_NONE = 0;
    public static final int CONFLICT_REPLACE = 5;
    public static final int CONFLICT_ROLLBACK = 1;
    private static final String[] CONFLICT_VALUES;
    public static final int CREATE_IF_NECESSARY = 6;
    public static final int ENABLE_WRITE_AHEAD_LOGGING = 536870912;
    private static final int EVENT_DB_CORRUPT = 75004;
    public static final String LIBRARY_NAME = "sqlite3x_branch";
    public static final int MAX_SQL_CACHE_SIZE = 500;
    public static final int OPEN_CREATE = 4;
    public static final int OPEN_FULLMUTEX = 65536;
    public static final int OPEN_NOMUTEX = 32768;
    public static final int OPEN_PRIVATECACHE = 262144;
    public static final int OPEN_READONLY = 1;
    public static final int OPEN_READWRITE = 2;
    public static final int OPEN_SHAREDCACHE = 131072;
    public static final int OPEN_URI = 64;
    private static final String TAG = "SQLiteDatabase";
    private static final WeakHashMap<SQLiteDatabase, Object> sActiveDatabases;
    private final q mConfigurationLocked;
    private h mConnectionPoolLocked;
    private final n mCursorFactory;
    private final io.branch.requery.android.database.d mErrorHandler;
    private final ThreadLocal<x> mThreadSession = new k(this, 0);
    private final Object mLock = new Object();
    private final a mCloseGuardLocked = new a();

    static {
        System.loadLibrary(LIBRARY_NAME);
        sActiveDatabases = new WeakHashMap<>();
        CONFLICT_VALUES = new String[]{com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, " OR ROLLBACK ", " OR ABORT ", " OR FAIL ", " OR IGNORE ", " OR REPLACE "};
    }

    private SQLiteDatabase(q qVar, n nVar, io.branch.requery.android.database.d dVar) {
        this.mCursorFactory = nVar;
        this.mErrorHandler = dVar == null ? new b50.d() : dVar;
        this.mConfigurationLocked = qVar;
    }

    private void collectDbStats(ArrayList<SQLiteDebug.DbStats> arrayList) {
        synchronized (this.mLock) {
            try {
                h hVar = this.mConnectionPoolLocked;
                if (hVar != null) {
                    hVar.c(arrayList);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public static SQLiteDatabase create(n nVar) {
        return openDatabase(":memory:", nVar, 6);
    }

    public static boolean deleteDatabase(File file) {
        if (file == null) {
            throw new IllegalArgumentException("file must not be null");
        }
        boolean zDelete = file.delete() | new File(file.getPath() + "-journal").delete() | new File(file.getPath() + "-shm").delete() | new File(file.getPath() + "-wal").delete();
        File parentFile = file.getParentFile();
        if (parentFile != null) {
            for (File file2 : parentFile.listFiles(new l(file.getName() + "-mj"))) {
                zDelete |= file2.delete();
            }
        }
        return zDelete;
    }

    private void dispose(boolean z11) {
        h hVar;
        synchronized (this.mLock) {
            try {
                a aVar = this.mCloseGuardLocked;
                if (aVar != null) {
                    if (z11) {
                        aVar.b();
                    }
                    this.mCloseGuardLocked.f61802a = null;
                }
                hVar = this.mConnectionPoolLocked;
                this.mConnectionPoolLocked = null;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (z11) {
            return;
        }
        WeakHashMap<SQLiteDatabase, Object> weakHashMap = sActiveDatabases;
        synchronized (weakHashMap) {
            weakHashMap.remove(this);
        }
        if (hVar != null) {
            hVar.e(false);
        }
    }

    private void dump(Printer printer, boolean z11) {
        synchronized (this.mLock) {
            try {
                if (this.mConnectionPoolLocked != null) {
                    printer.println(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                    this.mConnectionPoolLocked.f(printer, z11);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public static void dumpAll(Printer printer, boolean z11) {
        Iterator<SQLiteDatabase> it = getActiveDatabases().iterator();
        while (it.hasNext()) {
            it.next().dump(printer, z11);
        }
    }

    private static void ensureFile(String str) {
        File file = new File(str);
        if (file.exists()) {
            return;
        }
        try {
            if (!file.getParentFile().exists() && !file.getParentFile().mkdirs()) {
                Log.e(TAG, "Couldn't mkdirs " + file);
            }
            if (file.createNewFile()) {
                return;
            }
            Log.e(TAG, "Couldn't create " + file);
        } catch (IOException e3) {
            Log.e(TAG, "Couldn't ensure file " + file, e3);
        }
    }

    private int executeSql(String str, Object[] objArr) throws SQLException {
        return executeSql(str, objArr, false);
    }

    public static String findEditTable(String str) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalStateException("Invalid tables");
        }
        int iIndexOf = str.indexOf(32);
        int iIndexOf2 = str.indexOf(44);
        return (iIndexOf <= 0 || (iIndexOf >= iIndexOf2 && iIndexOf2 >= 0)) ? iIndexOf2 > 0 ? (iIndexOf2 < iIndexOf || iIndexOf < 0) ? str.substring(0, iIndexOf2) : str : str : str.substring(0, iIndexOf);
    }

    private static ArrayList<SQLiteDatabase> getActiveDatabases() {
        ArrayList<SQLiteDatabase> arrayList = new ArrayList<>();
        WeakHashMap<SQLiteDatabase, Object> weakHashMap = sActiveDatabases;
        synchronized (weakHashMap) {
            arrayList.addAll(weakHashMap.keySet());
        }
        return arrayList;
    }

    public static ArrayList<SQLiteDebug.DbStats> getDbStats() {
        ArrayList<SQLiteDebug.DbStats> arrayList = new ArrayList<>();
        Iterator<SQLiteDatabase> it = getActiveDatabases().iterator();
        while (it.hasNext()) {
            it.next().collectDbStats(arrayList);
        }
        return arrayList;
    }

    public static boolean hasCodec() {
        return SQLiteConnection.t();
    }

    private static boolean isMainThread() {
        Looper looperMyLooper = Looper.myLooper();
        return looperMyLooper != null && looperMyLooper == Looper.getMainLooper();
    }

    private boolean isReadOnlyLocked() {
        return (this.mConfigurationLocked.f61859c & 1) == 1;
    }

    public static void loadLibrary() {
    }

    private void open() {
        try {
            if (!this.mConfigurationLocked.a()) {
                q qVar = this.mConfigurationLocked;
                if ((qVar.f61859c & 4) != 0) {
                    ensureFile(qVar.f61857a);
                }
            }
            try {
                openInner();
            } catch (SQLiteDatabaseCorruptException unused) {
                onCorruption();
                openInner();
            }
        } catch (SQLiteException e3) {
            Log.e(TAG, "Failed to open database '" + getLabel() + "'.", e3);
            close();
            throw e3;
        }
    }

    public static SQLiteDatabase openDatabase(String str, n nVar, int i5) {
        return openDatabase(str, nVar, i5, null);
    }

    private void openInner() {
        synchronized (this.mLock) {
            q qVar = this.mConfigurationLocked;
            if (qVar == null) {
                throw new IllegalArgumentException("configuration must not be null.");
            }
            h hVar = new h(qVar);
            hVar.f61848k = hVar.s(hVar.f61841d, true);
            hVar.f61843f = true;
            hVar.f61838a.a();
            this.mConnectionPoolLocked = hVar;
            this.mCloseGuardLocked.a();
        }
        WeakHashMap<SQLiteDatabase, Object> weakHashMap = sActiveDatabases;
        synchronized (weakHashMap) {
            weakHashMap.put(this, null);
        }
    }

    public static SQLiteDatabase openOrCreateDatabase(File file, n nVar) {
        return openOrCreateDatabase(file.getPath(), nVar);
    }

    public static int releaseMemory() {
        return SQLiteGlobal.a();
    }

    private void throwIfNotOpenLocked() {
        if (this.mConnectionPoolLocked == null) {
            throw new IllegalStateException(c0.q(new StringBuilder("The database '"), this.mConfigurationLocked.f61858b, "' is not open."));
        }
    }

    private boolean yieldIfContendedHelper(boolean z11, long j11) {
        acquireReference();
        try {
            return getThreadSession().o(j11, z11);
        } finally {
            releaseReference();
        }
    }

    @Deprecated
    public void addCustomFunction(String str, int i5, o oVar) {
        SQLiteCustomFunction sQLiteCustomFunction = new SQLiteCustomFunction(str, i5, oVar);
        synchronized (this.mLock) {
            try {
                throwIfNotOpenLocked();
                this.mConfigurationLocked.f61864h.add(sQLiteCustomFunction);
                try {
                    this.mConnectionPoolLocked.w(this.mConfigurationLocked);
                } catch (RuntimeException e3) {
                    this.mConfigurationLocked.f61864h.remove(sQLiteCustomFunction);
                    throw e3;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public void addFunction(String str, int i5, p pVar) {
        addFunction(str, i5, pVar, 0);
    }

    @Override // d7.a
    public void beginTransaction() {
        beginTransaction(null, 2);
    }

    public void beginTransactionDeferred() {
        beginTransaction(null, 0);
    }

    @Override // d7.a
    public void beginTransactionNonExclusive() {
        beginTransaction(null, 1);
    }

    public void beginTransactionWithListener(SQLiteTransactionListener sQLiteTransactionListener) {
        beginTransaction(sQLiteTransactionListener, 2);
    }

    public void beginTransactionWithListenerDeferred(SQLiteTransactionListener sQLiteTransactionListener) {
        beginTransaction(sQLiteTransactionListener, 0);
    }

    public void beginTransactionWithListenerNonExclusive(SQLiteTransactionListener sQLiteTransactionListener) {
        beginTransaction(sQLiteTransactionListener, 1);
    }

    public ParcelFileDescriptor blobFileDescriptorForQuery(String str, String[] strArr) throws SQLException {
        SQLiteStatement sQLiteStatementCompileStatement = compileStatement(str);
        try {
            return blobFileDescriptorForQuery(sQLiteStatementCompileStatement, strArr);
        } finally {
            sQLiteStatementCompileStatement.close();
        }
    }

    public void collectDebugData(Boolean bool) {
        synchronized (this.mLock) {
            try {
                throwIfNotOpenLocked();
                q qVar = this.mConfigurationLocked;
                boolean z11 = qVar.f61863g;
                qVar.f61863g = bool.booleanValue();
                try {
                    this.mConnectionPoolLocked.w(this.mConfigurationLocked);
                } catch (RuntimeException e3) {
                    this.mConfigurationLocked.f61863g = z11;
                    throw e3;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public x createSession() {
        h hVar;
        synchronized (this.mLock) {
            throwIfNotOpenLocked();
            hVar = this.mConnectionPoolLocked;
        }
        return new x(hVar);
    }

    public void definePrioritySql(List<String> list) {
        synchronized (this.mLock) {
            h hVar = this.mConnectionPoolLocked;
            if (hVar != null) {
                synchronized (hVar.f61839b) {
                    hVar.f61850m.f71523b = list;
                    hVar.d();
                }
            }
        }
    }

    public int delete(String str, String str2, String[] strArr) {
        String str3;
        acquireReference();
        try {
            StringBuilder sb2 = new StringBuilder("DELETE FROM ");
            sb2.append(str);
            if (TextUtils.isEmpty(str2)) {
                str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            } else {
                str3 = " WHERE " + str2;
            }
            sb2.append(str3);
            SQLiteStatement sQLiteStatement = new SQLiteStatement(this, sb2.toString(), strArr);
            try {
                int iExecuteUpdateDelete = sQLiteStatement.executeUpdateDelete();
                releaseReference();
                return iExecuteUpdateDelete;
            } finally {
                sQLiteStatement.close();
            }
        } catch (Throwable th2) {
            releaseReference();
            throw th2;
        }
    }

    public void disableWriteAheadLogging() {
        synchronized (this.mLock) {
            try {
                throwIfNotOpenLocked();
                q qVar = this.mConfigurationLocked;
                int i5 = qVar.f61859c;
                if ((i5 & ENABLE_WRITE_AHEAD_LOGGING) == 0) {
                    return;
                }
                qVar.f61859c = i5 & (-536870913);
                try {
                    this.mConnectionPoolLocked.w(qVar);
                } catch (RuntimeException e3) {
                    q qVar2 = this.mConfigurationLocked;
                    qVar2.f61859c = 536870912 | qVar2.f61859c;
                    throw e3;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public void enableLocalizedCollators() {
        SQLiteConnection sQLiteConnection;
        h hVar = this.mConnectionPoolLocked;
        synchronized (hVar.f61839b) {
            try {
                if (!hVar.f61849l.isEmpty() || (sQLiteConnection = hVar.f61848k) == null) {
                    throw new IllegalStateException("Cannot enable localized collators while database is in use");
                }
                sQLiteConnection.j();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public boolean enableWriteAheadLogging() {
        synchronized (this.mLock) {
            try {
                throwIfNotOpenLocked();
                if ((this.mConfigurationLocked.f61859c & ENABLE_WRITE_AHEAD_LOGGING) != 0) {
                    return true;
                }
                if (isReadOnlyLocked()) {
                    return false;
                }
                if (this.mConfigurationLocked.a()) {
                    Log.i(TAG, "can't enable WAL for memory databases.");
                    return false;
                }
                q qVar = this.mConfigurationLocked;
                qVar.f61859c = 536870912 | qVar.f61859c;
                try {
                    this.mConnectionPoolLocked.w(qVar);
                    return true;
                } catch (RuntimeException e3) {
                    this.mConfigurationLocked.f61859c &= -536870913;
                    throw e3;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // d7.a
    public void endTransaction() {
        acquireReference();
        try {
            x threadSession = getThreadSession();
            if (threadSession.f61879f == null) {
                throw new IllegalStateException("Cannot perform this operation because there is no current transaction.");
            }
            threadSession.c(null, false);
        } finally {
            releaseReference();
        }
    }

    public void execPerConnectionSQL(@NotNull String sql, @SuppressLint({"ArrayReturn"}) @Nullable Object[] objArr) {
        Intrinsics.g(sql, "sql");
        throw new UnsupportedOperationException();
    }

    @Override // d7.a
    public void execSQL(String str) throws SQLException {
        executeSql(str, null, false);
    }

    public void finalize() throws Throwable {
        try {
            dispose(true);
        } finally {
            super.finalize();
        }
    }

    public List<Pair<String, String>> getAttachedDbs() {
        ArrayList arrayList = new ArrayList();
        synchronized (this.mLock) {
            try {
                Cursor cursorRawQuery = null;
                if (this.mConnectionPoolLocked == null) {
                    return null;
                }
                acquireReference();
                try {
                    try {
                        cursorRawQuery = rawQuery("pragma database_list;", null);
                        while (cursorRawQuery.moveToNext()) {
                            arrayList.add(new Pair(cursorRawQuery.getString(1), cursorRawQuery.getString(2)));
                        }
                        cursorRawQuery.close();
                        return arrayList;
                    } catch (Throwable th2) {
                        if (cursorRawQuery != null) {
                            cursorRawQuery.close();
                        }
                        throw th2;
                    }
                } finally {
                    releaseReference();
                }
            } catch (Throwable th3) {
                throw th3;
            }
        }
    }

    public String getLabel() {
        String str;
        synchronized (this.mLock) {
            str = this.mConfigurationLocked.f61858b;
        }
        return str;
    }

    public long getMaximumSize() throws SQLException {
        return getPageSize() * longForQuery("PRAGMA max_page_count;", (String[]) null);
    }

    public long getPageSize() {
        return longForQuery("PRAGMA page_size;", (String[]) null);
    }

    public final String getPath() {
        String str;
        synchronized (this.mLock) {
            str = this.mConfigurationLocked.f61857a;
        }
        return str;
    }

    public int getThreadDefaultConnectionFlags(boolean z11) {
        int i5 = z11 ? 1 : 2;
        return isMainThread() ? i5 | 4 : i5;
    }

    public x getThreadSession() {
        return this.mThreadSession.get();
    }

    public int getVersion() {
        return Long.valueOf(longForQuery("PRAGMA user_version;", (String[]) null)).intValue();
    }

    @Override // d7.a
    public boolean inTransaction() {
        acquireReference();
        try {
            return getThreadSession().f61879f != null;
        } finally {
            releaseReference();
        }
    }

    public long insert(String str, String str2, ContentValues contentValues) {
        try {
            return insertWithOnConflict(str, str2, contentValues, 0);
        } catch (SQLException e3) {
            Log.e(TAG, "Error inserting " + contentValues, e3);
            return -1L;
        }
    }

    public long insertOrThrow(String str, String str2, ContentValues contentValues) throws SQLException {
        return insertWithOnConflict(str, str2, contentValues, 0);
    }

    public long insertWithOnConflict(String str, String str2, ContentValues contentValues, int i5) {
        Object[] objArr;
        acquireReference();
        try {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("INSERT");
            sb2.append(CONFLICT_VALUES[i5]);
            sb2.append(" INTO ");
            sb2.append(str);
            sb2.append('(');
            int i11 = 0;
            int size = (contentValues == null || contentValues.size() <= 0) ? 0 : contentValues.size();
            if (size > 0) {
                objArr = new Object[size];
                int i12 = 0;
                for (Map.Entry<String, Object> entry : contentValues.valueSet()) {
                    sb2.append(i12 > 0 ? "," : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                    sb2.append(entry.getKey());
                    objArr[i12] = entry.getValue();
                    i12++;
                }
                sb2.append(')');
                sb2.append(" VALUES (");
                while (i11 < size) {
                    sb2.append(i11 > 0 ? ",?" : "?");
                    i11++;
                }
            } else {
                sb2.append(str2 + ") VALUES (NULL");
                objArr = null;
            }
            sb2.append(')');
            SQLiteStatement sQLiteStatement = new SQLiteStatement(this, sb2.toString(), objArr);
            try {
                long jExecuteInsert = sQLiteStatement.executeInsert();
                releaseReference();
                return jExecuteInsert;
            } finally {
                sQLiteStatement.close();
            }
        } catch (Throwable th2) {
            releaseReference();
            throw th2;
        }
    }

    public boolean isDatabaseIntegrityOk() {
        List<Pair<String, String>> list;
        List<Pair<String, String>> attachedDbs;
        acquireReference();
        try {
            try {
                attachedDbs = getAttachedDbs();
            } catch (SQLiteException unused) {
                ArrayList arrayList = new ArrayList();
                arrayList.add(new Pair("main", getPath()));
                list = arrayList;
            }
            if (attachedDbs == null) {
                throw new IllegalStateException("databaselist for: " + getPath() + " couldn't be retrieved. probably because the database is closed");
            }
            list = attachedDbs;
            for (Pair<String, String> pair : list) {
                SQLiteStatement sQLiteStatementCompileStatement = null;
                try {
                    sQLiteStatementCompileStatement = compileStatement("PRAGMA " + ((String) pair.first) + ".integrity_check(1);");
                    String strSimpleQueryForString = sQLiteStatementCompileStatement.simpleQueryForString();
                    if (!strSimpleQueryForString.equalsIgnoreCase("ok")) {
                        Log.e(TAG, "PRAGMA integrity_check on " + ((String) pair.second) + " returned: " + strSimpleQueryForString);
                        sQLiteStatementCompileStatement.close();
                        releaseReference();
                        return false;
                    }
                    sQLiteStatementCompileStatement.close();
                } catch (Throwable th2) {
                    if (sQLiteStatementCompileStatement != null) {
                        sQLiteStatementCompileStatement.close();
                    }
                    throw th2;
                }
            }
            releaseReference();
            return true;
        } catch (Throwable th3) {
            releaseReference();
            throw th3;
        }
    }

    public boolean isDbLockedByCurrentThread() {
        acquireReference();
        try {
            return getThreadSession().f61875b != null;
        } finally {
            releaseReference();
        }
    }

    public /* bridge */ /* synthetic */ boolean isExecPerConnectionSQLSupported() {
        return false;
    }

    public boolean isInMemoryDatabase() {
        boolean zA;
        synchronized (this.mLock) {
            zA = this.mConfigurationLocked.a();
        }
        return zA;
    }

    @Override // d7.a
    public boolean isOpen() {
        boolean z11;
        synchronized (this.mLock) {
            z11 = this.mConnectionPoolLocked != null;
        }
        return z11;
    }

    public boolean isReadOnly() {
        boolean zIsReadOnlyLocked;
        synchronized (this.mLock) {
            zIsReadOnlyLocked = isReadOnlyLocked();
        }
        return zIsReadOnlyLocked;
    }

    @Override // d7.a
    public boolean isWriteAheadLoggingEnabled() {
        boolean z11;
        synchronized (this.mLock) {
            throwIfNotOpenLocked();
            z11 = (this.mConfigurationLocked.f61859c & ENABLE_WRITE_AHEAD_LOGGING) != 0;
        }
        return z11;
    }

    public long longForQuery(String str, String[] strArr) throws SQLException {
        SQLiteStatement sQLiteStatementCompileStatement = compileStatement(str);
        try {
            return longForQuery(sQLiteStatementCompileStatement, strArr);
        } finally {
            sQLiteStatementCompileStatement.close();
        }
    }

    public boolean needUpgrade(int i5) {
        return i5 > getVersion();
    }

    @Override // io.branch.requery.android.database.sqlite.b
    public void onAllReferencesReleased() {
        dispose(false);
    }

    public void onCorruption() {
        EventLog.writeEvent(EVENT_DB_CORRUPT, getLabel());
        ((b50.d) this.mErrorHandler).getClass();
        Log.e("DefaultDatabaseError", "Corruption reported by sqlite on database: " + getPath());
        if (!isOpen()) {
            b50.d.m(getPath());
            return;
        }
        List<Pair<String, String>> attachedDbs = null;
        try {
            try {
                attachedDbs = getAttachedDbs();
            } finally {
                if (attachedDbs != null) {
                    Iterator<Pair<String, String>> it = attachedDbs.iterator();
                    while (it.hasNext()) {
                        b50.d.m((String) it.next().second);
                    }
                } else {
                    b50.d.m(getPath());
                }
            }
        } catch (SQLiteException unused) {
        }
        try {
            close();
        } catch (SQLiteException unused2) {
        }
    }

    public Cursor query(boolean z11, String str, String[] strArr, String str2, Object[] objArr, String str3, String str4, String str5, String str6) {
        return queryWithFactory(null, z11, str, strArr, str2, objArr, str3, str4, str5, str6, null);
    }

    public long queryNumEntries(String str) {
        return queryNumEntries(str, null, null);
    }

    public Cursor queryWithFactory(n nVar, boolean z11, String str, String[] strArr, String str2, Object[] objArr, String str3, String str4, String str5, String str6) {
        return queryWithFactory(nVar, z11, str, strArr, str2, objArr, str3, str4, str5, str6, null);
    }

    public Cursor rawQuery(String str, Object[] objArr) {
        return rawQueryWithFactory(null, str, objArr, null, null);
    }

    public Cursor rawQueryWithFactory(n nVar, String str, Object[] objArr, String str2) {
        return rawQueryWithFactory(nVar, str, objArr, str2, null);
    }

    public void reopenReadWrite() {
        synchronized (this.mLock) {
            try {
                throwIfNotOpenLocked();
                if (isReadOnlyLocked()) {
                    q qVar = this.mConfigurationLocked;
                    int i5 = qVar.f61859c;
                    qVar.f61859c = i5 & (-2);
                    try {
                        this.mConnectionPoolLocked.w(qVar);
                    } catch (RuntimeException e3) {
                        this.mConfigurationLocked.f61859c = i5;
                        throw e3;
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public long replace(String str, String str2, ContentValues contentValues) {
        try {
            return insertWithOnConflict(str, str2, contentValues, 5);
        } catch (SQLException e3) {
            Log.e(TAG, "Error inserting " + contentValues, e3);
            return -1L;
        }
    }

    public long replaceOrThrow(String str, String str2, ContentValues contentValues) throws SQLException {
        return insertWithOnConflict(str, str2, contentValues, 5);
    }

    public void setForeignKeyConstraintsEnabled(boolean z11) {
        synchronized (this.mLock) {
            try {
                throwIfNotOpenLocked();
                q qVar = this.mConfigurationLocked;
                if (qVar.f61862f == z11) {
                    return;
                }
                qVar.f61862f = z11;
                try {
                    this.mConnectionPoolLocked.w(qVar);
                } catch (RuntimeException e3) {
                    this.mConfigurationLocked.f61862f = !z11;
                    throw e3;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public void setLocale(Locale locale) {
        if (locale == null) {
            throw new IllegalArgumentException("locale must not be null.");
        }
        synchronized (this.mLock) {
            try {
                throwIfNotOpenLocked();
                q qVar = this.mConfigurationLocked;
                Locale locale2 = qVar.f61861e;
                qVar.f61861e = locale;
                try {
                    this.mConnectionPoolLocked.w(qVar);
                } catch (RuntimeException e3) {
                    this.mConfigurationLocked.f61861e = locale2;
                    throw e3;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public void setMaxSqlCacheSize(int i5) {
        if (i5 > 500 || i5 < 0) {
            throw new IllegalStateException("expected value between 0 and 500");
        }
        synchronized (this.mLock) {
            try {
                throwIfNotOpenLocked();
                q qVar = this.mConfigurationLocked;
                int i11 = qVar.f61860d;
                qVar.f61860d = i5;
                try {
                    this.mConnectionPoolLocked.w(qVar);
                } catch (RuntimeException e3) {
                    this.mConfigurationLocked.f61860d = i11;
                    throw e3;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public long setMaximumSize(long j11) {
        long pageSize = getPageSize();
        long j12 = j11 / pageSize;
        if (j11 % pageSize != 0) {
            j12++;
        }
        return longForQuery("PRAGMA max_page_count = " + j12, (String[]) null) * pageSize;
    }

    public void setPageSize(long j11) throws SQLException {
        execSQL("PRAGMA page_size = " + j11);
    }

    @Override // d7.a
    public void setTransactionSuccessful() {
        acquireReference();
        try {
            x threadSession = getThreadSession();
            if (threadSession.f61879f == null) {
                throw new IllegalStateException("Cannot perform this operation because there is no current transaction.");
            }
            threadSession.n();
            threadSession.f61879f.f61872d = true;
        } finally {
            releaseReference();
        }
    }

    public void setVersion(int i5) throws SQLException {
        execSQL("PRAGMA user_version = " + i5);
    }

    public String stringForQuery(String str, String[] strArr) throws SQLException {
        SQLiteStatement sQLiteStatementCompileStatement = compileStatement(str);
        try {
            return stringForQuery(sQLiteStatementCompileStatement, strArr);
        } finally {
            sQLiteStatementCompileStatement.close();
        }
    }

    public String toString() {
        return "SQLiteDatabase: " + getPath();
    }

    public int update(String str, ContentValues contentValues, String str2, String[] strArr) {
        return updateWithOnConflict(str, contentValues, str2, strArr, 0);
    }

    public int updateWithOnConflict(String str, ContentValues contentValues, String str2, String[] strArr, int i5) {
        if (contentValues == null || contentValues.size() == 0) {
            throw new IllegalArgumentException("Empty values");
        }
        acquireReference();
        try {
            StringBuilder sb2 = new StringBuilder(120);
            sb2.append("UPDATE ");
            sb2.append(CONFLICT_VALUES[i5]);
            sb2.append(str);
            sb2.append(" SET ");
            int size = contentValues.size();
            int length = strArr == null ? size : strArr.length + size;
            Object[] objArr = new Object[length];
            int i11 = 0;
            for (Map.Entry<String, Object> entry : contentValues.valueSet()) {
                sb2.append(i11 > 0 ? "," : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                sb2.append(entry.getKey());
                objArr[i11] = entry.getValue();
                sb2.append("=?");
                i11++;
            }
            if (strArr != null) {
                for (int i12 = size; i12 < length; i12++) {
                    objArr[i12] = strArr[i12 - size];
                }
            }
            if (!TextUtils.isEmpty(str2)) {
                sb2.append(" WHERE ");
                sb2.append(str2);
            }
            SQLiteStatement sQLiteStatement = new SQLiteStatement(this, sb2.toString(), objArr);
            try {
                int iExecuteUpdateDelete = sQLiteStatement.executeUpdateDelete();
                releaseReference();
                return iExecuteUpdateDelete;
            } finally {
                sQLiteStatement.close();
            }
        } catch (Throwable th2) {
            releaseReference();
            throw th2;
        }
    }

    public void validateSql(String str, w4.d dVar) {
        getThreadSession().l(str, getThreadDefaultConnectionFlags(true), dVar, null, false);
    }

    public boolean yieldIfContendedSafely() {
        return yieldIfContendedHelper(true, -1L);
    }

    private int executeSql(String str, Object[] objArr, boolean z11) throws SQLException {
        acquireReference();
        try {
            SQLiteStatement sQLiteStatement = new SQLiteStatement(this, str, objArr, z11);
            try {
                return sQLiteStatement.executeUpdateDelete(z11);
            } finally {
                sQLiteStatement.close();
            }
        } finally {
            releaseReference();
        }
    }

    public static SQLiteDatabase openDatabase(String str, n nVar, int i5, io.branch.requery.android.database.d dVar) {
        SQLiteDatabase sQLiteDatabase = new SQLiteDatabase(new q(str, i5), nVar, dVar);
        sQLiteDatabase.open();
        return sQLiteDatabase;
    }

    public static SQLiteDatabase openOrCreateDatabase(String str, n nVar) {
        return openDatabase(str, nVar, 6, null);
    }

    public void addFunction(String str, int i5, p pVar, int i11) {
        SQLiteFunction sQLiteFunction = new SQLiteFunction(str, i5, pVar, i11);
        synchronized (this.mLock) {
            try {
                throwIfNotOpenLocked();
                this.mConfigurationLocked.f61865i.add(sQLiteFunction);
                try {
                    this.mConnectionPoolLocked.w(this.mConfigurationLocked);
                } catch (RuntimeException e3) {
                    this.mConfigurationLocked.f61865i.remove(sQLiteFunction);
                    throw e3;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public void beginTransaction(boolean z11) {
        beginTransaction(null, 2, z11);
    }

    public void beginTransactionDeferred(boolean z11) {
        beginTransaction(null, 0, z11);
    }

    public void beginTransactionNonExclusive(boolean z11) {
        beginTransaction(null, 1, z11);
    }

    @Override // d7.a
    public SQLiteStatement compileStatement(String str) throws SQLException {
        acquireReference();
        try {
            return new SQLiteStatement(this, str, null);
        } finally {
            releaseReference();
        }
    }

    public void execSQL(String str, boolean z11) throws SQLException {
        executeSql(str, null, z11);
    }

    public Cursor query(boolean z11, String str, String[] strArr, String str2, Object[] objArr, String str3, String str4, String str5, String str6, w4.d dVar) {
        return queryWithFactory(null, z11, str, strArr, str2, objArr, str3, str4, str5, str6, dVar);
    }

    public long queryNumEntries(String str, String str2) {
        return queryNumEntries(str, str2, null);
    }

    public Cursor queryWithFactory(n nVar, boolean z11, String str, String[] strArr, String str2, Object[] objArr, String str3, String str4, String str5, String str6, w4.d dVar) {
        acquireReference();
        try {
            return rawQueryWithFactory(nVar, v.b(z11, str, strArr, str2, str3, str4, str5, str6), objArr, findEditTable(str), dVar);
        } finally {
            releaseReference();
        }
    }

    public Cursor rawQuery(String str, Object[] objArr, w4.d dVar) {
        return rawQueryWithFactory(null, str, objArr, null, dVar);
    }

    public Cursor rawQueryWithFactory(n nVar, String str, Object[] objArr, String str2, w4.d dVar) throws Throwable {
        acquireReference();
        try {
            try {
                fl.l lVar = new fl.l(this, str, str2, dVar, 15);
                if (nVar == null) {
                    nVar = this.mCursorFactory;
                }
                u uVar = new u(this, str, objArr, dVar);
                try {
                    Cursor sQLiteCursor = nVar == null ? new SQLiteCursor(lVar, str2, uVar) : ((e3) nVar).p(this, lVar, str2, uVar);
                    lVar.f55375c = uVar;
                    releaseReference();
                    return sQLiteCursor;
                } catch (RuntimeException e3) {
                    uVar.close();
                    throw e3;
                }
            } catch (Throwable th2) {
                th = th2;
                Throwable th3 = th;
                releaseReference();
                throw th3;
            }
        } catch (Throwable th4) {
            th = th4;
        }
    }

    public int update(String str, int i5, ContentValues contentValues, String str2, Object[] objArr) {
        if (contentValues == null || contentValues.size() == 0) {
            throw new IllegalArgumentException("Empty values");
        }
        acquireReference();
        try {
            StringBuilder sb2 = new StringBuilder(120);
            sb2.append("UPDATE ");
            sb2.append(CONFLICT_VALUES[i5]);
            sb2.append(str);
            sb2.append(" SET ");
            int size = contentValues.size();
            int length = objArr == null ? size : objArr.length + size;
            Object[] objArr2 = new Object[length];
            int i11 = 0;
            for (Map.Entry<String, Object> entry : contentValues.valueSet()) {
                sb2.append(i11 > 0 ? "," : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                sb2.append(entry.getKey());
                objArr2[i11] = entry.getValue();
                sb2.append("=?");
                i11++;
            }
            if (objArr != null) {
                for (int i12 = size; i12 < length; i12++) {
                    objArr2[i12] = objArr[i12 - size];
                }
            }
            if (!TextUtils.isEmpty(str2)) {
                sb2.append(" WHERE ");
                sb2.append(str2);
            }
            SQLiteStatement sQLiteStatement = new SQLiteStatement(this, sb2.toString(), objArr2);
            try {
                int iExecuteUpdateDelete = sQLiteStatement.executeUpdateDelete();
                releaseReference();
                return iExecuteUpdateDelete;
            } finally {
                sQLiteStatement.close();
            }
        } catch (Throwable th2) {
            releaseReference();
            throw th2;
        }
    }

    public boolean yieldIfContendedSafely(long j11) {
        return yieldIfContendedHelper(true, j11);
    }

    private void beginTransaction(SQLiteTransactionListener sQLiteTransactionListener, int i5) {
        beginTransaction(sQLiteTransactionListener, i5, false);
    }

    public static SQLiteDatabase openOrCreateDatabase(String str, n nVar, io.branch.requery.android.database.d dVar) {
        return openDatabase(str, nVar, 6, dVar);
    }

    public void execSQL(String str, Object[] objArr) throws SQLException {
        execSQL(str, objArr, false);
    }

    public long insert(String str, int i5, ContentValues contentValues) throws SQLException {
        return insertWithOnConflict(str, null, contentValues, i5);
    }

    public Cursor query(String str, String[] strArr, String str2, Object[] objArr, String str3, String str4, String str5) {
        return query(false, str, strArr, str2, objArr, str3, str4, str5, null);
    }

    public long queryNumEntries(String str, String str2, String[] strArr) {
        String strK;
        if (!TextUtils.isEmpty(str2)) {
            strK = c0.k(" where ", str2);
        } else {
            strK = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return longForQuery(c0.l("select count(*) from ", str, strK), strArr);
    }

    private void beginTransaction(SQLiteTransactionListener sQLiteTransactionListener, int i5, boolean z11) {
        acquireReference();
        try {
            x threadSession = getThreadSession();
            int threadDefaultConnectionFlags = getThreadDefaultConnectionFlags(z11);
            threadSession.n();
            threadSession.b(i5, sQLiteTransactionListener, threadDefaultConnectionFlags, null, z11);
        } finally {
            releaseReference();
        }
    }

    public void execSQL(String str, Object[] objArr, boolean z11) throws SQLException {
        if (objArr != null) {
            executeSql(str, objArr, z11);
            return;
        }
        throw new IllegalArgumentException("Empty bindArgs");
    }

    public Cursor query(String str, String[] strArr, String str2, Object[] objArr, String str3, String str4, String str5, String str6) {
        return query(false, str, strArr, str2, objArr, str3, str4, str5, str6);
    }

    public static ParcelFileDescriptor blobFileDescriptorForQuery(SQLiteStatement sQLiteStatement, String[] strArr) {
        sQLiteStatement.bindAllArgsAsStrings(strArr);
        return sQLiteStatement.simpleQueryForBlobFileDescriptor();
    }

    private static long longForQuery(SQLiteStatement sQLiteStatement, String[] strArr) {
        sQLiteStatement.bindAllArgsAsStrings(strArr);
        return sQLiteStatement.simpleQueryForLong();
    }

    public static SQLiteDatabase openDatabase(q qVar, n nVar, io.branch.requery.android.database.d dVar) {
        SQLiteDatabase sQLiteDatabase = new SQLiteDatabase(qVar, nVar, dVar);
        sQLiteDatabase.open();
        return sQLiteDatabase;
    }

    public static String stringForQuery(SQLiteStatement sQLiteStatement, String[] strArr) {
        sQLiteStatement.bindAllArgsAsStrings(strArr);
        return sQLiteStatement.simpleQueryForString();
    }

    @Override // d7.a
    public Cursor query(String str) {
        return rawQueryWithFactory(null, str, null, null, null);
    }

    public Cursor query(String str, Object[] objArr) {
        return rawQueryWithFactory(null, str, objArr, null, null);
    }

    @Override // d7.a
    public Cursor query(d7.f fVar) {
        return query(fVar, (w4.d) null);
    }

    @Override // d7.a
    public Cursor query(d7.f fVar, CancellationSignal cancellationSignal) {
        if (cancellationSignal != null) {
            w4.d dVar = new w4.d();
            cancellationSignal.setOnCancelListener(new m(this, dVar));
            return query(fVar, dVar);
        }
        return query(fVar, (w4.d) null);
    }

    public int delete(String str, String str2, Object[] objArr) {
        String str3;
        acquireReference();
        try {
            StringBuilder sb2 = new StringBuilder("DELETE FROM ");
            sb2.append(str);
            if (TextUtils.isEmpty(str2)) {
                str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            } else {
                str3 = " WHERE " + str2;
            }
            sb2.append(str3);
            SQLiteStatement sQLiteStatement = new SQLiteStatement(this, sb2.toString(), objArr);
            try {
                int iExecuteUpdateDelete = sQLiteStatement.executeUpdateDelete();
                releaseReference();
                return iExecuteUpdateDelete;
            } finally {
                sQLiteStatement.close();
            }
        } catch (Throwable th2) {
            releaseReference();
            throw th2;
        }
    }

    public Cursor query(d7.f fVar, w4.d dVar) {
        return rawQueryWithFactory(new e3(this, fVar, false, 19), fVar.a(), new String[0], null, dVar);
    }
}
