package defpackage;

import android.content.Context;
import android.database.DatabaseErrorHandler;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import android.util.Pair;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e35 extends SQLiteOpenHelper {
    public static final /* synthetic */ int h = 0;
    public final Context a;
    public final zm7 b;
    public final ad c;
    public final boolean d;
    public boolean e;
    public final e2a f;
    public boolean g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e35(Context context, String str, final zm7 zm7Var, final ad adVar, boolean z) {
        String string;
        super(context, str, null, adVar.b, new DatabaseErrorHandler() { // from class: a35
            @Override // android.database.DatabaseErrorHandler
            public final void onCorruption(SQLiteDatabase sQLiteDatabase) {
                int i = e35.h;
                sQLiteDatabase.getClass();
                zm7 zm7Var2 = zm7Var;
                z25 z25Var = (z25) zm7Var2.b;
                if (z25Var == null || !z25Var.a.equals(sQLiteDatabase)) {
                    z25Var = new z25(sQLiteDatabase);
                    zm7Var2.b = z25Var;
                }
                SQLiteDatabase sQLiteDatabase2 = z25Var.a;
                adVar.getClass();
                Log.e("SupportSQLite", "Corruption reported by sqlite on database: " + z25Var + ".path");
                if (!sQLiteDatabase2.isOpen()) {
                    String path = sQLiteDatabase2.getPath();
                    if (path != null) {
                        ad.i(path);
                        return;
                    }
                    return;
                }
                List<Pair<String, String>> attachedDbs = null;
                try {
                    try {
                        attachedDbs = sQLiteDatabase2.getAttachedDbs();
                    } finally {
                        if (attachedDbs != null) {
                            Iterator<T> it2 = attachedDbs.iterator();
                            while (it2.hasNext()) {
                                Object obj = ((Pair) it2.next()).second;
                                obj.getClass();
                                ad.i((String) obj);
                            }
                        } else {
                            String path2 = sQLiteDatabase2.getPath();
                            if (path2 != null) {
                                ad.i(path2);
                            }
                        }
                    }
                } catch (SQLiteException unused) {
                }
                try {
                    z25Var.close();
                } catch (IOException unused2) {
                }
                if (attachedDbs != null) {
                    return;
                }
            }
        });
        adVar.getClass();
        this.a = context;
        this.b = zm7Var;
        this.c = adVar;
        this.d = z;
        if (str == null) {
            string = UUID.randomUUID().toString();
            string.getClass();
        } else {
            string = str;
        }
        this.f = new e2a(string, context.getCacheDir(), false);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper, java.lang.AutoCloseable
    public final void close() {
        e2a e2aVar = this.f;
        try {
            e2aVar.a(e2aVar.a);
            super.close();
            this.b.b = null;
            this.g = false;
        } finally {
            e2aVar.b();
        }
    }

    public final z25 f(boolean z) {
        e2a e2aVar = this.f;
        try {
            e2aVar.a((this.g || getDatabaseName() == null) ? false : true);
            this.e = false;
            SQLiteDatabase sQLiteDatabaseP = p(z);
            if (!this.e) {
                z25 z25VarM = m(sQLiteDatabaseP);
                e2aVar.b();
                return z25VarM;
            }
            close();
            z25 z25VarF = f(z);
            e2aVar.b();
            return z25VarF;
        } catch (Throwable th) {
            e2aVar.b();
            throw th;
        }
    }

    public final z25 m(SQLiteDatabase sQLiteDatabase) {
        zm7 zm7Var = this.b;
        z25 z25Var = (z25) zm7Var.b;
        if (z25Var != null && z25Var.a.equals(sQLiteDatabase)) {
            return z25Var;
        }
        z25 z25Var2 = new z25(sQLiteDatabase);
        zm7Var.b = z25Var2;
        return z25Var2;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onConfigure(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.getClass();
        boolean z = this.e;
        ad adVar = this.c;
        if (!z && adVar.b != sQLiteDatabase.getVersion()) {
            sQLiteDatabase.setMaxSqlCacheSize(1);
        }
        try {
            m(sQLiteDatabase);
            adVar.getClass();
        } catch (Throwable th) {
            throw new b35(c35.ON_CONFIGURE, th);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.getClass();
        try {
            ((w73) this.c.c).w(new t2d(m(sQLiteDatabase)));
        } catch (Throwable th) {
            throw new b35(c35.ON_CREATE, th);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onDowngrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        sQLiteDatabase.getClass();
        this.e = true;
        try {
            this.c.m(m(sQLiteDatabase), i, i2);
        } catch (Throwable th) {
            throw new b35(c35.ON_DOWNGRADE, th);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onOpen(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.getClass();
        if (!this.e) {
            try {
                ad adVar = this.c;
                z25 z25VarM = m(sQLiteDatabase);
                w73 w73Var = (w73) adVar.c;
                w73Var.y(new t2d(z25VarM));
                w73Var.i = z25VarM;
            } catch (Throwable th) {
                throw new b35(c35.ON_OPEN, th);
            }
        }
        this.g = true;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        sQLiteDatabase.getClass();
        this.e = true;
        try {
            this.c.m(m(sQLiteDatabase), i, i2);
        } catch (Throwable th) {
            throw new b35(c35.ON_UPGRADE, th);
        }
    }

    public final SQLiteDatabase p(boolean z) throws Throwable {
        SQLiteDatabase readableDatabase;
        SQLiteDatabase readableDatabase2;
        File parentFile;
        String databaseName = getDatabaseName();
        boolean z2 = this.g;
        Context context = this.a;
        if (databaseName != null && !z2 && (parentFile = context.getDatabasePath(databaseName).getParentFile()) != null) {
            parentFile.mkdirs();
            if (!parentFile.isDirectory()) {
                Log.w("SupportSQLite", "Invalid database parent file, not a directory: " + parentFile);
            }
        }
        try {
            if (z) {
                SQLiteDatabase writableDatabase = getWritableDatabase();
                writableDatabase.getClass();
                return writableDatabase;
            }
            SQLiteDatabase readableDatabase3 = getReadableDatabase();
            readableDatabase3.getClass();
            return readableDatabase3;
        } catch (Throwable unused) {
            try {
                Thread.sleep(500L);
            } catch (InterruptedException unused2) {
            }
            try {
                if (z) {
                    readableDatabase2 = getWritableDatabase();
                    readableDatabase2.getClass();
                } else {
                    readableDatabase2 = getReadableDatabase();
                    readableDatabase2.getClass();
                }
                return readableDatabase2;
            } catch (Throwable th) {
                th = th;
                if (th instanceof b35) {
                    b35 b35Var = (b35) th;
                    int i = d35.a[b35Var.a.ordinal()];
                    th = b35Var.b;
                    if (i == 1 || i == 2 || i == 3 || i == 4) {
                        throw th;
                    }
                    if (i != 5) {
                        ygf.a();
                        return null;
                    }
                    if (!(th instanceof SQLiteException)) {
                        throw th;
                    }
                }
                if (!(th instanceof SQLiteException) || databaseName == null || !this.d) {
                    throw th;
                }
                context.deleteDatabase(databaseName);
                try {
                    if (z) {
                        readableDatabase = getWritableDatabase();
                        readableDatabase.getClass();
                    } else {
                        readableDatabase = getReadableDatabase();
                        readableDatabase.getClass();
                    }
                    return readableDatabase;
                } catch (b35 e) {
                    throw e.b;
                }
            }
        }
    }
}
