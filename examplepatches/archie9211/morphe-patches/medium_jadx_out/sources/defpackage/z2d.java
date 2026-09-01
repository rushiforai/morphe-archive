package defpackage;

import android.database.Cursor;
import android.database.sqlite.SQLiteCursorDriver;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteQuery;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z2d extends b3d {
    public int[] d;
    public long[] e;
    public double[] f;
    public String[] g;
    public byte[][] h;
    public Cursor i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z2d(z25 z25Var, String str) {
        super(z25Var, str);
        z25Var.getClass();
        str.getClass();
        this.d = new int[0];
        this.e = new long[0];
        this.f = new double[0];
        this.g = new String[0];
        this.h = new byte[0][];
    }

    public static void B(Cursor cursor, int i) {
        if (i < 0 || i >= cursor.getColumnCount()) {
            qk7.z(25, "column index out of range");
            throw null;
        }
    }

    public final Cursor D() {
        Cursor cursor = this.i;
        if (cursor != null) {
            return cursor;
        }
        qk7.z(21, "no row");
        throw null;
    }

    @Override // defpackage.gnb
    public final void M(int i, String str) {
        str.getClass();
        f();
        m(3, i);
        this.d[i] = 3;
        this.g[i] = str;
    }

    @Override // defpackage.gnb
    public final void c(int i, long j) {
        f();
        m(1, i);
        this.d[i] = 1;
        this.e[i] = j;
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        if (!this.c) {
            l();
            reset();
        }
        this.c = true;
    }

    @Override // defpackage.gnb
    public final void d(int i, byte[] bArr) {
        f();
        m(4, i);
        this.d[i] = 4;
        this.h[i] = bArr;
    }

    @Override // defpackage.gnb
    public final String d0(int i) {
        f();
        Cursor cursorD = D();
        B(cursorD, i);
        String string = cursorD.getString(i);
        string.getClass();
        return string;
    }

    @Override // defpackage.gnb
    public final void g(int i) {
        f();
        m(5, i);
        this.d[i] = 5;
    }

    @Override // defpackage.gnb
    public final byte[] getBlob(int i) {
        f();
        Cursor cursorD = D();
        B(cursorD, i);
        byte[] blob = cursorD.getBlob(i);
        blob.getClass();
        return blob;
    }

    @Override // defpackage.gnb
    public final int getColumnCount() {
        f();
        p();
        Cursor cursor = this.i;
        if (cursor != null) {
            return cursor.getColumnCount();
        }
        return 0;
    }

    @Override // defpackage.gnb
    public final String getColumnName(int i) {
        f();
        p();
        Cursor cursor = this.i;
        if (cursor == null) {
            ygf.f("Required value was null.");
            return null;
        }
        B(cursor, i);
        String columnName = cursor.getColumnName(i);
        columnName.getClass();
        return columnName;
    }

    @Override // defpackage.gnb
    public final long getLong(int i) {
        f();
        Cursor cursorD = D();
        B(cursorD, i);
        return cursorD.getLong(i);
    }

    @Override // defpackage.gnb
    public final boolean isNull(int i) {
        f();
        Cursor cursorD = D();
        B(cursorD, i);
        return cursorD.isNull(i);
    }

    @Override // defpackage.b3d, defpackage.gnb
    public final void l() {
        f();
        this.d = new int[0];
        this.e = new long[0];
        this.f = new double[0];
        this.g = new String[0];
        this.h = new byte[0][];
    }

    public final void m(int i, int i2) {
        int i3 = i2 + 1;
        int[] iArr = this.d;
        if (iArr.length < i3) {
            this.d = Arrays.copyOf(iArr, i3);
        }
        if (i == 1) {
            long[] jArr = this.e;
            if (jArr.length < i3) {
                this.e = Arrays.copyOf(jArr, i3);
                return;
            }
            return;
        }
        if (i == 2) {
            double[] dArr = this.f;
            if (dArr.length < i3) {
                this.f = Arrays.copyOf(dArr, i3);
                return;
            }
            return;
        }
        if (i == 3) {
            String[] strArr = this.g;
            if (strArr.length < i3) {
                this.g = (String[]) Arrays.copyOf(strArr, i3);
                return;
            }
            return;
        }
        if (i != 4) {
            return;
        }
        byte[][] bArr = this.h;
        if (bArr.length < i3) {
            this.h = (byte[][]) Arrays.copyOf(bArr, i3);
        }
    }

    public final void p() {
        if (this.i == null) {
            qlb qlbVar = new qlb(this);
            z25 z25Var = this.a;
            z25Var.getClass();
            final zq zqVar = new zq(1, qlbVar);
            Cursor cursorRawQueryWithFactory = z25Var.a.rawQueryWithFactory(new SQLiteDatabase.CursorFactory() { // from class: y25
                @Override // android.database.sqlite.SQLiteDatabase.CursorFactory
                public final Cursor newCursor(SQLiteDatabase sQLiteDatabase, SQLiteCursorDriver sQLiteCursorDriver, String str, SQLiteQuery sQLiteQuery) {
                    return (Cursor) zqVar.k(sQLiteDatabase, sQLiteCursorDriver, str, sQLiteQuery);
                }
            }, ((z2d) qlbVar.a).b, z25.c, null);
            cursorRawQueryWithFactory.getClass();
            this.i = cursorRawQueryWithFactory;
        }
    }

    @Override // defpackage.b3d, defpackage.gnb
    public final void reset() {
        f();
        Cursor cursor = this.i;
        if (cursor != null) {
            cursor.close();
        }
        this.i = null;
    }

    @Override // defpackage.gnb
    public final boolean w0() {
        f();
        p();
        Cursor cursor = this.i;
        if (cursor != null) {
            return cursor.moveToNext();
        }
        ygf.f("Required value was null.");
        return false;
    }
}
