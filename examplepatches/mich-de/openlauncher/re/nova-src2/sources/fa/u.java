package fa;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.os.Process;
import android.view.View;
import android.view.ViewGroup;
import androidx.constraintlayout.helper.widget.Flow;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import e10.z2;
import java.io.IOException;
import o9.g2;
import o9.h2;

/* loaded from: classes2.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public int f54499a;

    /* renamed from: b, reason: collision with root package name */
    public int f54500b;

    /* renamed from: c, reason: collision with root package name */
    public int f54501c;

    /* renamed from: d, reason: collision with root package name */
    public int f54502d;

    /* renamed from: e, reason: collision with root package name */
    public int f54503e;

    /* renamed from: f, reason: collision with root package name */
    public int f54504f;

    /* renamed from: g, reason: collision with root package name */
    public final Object f54505g;

    /* renamed from: h, reason: collision with root package name */
    public final Object f54506h;

    public u(Context context, SQLiteDatabase sQLiteDatabase, int i5, int i11, int i12) {
        this.f54505g = context;
        this.f54506h = sQLiteDatabase;
        this.f54499a = i5;
        this.f54500b = i11;
        this.f54501c = i12;
    }

    public static void b(SQLiteDatabase sQLiteDatabase, String str, String str2) throws SQLException, IllegalArgumentException {
        bh.g.O(sQLiteDatabase, str2);
        g2.a(sQLiteDatabase, false, str2);
        Cursor cursorRawQuery = sQLiteDatabase.rawQuery("PRAGMA table_info(" + str + ")", null);
        int columnIndexOrThrow = cursorRawQuery.getColumnIndexOrThrow(PendingUpgradeStore.KEY_NAME);
        StringBuilder sb2 = new StringBuilder();
        while (cursorRawQuery.moveToNext()) {
            sb2.append(cursorRawQuery.getString(columnIndexOrThrow));
            if (!cursorRawQuery.isLast()) {
                sb2.append(", ");
            }
        }
        cursorRawQuery.close();
        sQLiteDatabase.execSQL("INSERT INTO " + str2 + " (" + ((Object) sb2) + ") SELECT " + ((Object) sb2) + " FROM " + str);
    }

    public static boolean d(int i5, int i11, int i12) {
        if (i5 == i11) {
            return true;
        }
        int mode = View.MeasureSpec.getMode(i5);
        int mode2 = View.MeasureSpec.getMode(i11);
        int size = View.MeasureSpec.getSize(i11);
        if (mode2 == 1073741824) {
            return (mode == Integer.MIN_VALUE || mode == 0) && i12 == size;
        }
        return false;
    }

    public void a() throws SQLException, IllegalArgumentException {
        Context context = (Context) this.f54505g;
        SQLiteDatabase sQLiteDatabase = (SQLiteDatabase) this.f54506h;
        boolean zK0 = bh.g.k0(sQLiteDatabase, "favorites_bakup");
        x7.c cVar = ja.h.f69294h;
        if (zK0) {
            if (e() != 2) {
                return;
            }
            ((ja.h) cVar.h(context)).d(Process.myUserHandle());
            b(sQLiteDatabase, "favorites_bakup", "favorites");
            return;
        }
        if (h2.a(context.getContentResolver(), "get_empty_db_flag").getBoolean("value", false)) {
            return;
        }
        ((ja.h) cVar.h(context)).d(Process.myUserHandle());
        c(0);
    }

    public void c(int i5) throws SQLException, IllegalArgumentException {
        SQLiteDatabase sQLiteDatabase = (SQLiteDatabase) this.f54506h;
        b(sQLiteDatabase, "favorites", "favorites_bakup");
        int i11 = this.f54500b;
        int i12 = this.f54501c;
        int i13 = this.f54499a;
        int version = sQLiteDatabase.getVersion();
        ContentValues contentValues = new ContentValues();
        contentValues.put("_id", (Integer) (-1));
        contentValues.put("itemType", (Integer) (-1));
        contentValues.put("rank", Integer.valueOf(version));
        contentValues.put("spanX", Integer.valueOf(i11));
        contentValues.put("spanY", Integer.valueOf(i12));
        contentValues.put("screen", Integer.valueOf(i13));
        contentValues.put("options", Integer.valueOf(i5));
        sQLiteDatabase.insertWithOnConflict("favorites_bakup", null, contentValues, 5);
    }

    public int e() throws IOException {
        try {
            SQLiteDatabase sQLiteDatabase = (SQLiteDatabase) this.f54506h;
            c00.e eVarK0 = z2.k0(sQLiteDatabase.getVersion(), sQLiteDatabase.query("favorites_bakup", new String[]{"rank", "spanX", "spanY", "screen", "options"}, "_id=-1", null, null, null, null));
            this.f54503e = eVarK0.f19047a;
            this.f54504f = eVarK0.f19048b;
            this.f54502d = eVarK0.f19049c;
            return (eVarK0.f19050d & 1) == 0 ? 2 : 1;
        } catch (IllegalStateException unused) {
            return 0;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:112:0x019e  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x01a0  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x01a3  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x01a5  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x01aa A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:122:0x01af  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x01b2 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:127:0x01b7  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x01bb  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x01c3  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x01c6  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x01ce  */
    /* JADX WARN: Removed duplicated region for block: B:140:0x01d1 A[ORIG_RETURN, RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:141:0x01d2  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00b6  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0125  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0132  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void f(g4.d dVar, h4.b bVar) {
        int iMakeMeasureSpec;
        int iMakeMeasureSpec2;
        int iF;
        int iMakeMeasureSpec3;
        int childMeasureSpec;
        g4.e eVar;
        int baseline;
        int iMax;
        int iMax2;
        boolean z11;
        int i5;
        ConstraintLayout constraintLayout = (ConstraintLayout) this.f54506h;
        if (dVar == null) {
            return;
        }
        g4.c cVar = dVar.J;
        g4.c cVar2 = dVar.H;
        if (dVar.f57093f0 == 8) {
            bVar.f59090e = 0;
            bVar.f59091f = 0;
            bVar.f59092g = 0;
            return;
        }
        if (dVar.S == null) {
            return;
        }
        int i11 = ConstraintLayout.o;
        int i12 = bVar.f59086a;
        int i13 = bVar.f59087b;
        int i14 = bVar.f59088c;
        int i15 = bVar.f59089d;
        int i16 = this.f54499a + this.f54500b;
        int i17 = this.f54501c;
        View view = dVar.f57091e0;
        int iF2 = b.c0.F(i12);
        if (iF2 == 0) {
            iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(i14, 1073741824);
        } else if (iF2 == 1) {
            iMakeMeasureSpec = ViewGroup.getChildMeasureSpec(this.f54503e, i17, -2);
        } else if (iF2 != 2) {
            if (iF2 != 3) {
                iMakeMeasureSpec2 = 0;
            } else {
                int i18 = this.f54503e;
                int i19 = cVar2 != null ? cVar2.f57079g : 0;
                if (cVar != null) {
                    i19 += cVar.f57079g;
                }
                iMakeMeasureSpec2 = ViewGroup.getChildMeasureSpec(i18, i17 + i19, -1);
            }
            iF = b.c0.F(i13);
            if (iF != 0) {
                iMakeMeasureSpec3 = View.MeasureSpec.makeMeasureSpec(i15, 1073741824);
            } else if (iF == 1) {
                iMakeMeasureSpec3 = ViewGroup.getChildMeasureSpec(this.f54504f, i16, -2);
            } else {
                if (iF != 2) {
                    if (iF != 3) {
                        childMeasureSpec = 0;
                    } else {
                        int i21 = this.f54504f;
                        int i22 = cVar2 != null ? dVar.I.f57079g : 0;
                        if (cVar != null) {
                            i22 += dVar.K.f57079g;
                        }
                        childMeasureSpec = ViewGroup.getChildMeasureSpec(i21, i16 + i22, -1);
                    }
                    eVar = (g4.e) dVar.S;
                    if (eVar == null && g4.j.c(constraintLayout.f14189i, 256) && view.getMeasuredWidth() == dVar.n() && view.getMeasuredWidth() < eVar.n() && view.getMeasuredHeight() == dVar.k() && view.getMeasuredHeight() < eVar.k() && view.getBaseline() == dVar.Z && !dVar.w() && d(dVar.F, iMakeMeasureSpec2, dVar.n()) && d(dVar.G, childMeasureSpec, dVar.k())) {
                        bVar.f59090e = dVar.n();
                        bVar.f59091f = dVar.k();
                        bVar.f59092g = dVar.Z;
                        return;
                    }
                    boolean z12 = i12 == 3;
                    boolean z13 = i13 == 3;
                    boolean z14 = i13 == 4 || i13 == 1;
                    boolean z15 = i12 == 4 || i12 == 1;
                    boolean z16 = z12 && dVar.V > 0.0f;
                    boolean z17 = z13 && dVar.V > 0.0f;
                    if (view == null) {
                        return;
                    }
                    j4.e eVar2 = (j4.e) view.getLayoutParams();
                    int i23 = bVar.f59095j;
                    if (i23 != 1 && i23 != 2 && z12 && dVar.f57111q == 0 && z13 && dVar.f57112r == 0) {
                        iMax2 = 0;
                        z11 = false;
                        i5 = -1;
                        baseline = 0;
                        iMax = 0;
                    } else {
                        if ((view instanceof Flow) && (dVar instanceof g4.g)) {
                            ((Flow) view).l((g4.g) dVar, iMakeMeasureSpec2, childMeasureSpec);
                        } else {
                            view.measure(iMakeMeasureSpec2, childMeasureSpec);
                        }
                        dVar.F = iMakeMeasureSpec2;
                        dVar.G = childMeasureSpec;
                        dVar.f57094g = false;
                        int measuredWidth = view.getMeasuredWidth();
                        int measuredHeight = view.getMeasuredHeight();
                        baseline = view.getBaseline();
                        int i24 = dVar.f57114t;
                        iMax = i24 > 0 ? Math.max(i24, measuredWidth) : measuredWidth;
                        int i25 = dVar.f57115u;
                        if (i25 > 0) {
                            iMax = Math.min(i25, iMax);
                        }
                        int i26 = dVar.f57117w;
                        iMax2 = i26 > 0 ? Math.max(i26, measuredHeight) : measuredHeight;
                        int i27 = childMeasureSpec;
                        int i28 = dVar.f57118x;
                        if (i28 > 0) {
                            iMax2 = Math.min(i28, iMax2);
                        }
                        if (!g4.j.c(constraintLayout.f14189i, 1)) {
                            if (z16 && z14) {
                                iMax = (int) ((iMax2 * dVar.V) + 0.5f);
                            } else if (z17 && z15) {
                                iMax2 = (int) ((iMax / dVar.V) + 0.5f);
                            }
                        }
                        if (measuredWidth == iMax && measuredHeight == iMax2) {
                            z11 = false;
                        } else {
                            if (measuredWidth != iMax) {
                                iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(iMax, 1073741824);
                            }
                            int iMakeMeasureSpec4 = measuredHeight != iMax2 ? View.MeasureSpec.makeMeasureSpec(iMax2, 1073741824) : i27;
                            view.measure(iMakeMeasureSpec2, iMakeMeasureSpec4);
                            dVar.F = iMakeMeasureSpec2;
                            dVar.G = iMakeMeasureSpec4;
                            z11 = false;
                            dVar.f57094g = false;
                            iMax = view.getMeasuredWidth();
                            iMax2 = view.getMeasuredHeight();
                            baseline = view.getBaseline();
                        }
                        i5 = -1;
                    }
                    boolean z18 = baseline != i5 ? true : z11;
                    bVar.f59094i = (iMax == bVar.f59088c && iMax2 == bVar.f59089d) ? z11 : true;
                    if (eVar2.f68918c0) {
                        z18 = true;
                    }
                    if (z18 && baseline != -1 && dVar.Z != baseline) {
                        bVar.f59094i = true;
                    }
                    bVar.f59090e = iMax;
                    bVar.f59091f = iMax2;
                    bVar.f59093h = z18;
                    bVar.f59092g = baseline;
                    return;
                }
                iMakeMeasureSpec3 = ViewGroup.getChildMeasureSpec(this.f54504f, i16, -2);
                boolean z19 = dVar.f57112r == 1;
                int i29 = bVar.f59095j;
                if (i29 == 1 || i29 == 2) {
                    boolean z21 = view.getMeasuredWidth() == dVar.n();
                    if (bVar.f59095j == 2 || !z19 || ((z19 && z21) || dVar.y())) {
                        iMakeMeasureSpec3 = View.MeasureSpec.makeMeasureSpec(dVar.k(), 1073741824);
                    }
                }
            }
            childMeasureSpec = iMakeMeasureSpec3;
            eVar = (g4.e) dVar.S;
            if (eVar == null) {
            }
            if (i12 == 3) {
            }
            if (i13 == 3) {
            }
            if (i13 == 4) {
            }
            if (i12 == 4) {
            }
            if (z12) {
            }
            if (z13) {
            }
            if (view == null) {
            }
        } else {
            iMakeMeasureSpec = ViewGroup.getChildMeasureSpec(this.f54503e, i17, -2);
            boolean z22 = dVar.f57111q == 1;
            int i31 = bVar.f59095j;
            if (i31 == 1 || i31 == 2) {
                boolean z23 = view.getMeasuredHeight() == dVar.k();
                if (bVar.f59095j == 2 || !z22 || ((z22 && z23) || dVar.x())) {
                    iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(dVar.n(), 1073741824);
                }
            }
        }
        iMakeMeasureSpec2 = iMakeMeasureSpec;
        iF = b.c0.F(i13);
        if (iF != 0) {
        }
        childMeasureSpec = iMakeMeasureSpec3;
        eVar = (g4.e) dVar.S;
        if (eVar == null) {
        }
        if (i12 == 3) {
        }
        if (i13 == 3) {
        }
        if (i13 == 4) {
        }
        if (i12 == 4) {
        }
        if (z12) {
        }
        if (z13) {
        }
        if (view == null) {
        }
    }

    public boolean g() throws SQLException, IllegalArgumentException {
        SQLiteDatabase sQLiteDatabase = (SQLiteDatabase) this.f54506h;
        if (!bh.g.k0(sQLiteDatabase, "favorites_bakup") || e() != 1 || this.f54499a != this.f54502d || this.f54500b != this.f54503e || this.f54501c != this.f54504f) {
            return false;
        }
        b(sQLiteDatabase, "favorites_bakup", "favorites");
        return true;
    }

    public u(ConstraintLayout constraintLayout, ConstraintLayout constraintLayout2) {
        this.f54506h = constraintLayout;
        this.f54505g = constraintLayout2;
    }
}
