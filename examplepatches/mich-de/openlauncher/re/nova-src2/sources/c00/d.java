package c00;

import ads_mobile_sdk.zt3;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import android.util.SparseArray;
import b.c0;
import b.k9;
import b.n6;
import b3.x;
import c3.n3;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.internal.measurement.z6;
import e10.z2;
import g.p;
import ga.j;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import ke.k;
import ke.m;
import ke.o;
import kotlin.LazyKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import lh.i;
import mk.v;
import mk.w;
import o9.g3;
import rg.d0;
import rg.n;
import v2.t;

/* loaded from: classes4.dex */
public final class d implements n6, w4.c, ke.e, z8.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19043a;

    /* renamed from: b, reason: collision with root package name */
    public int f19044b;

    /* renamed from: c, reason: collision with root package name */
    public Object f19045c;

    /* renamed from: d, reason: collision with root package name */
    public Object f19046d;

    public /* synthetic */ d(int i5, boolean z11) {
        this.f19043a = i5;
    }

    public void A(Bundle bundle) {
        this.f19044b = 1;
        this.f19046d = bundle;
        for (Map.Entry entry : ((Map) this.f19045c).entrySet()) {
            ((n) entry.getValue()).b(bundle != null ? bundle.getBundle((String) entry.getKey()) : null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x0089 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x000c A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void B(int i5, int i11, Intent intent) {
        for (n nVar : ((Map) this.f19045c).values()) {
            AtomicReference atomicReference = nVar.f85897c;
            rg.e eVar = nVar.f85901g;
            AtomicReference atomicReference2 = nVar.f85897c;
            d0 d0Var = (d0) atomicReference.get();
            if (i5 != 1) {
                if (i5 == 2) {
                    int iB = nVar.f85899e.b(nVar.a(), pg.c.f82561a);
                    if (iB == 0) {
                        atomicReference2.set(null);
                        z6 z6Var = eVar.n;
                        z6Var.sendMessage(z6Var.obtainMessage(3));
                    } else if (d0Var == null || (d0Var.f85869b.f31779g == 18 && iB == 18)) {
                    }
                }
                if (d0Var == null) {
                    ConnectionResult connectionResult = d0Var.f85869b;
                    int i12 = d0Var.f85868a;
                    atomicReference2.set(null);
                    eVar.h(connectionResult, i12);
                }
            } else if (i11 == -1) {
                atomicReference2.set(null);
                z6 z6Var2 = eVar.n;
                z6Var2.sendMessage(z6Var2.obtainMessage(3));
            } else if (i11 == 0) {
                if (d0Var != null) {
                    ConnectionResult connectionResult2 = new ConnectionResult(intent != null ? intent.getIntExtra("<<ResolutionFailureErrorDetail>>", 13) : 13, null, d0Var.f85869b.toString());
                    int i13 = d0Var.f85868a;
                    atomicReference2.set(null);
                    eVar.h(connectionResult2, i13);
                }
            } else if (d0Var == null) {
            }
        }
    }

    public void C(Bundle bundle) {
        if (bundle == null) {
            return;
        }
        for (Map.Entry entry : ((Map) this.f19045c).entrySet()) {
            Bundle bundle2 = new Bundle();
            d0 d0Var = (d0) ((n) entry.getValue()).f85897c.get();
            if (d0Var != null) {
                ConnectionResult connectionResult = d0Var.f85869b;
                bundle2.putBoolean("resolving_error", true);
                bundle2.putInt("failed_client_id", d0Var.f85868a);
                bundle2.putInt("failed_status", connectionResult.f31779g);
                bundle2.putParcelable("failed_resolution", connectionResult.f31780h);
            }
            bundle.putBundle((String) entry.getKey(), bundle2);
        }
    }

    @Override // b.n6
    public byte a(zt3 zt3Var, int i5) {
        byte[] bArr = (byte[]) this.f19045c;
        int iC = i5 >>> (k9.c(((~143154913) & 992498304) | 439467622, (143154913 & 1627930754) | 1212551295, -122082883, 1967905751) ^ (2033018190 % 70061690));
        if (iC != this.f19044b) {
            ((x) this.f19046d).a(iC, bArr);
            this.f19044b = iC;
        }
        return (byte) (((zt3Var.a(i5) ^ bArr[i5 % 8]) << 24) >> 24);
    }

    public void b(int i5, String str) {
        d(2, str, i5);
    }

    public void d(int i5, String str, float f11) {
        yi.b bVar;
        int i11 = this.f19044b;
        yi.b[] bVarArr = (yi.b[]) this.f19046d;
        int length = ((bVarArr.length + i11) - 1) % bVarArr.length;
        int length2 = ((i11 + bVarArr.length) - 2) % bVarArr.length;
        yi.b bVar2 = bVarArr[length];
        if (bVar2 != null && bVar2.f97319a == i5 && bVar2.f97320b.equals(str) && (bVar = bVarArr[length2]) != null && bVar.f97319a == i5 && bVar.f97320b.equals(str)) {
            yi.b bVar3 = bVarArr[length];
            bVar3.f97319a = i5;
            bVar3.f97320b = str;
            bVar3.f97321c = f11;
            bVar3.f97322d = System.currentTimeMillis();
            bVar3.f97323e = 0;
            bVarArr[length2].f97323e++;
            return;
        }
        int i12 = this.f19044b;
        if (bVarArr[i12] == null) {
            bVarArr[i12] = new yi.b();
        }
        yi.b bVar4 = bVarArr[i12];
        bVar4.f97319a = i5;
        bVar4.f97320b = str;
        bVar4.f97321c = f11;
        bVar4.f97322d = System.currentTimeMillis();
        bVar4.f97323e = 0;
        this.f19044b = (this.f19044b + 1) % bVarArr.length;
    }

    public void e(String str) {
        d(0, str, 0.0f);
    }

    public void f(String str, boolean z11) {
        d(z11 ? 3 : 4, str, 0.0f);
    }

    @Override // z8.b
    public void g(Drawable drawable) {
        j jVar = (j) this.f19045c;
        int i5 = this.f19044b;
        jVar.f57304r = BitmapInfo.a(z2.A(drawable, i5, i5));
        ((p) this.f19046d).run();
    }

    @Override // z8.b
    public void h(Drawable drawable) {
    }

    public void i(String str, Object... objArr) {
        if (this.f19044b <= 3) {
            if (objArr.length > 0) {
                str = String.format(Locale.US, str, objArr);
            }
            ((String) this.f19046d).concat(str);
        }
    }

    @Override // ke.e
    public ke.d j(k kVar, long j11) {
        long position = kVar.getPosition();
        long jM = m(kVar);
        long jG = kVar.g();
        kVar.k(Math.max(6, ((o) this.f19045c).f71413c));
        long jM2 = m(kVar);
        return (jM > j11 || jM2 <= j11) ? jM2 <= j11 ? new ke.d(-2, jM2, kVar.g()) : new ke.d(-1, jM, position) : new ke.d(0, -9223372036854775807L, jG);
    }

    public void k(String str, PrintWriter printWriter) {
        printWriter.println(str + ((String) this.f19045c) + " event history:");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("  HH:mm:ss.SSSZ  ", Locale.US);
        Date date = new Date();
        int i5 = 0;
        while (true) {
            yi.b[] bVarArr = (yi.b[]) this.f19046d;
            if (i5 >= bVarArr.length) {
                return;
            }
            yi.b bVar = bVarArr[(((this.f19044b + bVarArr.length) - i5) - 1) % bVarArr.length];
            if (bVar != null) {
                date.setTime(bVar.f97322d);
                StringBuilder sb2 = new StringBuilder(str);
                sb2.append(simpleDateFormat.format(date));
                sb2.append(bVar.f97320b);
                int i11 = bVar.f97319a;
                if (i11 == 1) {
                    sb2.append(": ");
                    sb2.append(bVar.f97321c);
                } else if (i11 == 2) {
                    sb2.append(": ");
                    sb2.append((int) bVar.f97321c);
                } else if (i11 == 3) {
                    sb2.append(": true");
                } else if (i11 == 4) {
                    sb2.append(": false");
                }
                if (bVar.f97323e > 0) {
                    sb2.append(" & ");
                    sb2.append(bVar.f97323e);
                    sb2.append(" similar events");
                }
                printWriter.println(sb2);
            }
            i5++;
        }
    }

    public long m(k kVar) {
        int iC;
        m mVar = (m) this.f19046d;
        o oVar = (o) this.f19045c;
        while (kVar.g() < kVar.getLength() - 6) {
            int i5 = this.f19044b;
            long jG = kVar.g();
            byte[] bArr = new byte[2];
            int i11 = 0;
            boolean z11 = false;
            kVar.b(0, 2, bArr);
            if ((((bArr[0] & 255) << 8) | (bArr[1] & 255)) != i5) {
                kVar.e();
                kVar.k((int) (jG - kVar.getPosition()));
            } else {
                com.google.android.gms.internal.consent_sdk.a aVar = new com.google.android.gms.internal.consent_sdk.a(16);
                System.arraycopy(bArr, 0, (byte[]) aVar.f31986d, 0, 2);
                byte[] bArr2 = (byte[]) aVar.f31986d;
                while (i11 < 14 && (iC = kVar.c(2 + i11, 14 - i11, bArr2)) != -1) {
                    i11 += iC;
                }
                aVar.X(i11);
                kVar.e();
                kVar.k((int) (jG - kVar.getPosition()));
                z11 = v.z(aVar, oVar, i5, mVar);
            }
            if (z11) {
                break;
            }
            kVar.k(1);
        }
        if (kVar.g() < kVar.getLength() - 6) {
            return mVar.f71407a;
        }
        kVar.k((int) (kVar.getLength() - kVar.g()));
        return oVar.f71420j;
    }

    public Object n(int i5) {
        SparseArray sparseArray = (SparseArray) this.f19045c;
        if (this.f19044b == -1) {
            this.f19044b = 0;
        }
        while (true) {
            int i11 = this.f19044b;
            if (i11 <= 0 || i5 >= sparseArray.keyAt(i11)) {
                break;
            }
            this.f19044b--;
        }
        while (this.f19044b < sparseArray.size() - 1 && i5 >= sparseArray.keyAt(this.f19044b + 1)) {
            this.f19044b++;
        }
        return sparseArray.valueAt(this.f19044b);
    }

    public int o() {
        return this.f19044b;
    }

    @Override // w4.c
    public void onCancel() {
        synchronized (((io.branch.requery.android.database.sqlite.h) this.f19046d).f61839b) {
            try {
                io.branch.requery.android.database.sqlite.g gVar = (io.branch.requery.android.database.sqlite.g) this.f19045c;
                if (gVar.f61837j == this.f19044b) {
                    io.branch.requery.android.database.sqlite.h.a((io.branch.requery.android.database.sqlite.h) this.f19046d, gVar);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public CharSequence[] p() {
        return (CharSequence[]) this.f19045c;
    }

    public SharedPreferences q() {
        Object value = ((a70.d) this.f19046d).getValue();
        Intrinsics.f(value, "getValue(...)");
        return (SharedPreferences) value;
    }

    public boolean r() {
        return (this.f19044b & 2) > 0 && ((CharSequence[]) this.f19045c)[0] != null;
    }

    public boolean s() {
        for (CharSequence charSequence : (CharSequence[]) this.f19045c) {
            if (charSequence != null && !TextUtils.isEmpty(charSequence)) {
                return true;
            }
        }
        return false;
    }

    public synchronized void t() {
        if (((LinkedHashMap) this.f19045c).isEmpty()) {
            Context context = (Context) this.f19046d;
            h30.k kVar = new h30.k();
            kVar.f59085a = context;
            ((LinkedHashMap) this.f19045c).put("uri", kVar);
            if (this.f19044b > 0) {
                Iterator it = ((LinkedHashMap) this.f19045c).values().iterator();
                while (it.hasNext()) {
                    ((h30.k) it.next()).getClass();
                }
            }
        }
    }

    public String toString() {
        switch (this.f19043a) {
            case 14:
                return c0.m("status=", Integer.toBinaryString(this.f19044b), ", labels=", Arrays.toString((CharSequence[]) this.f19045c));
            default:
                return super.toString();
        }
    }

    @Override // z8.b
    public void u(Drawable drawable) {
    }

    /* JADX WARN: Removed duplicated region for block: B:73:0x01ee  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public LinkedHashMap v() throws Exception {
        AppWidgetManager appWidgetManager;
        LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfoE;
        int i5;
        int i11;
        Point point;
        Cursor cursorQuery = ((SQLiteDatabase) this.f19045c).query("favorites", new String[]{"_id", "itemType", "screen", "cellX", "cellY", "spanX", "spanY", "intent", "appWidgetProvider", "appWidgetId", "title"}, "container = -100", null, null, null, null);
        int columnIndexOrThrow = cursorQuery.getColumnIndexOrThrow("_id");
        int columnIndexOrThrow2 = cursorQuery.getColumnIndexOrThrow("itemType");
        int columnIndexOrThrow3 = cursorQuery.getColumnIndexOrThrow("screen");
        int columnIndexOrThrow4 = cursorQuery.getColumnIndexOrThrow("cellX");
        int columnIndexOrThrow5 = cursorQuery.getColumnIndexOrThrow("cellY");
        int columnIndexOrThrow6 = cursorQuery.getColumnIndexOrThrow("spanX");
        int columnIndexOrThrow7 = cursorQuery.getColumnIndexOrThrow("spanY");
        int columnIndexOrThrow8 = cursorQuery.getColumnIndexOrThrow("intent");
        int columnIndexOrThrow9 = cursorQuery.getColumnIndexOrThrow("appWidgetProvider");
        int columnIndexOrThrow10 = cursorQuery.getColumnIndexOrThrow("appWidgetId");
        int columnIndexOrThrow11 = cursorQuery.getColumnIndexOrThrow("title");
        ya.p pVar = new ya.p();
        Context context = (Context) this.f19046d;
        AppWidgetManager appWidgetManager2 = AppWidgetManager.getInstance(context);
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        while (cursorQuery.moveToNext()) {
            LinkedHashMap linkedHashMap2 = linkedHashMap;
            c cVar = new c();
            new LinkedHashMap();
            cVar.f57289a = cursorQuery.getInt(columnIndexOrThrow);
            cVar.f57290b = cursorQuery.getInt(columnIndexOrThrow2);
            int i12 = cursorQuery.getInt(columnIndexOrThrow3);
            cVar.f57292d = i12;
            int i13 = columnIndexOrThrow;
            this.f19044b = Math.max(this.f19044b, i12);
            int i14 = columnIndexOrThrow2;
            float f11 = 2;
            cVar.f57293e = new n30.a(MathKt.b(cursorQuery.getFloat(columnIndexOrThrow4) * f11));
            cVar.f57294f = new n30.a(MathKt.b(cursorQuery.getFloat(columnIndexOrThrow5) * f11));
            n30.b bVar = n30.b.f77778b;
            cVar.f57295g = fg.a.l(cursorQuery.getFloat(columnIndexOrThrow6));
            cVar.f57296h = fg.a.l(cursorQuery.getFloat(columnIndexOrThrow7));
            String string = cursorQuery.getString(columnIndexOrThrow11);
            if (string == null && (string = cursorQuery.getString(columnIndexOrThrow9)) == null) {
                string = cursorQuery.getString(columnIndexOrThrow8);
            }
            cVar.f57300l = string;
            try {
                int i15 = cVar.f57290b;
                if (i15 == 0 || i15 == 1) {
                    cVar.f19042r = cursorQuery.getString(columnIndexOrThrow8);
                    if (!linkedHashMap2.containsKey(Integer.valueOf(cVar.f57292d))) {
                        linkedHashMap2.put(Integer.valueOf(cVar.f57292d), new ArrayList());
                    }
                    Object obj = linkedHashMap2.get(Integer.valueOf(cVar.f57292d));
                    Intrinsics.d(obj);
                    ((List) obj).add(cVar);
                    linkedHashMap = linkedHashMap2;
                    columnIndexOrThrow = i13;
                } else {
                    if (i15 != 2) {
                        if (i15 == 4 || i15 == 5) {
                            String string2 = cursorQuery.getString(columnIndexOrThrow9);
                            Intrinsics.d(string2);
                            ComponentName.unflattenFromString(string2);
                            int i16 = cursorQuery.getInt(columnIndexOrThrow10);
                            if (i16 <= -100) {
                                launcherAppWidgetProviderInfoE = ((bb.b) bb.b.f17790h.h(context)).a(i16);
                                appWidgetManager = appWidgetManager2;
                            } else {
                                appWidgetManager = appWidgetManager2;
                                AppWidgetProviderInfo appWidgetInfo = appWidgetManager.getAppWidgetInfo(i16);
                                launcherAppWidgetProviderInfoE = appWidgetInfo == null ? null : LauncherAppWidgetProviderInfo.e(context, appWidgetInfo);
                            }
                            if (launcherAppWidgetProviderInfoE != null) {
                                try {
                                    appWidgetManager2 = appWidgetManager;
                                    int i17 = ((AppWidgetProviderInfo) launcherAppWidgetProviderInfoE).resizeMode;
                                    if ((i17 & 1) != 0) {
                                        i5 = i17;
                                        i11 = launcherAppWidgetProviderInfoE.f21315c;
                                    } else {
                                        i5 = i17;
                                        i11 = -1;
                                    }
                                    point = new Point(i11, (i5 & 2) != 0 ? launcherAppWidgetProviderInfoE.f21316d : -1);
                                } catch (Exception e3) {
                                    e = e3;
                                    appWidgetManager2 = appWidgetManager;
                                    mc0.d.f76206a.c(e, c0.h(cVar.f57289a, "Removing item "), new Object[0]);
                                    pVar.c(cVar.f57289a);
                                    cursorQuery = cursorQuery;
                                    columnIndexOrThrow = i13;
                                    linkedHashMap = linkedHashMap2;
                                    columnIndexOrThrow2 = i14;
                                }
                            } else {
                                appWidgetManager2 = appWidgetManager;
                                point = null;
                            }
                            if (point != null) {
                                int i18 = point.x;
                                cVar.f57297i = i18 > 0 ? fg.a.l(i18) : cVar.f57295g;
                                int i19 = point.y;
                                cVar.f57298j = i19 > 0 ? fg.a.l(i19) : cVar.f57296h;
                                if (cVar.f57297i.a() > cVar.f57295g.a()) {
                                    cVar.f57297i = cVar.f57295g;
                                }
                                if (cVar.f57298j.a() > cVar.f57296h.a()) {
                                    cVar.f57298j = cVar.f57296h;
                                }
                            } else {
                                n30.b bVarL = fg.a.l(1.0f);
                                cVar.f57298j = bVarL;
                                cVar.f57297i = bVarL;
                            }
                        } else {
                            if (i15 != 6) {
                                throw new Exception("Invalid item type");
                            }
                            cVar.f19042r = cursorQuery.getString(columnIndexOrThrow8);
                        }
                    }
                    if (!linkedHashMap2.containsKey(Integer.valueOf(cVar.f57292d))) {
                    }
                    Object obj2 = linkedHashMap2.get(Integer.valueOf(cVar.f57292d));
                    Intrinsics.d(obj2);
                    ((List) obj2).add(cVar);
                    linkedHashMap = linkedHashMap2;
                    columnIndexOrThrow = i13;
                }
            } catch (Exception e11) {
                e = e11;
            }
            columnIndexOrThrow2 = i14;
        }
        LinkedHashMap linkedHashMap3 = linkedHashMap;
        ((SQLiteDatabase) this.f19045c).delete("favorites", g3.e(pVar), null);
        cursorQuery.close();
        return linkedHashMap3;
    }

    public void w(int i5, CharSequence charSequence, Float f11) {
        CharSequence[] charSequenceArr = (CharSequence[]) this.f19045c;
        if (i5 < charSequenceArr.length) {
            charSequenceArr[i5] = charSequence;
            ((Float[]) this.f19046d)[i5] = f11;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0043  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void y(v2.m mVar) {
        n3 n3Var = (n3) this.f19045c;
        t tVar = (t) this.f19046d;
        t tVar2 = (t) mVar.f91975a.get(0);
        if (tVar == null || tVar2.f91991b - tVar.f91991b >= n3Var.a()) {
            this.f19044b = 1;
        } else {
            if (h2.b.c(h2.b.f(tVar.e(), tVar2.e())) < g0.x.e(n3Var, tVar.j())) {
                this.f19044b++;
            }
        }
        this.f19046d = tVar2;
    }

    public void z(n nVar) {
        Map map = (Map) this.f19045c;
        if (map.containsKey("ConnectionlessLifecycleHelper")) {
            StringBuilder sb2 = new StringBuilder("ConnectionlessLifecycleHelper".length() + 59);
            sb2.append("LifecycleCallback with tag ConnectionlessLifecycleHelper already added to this fragment.");
            throw new IllegalArgumentException(sb2.toString());
        }
        map.put("ConnectionlessLifecycleHelper", nVar);
        if (this.f19044b > 0) {
            new i(Looper.getMainLooper()).post(new w((Object) this, (Object) nVar, false, 19));
        }
    }

    public d(int i5) {
        this.f19043a = i5;
        switch (i5) {
            case 14:
                this.f19044b = 0;
                this.f19045c = new CharSequence[4];
                this.f19046d = new Float[4];
                break;
            default:
                this.f19045c = Collections.synchronizedMap(new z.e(0));
                this.f19044b = 0;
                break;
        }
    }

    @Override // b.n6
    public zt3 a(zt3 zt3Var, int i5, int i11) {
        byte[] bArr;
        if (i5 < 0 || i5 > i11 || i11 > zt3Var.f12665a.length) {
            throw new IndexOutOfBoundsException();
        }
        int i12 = i11 - i5;
        byte[] bArr2 = new byte[i12];
        int i13 = 0;
        while (i5 < i11) {
            bArr2[i13] = a(zt3Var, i5);
            i5++;
            i13++;
        }
        if (i12 == 0) {
            bArr = new byte[0];
        } else {
            bArr = new byte[i12];
            System.arraycopy(bArr2, 0, bArr, 0, i12);
        }
        return new zt3(bArr);
    }

    public d(x xVar) {
        this.f19043a = 1;
        this.f19044b = k9.c(((~1539942439) & 2070175971) | 1100945533, (1539942439 & (-1166483302)) | (-2145608135), 164110942, 67728125) ^ (1143565421 % 981914693);
        this.f19045c = new byte[8];
        this.f19046d = xVar;
    }

    @Override // b.n6
    public /* bridge */ /* synthetic */ n6 a() {
        return new d((x) this.f19046d);
    }

    public d(String str, String[] strArr) {
        String string;
        this.f19043a = 13;
        if (strArr.length == 0) {
            string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
            for (String str2 : strArr) {
                if (sb2.length() > 1) {
                    sb2.append(",");
                }
                sb2.append(str2);
            }
            sb2.append("] ");
            string = sb2.toString();
        }
        this.f19046d = string;
        this.f19045c = str;
        sg.w.b("tag \"%s\" is longer than the %d character maximum", new Object[]{str, 23}, str.length() <= 23);
        int i5 = 2;
        while (i5 <= 7 && !Log.isLoggable((String) this.f19045c, i5)) {
            i5++;
        }
        this.f19044b = i5;
    }

    public d(String str, int i5) {
        this.f19043a = 15;
        this.f19044b = 0;
        this.f19045c = str;
        this.f19046d = new yi.b[i5];
    }

    public d(ge.d dVar) {
        this.f19043a = 5;
        this.f19045c = new SparseArray();
        this.f19046d = dVar;
        this.f19044b = -1;
    }

    public d(o oVar, int i5) {
        this.f19043a = 8;
        this.f19045c = oVar;
        this.f19044b = i5;
        this.f19046d = new m();
    }

    public d(Context context, int i5, CoroutineContext coroutineContext) {
        this.f19043a = 12;
        this.f19044b = i5;
        this.f19045c = coroutineContext;
        this.f19046d = LazyKt.a(new n00.d(context, 7));
    }

    public d(Context context) {
        this.f19043a = 6;
        this.f19044b = 0;
        this.f19045c = new LinkedHashMap();
        this.f19046d = context.getApplicationContext();
        new Handler(context.getMainLooper());
    }

    public d(SQLiteDatabase sQLiteDatabase, Context context) {
        this.f19043a = 0;
        this.f19045c = sQLiteDatabase;
        this.f19046d = context;
        this.f19044b = -1;
    }

    public d(n3 n3Var) {
        this.f19043a = 4;
        this.f19045c = n3Var;
    }

    public d(io.branch.requery.android.database.sqlite.h hVar, io.branch.requery.android.database.sqlite.g gVar, int i5) {
        this.f19043a = 7;
        this.f19046d = hVar;
        this.f19045c = gVar;
        this.f19044b = i5;
    }

    public d(j jVar, int i5, p pVar) {
        this.f19043a = 9;
        this.f19045c = jVar;
        this.f19044b = i5;
        this.f19046d = pVar;
    }
}
