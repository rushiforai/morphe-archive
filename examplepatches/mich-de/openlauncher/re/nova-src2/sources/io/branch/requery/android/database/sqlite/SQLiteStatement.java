package io.branch.requery.android.database.sqlite;

import android.database.sqlite.SQLiteDatabaseCorruptException;
import android.os.ParcelFileDescriptor;

/* loaded from: classes4.dex */
public final class SQLiteStatement extends t implements d7.g {
    public SQLiteStatement(SQLiteDatabase sQLiteDatabase, String str, Object[] objArr) {
        this(sQLiteDatabase, str, objArr, false);
    }

    public void execute() {
        acquireReference();
        try {
            try {
                getSession().d(getConnectionFlags(), getSql(), getBindArgs());
            } catch (SQLiteDatabaseCorruptException e3) {
                onCorruption();
                throw e3;
            }
        } finally {
            releaseReference();
        }
    }

    @Override // d7.g
    public long executeInsert() {
        acquireReference();
        try {
            try {
                return getSession().h(getConnectionFlags(), getSql(), getBindArgs());
            } catch (SQLiteDatabaseCorruptException e3) {
                onCorruption();
                throw e3;
            }
        } finally {
            releaseReference();
        }
    }

    @Override // d7.g
    public int executeUpdateDelete() {
        return executeUpdateDelete(false);
    }

    public ParcelFileDescriptor simpleQueryForBlobFileDescriptor() {
        acquireReference();
        try {
            try {
                return getSession().e(getConnectionFlags(), getSql(), getBindArgs());
            } catch (SQLiteDatabaseCorruptException e3) {
                onCorruption();
                throw e3;
            }
        } finally {
            releaseReference();
        }
    }

    public long simpleQueryForLong() {
        acquireReference();
        try {
            try {
                return getSession().i(getConnectionFlags(), getSql(), getBindArgs());
            } catch (SQLiteDatabaseCorruptException e3) {
                onCorruption();
                throw e3;
            }
        } finally {
            releaseReference();
        }
    }

    public String simpleQueryForString() {
        acquireReference();
        try {
            try {
                return getSession().j(getConnectionFlags(), getSql(), getBindArgs());
            } catch (SQLiteDatabaseCorruptException e3) {
                onCorruption();
                throw e3;
            }
        } finally {
            releaseReference();
        }
    }

    public String toString() {
        return "SQLiteProgram: " + getSql();
    }

    public SQLiteStatement(SQLiteDatabase sQLiteDatabase, String str, Object[] objArr, boolean z11) {
        super(sQLiteDatabase, str, objArr, null, z11);
    }

    public int executeUpdateDelete(boolean z11) {
        acquireReference();
        try {
            try {
                return getSession().f(getSql(), getBindArgs(), getConnectionFlags(), z11);
            } catch (SQLiteDatabaseCorruptException e3) {
                onCorruption();
                throw e3;
            }
        } finally {
            releaseReference();
        }
    }
}
