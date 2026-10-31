package aa;

import ads_mobile_sdk.c7;
import ads_mobile_sdk.pa1;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Bitmap;
import android.graphics.BlurMaskFilter;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteException;
import android.util.Log;
import b.p6;
import b.t2;
import b.t5;
import com.android.launcher3.allapps.AllAppsContainerView;
import com.android.launcher3.allapps.WorkModeSwitch;
import h6.c1;
import i2.r0;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeMap;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class m0 implements i2.l0 {

    /* renamed from: a, reason: collision with root package name */
    public int f618a;

    /* renamed from: b, reason: collision with root package name */
    public Object f619b;

    /* renamed from: c, reason: collision with root package name */
    public Object f620c;

    /* renamed from: d, reason: collision with root package name */
    public Object f621d;

    /* renamed from: e, reason: collision with root package name */
    public Object f622e;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public m0(androidx.room.d configuration, androidx.room.r rVar, String str, String str2) {
        this(rVar.version, 2);
        Intrinsics.g(configuration, "configuration");
        this.f619b = configuration;
        this.f620c = rVar;
        this.f621d = str;
        this.f622e = str2;
    }

    public static void b(String str) {
        if (str.equalsIgnoreCase(":memory:")) {
            return;
        }
        int length = str.length() - 1;
        int i5 = 0;
        boolean z11 = false;
        while (i5 <= length) {
            boolean z12 = Intrinsics.h(str.charAt(!z11 ? i5 : length), 32) <= 0;
            if (z11) {
                if (!z12) {
                    break;
                } else {
                    length--;
                }
            } else if (z12) {
                i5++;
            } else {
                z11 = true;
            }
        }
        if (str.subSequence(i5, length + 1).toString().length() == 0) {
            return;
        }
        Log.w("SupportSQLite", "deleting the database file: ".concat(str));
        try {
            SQLiteDatabase.deleteDatabase(new File(str));
        } catch (Exception e3) {
            Log.w("SupportSQLite", "delete failed: ", e3);
        }
    }

    public c7 a() throws RemoteException {
        if (this.f618a != 2 || ((p6) this.f621d) == null || ((pa1) this.f622e) == null) {
            throw new IllegalStateException("Service not connected. Please start a connection before using the service.");
        }
        Bundle bundle = new Bundle();
        bundle.putString("package_name", (String) this.f620c);
        try {
            t5 t5Var = (t5) ((p6) this.f621d);
            t5Var.getClass();
            Parcel parcelObtain = Parcel.obtain();
            parcelObtain.writeInterfaceToken(t5Var.f74936c);
            parcelObtain.writeInt(1);
            bundle.writeToParcel(parcelObtain, 0);
            Parcel parcelA = t5Var.a(parcelObtain, 1);
            Parcelable parcelable = parcelA.readInt() == 0 ? null : (Parcelable) Bundle.CREATOR.createFromParcel(parcelA);
            parcelA.recycle();
            return new c7((Bundle) parcelable, 14);
        } catch (RemoteException e3) {
            t2.V("RemoteException getting install referrer information");
            this.f618a = 0;
            throw e3;
        }
    }

    public synchronized void c(Bitmap bitmap, BlurMaskFilter blurMaskFilter, Canvas canvas) {
        int[] iArr = (int[]) this.f622e;
        ((Paint) this.f619b).setMaskFilter(blurMaskFilter);
        Bitmap bitmapExtractAlpha = bitmap.extractAlpha((Paint) this.f619b, iArr);
        ((Paint) this.f620c).setAlpha(25);
        canvas.drawBitmap(bitmapExtractAlpha, iArr[0], iArr[1], (Paint) this.f620c);
        ((Paint) this.f620c).setAlpha(7);
        canvas.drawBitmap(bitmapExtractAlpha, iArr[0], (this.f618a * 0.020833334f) + iArr[1], (Paint) this.f620c);
    }

    public long d() {
        return r0.b(((Paint) this.f619b).getColor());
    }

    public int e() {
        Paint.Cap strokeCap = ((Paint) this.f619b).getStrokeCap();
        int i5 = strokeCap == null ? -1 : i2.g.f61112a[strokeCap.ordinal()];
        if (i5 == 1) {
            return 0;
        }
        if (i5 != 2) {
            return i5 != 3 ? 0 : 2;
        }
        return 1;
    }

    public int f() {
        Paint.Join strokeJoin = ((Paint) this.f619b).getStrokeJoin();
        int i5 = strokeJoin == null ? -1 : i2.g.f61113b[strokeJoin.ordinal()];
        if (i5 == 1) {
            return 0;
        }
        if (i5 != 2) {
            return i5 != 3 ? 0 : 1;
        }
        return 2;
    }

    public void g(e7.d dVar) {
    }

    public void h(e7.d dVar) throws IOException {
        androidx.room.r rVar = (androidx.room.r) this.f620c;
        Cursor cursorQuery = dVar.query("SELECT count(*) FROM sqlite_master WHERE name != 'android_metadata'");
        try {
            boolean z11 = false;
            if (cursorQuery.moveToFirst()) {
                if (cursorQuery.getInt(0) == 0) {
                    z11 = true;
                }
            }
            cursorQuery.close();
            rVar.createAllTables(dVar);
            if (!z11) {
                androidx.room.s sVarOnValidateSchema = rVar.onValidateSchema(dVar);
                if (!sVarOnValidateSchema.f15264a) {
                    throw new IllegalStateException("Pre-packaged database has an invalid schema: " + sVarOnValidateSchema.f15265b);
                }
            }
            dVar.execSQL("CREATE TABLE IF NOT EXISTS room_master_table (id INTEGER PRIMARY KEY,identity_hash TEXT)");
            dVar.execSQL(mk.v.B((String) this.f621d));
            rVar.onCreate(dVar);
        } finally {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0020  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void i(e7.d dVar) throws IOException {
        boolean z11;
        androidx.room.r rVar = (androidx.room.r) this.f620c;
        String str = (String) this.f621d;
        Cursor cursorQuery = dVar.query("SELECT 1 FROM sqlite_master WHERE type = 'table' AND name='room_master_table'");
        try {
            if (cursorQuery.moveToFirst()) {
                z11 = cursorQuery.getInt(0) != 0;
            }
            cursorQuery.close();
            if (z11) {
                Cursor cursorQuery2 = dVar.query(new x7.l("SELECT identity_hash FROM room_master_table WHERE id = 42 LIMIT 1"));
                try {
                    String string = cursorQuery2.moveToFirst() ? cursorQuery2.getString(0) : null;
                    cursorQuery2.close();
                    if (!str.equals(string) && !((String) this.f622e).equals(string)) {
                        throw new IllegalStateException(b.c0.m("Room cannot verify the data integrity. Looks like you've changed schema but forgot to update the version number. You can simply fix this by increasing the version number. Expected identity hash: ", str, ", found: ", string));
                    }
                } finally {
                }
            } else {
                androidx.room.s sVarOnValidateSchema = rVar.onValidateSchema(dVar);
                if (!sVarOnValidateSchema.f15264a) {
                    throw new IllegalStateException("Pre-packaged database has an invalid schema: " + sVarOnValidateSchema.f15265b);
                }
                rVar.onPostMigrate(dVar);
                dVar.execSQL("CREATE TABLE IF NOT EXISTS room_master_table (id INTEGER PRIMARY KEY,identity_hash TEXT)");
                dVar.execSQL(mk.v.B(str));
            }
            rVar.onOpen(dVar);
            this.f619b = null;
        } finally {
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0038  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0083 A[EDGE_INSN: B:70:0x0083->B:37:0x0083 BREAK  A[LOOP:1: B:12:0x0022->B:73:?], SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void j(e7.d dVar, int i5, int i11) {
        Set set;
        Iterable iterable;
        TreeMap treeMap;
        boolean z11;
        androidx.room.r rVar = (androidx.room.r) this.f620c;
        androidx.room.d dVar2 = (androidx.room.d) this.f619b;
        if (dVar2 != null) {
            a0.b bVar = dVar2.f15207d;
            bVar.getClass();
            if (i5 == i11) {
                iterable = EmptyList.f71733a;
            } else {
                boolean z12 = i11 > i5;
                ArrayList arrayList = new ArrayList();
                int iIntValue = i5;
                do {
                    if (z12) {
                        if (iIntValue >= i11) {
                            iterable = arrayList;
                            break;
                        }
                        treeMap = (TreeMap) bVar.f57a.get(Integer.valueOf(iIntValue));
                        if (treeMap == null) {
                            break;
                        }
                        for (Integer targetVersion : z12 ? treeMap.descendingKeySet() : treeMap.keySet()) {
                            if (z12) {
                                int i12 = iIntValue + 1;
                                Intrinsics.f(targetVersion, "targetVersion");
                                int iIntValue2 = targetVersion.intValue();
                                if (i12 <= iIntValue2 && iIntValue2 <= i11) {
                                    Object obj = treeMap.get(targetVersion);
                                    Intrinsics.d(obj);
                                    arrayList.add(obj);
                                    iIntValue = targetVersion.intValue();
                                    z11 = true;
                                    break;
                                }
                            } else {
                                Intrinsics.f(targetVersion, "targetVersion");
                                int iIntValue3 = targetVersion.intValue();
                                if (i11 <= iIntValue3 && iIntValue3 < iIntValue) {
                                    Object obj2 = treeMap.get(targetVersion);
                                    Intrinsics.d(obj2);
                                    arrayList.add(obj2);
                                    iIntValue = targetVersion.intValue();
                                    z11 = true;
                                    break;
                                    break;
                                }
                            }
                        }
                        z11 = false;
                    } else {
                        if (iIntValue <= i11) {
                            iterable = arrayList;
                            break;
                        }
                        treeMap = (TreeMap) bVar.f57a.get(Integer.valueOf(iIntValue));
                        if (treeMap == null) {
                        }
                    }
                } while (z11);
                iterable = null;
            }
            if (iterable != null) {
                rVar.onPreMigrate(dVar);
                Iterator it = iterable.iterator();
                while (it.hasNext()) {
                    ((y6.a) it.next()).a(dVar);
                }
                androidx.room.s sVarOnValidateSchema = rVar.onValidateSchema(dVar);
                if (!sVarOnValidateSchema.f15264a) {
                    throw new IllegalStateException("Migration didn't properly handle: " + sVarOnValidateSchema.f15265b);
                }
                rVar.onPostMigrate(dVar);
                dVar.execSQL("CREATE TABLE IF NOT EXISTS room_master_table (id INTEGER PRIMARY KEY,identity_hash TEXT)");
                dVar.execSQL(mk.v.B((String) this.f621d));
                return;
            }
        }
        androidx.room.d dVar3 = (androidx.room.d) this.f619b;
        if (dVar3 == null || ((i5 <= i11 || !dVar3.f15214k) && dVar3.f15213j && ((set = dVar3.f15215l) == null || !set.contains(Integer.valueOf(i5))))) {
            throw new IllegalStateException(c1.n(i5, "A migration from ", " to ", i11, " was required but not found. Please provide the necessary Migration path via RoomDatabase.Builder.addMigration(Migration ...) or allow for destructive migrations via one of the RoomDatabase.Builder.fallbackToDestructiveMigration* methods."));
        }
        rVar.dropAllTables(dVar);
        rVar.createAllTables(dVar);
    }

    public synchronized Bitmap k(Drawable drawable) {
        Bitmap bitmapCreateBitmap;
        int i5 = this.f618a;
        Bitmap.Config config = Bitmap.Config.ARGB_8888;
        Bitmap bitmapCreateBitmap2 = Bitmap.createBitmap(i5, i5, config);
        Canvas canvas = new Canvas(bitmapCreateBitmap2);
        Rect rect = new Rect();
        rect.set(drawable.getBounds());
        int i11 = this.f618a;
        drawable.setBounds(0, 0, i11, i11);
        drawable.draw(canvas);
        drawable.setBounds(rect);
        int i12 = this.f618a;
        bitmapCreateBitmap = Bitmap.createBitmap(i12, i12, config);
        canvas.setBitmap(bitmapCreateBitmap);
        l(bitmapCreateBitmap2, canvas);
        return bitmapCreateBitmap;
    }

    public synchronized void l(Bitmap bitmap, Canvas canvas) {
        BlurMaskFilter blurMaskFilter = (BlurMaskFilter) this.f621d;
        synchronized (this) {
            c(bitmap, blurMaskFilter, canvas);
            ((Paint) this.f620c).setAlpha(255);
            canvas.drawBitmap(bitmap, 0.0f, 0.0f, (Paint) this.f620c);
        }
    }

    public void m(float f11) {
        ((Paint) this.f619b).setAlpha((int) Math.rint(f11 * 255.0f));
    }

    public void n(int i5) {
        if (this.f618a == i5) {
            return;
        }
        this.f618a = i5;
        Paint paint = (Paint) this.f619b;
        if (Build.VERSION.SDK_INT >= 29) {
            ic.b.R(i5, paint);
        } else {
            paint.setXfermode(new PorterDuffXfermode(r0.s(i5)));
        }
    }

    public void o(long j11) {
        ((Paint) this.f619b).setColor(r0.r(j11));
    }

    public void p(i2.t tVar) {
        this.f621d = tVar;
        ((Paint) this.f619b).setColorFilter(tVar != null ? tVar.f61166a : null);
    }

    public void q(int i5) {
        ((Paint) this.f619b).setFilterBitmap(!(i5 == 0));
    }

    public void r(i2.o0 o0Var) {
        i2.i iVar = (i2.i) o0Var;
        ((Paint) this.f619b).setPathEffect(iVar != null ? iVar.a() : null);
        this.f622e = o0Var;
    }

    public void s(Shader shader) {
        this.f620c = shader;
        ((Paint) this.f619b).setShader(shader);
    }

    public void t(int i5) {
        ((Paint) this.f619b).setStrokeCap(i5 == 2 ? Paint.Cap.SQUARE : i5 == 1 ? Paint.Cap.ROUND : i5 == 0 ? Paint.Cap.BUTT : Paint.Cap.BUTT);
    }

    public void u(int i5) {
        ((Paint) this.f619b).setStrokeJoin(i5 == 0 ? Paint.Join.MITER : i5 == 2 ? Paint.Join.BEVEL : i5 == 1 ? Paint.Join.ROUND : Paint.Join.MITER);
    }

    public void v(float f11) {
        ((Paint) this.f619b).setStrokeMiter(f11);
    }

    public void w(float f11) {
        ((Paint) this.f619b).setStrokeWidth(f11);
    }

    public void x(int i5) {
        ((Paint) this.f619b).setStyle(i5 == 1 ? Paint.Style.STROKE : Paint.Style.FILL);
    }

    public void y(int i5) {
        this.f618a = i5;
        ((q9.z) this.f621d).f83901a = i5;
        AllAppsContainerView allAppsContainerView = (AllAppsContainerView) this.f620c;
        if (allAppsContainerView.g() != null) {
            allAppsContainerView.g().f83830d.b();
        }
        WorkModeSwitch workModeSwitch = (WorkModeSwitch) this.f622e;
        if (workModeSwitch != null) {
            workModeSwitch.b(i5 == 1);
        }
    }

    public m0(Paint paint) {
        this.f619b = paint;
        this.f618a = 3;
    }

    public m0(int i5, int i11) {
        switch (i11) {
            case 2:
                this.f618a = i5;
                break;
            default:
                this.f622e = new int[2];
                this.f618a = i5;
                this.f619b = new Paint(3);
                this.f620c = new Paint(3);
                this.f621d = new BlurMaskFilter(i5 * 0.035f, BlurMaskFilter.Blur.NORMAL);
                break;
        }
    }
}
