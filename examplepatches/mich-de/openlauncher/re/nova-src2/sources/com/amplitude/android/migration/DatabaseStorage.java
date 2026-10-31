package com.amplitude.android.migration;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import com.amplitude.common.Logger;
import com.amplitude.common.android.LogcatLogger;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.File;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;
import r70.j;
import r70.k;

@Metadata(d1 = {"\u0000z\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\b\u0005\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\f\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bJ\b\u0010\u0012\u001a\u00020\u0013H\u0002J\u0010\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0015\u001a\u00020\u0016H\u0002J\u0015\u0010\u0017\u001a\u0004\u0018\u00010\u00182\u0006\u0010\u0019\u001a\u00020\u0005¢\u0006\u0002\u0010\u001aJ\u0010\u0010\u001b\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0019\u001a\u00020\u0005J\u001a\u0010\u001c\u001a\u0004\u0018\u00010\u001d2\u0006\u0010\u001e\u001a\u00020\u00052\u0006\u0010\u0019\u001a\u00020\u0005H\u0002J\u0010\u0010\u001f\u001a\u00020\u00132\u0006\u0010\u0015\u001a\u00020 H\u0002J\u0010\u0010!\u001a\u00020\u00132\u0006\u0010\"\u001a\u00020#H\u0016J\"\u0010$\u001a\u00020\u00132\b\u0010\"\u001a\u0004\u0018\u00010#2\u0006\u0010%\u001a\u00020\n2\u0006\u0010&\u001a\u00020\nH\u0016JW\u0010'\u001a\u0004\u0018\u00010(2\u0006\u0010\"\u001a\u00020#2\u0006\u0010\u001e\u001a\u00020\u00052\u0010\u0010)\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0005\u0018\u00010*2\b\u0010+\u001a\u0004\u0018\u00010\u00052\u0010\u0010,\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010\u0005\u0018\u00010*2\b\u0010-\u001a\u0004\u0018\u00010\u0005H\u0002¢\u0006\u0002\u0010.J\f\u0010/\u001a\b\u0012\u0004\u0012\u00020100J\u0016\u00102\u001a\b\u0012\u0004\u0012\u000201002\u0006\u0010\u001e\u001a\u00020\u0005H\u0002J\f\u00103\u001a\b\u0012\u0004\u0012\u00020100J\f\u00104\u001a\b\u0012\u0004\u0012\u00020100J\u000e\u00105\u001a\u00020\u00132\u0006\u00106\u001a\u00020\u0018J\u0018\u00107\u001a\u00020\u00132\u0006\u0010\u001e\u001a\u00020\u00052\u0006\u00106\u001a\u00020\u0018H\u0002J\u000e\u00108\u001a\u00020\u00132\u0006\u00106\u001a\u00020\u0018J\u000e\u00109\u001a\u00020\u00132\u0006\u00106\u001a\u00020\u0018J\u000e\u0010:\u001a\u00020\u00132\u0006\u0010\u0019\u001a\u00020\u0005J\u000e\u0010;\u001a\u00020\u00132\u0006\u0010\u0019\u001a\u00020\u0005J\u0018\u0010<\u001a\u00020\u00132\u0006\u0010\u001e\u001a\u00020\u00052\u0006\u0010\u0019\u001a\u00020\u0005H\u0002R\u001e\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\n@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006="}, d2 = {"Lcom/amplitude/android/migration/DatabaseStorage;", "Landroid/database/sqlite/SQLiteOpenHelper;", "context", "Landroid/content/Context;", "databaseName", b.f42142b, "logger", "Lcom/amplitude/common/Logger;", "(Landroid/content/Context;Ljava/lang/String;Lcom/amplitude/common/Logger;)V", "<set-?>", b.f42142b, "currentDbVersion", "getCurrentDbVersion", "()I", "file", "Ljava/io/File;", "isValidDatabaseFile", b.f42142b, "closeDb", b.f42142b, "convertIfCursorWindowException", "e", "Ljava/lang/RuntimeException;", "getLongValue", b.f42142b, DatabaseConstants.KEY_FIELD, "(Ljava/lang/String;)Ljava/lang/Long;", "getValue", "getValueFromTable", b.f42142b, "table", "handleIfCursorRowTooLargeException", "Ljava/lang/IllegalStateException;", "onCreate", "db", "Landroid/database/sqlite/SQLiteDatabase;", "onUpgrade", "oldVersion", "newVersion", "queryDb", "Landroid/database/Cursor;", "columns", b.f42142b, "selection", "selectionArgs", "orderBy", "(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;", "readEventsContent", b.f42142b, "Lorg/json/JSONObject;", "readEventsFromTable", "readIdentifiesContent", "readInterceptedIdentifiesContent", "removeEvent", "rowId", "removeEventFromTable", "removeIdentify", "removeInterceptedIdentify", "removeLongValue", "removeValue", "removeValueFromTable", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class DatabaseStorage extends SQLiteOpenHelper {
    private int currentDbVersion;

    @NotNull
    private File file;
    private boolean isValidDatabaseFile;

    @NotNull
    private final Logger logger;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DatabaseStorage(@NotNull Context context, @NotNull String databaseName, @NotNull Logger logger) {
        super(context, databaseName, (SQLiteDatabase.CursorFactory) null, 4);
        Intrinsics.g(context, "context");
        Intrinsics.g(databaseName, "databaseName");
        Intrinsics.g(logger, "logger");
        this.logger = logger;
        File databasePath = context.getDatabasePath(databaseName);
        Intrinsics.f(databasePath, "getDatabasePath(...)");
        this.file = databasePath;
        this.isValidDatabaseFile = true;
        this.currentDbVersion = 4;
    }

    private final void closeDb() {
        try {
            close();
        } catch (Exception e3) {
            LogcatLogger.INSTANCE.getLogger().error("close failed: " + e3.getMessage());
        }
    }

    private final void convertIfCursorWindowException(RuntimeException e3) {
        String message = e3.getMessage();
        if (message == null || message.length() == 0) {
            throw e3;
        }
        if (!j.I0(message, "Cursor window allocation of", false) && !j.I0(message, "Could not allocate CursorWindow", false)) {
            throw e3;
        }
        throw new CursorWindowAllocationException(message);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0099 A[PHI: r12
      0x0099: PHI (r12v8 android.database.Cursor) = 
      (r12v5 android.database.Cursor)
      (r12v6 android.database.Cursor)
      (r12v7 android.database.Cursor)
      (r12v9 android.database.Cursor)
     binds: [B:61:0x00ca, B:53:0x0097, B:58:0x00a5, B:63:0x00ed] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00ca  */
    /* JADX WARN: Type inference failed for: r3v0 */
    /* JADX WARN: Type inference failed for: r3v1 */
    /* JADX WARN: Type inference failed for: r3v2, types: [android.database.Cursor] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final Object getValueFromTable(String table, String key) throws Throwable {
        Throwable th2;
        String str;
        StackOverflowError stackOverflowError;
        Cursor cursorQueryDb;
        RuntimeException runtimeException;
        IllegalStateException illegalStateException;
        SQLiteException sQLiteException;
        ?? r32 = 0;
        Object string = null;
        try {
            if (!this.file.exists()) {
                return null;
            }
            try {
                SQLiteDatabase readableDatabase = getReadableDatabase();
                if (!this.isValidDatabaseFile) {
                    close();
                    return null;
                }
                Intrinsics.d(readableDatabase);
                str = table;
                try {
                    cursorQueryDb = queryDb(readableDatabase, str, new String[]{DatabaseConstants.KEY_FIELD, "value"}, "key = ?", new String[]{key}, null);
                    try {
                        Intrinsics.d(cursorQueryDb);
                        if (cursorQueryDb.moveToFirst()) {
                            string = Intrinsics.b(str, "store") ? cursorQueryDb.getString(1) : Long.valueOf(cursorQueryDb.getLong(1));
                        }
                        cursorQueryDb.close();
                        close();
                        return string;
                    } catch (SQLiteException e3) {
                        sQLiteException = e3;
                        LogcatLogger.INSTANCE.getLogger().error("getValue from " + str + " failed: " + sQLiteException.getMessage());
                        closeDb();
                        if (cursorQueryDb != null) {
                            cursorQueryDb.close();
                        }
                        close();
                        return null;
                    } catch (IllegalStateException e11) {
                        illegalStateException = e11;
                        handleIfCursorRowTooLargeException(illegalStateException);
                        if (cursorQueryDb != null) {
                            cursorQueryDb.close();
                        }
                        close();
                        return null;
                    } catch (RuntimeException e12) {
                        runtimeException = e12;
                        convertIfCursorWindowException(runtimeException);
                        if (cursorQueryDb != null) {
                        }
                        close();
                        return null;
                    } catch (StackOverflowError e13) {
                        stackOverflowError = e13;
                        LogcatLogger.INSTANCE.getLogger().error("getValue from " + str + " failed: " + stackOverflowError.getMessage());
                        closeDb();
                        if (cursorQueryDb != null) {
                            cursorQueryDb.close();
                        }
                        close();
                        return null;
                    }
                } catch (SQLiteException e14) {
                    e = e14;
                    sQLiteException = e;
                    cursorQueryDb = null;
                    LogcatLogger.INSTANCE.getLogger().error("getValue from " + str + " failed: " + sQLiteException.getMessage());
                    closeDb();
                    if (cursorQueryDb != null) {
                    }
                    close();
                    return null;
                } catch (IllegalStateException e15) {
                    e = e15;
                    illegalStateException = e;
                    cursorQueryDb = null;
                    handleIfCursorRowTooLargeException(illegalStateException);
                    if (cursorQueryDb != null) {
                    }
                    close();
                    return null;
                } catch (RuntimeException e16) {
                    e = e16;
                    runtimeException = e;
                    cursorQueryDb = null;
                    convertIfCursorWindowException(runtimeException);
                    if (cursorQueryDb != null) {
                    }
                    close();
                    return null;
                } catch (StackOverflowError e17) {
                    e = e17;
                    stackOverflowError = e;
                    cursorQueryDb = null;
                    LogcatLogger.INSTANCE.getLogger().error("getValue from " + str + " failed: " + stackOverflowError.getMessage());
                    closeDb();
                    if (cursorQueryDb != null) {
                    }
                    close();
                    return null;
                } catch (Throwable th3) {
                    th = th3;
                    th2 = th;
                    if (r32 != 0) {
                        r32.close();
                    }
                    close();
                    throw th2;
                }
            } catch (SQLiteException e18) {
                e = e18;
                str = table;
            } catch (IllegalStateException e19) {
                e = e19;
            } catch (RuntimeException e21) {
                e = e21;
            } catch (StackOverflowError e22) {
                e = e22;
                str = table;
            } catch (Throwable th4) {
                th = th4;
            }
        } catch (Throwable th5) {
            th2 = th5;
            r32 = table;
        }
    }

    private final void handleIfCursorRowTooLargeException(IllegalStateException e3) {
        String message = e3.getMessage();
        if (message == null || message.length() == 0 || !k.K0(message, "Couldn't read", false) || !k.K0(message, "CursorWindow", false)) {
            throw e3;
        }
        closeDb();
    }

    private final Cursor queryDb(SQLiteDatabase db2, String table, String[] columns, String selection, String[] selectionArgs, String orderBy) {
        return db2.query(table, columns, selection, selectionArgs, null, null, orderBy, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:54:0x00a4 A[PHI: r4
      0x00a4: PHI (r4v6 android.database.Cursor) = 
      (r4v1 android.database.Cursor)
      (r4v2 android.database.Cursor)
      (r4v4 android.database.Cursor)
      (r4v7 android.database.Cursor)
     binds: [B:61:0x00d8, B:53:0x00a2, B:58:0x00b0, B:63:0x00fe] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0104  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final List<JSONObject> readEventsFromTable(String table) throws Throwable {
        String str;
        Throwable th2;
        RuntimeException runtimeException;
        IllegalStateException illegalStateException;
        if (!this.file.exists()) {
            return new ArrayList();
        }
        LinkedList linkedList = new LinkedList();
        Cursor cursorQueryDb = null;
        try {
            try {
                try {
                    SQLiteDatabase readableDatabase = getReadableDatabase();
                    if (!this.isValidDatabaseFile) {
                        try {
                            ArrayList arrayList = new ArrayList();
                            close();
                            return arrayList;
                        } catch (IllegalStateException e3) {
                            illegalStateException = e3;
                            handleIfCursorRowTooLargeException(illegalStateException);
                            if (cursorQueryDb != null) {
                                cursorQueryDb.close();
                            }
                            close();
                            return linkedList;
                        } catch (RuntimeException e11) {
                            runtimeException = e11;
                            convertIfCursorWindowException(runtimeException);
                            if (cursorQueryDb != null) {
                                cursorQueryDb.close();
                            }
                            close();
                            return linkedList;
                        } catch (Throwable th3) {
                            th2 = th3;
                            if (0 != 0) {
                            }
                            close();
                            throw th2;
                        }
                    }
                    Intrinsics.d(readableDatabase);
                    str = table;
                    try {
                        cursorQueryDb = queryDb(readableDatabase, str, new String[]{"id", DatabaseConstants.EVENT_FIELD}, null, null, "id ASC");
                        while (true) {
                            Intrinsics.d(cursorQueryDb);
                            if (!cursorQueryDb.moveToNext()) {
                                cursorQueryDb.close();
                                close();
                                return linkedList;
                            }
                            long j11 = cursorQueryDb.getLong(0);
                            String string = cursorQueryDb.getString(1);
                            if (string != null && string.length() != 0) {
                                JSONObject jSONObject = new JSONObject(string);
                                jSONObject.put(DatabaseConstants.ROW_ID_FIELD, j11);
                                linkedList.add(jSONObject);
                            }
                        }
                    } catch (SQLiteException e12) {
                        e = e12;
                        LogcatLogger.INSTANCE.getLogger().error("read events from " + str + " failed: " + e.getMessage());
                        closeDb();
                        if (cursorQueryDb != null) {
                        }
                        close();
                        return linkedList;
                    } catch (IllegalStateException e13) {
                        e = e13;
                        illegalStateException = e;
                        handleIfCursorRowTooLargeException(illegalStateException);
                        if (cursorQueryDb != null) {
                        }
                        close();
                        return linkedList;
                    } catch (RuntimeException e14) {
                        e = e14;
                        runtimeException = e;
                        convertIfCursorWindowException(runtimeException);
                        if (cursorQueryDb != null) {
                        }
                        close();
                        return linkedList;
                    } catch (StackOverflowError e15) {
                        e = e15;
                        LogcatLogger.INSTANCE.getLogger().error("read events from " + str + " failed: " + e.getMessage());
                        closeDb();
                        if (cursorQueryDb != null) {
                            cursorQueryDb.close();
                        }
                        close();
                        return linkedList;
                    }
                } catch (Throwable th4) {
                    th = th4;
                    th2 = th;
                    if (0 != 0) {
                        cursorQueryDb.close();
                    }
                    close();
                    throw th2;
                }
            } catch (SQLiteException e16) {
                e = e16;
                str = table;
            } catch (StackOverflowError e17) {
                e = e17;
                str = table;
            }
        } catch (IllegalStateException e18) {
            e = e18;
        } catch (RuntimeException e19) {
            e = e19;
        } catch (Throwable th5) {
            th = th5;
            th2 = th;
            if (0 != 0) {
            }
            close();
            throw th2;
        }
    }

    private final void removeEventFromTable(String table, long rowId) {
        try {
            try {
                try {
                    getWritableDatabase().delete(table, "id = ?", new String[]{String.valueOf(rowId)});
                } catch (StackOverflowError e3) {
                    LogcatLogger.INSTANCE.getLogger().error("remove events from " + table + " failed: " + e3.getMessage());
                    closeDb();
                }
            } catch (SQLiteException e11) {
                LogcatLogger.INSTANCE.getLogger().error("remove events from " + table + " failed: " + e11.getMessage());
                closeDb();
            }
        } finally {
            close();
        }
    }

    private final void removeValueFromTable(String table, String key) {
        try {
            try {
                getWritableDatabase().delete(table, "key = ?", new String[]{key});
            } catch (SQLiteException e3) {
                LogcatLogger.INSTANCE.getLogger().error("remove value from " + table + " failed: " + e3.getMessage());
                closeDb();
            } catch (StackOverflowError e11) {
                LogcatLogger.INSTANCE.getLogger().error("remove value from " + table + " failed: " + e11.getMessage());
                closeDb();
            }
        } finally {
            close();
        }
    }

    public final int getCurrentDbVersion() {
        return this.currentDbVersion;
    }

    @Nullable
    public final synchronized Long getLongValue(@NotNull String key) {
        Intrinsics.g(key, "key");
        return (Long) getValueFromTable(DatabaseConstants.LONG_STORE_TABLE_NAME, key);
    }

    @Nullable
    public final synchronized String getValue(@NotNull String key) {
        Intrinsics.g(key, "key");
        return (String) getValueFromTable("store", key);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(@NotNull SQLiteDatabase db2) {
        Intrinsics.g(db2, "db");
        this.isValidDatabaseFile = false;
        this.logger.error("Attempt to re-create existing legacy database file " + this.file.getAbsolutePath());
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(@Nullable SQLiteDatabase db2, int oldVersion, int newVersion) {
        this.currentDbVersion = oldVersion;
    }

    @NotNull
    public final synchronized List<JSONObject> readEventsContent() {
        return readEventsFromTable(DatabaseConstants.EVENT_TABLE_NAME);
    }

    @NotNull
    public final synchronized List<JSONObject> readIdentifiesContent() {
        return readEventsFromTable(DatabaseConstants.IDENTIFY_TABLE_NAME);
    }

    @NotNull
    public final synchronized List<JSONObject> readInterceptedIdentifiesContent() {
        if (this.currentDbVersion < 4) {
            return EmptyList.f71733a;
        }
        return readEventsFromTable(DatabaseConstants.IDENTIFY_INTERCEPTOR_TABLE_NAME);
    }

    public final synchronized void removeEvent(long rowId) {
        removeEventFromTable(DatabaseConstants.EVENT_TABLE_NAME, rowId);
    }

    public final synchronized void removeIdentify(long rowId) {
        removeEventFromTable(DatabaseConstants.IDENTIFY_TABLE_NAME, rowId);
    }

    public final synchronized void removeInterceptedIdentify(long rowId) {
        if (this.currentDbVersion < 4) {
            return;
        }
        removeEventFromTable(DatabaseConstants.IDENTIFY_INTERCEPTOR_TABLE_NAME, rowId);
    }

    public final synchronized void removeLongValue(@NotNull String key) {
        Intrinsics.g(key, "key");
        removeValueFromTable(DatabaseConstants.LONG_STORE_TABLE_NAME, key);
    }

    public final synchronized void removeValue(@NotNull String key) {
        Intrinsics.g(key, "key");
        removeValueFromTable("store", key);
    }
}
