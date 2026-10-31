package fa;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.content.pm.PackageManager;
import android.os.LocaleList;
import android.os.Process;
import android.os.UserHandle;
import android.text.TextUtils;
import android.util.Log;
import com.android.launcher3.icons.BitmapInfo;
import com.facebook.ads.internal.util.common.FbValidationUtils;
import e10.a3;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.function.Consumer;
import nova.branch.engage.sesame_lite.internal.ingest.IngestibleAlias;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: k, reason: collision with root package name */
    public static final c f54372k = new c();

    /* renamed from: b, reason: collision with root package name */
    public final fz.d0 f54374b;

    /* renamed from: c, reason: collision with root package name */
    public final jz.g f54375c;

    /* renamed from: f, reason: collision with root package name */
    public x7.e f54378f;

    /* renamed from: g, reason: collision with root package name */
    public LocaleList f54379g;

    /* renamed from: h, reason: collision with root package name */
    public int f54380h;

    /* renamed from: j, reason: collision with root package name */
    public final List f54382j;

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f54373a = new ArrayList(42);

    /* renamed from: d, reason: collision with root package name */
    public boolean f54376d = false;

    /* renamed from: e, reason: collision with root package name */
    public Consumer f54377e = f54372k;

    /* renamed from: i, reason: collision with root package name */
    public ArrayList f54381i = new ArrayList();

    public d(fz.d0 d0Var) {
        Object[] objArr = {new IngestibleAlias("com.google.android.gm", "gMail", null, "Gmail"), new IngestibleAlias("com.infonow.bofa", "Bank of America", null, null), new IngestibleAlias("com.facebook.lite", "Facebook Lite", null, null), new IngestibleAlias("com.facebook.lite", "FaceBook Lite", null, "Facebook Lite"), new IngestibleAlias(FbValidationUtils.FB_PACKAGE, "FaceBook", null, "Facebook"), new IngestibleAlias("com.instagram.android", "InstaGram", null, "Instagram"), new IngestibleAlias("com.marriott.mrt", "Bonvoy Marriott", null, null), new IngestibleAlias("com.google.android.apps.youtube.music", "YouTube Music", null, null), new IngestibleAlias("com.x8bit.bitwarden", "BitWarden", null, null)};
        ArrayList arrayList = new ArrayList(9);
        for (int i5 = 0; i5 < 9; i5++) {
            Object obj = objArr[i5];
            Objects.requireNonNull(obj);
            arrayList.add(obj);
        }
        this.f54382j = Collections.unmodifiableList(arrayList);
        this.f54374b = d0Var;
        this.f54375c = jz.g.f70530a;
        LocaleList localeList = LocaleList.getDefault();
        this.f54379g = localeList;
        this.f54378f = new x7.e(localeList);
    }

    public final void a(ga.a aVar, LauncherActivityInfo launcherActivityInfo, boolean z11) {
        ComponentName componentName = aVar.f57279y;
        Objects.requireNonNull(componentName);
        this.f54375c.getClass();
        if ("com.google.android.googlequicksearchbox".equals(componentName.getPackageName()) && "com.google.android.googlequicksearchbox.VoiceSearchActivity".equals(componentName.getClassName())) {
            return;
        }
        ComponentName componentName2 = aVar.f57279y;
        Objects.requireNonNull(componentName2);
        if (d(componentName2, aVar.o) != null) {
            return;
        }
        if (z11) {
            this.f54374b.r(aVar, launcherActivityInfo, false);
            aVar.f57280z = this.f54378f.c(aVar);
        }
        this.f54373a.add(aVar);
        this.f54376d = true;
    }

    public final void b(iz.a aVar) {
        ComponentName componentNameI = aVar.i();
        this.f54375c.getClass();
        if (!("com.google.android.googlequicksearchbox".equals(componentNameI.getPackageName()) && "com.google.android.googlequicksearchbox.VoiceSearchActivity".equals(componentNameI.getClassName())) && d(aVar.i(), aVar.o) == null) {
            aVar.f57280z = this.f54378f.c(aVar);
            this.f54373a.add(aVar);
            this.f54376d = true;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0028  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final ga.a c(Context context, ja.d dVar, boolean z11) throws PackageManager.NameNotFoundException {
        ApplicationInfo applicationInfo;
        Context applicationContext = context.getApplicationContext();
        applicationContext.getPackageManager();
        try {
            applicationInfo = ((LauncherApps) applicationContext.getSystemService(LauncherApps.class)).getApplicationInfo((String) dVar.f69286e, 0, (UserHandle) dVar.f69287f);
        } catch (PackageManager.NameNotFoundException unused) {
        }
        if ((applicationInfo.flags & 8388608) != 0) {
            if (!applicationInfo.enabled) {
                applicationInfo = null;
            }
        }
        if (applicationInfo != null) {
            return null;
        }
        ga.a aVar = new ga.a(dVar);
        if (z11) {
            this.f54374b.t(aVar, aVar.L0());
            aVar.f57280z = this.f54378f.d(aVar.f57300l);
        }
        this.f54373a.add(aVar);
        this.f54376d = true;
        return aVar;
    }

    public final ga.a d(ComponentName componentName, UserHandle userHandle) {
        Iterator it = this.f54373a.iterator();
        while (it.hasNext()) {
            ga.a aVar = (ga.a) it.next();
            if (componentName.equals(aVar.f57279y) && userHandle.equals(aVar.o)) {
                return aVar;
            }
        }
        return null;
    }

    public final void e(int i5) {
        ga.a aVar = (ga.a) this.f54373a.remove(i5);
        if (aVar != null) {
            this.f54376d = true;
            this.f54377e.accept(aVar);
        }
    }

    public final void f(String str, UserHandle userHandle) {
        ArrayList arrayList = this.f54373a;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            ga.a aVar = (ga.a) arrayList.get(size);
            if (aVar.o.equals(userHandle) && str.equals(aVar.f57279y.getPackageName())) {
                e(size);
            }
        }
    }

    public final void g(int i5, boolean z11) {
        if (z11) {
            this.f54380h = i5 | this.f54380h;
        } else {
            this.f54380h = (~i5) & this.f54380h;
        }
        this.f54376d = true;
    }

    public final void h(ya.v vVar, ya.k kVar) {
        ArrayList arrayList = this.f54373a;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            ga.a aVar = (ga.a) arrayList.get(size);
            if (vVar.b(aVar, aVar.f57279y)) {
                aVar.f57305s = kVar.apply(aVar.f57305s);
                this.f54376d = true;
            }
        }
    }

    public final void i(Set set, UserHandle userHandle) {
        Iterator it = this.f54373a.iterator();
        while (it.hasNext()) {
            ga.a aVar = (ga.a) it.next();
            if (aVar.o.equals(userHandle) && set.contains(aVar.f57279y.getPackageName())) {
                CharSequence charSequence = aVar.f57300l;
                fz.d0 d0Var = this.f54374b;
                if (aVar instanceof iz.a) {
                    d0Var.getClass();
                } else {
                    synchronized (d0Var) {
                        ba.b bVarE = d0Var.e(aVar.f57279y, aVar.o, new aa.s(0), d0Var.o, null, false, aVar.L0());
                        BitmapInfo bitmapInfo = bVarE.f17734a;
                        if (bitmapInfo != null && !d0Var.x(bitmapInfo, aVar.o)) {
                            d0Var.c(bVarE, aVar);
                        }
                    }
                }
                if (TextUtils.equals(charSequence, aVar.f57300l)) {
                    this.f54381i.add(aVar);
                } else {
                    aVar.f57280z = this.f54378f.c(aVar);
                    this.f54376d = true;
                }
            }
        }
    }

    public final List j(Context context, String str, UserHandle userHandle) {
        List<LauncherActivityInfo> activityList = ((LauncherApps) context.getSystemService(LauncherApps.class)).getActivityList(str, userHandle);
        Intent intent = oz.a.f81126a;
        if (a3.f51435a.f51545a.getBoolean("show_launchers_in_drawer", false) && userHandle == Process.myUserHandle()) {
            List listA = oz.a.a(context, str);
            if (!listA.isEmpty()) {
                ArrayList arrayList = new ArrayList(activityList);
                arrayList.addAll(listA);
                activityList = arrayList;
            }
        }
        int size = activityList.size();
        fz.d0 d0Var = this.f54374b;
        ArrayList arrayList2 = this.f54373a;
        if (size > 0) {
            for (int size2 = arrayList2.size() - 1; size2 >= 0; size2--) {
                ga.a aVar = (ga.a) arrayList2.get(size2);
                if (userHandle.equals(aVar.o) && str.equals(aVar.f57279y.getPackageName())) {
                    ComponentName componentName = aVar.f57279y;
                    Iterator<LauncherActivityInfo> it = activityList.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            Log.w("AllAppsList", "Changing shortcut target due to app component name change.");
                            e(size2);
                            break;
                        }
                        if (it.next().getComponentName().equals(componentName)) {
                            break;
                        }
                    }
                }
            }
            for (LauncherActivityInfo launcherActivityInfo : activityList) {
                ga.a aVarD = d(launcherActivityInfo.getComponentName(), userHandle);
                if (aVarD == null) {
                    a(new ga.a(context, launcherActivityInfo, userHandle), launcherActivityInfo, true);
                } else {
                    CharSequence charSequence = aVarD.f57300l;
                    Intent intentN0 = ga.a.N0(launcherActivityInfo.getComponentName());
                    d0Var.r(aVarD, launcherActivityInfo, false);
                    aVarD.C0(x7.e.u(launcherActivityInfo), 2);
                    aVarD.f57278x = intentN0;
                    if (TextUtils.equals(charSequence, aVarD.f57300l)) {
                        this.f54381i.add(aVarD);
                    } else {
                        aVarD.f57280z = this.f54378f.c(aVarD);
                        this.f54376d = true;
                    }
                }
            }
        } else {
            for (int size3 = arrayList2.size() - 1; size3 >= 0; size3--) {
                ga.a aVar2 = (ga.a) arrayList2.get(size3);
                if (userHandle.equals(aVar2.o) && str.equals(aVar2.f57279y.getPackageName())) {
                    d0Var.A(aVar2.f57279y, userHandle);
                    e(size3);
                }
            }
        }
        return activityList;
    }

    public final ArrayList k(ja.d dVar) {
        ArrayList arrayList = new ArrayList();
        UserHandle userHandle = (UserHandle) dVar.f69287f;
        int i5 = dVar.f69283b;
        ArrayList arrayList2 = this.f54373a;
        for (int size = arrayList2.size() - 1; size >= 0; size--) {
            ga.a aVar = (ga.a) arrayList2.get(size);
            ComponentName componentNameI = aVar.i();
            if (componentNameI != null && componentNameI.getPackageName().equals((String) dVar.f69286e) && aVar.o.equals(userHandle)) {
                if (i5 == 2 || i5 == 1) {
                    if (!aVar.p0() || i5 != 1) {
                        aVar.K0(dVar);
                        arrayList.add(aVar);
                    }
                } else if (i5 == 3 && !aVar.p0()) {
                    e(size);
                }
            }
        }
        return arrayList;
    }
}
