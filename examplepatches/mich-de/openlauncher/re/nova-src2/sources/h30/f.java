package h30;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import java.io.File;
import java.net.URL;
import java.util.HashMap;
import mg.l;
import tm.o;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: i, reason: collision with root package name */
    public static final String f59056i = g.f59069c.f54300a;

    /* renamed from: j, reason: collision with root package name */
    public static final String[] f59057j = {"_id", "_data"};

    /* renamed from: k, reason: collision with root package name */
    public static final String f59058k = "hash_code = ? AND content_url = ?";

    /* renamed from: l, reason: collision with root package name */
    public static final String[] f59059l = {"_id", "_data", "content_url", "_size"};

    /* renamed from: m, reason: collision with root package name */
    public static final String f59060m = "last_access ASC";
    public static final String[] n = {"sum(_size)"};

    /* renamed from: c, reason: collision with root package name */
    public final File f59063c;

    /* renamed from: d, reason: collision with root package name */
    public final Context f59064d;

    /* renamed from: e, reason: collision with root package name */
    public final SQLiteDatabase f59065e;

    /* renamed from: f, reason: collision with root package name */
    public final long f59066f;

    /* renamed from: a, reason: collision with root package name */
    public final l f59061a = new l(28);

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f59062b = new HashMap();

    /* renamed from: g, reason: collision with root package name */
    public long f59067g = 0;

    /* renamed from: h, reason: collision with root package name */
    public boolean f59068h = false;

    public f(Context context, File file) {
        long[] jArr = f30.f.f54304a;
        this.f59063c = file;
        context.getClass();
        this.f59064d = context;
        this.f59066f = 67108864L;
        this.f59065e = new b(this, context).getWritableDatabase();
    }

    public final d a(j30.g gVar, URL url) {
        d dVar;
        if (!this.f59068h) {
            synchronized (this) {
                try {
                    if (!this.f59068h) {
                        this.f59068h = true;
                        if (!this.f59063c.isDirectory()) {
                            this.f59063c.mkdirs();
                        }
                        if (!this.f59063c.isDirectory()) {
                            throw new RuntimeException("cannot create " + this.f59063c.getAbsolutePath());
                        }
                        Cursor cursorQuery = this.f59065e.query(f59056i, n, null, null, null, null, null);
                        this.f59067g = 0L;
                        try {
                            if (cursorQuery.moveToNext()) {
                                this.f59067g = cursorQuery.getLong(0);
                            }
                            cursorQuery.close();
                            if (this.f59067g > this.f59066f) {
                                c();
                            }
                        } catch (Throwable th2) {
                            cursorQuery.close();
                            throw th2;
                        }
                    }
                } finally {
                }
            }
        }
        String string = url.toString();
        synchronized (this.f59061a) {
            try {
                d dVar2 = (d) this.f59061a.j(string);
                if (dVar2 != null) {
                    d(dVar2.f59052b);
                    return dVar2;
                }
                e eVar = new e();
                eVar.f59054b = false;
                synchronized (this.f59062b) {
                    try {
                        d dVarB = b(string);
                        if (dVarB != null) {
                            d(dVarB.f59052b);
                            return dVarB;
                        }
                        c cVar = (c) this.f59062b.get(string);
                        if (cVar == null) {
                            cVar = new c(this, string);
                            this.f59062b.put(string, cVar);
                            cVar.f59048b = o.h0(this.f59064d).k0().C(cVar, cVar);
                        }
                        eVar.f59053a = cVar;
                        cVar.f59047a.add(eVar);
                        synchronized (eVar) {
                            gVar.c(new gu.j(eVar, 4));
                            while (!eVar.f59054b && eVar.f59055c == null) {
                                try {
                                    eVar.wait();
                                } catch (InterruptedException e3) {
                                    mc0.d.f76206a.p(e3, "ignore interrupt", new Object[0]);
                                }
                            }
                            gVar.c(null);
                            dVar = eVar.f59055c;
                        }
                        return dVar;
                    } finally {
                    }
                }
            } finally {
            }
        }
    }

    public final d b(String str) {
        d dVar;
        Cursor cursorQuery = this.f59065e.query(f59056i, f59057j, f59058k, new String[]{String.valueOf(f30.f.d(str)), str}, null, null, null);
        try {
            if (!cursorQuery.moveToNext()) {
                cursorQuery.close();
                return null;
            }
            File file = new File(cursorQuery.getString(1));
            long j11 = cursorQuery.getInt(0);
            synchronized (this.f59061a) {
                try {
                    dVar = (d) this.f59061a.j(str);
                    if (dVar == null) {
                        dVar = new d(j11, file);
                        this.f59061a.r(str, dVar);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            cursorQuery.close();
            return dVar;
        } catch (Throwable th3) {
            cursorQuery.close();
            throw th3;
        }
    }

    public final synchronized void c() {
        boolean zContainsKey;
        try {
            if (this.f59067g <= this.f59066f) {
                return;
            }
            Cursor cursorQuery = this.f59065e.query(f59056i, f59059l, null, null, null, null, f59060m);
            int i5 = 16;
            while (i5 > 0) {
                try {
                    if (this.f59067g <= this.f59066f || !cursorQuery.moveToNext()) {
                        break;
                    }
                    long j11 = cursorQuery.getLong(0);
                    String string = cursorQuery.getString(2);
                    long j12 = cursorQuery.getLong(3);
                    String string2 = cursorQuery.getString(1);
                    synchronized (this.f59061a) {
                        l lVar = this.f59061a;
                        synchronized (lVar) {
                            lVar.f();
                            zContainsKey = ((HashMap) lVar.f76310c).containsKey(string);
                        }
                    }
                    if (!zContainsKey) {
                        i5--;
                        this.f59067g -= j12;
                        new File(string2).delete();
                        this.f59065e.delete(f59056i, "_id = ?", new String[]{String.valueOf(j11)});
                    }
                } finally {
                    cursorQuery.close();
                }
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final void d(long j11) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("last_access", Long.valueOf(System.currentTimeMillis()));
        this.f59065e.update(f59056i, contentValues, "_id = ?", new String[]{String.valueOf(j11)});
    }
}
