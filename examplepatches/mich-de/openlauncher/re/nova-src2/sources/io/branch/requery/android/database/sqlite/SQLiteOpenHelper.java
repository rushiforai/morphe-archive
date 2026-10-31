package io.branch.requery.android.database.sqlite;

import android.content.Context;
import android.database.sqlite.SQLiteException;
import android.util.Log;
import b.c0;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes4.dex */
public abstract class SQLiteOpenHelper implements d7.d {
    private static final boolean DEBUG_STRICT_READONLY = false;
    private static final String TAG = "SQLiteOpenHelper";
    private final Context mContext;
    private SQLiteDatabase mDatabase;
    private boolean mEnableWriteAheadLogging;
    private final io.branch.requery.android.database.d mErrorHandler;
    private final n mFactory;
    private boolean mIsInitializing;
    private final String mName;
    private final int mNewVersion;

    public SQLiteOpenHelper(Context context, String str, n nVar, int i5) {
        this(context, str, nVar, i5, null);
    }

    private List<j> getCustomExtensions() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new j());
        return arrayList;
    }

    private SQLiteDatabase getDatabaseLocked(boolean z11) {
        SQLiteDatabase sQLiteDatabase = this.mDatabase;
        if (sQLiteDatabase != null) {
            if (!sQLiteDatabase.isOpen()) {
                this.mDatabase = null;
            } else if (!z11 || !this.mDatabase.isReadOnly()) {
                return this.mDatabase;
            }
        }
        if (this.mIsInitializing) {
            throw new IllegalStateException("getDatabase called recursively");
        }
        SQLiteDatabase sQLiteDatabaseOpenDatabase = this.mDatabase;
        try {
            this.mIsInitializing = true;
            if (sQLiteDatabaseOpenDatabase == null) {
                String str = this.mName;
                if (str == null) {
                    sQLiteDatabaseOpenDatabase = SQLiteDatabase.create(null);
                } else {
                    try {
                        sQLiteDatabaseOpenDatabase = SQLiteDatabase.openDatabase(createConfiguration(this.mContext.getDatabasePath(str).getPath(), (this.mEnableWriteAheadLogging ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 0) | 6), this.mFactory, this.mErrorHandler);
                    } catch (SQLiteException e3) {
                        if (z11) {
                            throw e3;
                        }
                        Log.e(TAG, "Couldn't open " + this.mName + " for writing (will try read-only):", e3);
                        sQLiteDatabaseOpenDatabase = SQLiteDatabase.openDatabase(createConfiguration(this.mContext.getDatabasePath(this.mName).getPath(), 1), this.mFactory, this.mErrorHandler);
                    }
                }
            } else if (sQLiteDatabaseOpenDatabase.isReadOnly()) {
                sQLiteDatabaseOpenDatabase.reopenReadWrite();
            }
            onConfigure(sQLiteDatabaseOpenDatabase);
            int version = sQLiteDatabaseOpenDatabase.getVersion();
            if (version != this.mNewVersion) {
                if (sQLiteDatabaseOpenDatabase.isReadOnly()) {
                    throw new SQLiteException("Can't upgrade read-only database from version " + sQLiteDatabaseOpenDatabase.getVersion() + " to " + this.mNewVersion + ": " + this.mName);
                }
                sQLiteDatabaseOpenDatabase.beginTransaction();
                try {
                    if (version == 0) {
                        onCreate(sQLiteDatabaseOpenDatabase);
                    } else {
                        int i5 = this.mNewVersion;
                        if (version > i5) {
                            onDowngrade(sQLiteDatabaseOpenDatabase, version, i5);
                        } else {
                            onUpgrade(sQLiteDatabaseOpenDatabase, version, i5);
                        }
                    }
                    sQLiteDatabaseOpenDatabase.setVersion(this.mNewVersion);
                    sQLiteDatabaseOpenDatabase.setTransactionSuccessful();
                    sQLiteDatabaseOpenDatabase.endTransaction();
                } catch (Throwable th2) {
                    sQLiteDatabaseOpenDatabase.endTransaction();
                    throw th2;
                }
            }
            onOpen(sQLiteDatabaseOpenDatabase);
            if (sQLiteDatabaseOpenDatabase.isReadOnly()) {
                Log.w(TAG, "Opened " + this.mName + " in read-only mode");
            }
            this.mDatabase = sQLiteDatabaseOpenDatabase;
            this.mIsInitializing = false;
            return sQLiteDatabaseOpenDatabase;
        } catch (Throwable th3) {
            this.mIsInitializing = false;
            if (sQLiteDatabaseOpenDatabase != null && sQLiteDatabaseOpenDatabase != this.mDatabase) {
                sQLiteDatabaseOpenDatabase.close();
            }
            throw th3;
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public synchronized void close() {
        if (this.mIsInitializing) {
            throw new IllegalStateException("Closed during initialization");
        }
        SQLiteDatabase sQLiteDatabase = this.mDatabase;
        if (sQLiteDatabase != null && sQLiteDatabase.isOpen()) {
            this.mDatabase.close();
            this.mDatabase = null;
        }
    }

    public q createConfiguration(String str, int i5) {
        List list = Collections.EMPTY_LIST;
        List<j> customExtensions = getCustomExtensions();
        q qVar = new q(str, i5);
        qVar.f61864h.addAll(list);
        qVar.f61866j.addAll(customExtensions);
        qVar.f61865i.addAll(list);
        return qVar;
    }

    public String getDatabaseName() {
        return this.mName;
    }

    public void onConfigure(SQLiteDatabase sQLiteDatabase) {
    }

    public abstract void onCreate(SQLiteDatabase sQLiteDatabase);

    public void onDowngrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) {
        throw new SQLiteException(c0.g(i5, i11, "Can't downgrade database from version ", " to "));
    }

    public void onOpen(SQLiteDatabase sQLiteDatabase) {
    }

    public abstract void onUpgrade(SQLiteDatabase sQLiteDatabase, int i5, int i11);

    @Override // d7.d
    public void setWriteAheadLoggingEnabled(boolean z11) {
        synchronized (this) {
            try {
                if (this.mEnableWriteAheadLogging != z11) {
                    SQLiteDatabase sQLiteDatabase = this.mDatabase;
                    if (sQLiteDatabase != null && sQLiteDatabase.isOpen() && !this.mDatabase.isReadOnly()) {
                        if (z11) {
                            this.mDatabase.enableWriteAheadLogging();
                        } else {
                            this.mDatabase.disableWriteAheadLogging();
                        }
                    }
                    this.mEnableWriteAheadLogging = z11;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public SQLiteOpenHelper(Context context, String str, n nVar, int i5, io.branch.requery.android.database.d dVar) {
        if (i5 < 1) {
            throw new IllegalArgumentException(c0.h(i5, "Version must be >= 1, was "));
        }
        this.mContext = context;
        this.mName = str;
        this.mFactory = nVar;
        this.mNewVersion = i5;
        this.mErrorHandler = dVar;
    }

    public SQLiteDatabase getReadableDatabase() {
        SQLiteDatabase databaseLocked;
        synchronized (this) {
            databaseLocked = getDatabaseLocked(false);
        }
        return databaseLocked;
    }

    @Override // d7.d
    public SQLiteDatabase getWritableDatabase() {
        SQLiteDatabase databaseLocked;
        synchronized (this) {
            databaseLocked = getDatabaseLocked(true);
        }
        return databaseLocked;
    }
}
