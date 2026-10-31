package o9;

import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.LauncherApps;
import android.os.UserHandle;
import android.provider.Settings;
import android.text.TextUtils;
import com.android.launcher3.model.ModelDelegate;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

/* loaded from: classes.dex */
public final class c2 extends LauncherApps.Callback implements ja.b {

    /* renamed from: a, reason: collision with root package name */
    public final t1 f79787a;

    /* renamed from: c, reason: collision with root package name */
    public fa.e0 f79789c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f79790d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f79791e;

    /* renamed from: h, reason: collision with root package name */
    public final fa.d f79794h;

    /* renamed from: j, reason: collision with root package name */
    public final ModelDelegate f79796j;

    /* renamed from: b, reason: collision with root package name */
    public final Object f79788b = new Object();

    /* renamed from: f, reason: collision with root package name */
    public boolean f79792f = false;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f79793g = new ArrayList(1);

    /* renamed from: i, reason: collision with root package name */
    public final fa.q f79795i = new fa.q();

    /* renamed from: k, reason: collision with root package name */
    public final a90.d f79797k = new a90.d(this, 5);

    public c2(Context context, t1 t1Var, fz.d0 d0Var) {
        this.f79787a = t1Var;
        fa.d dVar = new fa.d(d0Var);
        this.f79794h = dVar;
        ModelDelegate modelDelegate = (ModelDelegate) ya.l0.e(ModelDelegate.class, context, 2132018630);
        modelDelegate.f21169a = t1Var;
        modelDelegate.f21170b = dVar;
        this.f79796j = modelDelegate;
    }

    public final boolean a(fa.p pVar) {
        boolean zO;
        synchronized (this.f79788b) {
            synchronized (this.f79793g) {
                this.f79793g.add(pVar);
            }
            zO = o(new fa.p[]{pVar});
        }
        return zO;
    }

    public final void b(String str, PrintWriter printWriter, String[] strArr) {
        if (strArr.length > 0 && TextUtils.equals(strArr[0], "--all")) {
            StringBuilder sbK = com.google.android.gms.internal.measurement.k2.k(str, "All apps list: size=");
            sbK.append(this.f79794h.f54373a.size());
            printWriter.println(sbK.toString());
            Iterator it = this.f79794h.f54373a.iterator();
            while (it.hasNext()) {
                ga.a aVar = (ga.a) it.next();
                StringBuilder sbK2 = com.google.android.gms.internal.measurement.k2.k(str, "   title=\"");
                sbK2.append((Object) aVar.f57300l);
                sbK2.append("\" bitmapIcon=");
                sbK2.append(aVar.f57304r.f21151a);
                sbK2.append(" componentName=");
                sbK2.append(aVar.f57279y.getPackageName());
                printWriter.println(sbK2.toString());
            }
            printWriter.println();
        }
        this.f79796j.getClass();
        fa.q qVar = this.f79795i;
        synchronized (qVar) {
            try {
                printWriter.println(str + "Data Model:");
                printWriter.println(str + " ---- workspace items ");
                for (int i5 = 0; i5 < qVar.f54465b.size(); i5++) {
                    printWriter.println(str + '\t' + ((ga.e) qVar.f54465b.get(i5)).toString());
                }
                printWriter.println(str + " ---- appwidget items ");
                for (int i11 = 0; i11 < qVar.f54466c.size(); i11++) {
                    printWriter.println(str + '\t' + ((ga.g) qVar.f54466c.get(i11)).toString());
                }
                printWriter.println(str + " ---- folder items ");
                for (int i12 = 0; i12 < qVar.f54467d.size(); i12++) {
                    printWriter.println(str + '\t' + ((ga.c) qVar.f54467d.valueAt(i12)).toString());
                }
                printWriter.println(str + " ---- items id map ");
                for (int i13 = 0; i13 < qVar.f54464a.size(); i13++) {
                    printWriter.println(str + '\t' + ((ga.e) qVar.f54464a.valueAt(i13)).toString());
                }
                if (strArr.length > 0 && TextUtils.equals(strArr[0], "--all")) {
                    printWriter.println(str + "shortcut counts ");
                    Iterator it2 = qVar.f54469f.values().iterator();
                    while (it2.hasNext()) {
                        printWriter.print(((Integer) it2.next()) + ", ");
                    }
                    printWriter.println();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void c(b2 b2Var) {
        if (this.f79792f) {
            return;
        }
        b2Var.D(this.f79787a, this, this.f79795i, this.f79794h, ya.j.f97147b);
        ya.j.f97149d.execute(b2Var);
    }

    public final void d() {
        mc0.d.f76206a.c(new Throwable(), "forceReload", new Object[0]);
        synchronized (this.f79788b) {
            p();
            this.f79791e = false;
        }
        if (i()) {
            o(new fa.p[0]);
        }
    }

    public final List e(Context context, boolean z11) {
        List list = (List) this.f79794h.f54373a.clone();
        if (!z11) {
            Iterator it = list.iterator();
            while (it.hasNext()) {
                if (((ga.a) it.next()) instanceof ga.c) {
                    it.remove();
                }
            }
        }
        Collections.sort(list, new q9.t(context));
        return list;
    }

    public final fa.p[] f() {
        fa.p[] pVarArr;
        synchronized (this.f79793g) {
            ArrayList arrayList = this.f79793g;
            pVarArr = (fa.p[]) arrayList.toArray(new fa.p[arrayList.size()]);
        }
        return pVarArr;
    }

    public final fa.p0 g(boolean z11, boolean z12, n1 n1Var) {
        return new fa.p0(this.f79787a.f80132a, this, this.f79795i, z11, z12, n1Var);
    }

    public final boolean h() {
        synchronized (this.f79795i) {
            try {
                Iterator it = this.f79795i.f54465b.iterator();
                while (it.hasNext()) {
                    ga.e eVar = (ga.e) it.next();
                    int i5 = eVar.f57291c;
                    if (i5 == -101) {
                        if (eVar.f57292d == 0 && e10.a3.f51435a.f51550f) {
                            if (eVar.d() != null && mx.c0.c(eVar.d()) == mx.c0.APP_DRAWER) {
                                return true;
                            }
                        }
                    } else if (i5 != -100) {
                        continue;
                    } else if (eVar.d() != null) {
                        continue;
                    }
                }
                return false;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final boolean i() {
        boolean z11;
        synchronized (this.f79793g) {
            z11 = !this.f79793g.isEmpty();
        }
        return z11;
    }

    public final boolean j() {
        boolean z11;
        synchronized (this.f79788b) {
            try {
                z11 = this.f79791e && this.f79789c == null && !this.f79792f;
            } finally {
            }
        }
        return z11;
    }

    public final void k(String str, UserHandle userHandle) {
        Context context = this.f79787a.f80132a;
        onPackageChanged(str, userHandle);
        androidx.room.h hVar = new androidx.room.h(context, userHandle);
        hVar.a(str, null);
        qa.b bVarC = hVar.c(2);
        if (bVarC.isEmpty()) {
            return;
        }
        c(new fa.y0(str, bVarC, userHandle, false));
    }

    public final void l(String[] strArr, UserHandle userHandle) {
        ea.b.a("Launcher.Model", "package removed received " + TextUtils.join(",", strArr));
        c(new fa.u0(3, userHandle, strArr));
    }

    public final void m(fa.p pVar) {
        synchronized (this.f79793g) {
            try {
                if (this.f79793g.remove(pVar) && p()) {
                    o(new fa.p[0]);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void n() {
        synchronized (this.f79788b) {
            p();
            this.f79791e = false;
        }
    }

    public final boolean o(fa.p[] pVarArr) {
        ((fa.x) fa.x.f54523e.h(this.f79787a.f80132a)).f54526c |= 2;
        synchronized (this.f79788b) {
            try {
                boolean zP = p();
                boolean z11 = this.f79791e && !this.f79790d;
                boolean z12 = zP || !z11 || pVarArr.length == 0;
                if (z12) {
                    pVarArr = f();
                }
                fa.p[] pVarArr2 = pVarArr;
                if (pVarArr2.length > 0) {
                    for (fa.p pVar : pVarArr2) {
                        ya.x xVar = ya.j.f97147b;
                        Objects.requireNonNull(pVar);
                        xVar.execute(new ae.m(pVar, 25));
                    }
                    t1 t1Var = this.f79787a;
                    fa.q qVar = this.f79795i;
                    fa.d dVar = this.f79794h;
                    ya.x xVar2 = ya.j.f97147b;
                    b90.p pVar2 = new b90.p(t1Var, qVar, dVar, pVarArr2, xVar2);
                    if (z11) {
                        pVar2.d(z12);
                        ga.a[] aVarArr = (ga.a[]) dVar.f54373a.toArray(ga.a.D);
                        Arrays.sort(aVarArr, ga.a.E);
                        xVar2.execute(new b80.a(5, pVar2, new fa.e(aVarArr, dVar.f54380h, 0)));
                        pVar2.c();
                        xVar2.execute(new b80.a(5, pVar2, new fa.l(qVar.f54470g.p(t1Var.f80132a), 1)));
                        return true;
                    }
                    p();
                    fa.e0 e0Var = new fa.e0(this.f79787a, this.f79794h, this.f79795i, this.f79796j, pVar2);
                    this.f79789c = e0Var;
                    ya.j.f97149d.a(e0Var);
                }
                return false;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackageAdded(String str, UserHandle userHandle) {
        c(new fa.u0(1, userHandle, str));
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackageChanged(String str, UserHandle userHandle) {
        if ("com.teslacoilsw.launcher".equals(str)) {
            return;
        }
        ContentResolver contentResolver = this.f79787a.f80132a.getContentResolver();
        String str2 = w20.m.f93701k;
        if (str2 != null) {
            try {
                if (Settings.System.getInt(contentResolver, str2) != 0) {
                    return;
                }
            } catch (Settings.SettingNotFoundException unused) {
            }
        }
        String str3 = w20.m.f93702l;
        if (str3 != null) {
            try {
                if (Settings.System.getInt(contentResolver, str3) != 0) {
                    return;
                }
            } catch (Settings.SettingNotFoundException unused2) {
            }
        }
        c(new fa.u0(2, userHandle, str));
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackageLoadingProgressChanged(String str, UserHandle userHandle, float f11) {
        if (g3.f79853h) {
            c(new fa.s(str, userHandle, f11));
        }
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackageRemoved(String str, UserHandle userHandle) {
        l(new String[]{str}, userHandle);
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackagesAvailable(String[] strArr, UserHandle userHandle, boolean z11) {
        c(new fa.u0(2, userHandle, strArr));
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackagesSuspended(String[] strArr, UserHandle userHandle) {
        c(new fa.u0(5, userHandle, strArr));
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackagesUnavailable(String[] strArr, UserHandle userHandle, boolean z11) {
        if (z11) {
            return;
        }
        c(new fa.u0(4, userHandle, strArr));
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackagesUnsuspended(String[] strArr, UserHandle userHandle) {
        c(new fa.u0(6, userHandle, strArr));
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onShortcutsChanged(String str, List list, UserHandle userHandle) {
        c(new fa.y0(str, list, userHandle, true));
    }

    public final boolean p() {
        synchronized (this.f79788b) {
            fa.e0 e0Var = this.f79789c;
            this.f79789c = null;
            if (e0Var == null) {
                return false;
            }
            synchronized (e0Var) {
                e0Var.f54398m = true;
                e0Var.notify();
            }
            return true;
        }
    }
}
