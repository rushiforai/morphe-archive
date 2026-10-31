package e7;

import aa.m0;
import android.content.Context;
import android.database.DatabaseErrorHandler;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import android.util.Pair;
import b.c0;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class h extends SQLiteOpenHelper {

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ int f52224h = 0;

    /* renamed from: a, reason: collision with root package name */
    public final Context f52225a;

    /* renamed from: b, reason: collision with root package name */
    public final e f52226b;

    /* renamed from: c, reason: collision with root package name */
    public final m0 f52227c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f52228d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f52229e;

    /* renamed from: f, reason: collision with root package name */
    public final f7.a f52230f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f52231g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(Context context, String str, final e eVar, final m0 callback, boolean z11) {
        super(context, str, null, callback.f618a, new DatabaseErrorHandler() { // from class: e7.f
            @Override // android.database.DatabaseErrorHandler
            public final void onCorruption(SQLiteDatabase dbObj) {
                m0 callback2 = callback;
                Intrinsics.g(callback2, "$callback");
                int i5 = h.f52224h;
                Intrinsics.f(dbObj, "dbObj");
                d dVarH = x7.f.H(eVar, dbObj);
                Log.e("SupportSQLite", "Corruption reported by sqlite on database: " + dVarH + ".path");
                SQLiteDatabase sQLiteDatabase = dVarH.f52218a;
                if (!sQLiteDatabase.isOpen()) {
                    String path = sQLiteDatabase.getPath();
                    if (path != null) {
                        m0.b(path);
                        return;
                    }
                    return;
                }
                List<Pair<String, String>> attachedDbs = null;
                try {
                    try {
                        attachedDbs = sQLiteDatabase.getAttachedDbs();
                    } catch (SQLiteException unused) {
                    }
                    try {
                        dVarH.close();
                    } catch (IOException unused2) {
                    }
                    if (attachedDbs != null) {
                        return;
                    }
                } finally {
                    if (attachedDbs != null) {
                        Iterator<T> it = attachedDbs.iterator();
                        while (it.hasNext()) {
                            Object obj = ((Pair) it.next()).second;
                            Intrinsics.f(obj, "p.second");
                            m0.b((String) obj);
                        }
                    } else {
                        String path2 = sQLiteDatabase.getPath();
                        if (path2 != null) {
                            m0.b(path2);
                        }
                    }
                }
            }
        });
        Intrinsics.g(context, "context");
        Intrinsics.g(callback, "callback");
        this.f52225a = context;
        this.f52226b = eVar;
        this.f52227c = callback;
        this.f52228d = z11;
        this.f52230f = new f7.a(context.getCacheDir(), str == null ? c0.j("randomUUID().toString()") : str);
    }

    public final d7.a a(boolean z11) throws IOException {
        f7.a aVar = this.f52230f;
        try {
            aVar.a((this.f52231g || getDatabaseName() == null) ? false : true);
            this.f52229e = false;
            SQLiteDatabase sQLiteDatabaseC = c(z11);
            if (!this.f52229e) {
                d dVarH = x7.f.H(this.f52226b, sQLiteDatabaseC);
                aVar.b();
                return dVarH;
            }
            close();
            d7.a aVarA = a(z11);
            aVar.b();
            return aVarA;
        } catch (Throwable th2) {
            aVar.b();
            throw th2;
        }
    }

    public final SQLiteDatabase b(boolean z11) {
        if (z11) {
            SQLiteDatabase writableDatabase = getWritableDatabase();
            Intrinsics.f(writableDatabase, "{\n                super.…eDatabase()\n            }");
            return writableDatabase;
        }
        SQLiteDatabase readableDatabase = getReadableDatabase();
        Intrinsics.f(readableDatabase, "{\n                super.…eDatabase()\n            }");
        return readableDatabase;
    }

    public final SQLiteDatabase c(boolean z11) throws Throwable {
        File parentFile;
        String databaseName = getDatabaseName();
        boolean z12 = this.f52231g;
        Context context = this.f52225a;
        if (databaseName != null && !z12 && (parentFile = context.getDatabasePath(databaseName).getParentFile()) != null) {
            parentFile.mkdirs();
            if (!parentFile.isDirectory()) {
                Log.w("SupportSQLite", "Invalid database parent file, not a directory: " + parentFile);
            }
        }
        try {
            return b(z11);
        } catch (Throwable unused) {
            super.close();
            try {
                Thread.sleep(500L);
            } catch (InterruptedException unused2) {
            }
            try {
                return b(z11);
            } catch (Throwable th2) {
                super.close();
                if (th2 instanceof g) {
                    g gVar = th2;
                    int iF = c0.F(gVar.f52222a);
                    Throwable th3 = gVar.f52223b;
                    if (iF == 0 || iF == 1 || iF == 2 || iF == 3 || !(th3 instanceof SQLiteException)) {
                        throw th3;
                    }
                } else if (!(th2 instanceof SQLiteException) || databaseName == null || !this.f52228d) {
                    throw th2;
                }
                context.deleteDatabase(databaseName);
                try {
                    return b(z11);
                } catch (g e3) {
                    throw e3.f52223b;
                }
            }
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper, java.lang.AutoCloseable
    public final void close() throws IOException {
        f7.a aVar = this.f52230f;
        try {
            HashMap map = f7.a.f54340d;
            aVar.getClass();
            aVar.a(false);
            super.close();
            this.f52226b.f52219a = null;
            this.f52231g = false;
        } finally {
            aVar.b();
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onConfigure(SQLiteDatabase db2) {
        Intrinsics.g(db2, "db");
        boolean z11 = this.f52229e;
        m0 m0Var = this.f52227c;
        if (!z11 && m0Var.f618a != db2.getVersion()) {
            db2.setMaxSqlCacheSize(1);
        }
        try {
            x7.f.H(this.f52226b, db2);
            m0Var.getClass();
        } catch (Throwable th2) {
            throw new g(1, th2);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(SQLiteDatabase sqLiteDatabase) {
        Intrinsics.g(sqLiteDatabase, "sqLiteDatabase");
        try {
            this.f52227c.h(x7.f.H(this.f52226b, sqLiteDatabase));
        } catch (Throwable th2) {
            throw new g(2, th2);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onDowngrade(SQLiteDatabase db2, int i5, int i11) {
        Intrinsics.g(db2, "db");
        this.f52229e = true;
        try {
            this.f52227c.j(x7.f.H(this.f52226b, db2), i5, i11);
        } catch (Throwable th2) {
            throw new g(4, th2);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onOpen(SQLiteDatabase db2) {
        Intrinsics.g(db2, "db");
        if (!this.f52229e) {
            try {
                this.f52227c.i(x7.f.H(this.f52226b, db2));
            } catch (Throwable th2) {
                throw new g(5, th2);
            }
        }
        this.f52231g = true;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onUpgrade(SQLiteDatabase sqLiteDatabase, int i5, int i11) {
        Intrinsics.g(sqLiteDatabase, "sqLiteDatabase");
        this.f52229e = true;
        try {
            this.f52227c.j(x7.f.H(this.f52226b, sqLiteDatabase), i5, i11);
        } catch (Throwable th2) {
            throw new g(3, th2);
        }
    }
}
