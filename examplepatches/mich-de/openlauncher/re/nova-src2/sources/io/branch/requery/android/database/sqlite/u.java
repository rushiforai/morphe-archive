package io.branch.requery.android.database.sqlite;

import android.database.sqlite.SQLiteDatabaseCorruptException;
import android.database.sqlite.SQLiteException;
import android.util.Log;
import io.branch.requery.android.database.CursorWindow;

/* loaded from: classes4.dex */
public final class u extends t {

    /* renamed from: a, reason: collision with root package name */
    public final w4.d f61867a;

    public u(SQLiteDatabase sQLiteDatabase, String str, Object[] objArr, w4.d dVar) {
        super(sQLiteDatabase, str, objArr, dVar, false);
        this.f61867a = dVar;
    }

    public final int b(CursorWindow cursorWindow, int i5, int i11, boolean z11) {
        acquireReference();
        try {
            try {
                cursorWindow.acquireReference();
            } catch (Throwable th2) {
                releaseReference();
                throw th2;
            }
        } catch (Throwable th3) {
            th = th3;
        }
        try {
        } catch (SQLiteDatabaseCorruptException e3) {
            e = e3;
        } catch (SQLiteException e11) {
            e = e11;
        } catch (Throwable th4) {
            th = th4;
            Throwable th5 = th;
            cursorWindow.releaseReference();
            throw th5;
        }
        try {
            int iG = getSession().g(getSql(), getBindArgs(), cursorWindow, i5, i11, z11, getConnectionFlags(), this.f61867a);
            cursorWindow.releaseReference();
            releaseReference();
            return iG;
        } catch (SQLiteDatabaseCorruptException e12) {
            e = e12;
            SQLiteDatabaseCorruptException sQLiteDatabaseCorruptException = e;
            onCorruption();
            throw sQLiteDatabaseCorruptException;
        } catch (SQLiteException e13) {
            e = e13;
            SQLiteException sQLiteException = e;
            Log.e("SQLiteQuery", "exception: " + sQLiteException.getMessage() + "; query: " + getSql());
            throw sQLiteException;
        }
    }

    public final String toString() {
        return "SQLiteQuery: " + getSql();
    }
}
