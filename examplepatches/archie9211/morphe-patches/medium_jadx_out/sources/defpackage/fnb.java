package defpackage;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabaseLockedException;
import android.os.SystemClock;
import android.util.Base64;
import com.google.android.datatransport.runtime.synchronization.SynchronizationException;
import j$.util.Objects;
import java.io.Closeable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fnb implements Closeable {
    public static final wy3 f = new wy3("proto");
    public final erb a;
    public final dp1 b;
    public final dp1 c;
    public final jj0 d;
    public final g8a e;

    public fnb(dp1 dp1Var, dp1 dp1Var2, jj0 jj0Var, erb erbVar, g8a g8aVar) {
        this.a = erbVar;
        this.b = dp1Var;
        this.c = dp1Var2;
        this.d = jj0Var;
        this.e = g8aVar;
    }

    public static String L(Iterable iterable) {
        StringBuilder sb = new StringBuilder("(");
        Iterator it2 = iterable.iterator();
        while (it2.hasNext()) {
            sb.append(((xj0) it2.next()).a);
            if (it2.hasNext()) {
                sb.append(',');
            }
        }
        sb.append(')');
        return sb.toString();
    }

    public static Object N(Cursor cursor, dnb dnbVar) {
        try {
            return dnbVar.apply(cursor);
        } finally {
            cursor.close();
        }
    }

    public static Long m(SQLiteDatabase sQLiteDatabase, kk0 kk0Var) {
        StringBuilder sb = new StringBuilder("backend_name = ? and priority = ?");
        ArrayList arrayList = new ArrayList(Arrays.asList(kk0Var.a, String.valueOf(c1a.a(kk0Var.c))));
        byte[] bArr = kk0Var.b;
        if (bArr != null) {
            sb.append(" and extras = ?");
            arrayList.add(Base64.encodeToString(bArr, 0));
        } else {
            sb.append(" and extras is null");
        }
        Cursor cursorQuery = sQLiteDatabase.query("transport_contexts", new String[]{"_id"}, sb.toString(), (String[]) arrayList.toArray(new String[0]), null, null, null);
        try {
            return !cursorQuery.moveToNext() ? null : Long.valueOf(cursorQuery.getLong(0));
        } finally {
            cursorQuery.close();
        }
    }

    public final ArrayList B(SQLiteDatabase sQLiteDatabase, kk0 kk0Var, int i) {
        ArrayList arrayList = new ArrayList();
        Long lM = m(sQLiteDatabase, kk0Var);
        if (lM == null) {
            return arrayList;
        }
        N(sQLiteDatabase.query("events", new String[]{"_id", "transport_name", "timestamp_ms", "uptime_ms", "payload_encoding", "payload", "code", "inline", "product_id", "pseudonymous_id", "experiment_ids_clear_blob", "experiment_ids_encrypted_blob"}, "context_id = ?", new String[]{lM.toString()}, null, null, null, String.valueOf(i)), new mt(this, arrayList, kk0Var, 10));
        return arrayList;
    }

    public final void D(long j, v77 v77Var, String str) {
        p(new oc2(j, str, v77Var));
    }

    public final Object I(v5d v5dVar) {
        SQLiteDatabase sQLiteDatabaseF = f();
        dp1 dp1Var = this.c;
        long jE = dp1Var.e();
        while (true) {
            try {
                sQLiteDatabaseF.beginTransaction();
                try {
                    Object objC = v5dVar.c();
                    sQLiteDatabaseF.setTransactionSuccessful();
                    return objC;
                } finally {
                    sQLiteDatabaseF.endTransaction();
                }
            } catch (SQLiteDatabaseLockedException e) {
                if (dp1Var.e() >= ((long) this.d.c) + jE) {
                    throw new SynchronizationException("Timed out while trying to acquire the lock.", e);
                }
                SystemClock.sleep(50L);
            }
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.a.close();
    }

    public final SQLiteDatabase f() {
        erb erbVar = this.a;
        Objects.requireNonNull(erbVar);
        dp1 dp1Var = this.c;
        long jE = dp1Var.e();
        while (true) {
            try {
                return erbVar.getWritableDatabase();
            } catch (SQLiteDatabaseLockedException e) {
                if (dp1Var.e() >= ((long) this.d.c) + jE) {
                    throw new SynchronizationException("Timed out while trying to open db.", e);
                }
                SystemClock.sleep(50L);
            }
        }
    }

    public final Object p(dnb dnbVar) {
        SQLiteDatabase sQLiteDatabaseF = f();
        sQLiteDatabaseF.beginTransaction();
        try {
            Object objApply = dnbVar.apply(sQLiteDatabaseF);
            sQLiteDatabaseF.setTransactionSuccessful();
            return objApply;
        } finally {
            sQLiteDatabaseF.endTransaction();
        }
    }
}
