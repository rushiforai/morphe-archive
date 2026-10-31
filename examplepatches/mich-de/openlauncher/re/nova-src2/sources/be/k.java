package be;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabaseLockedException;
import android.os.SystemClock;
import android.util.Base64;
import com.amplitude.android.migration.DatabaseConstants;
import com.google.android.datatransport.runtime.synchronization.SynchronizationException;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Objects;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class k implements d, ce.b, c {

    /* renamed from: f, reason: collision with root package name */
    public static final qd.c f17846f = new qd.c("proto");

    /* renamed from: a, reason: collision with root package name */
    public final m f17847a;

    /* renamed from: b, reason: collision with root package name */
    public final de.a f17848b;

    /* renamed from: c, reason: collision with root package name */
    public final de.a f17849c;

    /* renamed from: d, reason: collision with root package name */
    public final a f17850d;

    /* renamed from: e, reason: collision with root package name */
    public final w60.a f17851e;

    public k(de.a aVar, de.a aVar2, a aVar3, m mVar, w60.a aVar4) {
        this.f17847a = mVar;
        this.f17848b = aVar;
        this.f17849c = aVar2;
        this.f17850d = aVar3;
        this.f17851e = aVar4;
    }

    public static Long b(SQLiteDatabase sQLiteDatabase, td.i iVar) {
        StringBuilder sb2 = new StringBuilder("backend_name = ? and priority = ?");
        ArrayList arrayList = new ArrayList(Arrays.asList(iVar.f88985a, String.valueOf(ee.a.a(iVar.f88987c))));
        byte[] bArr = iVar.f88986b;
        if (bArr != null) {
            sb2.append(" and extras = ?");
            arrayList.add(Base64.encodeToString(bArr, 0));
        } else {
            sb2.append(" and extras is null");
        }
        Cursor cursorQuery = sQLiteDatabase.query("transport_contexts", new String[]{"_id"}, sb2.toString(), (String[]) arrayList.toArray(new String[0]), null, null, null);
        try {
            return !cursorQuery.moveToNext() ? null : Long.valueOf(cursorQuery.getLong(0));
        } finally {
            cursorQuery.close();
        }
    }

    public static String h(Iterable iterable) {
        StringBuilder sb2 = new StringBuilder("(");
        Iterator it = iterable.iterator();
        while (it.hasNext()) {
            sb2.append(((b) it.next()).f17831a);
            if (it.hasNext()) {
                sb2.append(AbstractJsonLexerKt.COMMA);
            }
        }
        sb2.append(')');
        return sb2.toString();
    }

    public static Object l(Cursor cursor, i iVar) {
        try {
            return iVar.apply(cursor);
        } finally {
            cursor.close();
        }
    }

    public final SQLiteDatabase a() {
        m mVar = this.f17847a;
        Objects.requireNonNull(mVar);
        de.a aVar = this.f17849c;
        long time = aVar.getTime();
        while (true) {
            try {
                return mVar.getWritableDatabase();
            } catch (SQLiteDatabaseLockedException e3) {
                if (aVar.getTime() >= this.f17850d.f17828c + time) {
                    throw new SynchronizationException("Timed out while trying to open db.", e3);
                }
                SystemClock.sleep(50L);
            }
        }
    }

    public final Object c(i iVar) {
        SQLiteDatabase sQLiteDatabaseA = a();
        sQLiteDatabaseA.beginTransaction();
        try {
            Object objApply = iVar.apply(sQLiteDatabaseA);
            sQLiteDatabaseA.setTransactionSuccessful();
            return objApply;
        } finally {
            sQLiteDatabaseA.endTransaction();
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f17847a.close();
    }

    public final ArrayList d(SQLiteDatabase sQLiteDatabase, td.i iVar, int i5) {
        ArrayList arrayList = new ArrayList();
        Long lB = b(sQLiteDatabase, iVar);
        if (lB == null) {
            return arrayList;
        }
        l(sQLiteDatabase.query(DatabaseConstants.EVENT_TABLE_NAME, new String[]{"_id", "transport_name", "timestamp_ms", "uptime_ms", "payload_encoding", "payload", TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, "inline", "product_id", "pseudonymous_id", "experiment_ids_clear_blob", "experiment_ids_encrypted_blob"}, "context_id = ?", new String[]{lB.toString()}, null, null, null, String.valueOf(i5)), new f(0, this, arrayList, iVar));
        return arrayList;
    }

    public final void e(long j11, wd.c cVar, String str) {
        c(new ae.j(j11, str, cVar));
    }

    public final Object f(ce.a aVar) {
        SQLiteDatabase sQLiteDatabaseA = a();
        de.a aVar2 = this.f17849c;
        long time = aVar2.getTime();
        while (true) {
            try {
                sQLiteDatabaseA.beginTransaction();
                try {
                    Object objL = aVar.l();
                    sQLiteDatabaseA.setTransactionSuccessful();
                    return objL;
                } finally {
                    sQLiteDatabaseA.endTransaction();
                }
            } catch (SQLiteDatabaseLockedException e3) {
                if (aVar2.getTime() >= this.f17850d.f17828c + time) {
                    throw new SynchronizationException("Timed out while trying to acquire the lock.", e3);
                }
                SystemClock.sleep(50L);
            }
        }
    }
}
