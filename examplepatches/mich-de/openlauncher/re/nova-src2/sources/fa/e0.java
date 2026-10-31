package fa;

import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.content.pm.PackageInstaller;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.ShortcutInfo;
import android.net.Uri;
import android.os.Bundle;
import android.os.LocaleList;
import android.os.Process;
import android.os.Trace;
import android.os.UserHandle;
import android.os.UserManager;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.ArrayMap;
import android.util.Log;
import android.util.LongSparseArray;
import android.util.SparseBooleanArray;
import android.util.TimingLogger;
import b.i8;
import com.android.launcher3.folder.Folder;
import com.android.launcher3.folder.FolderNameProvider;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.model.ModelDelegate;
import com.android.launcher3.qsb.QsbContainerView;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.android.launcher3.util.ComponentKey;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import com.google.android.gms.internal.measurement.v6;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.teslacoilsw.launcher.NovaShortcutHandler;
import com.teslacoilsw.launcher.icon.NovaIconSource;
import com.teslacoilsw.launcher.icon.NovaLauncherActivityCachingLogic;
import com.teslacoilsw.launcher.preferences.SettingsActivity;
import com.teslacoilsw.launcher.util.NamedIntent;
import e10.a3;
import e10.s2;
import e10.y2;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.function.BiConsumer;
import kotlin.coroutines.Continuation;
import kotlin.reflect.KProperty;
import o9.a2;
import o9.c2;
import o9.g2;
import o9.g3;
import o9.h2;
import o9.t1;
import o9.x1;

/* loaded from: classes.dex */
public final class e0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final t1 f54386a;

    /* renamed from: b, reason: collision with root package name */
    public final d f54387b;

    /* renamed from: c, reason: collision with root package name */
    public final q f54388c;

    /* renamed from: d, reason: collision with root package name */
    public final ModelDelegate f54389d;

    /* renamed from: e, reason: collision with root package name */
    public final b90.p f54390e;

    /* renamed from: f, reason: collision with root package name */
    public final LauncherApps f54391f;

    /* renamed from: g, reason: collision with root package name */
    public final UserManager f54392g;

    /* renamed from: h, reason: collision with root package name */
    public final ja.h f54393h;

    /* renamed from: i, reason: collision with root package name */
    public final ja.a f54394i;

    /* renamed from: j, reason: collision with root package name */
    public final fz.d0 f54395j;

    /* renamed from: m, reason: collision with root package name */
    public boolean f54398m;

    /* renamed from: p, reason: collision with root package name */
    public String f54399p;

    /* renamed from: k, reason: collision with root package name */
    public final i50.c f54396k = new i50.c(5);

    /* renamed from: l, reason: collision with root package name */
    public final ArrayMap f54397l = new ArrayMap();
    public final HashSet n = new HashSet();
    public boolean o = false;

    public e0(t1 t1Var, d dVar, q qVar, ModelDelegate modelDelegate, b90.p pVar) {
        this.f54386a = t1Var;
        this.f54387b = dVar;
        this.f54388c = qVar;
        this.f54389d = modelDelegate;
        this.f54390e = pVar;
        this.f54391f = (LauncherApps) t1Var.f80132a.getSystemService(LauncherApps.class);
        Context context = t1Var.f80132a;
        this.f54392g = (UserManager) context.getSystemService(UserManager.class);
        this.f54393h = (ja.h) ja.h.f69294h.h(context);
        this.f54394i = (ja.a) ja.a.f69271f.h(context);
        this.f54395j = t1Var.f80135d;
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0042, code lost:
    
        r4 = false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean a(AppWidgetProviderInfo appWidgetProviderInfo) {
        ComponentName componentName;
        if (appWidgetProviderInfo != null && (componentName = appWidgetProviderInfo.provider) != null && componentName.getPackageName() != null) {
            boolean z11 = (r1 = (r4 = appWidgetProviderInfo.provider.getPackageName()).hashCode()) != -1493701396 ? true : true;
            if (!z11) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:239:0x05c8, code lost:
    
        throw r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x02fe, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:193:0x04a5  */
    /* JADX WARN: Removed duplicated region for block: B:196:0x04c8  */
    /* JADX WARN: Removed duplicated region for block: B:209:0x053b  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x00a4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final ArrayList b(HashMap map) throws Throwable {
        boolean z11;
        boolean zHasShortcutHostPermission;
        ArrayList arrayList;
        kl.q0 q0Var;
        int i5;
        Throwable th2;
        y30.b bVarG;
        boolean z12;
        ApplicationInfo applicationInfo;
        String strB;
        List<UserHandle> listF = this.f54393h.f();
        ArrayList arrayList2 = new ArrayList();
        d dVar = this.f54387b;
        dVar.f54373a.clear();
        dVar.f54376d = false;
        LocaleList localeList = LocaleList.getDefault();
        if (!localeList.equals(dVar.f54379g)) {
            dVar.f54379g = localeList;
            dVar.f54378f = new x7.e(localeList);
        }
        HashSet hashSet = new HashSet();
        String strJ = ((mx.l0) this.f54386a.f80136e).j();
        ArrayList arrayList3 = new ArrayList();
        for (UserHandle userHandle : listF) {
            List<LauncherActivityInfo> activityList = this.f54391f.getActivityList(null, userHandle);
            if (activityList != null && !activityList.isEmpty()) {
                boolean z13 = ((SparseBooleanArray) this.f54396k.f61381d).get(userHandle.hashCode());
                int i11 = 0;
                while (i11 < activityList.size()) {
                    LauncherActivityInfo launcherActivityInfo = activityList.get(i11);
                    ga.a aVar = new ga.a(launcherActivityInfo, userHandle, z13);
                    c00.b bVar = (c00.b) map.get(aVar.P0());
                    if (bVar != null) {
                        aVar.f57300l = bVar.f19039b;
                        NovaIconSource novaIconSource = bVar.f19040c;
                        aVar.f57307u = novaIconSource;
                        aVar.f57303q = bVar.f19041d;
                        strB = novaIconSource != null ? novaIconSource.b() : null;
                    }
                    hashSet.add(aVar.f57279y.getPackageName());
                    List<LauncherActivityInfo> list = activityList;
                    int i12 = i11;
                    String str = strB;
                    boolean z14 = z13;
                    arrayList3.add(new ga.d(aVar, launcherActivityInfo, false, str, strJ));
                    if (userHandle == Process.myUserHandle() && NovaShortcutHandler.f45670c.equals(aVar.f57279y)) {
                        ComponentName componentName = SettingsActivity.f45966y;
                        aVar.f57279y = componentName;
                        Intent intentN0 = ga.a.N0(componentName);
                        aVar.f57278x = intentN0;
                        this.f54387b.a(aVar, this.f54391f.resolveActivity(intentN0, userHandle), !u9.b.f90700m.b());
                    } else {
                        this.f54387b.a(aVar, launcherActivityInfo, !u9.b.f90700m.b());
                    }
                    i11 = i12 + 1;
                    z13 = z14;
                    activityList = list;
                }
                arrayList2.addAll(activityList);
            }
        }
        boolean z15 = true;
        Intent intent = oz.a.f81126a;
        if (a3.f51435a.f51545a.getBoolean("show_launchers_in_drawer", false)) {
            PackageManager packageManager = this.f54386a.f80132a.getPackageManager();
            UserHandle userHandleMyUserHandle = Process.myUserHandle();
            LauncherApps launcherApps = this.f54391f;
            d dVar2 = this.f54387b;
            boolean z16 = ((SparseBooleanArray) this.f54396k.f61381d).get(userHandleMyUserHandle.hashCode());
            Intent intent2 = oz.a.f81126a;
            List<ResolveInfo> listQueryIntentActivities = packageManager.queryIntentActivities(intent2, SQLiteDatabase.OPEN_FULLMUTEX);
            UserHandle userHandleMyUserHandle2 = Process.myUserHandle();
            for (ResolveInfo resolveInfo : listQueryIntentActivities) {
                if (hashSet.contains(resolveInfo.activityInfo.packageName)) {
                    z15 = true;
                } else {
                    Intent intent3 = new Intent(intent2);
                    ActivityInfo activityInfo = resolveInfo.activityInfo;
                    intent3.setComponent(new ComponentName(activityInfo.packageName, activityInfo.name));
                    LauncherActivityInfo launcherActivityInfoResolveActivity = launcherApps.resolveActivity(intent3, userHandleMyUserHandle2);
                    ga.a aVar2 = new ga.a(launcherActivityInfoResolveActivity, userHandleMyUserHandle2, z16);
                    Intent intent4 = new Intent("android.intent.action.MAIN");
                    intent4.setComponent(aVar2.f57279y);
                    intent4.addCategory("android.intent.category.HOME");
                    aVar2.f57278x = intent4;
                    c00.b bVar2 = (c00.b) map.get(aVar2.P0());
                    if (bVar2 != null) {
                        aVar2.f57300l = bVar2.f19039b;
                        aVar2.f57307u = bVar2.f19040c;
                        aVar2.f57303q = bVar2.f19041d;
                    }
                    boolean z17 = z15;
                    dVar2.a(aVar2, launcherActivityInfoResolveActivity, z17);
                    z15 = z17;
                }
            }
        }
        if (u9.b.f90689b.b()) {
            Iterator it = this.f54394i.c().iterator();
            while (it.hasNext()) {
                ga.a aVarC = this.f54387b.c(this.f54386a.f80132a, ja.d.f((PackageInstaller.SessionInfo) it.next()), !u9.b.f90700m.b());
                if (aVarC != null) {
                    arrayList3.add(new ga.d(aVarC, null, aVarC.L0(), null, strJ));
                }
            }
        }
        int i13 = 3;
        if (u9.b.f90700m.b()) {
            Trace.beginSection("LoadAllAppsIconsInBulk");
            try {
                this.f54395j.w(arrayList3);
                arrayList3.forEach(new f(this, i13));
            } finally {
                Trace.endSection();
            }
        }
        d dVar3 = this.f54387b;
        SparseBooleanArray sparseBooleanArray = (SparseBooleanArray) this.f54396k.f61381d;
        int size = sparseBooleanArray.size() - 1;
        while (true) {
            if (size < 0) {
                z11 = false;
                break;
            }
            if (sparseBooleanArray.valueAt(size)) {
                z11 = true;
                break;
            }
            size--;
        }
        dVar3.g(2, z11);
        d dVar4 = this.f54387b;
        try {
            zHasShortcutHostPermission = ((LauncherApps) this.f54386a.f80132a.getSystemService(LauncherApps.class)).hasShortcutHostPermission();
        } catch (Exception e3) {
            Log.e("PackageManagerHelper", "Failed to make shortcut manager call", e3);
            zHasShortcutHostPermission = false;
        }
        dVar4.g(1, zHasShortcutHostPermission);
        this.f54387b.g(4, this.f54386a.f80132a.checkSelfPermission("android.permission.MODIFY_QUIET_MODE") == 0);
        d dVar5 = this.f54387b;
        boolean z18 = dVar5.f54376d;
        dVar5.f54376d = false;
        if (z18) {
            dVar5.f54381i.clear();
        }
        uy.d0 d0Var = uy.d0.f91699e;
        d0Var.o(this.f54386a.f80132a);
        synchronized (d0Var) {
            try {
                arrayList = new ArrayList(d0Var.f91702b.g());
                for (int iG = d0Var.f91702b.g() - 1; iG >= 0; iG--) {
                    uy.s sVar = (uy.s) d0Var.f91702b.h(iG);
                    if ((sVar instanceof uy.q) && sVar.d()) {
                        arrayList.add((uy.q) sVar);
                    }
                }
                arrayList.sort(uy.d0.k());
            } finally {
            }
        }
        ArrayList arrayList4 = new ArrayList(arrayList.size());
        synchronized (this.f54388c) {
            for (int i14 = 0; i14 < arrayList.size(); i14++) {
                try {
                    uy.q qVar = (uy.q) arrayList.get(i14);
                    iz.a aVar3 = (iz.a) this.f54388c.d(qVar.g());
                    aVar3.I = qVar;
                    aVar3.f57300l = qVar.f91749a;
                    BitmapInfo bitmapInfo = qVar.f91746j;
                    if (bitmapInfo != null) {
                        aVar3.f57304r = bitmapInfo;
                        aVar3.f57307u = qVar.f91747k;
                    }
                    aVar3.f57303q = qVar.f91756h;
                    this.f54387b.b(aVar3);
                    arrayList4.add(aVar3);
                } finally {
                }
            }
            boolean zO = g3.o();
            Context applicationContext = this.f54386a.f80132a.getApplicationContext();
            PackageManager packageManager2 = applicationContext.getPackageManager();
            synchronized (d0Var) {
                ArrayList arrayListL = d0Var.l();
                q0Var = new kl.q0(d0Var);
                Iterator it2 = arrayListL.iterator();
                while (it2.hasNext()) {
                    uy.j jVar = (uy.j) it2.next();
                    if (!(jVar instanceof uy.l)) {
                        for (ComponentKey componentKey : jVar.f91757i.d()) {
                            int i15 = 0;
                            ga.a aVar4 = null;
                            while (true) {
                                if (i15 < this.f54387b.f54373a.size()) {
                                    ga.a aVar5 = (ga.a) this.f54387b.f54373a.get(i15);
                                    ComponentName componentNameI = aVar5.i();
                                    z12 = zO;
                                    if (componentKey.f21252b.equals(aVar5.o) && componentKey.f21251a.getPackageName().equals(componentNameI.getPackageName())) {
                                        if (componentNameI.getClassName().equals(componentKey.f21251a.getClassName())) {
                                            break;
                                        }
                                        aVar4 = aVar5;
                                    }
                                    i15++;
                                    zO = z12;
                                } else {
                                    z12 = zO;
                                    uy.o oVarD = q0Var.d(jVar);
                                    if (aVar4 != null) {
                                        oVarD.e(componentKey);
                                        oVarD.a(aVar4.P0());
                                    } else if (z12) {
                                        try {
                                            applicationInfo = packageManager2.getApplicationInfo(componentKey.f21251a.getPackageName(), UserMetadata.MAX_INTERNAL_KEY_SIZE);
                                        } catch (PackageManager.NameNotFoundException unused) {
                                            applicationInfo = null;
                                        }
                                        if (applicationInfo == null || (applicationInfo.flags & SQLiteDatabase.OPEN_PRIVATECACHE) == 0) {
                                            oVarD.e(componentKey);
                                        }
                                    }
                                }
                            }
                            zO = z12;
                        }
                    }
                }
                q0Var.b(this.f54386a.f80132a.getContentResolver());
            }
        }
        d0 d0Var2 = new d0();
        x7.e eVarN = d0Var.n();
        try {
            try {
                y30.c cVarG = y30.c.g(this.f54386a.f80132a.getDatabasePath("smartAppCategories.db44"));
                try {
                    Iterator it3 = arrayList2.iterator();
                    q0Var = null;
                    while (it3.hasNext()) {
                        try {
                            LauncherActivityInfo launcherActivityInfo2 = (LauncherActivityInfo) it3.next();
                            if (launcherActivityInfo2.getUser() == Process.myUserHandle()) {
                                try {
                                    bVarG = cVarG.G(launcherActivityInfo2.getComponentName().getPackageName(), launcherActivityInfo2.getComponentName().getClassName());
                                } catch (Exception e11) {
                                    mc0.d.a(e11);
                                    bVarG = null;
                                }
                                uy.s sVar2 = bVarG != null ? (uy.s) ((EnumMap) eVarN.f95130a).get(bVarG) : null;
                                if (sVar2 != null) {
                                    ComponentKey componentKey2 = new ComponentKey(launcherActivityInfo2.getComponentName(), launcherActivityInfo2.getUser());
                                    if (!sVar2.f91757i.c(componentKey2) && !((uy.s) eVarN.f95131b).f91757i.c(componentKey2)) {
                                        if (q0Var == null) {
                                            kl.q0 q0Var2 = new kl.q0(d0Var);
                                            try {
                                                d0Var.b(d0Var2);
                                                q0Var = q0Var2;
                                            } catch (Throwable th3) {
                                                th2 = th3;
                                                q0Var = q0Var2;
                                                try {
                                                    cVarG.close();
                                                    throw th2;
                                                } catch (Throwable th4) {
                                                    th2.addSuppressed(th4);
                                                    throw th2;
                                                }
                                            }
                                        }
                                        q0Var.d(sVar2).a(componentKey2);
                                    }
                                } else {
                                    continue;
                                }
                            }
                        } catch (Throwable th5) {
                            th2 = th5;
                            cVarG.close();
                            throw th2;
                        }
                    }
                    cVarG.close();
                } catch (Throwable th6) {
                    th2 = th6;
                    q0Var = null;
                }
            } catch (IOException e12) {
                e = e12;
                mc0.d.a(e);
                if (q0Var != null) {
                }
                y2.f51877a.getClass();
                if (((Boolean) y2.V().l()).booleanValue()) {
                }
                while (i5 < arrayList4.size()) {
                }
                return arrayList2;
            }
        } catch (IOException e13) {
            e = e13;
            q0Var = null;
            mc0.d.a(e);
            if (q0Var != null) {
            }
            y2.f51877a.getClass();
            if (((Boolean) y2.V().l()).booleanValue()) {
            }
            while (i5 < arrayList4.size()) {
            }
            return arrayList2;
        }
        if (q0Var != null) {
            q0Var.b(this.f54386a.f80132a.getContentResolver());
            d0Var.s(d0Var2);
        }
        y2.f51877a.getClass();
        if (((Boolean) y2.V().l()).booleanValue()) {
            s2 s2Var = y2.G;
            KProperty kProperty = y2.f51881b[26];
            s2Var.getClass();
            if (!((Boolean) s2Var.l()).booleanValue()) {
                for (y30.b bVar3 : y30.b.values()) {
                    uy.s sVar3 = (uy.s) ((EnumMap) eVarN.f95130a).get(bVar3);
                    if (sVar3.f91757i.f91684b.f97766c >= 3) {
                        uy.o oVarA = sVar3.a();
                        iz.c cVar = sVar3.f91756h;
                        cVar.f68417a = cVar.g(128, false);
                        oVarA.f(sVar3.f91756h);
                        oVarA.c(this.f54386a.f80132a.getContentResolver(), true);
                    }
                }
                y2.f51877a.getClass();
                s2 s2Var2 = y2.G;
                KProperty kProperty2 = y2.f51881b[26];
                s2Var2.getClass();
                s2Var2.i(Boolean.TRUE);
            }
        }
        for (i5 = 0; i5 < arrayList4.size(); i5++) {
            iz.a aVar6 = (iz.a) arrayList4.get(i5);
            Set<ComponentKey> setD = aVar6.I.f91757i.d();
            uy.p pVar = null;
            for (int i16 = 0; i16 < aVar6.H.size(); i16++) {
                ga.e eVar = (ga.e) aVar6.H.get(i16);
                ComponentName componentNameI2 = eVar.i();
                if (componentNameI2 != null && fg.a.F(eVar.d())) {
                    ComponentKey componentKey3 = new ComponentKey(componentNameI2, eVar.o);
                    if (!setD.remove(componentKey3)) {
                        if (pVar == null) {
                            pVar = new uy.p(aVar6.c1());
                        }
                        pVar.a(componentKey3);
                    }
                }
            }
            if (!setD.isEmpty()) {
                for (ComponentKey componentKey4 : setD) {
                    if (pVar == null) {
                        pVar = new uy.p(aVar6.c1());
                    }
                    pVar.b(componentKey4);
                }
            }
            if (pVar != null) {
                pVar.h(this.f54386a.f80132a.getContentResolver(), false);
            }
        }
        return arrayList2;
    }

    public final HashMap c() {
        Context context = this.f54386a.f80132a;
        c00.a aVar = new c00.a(context, context.getContentResolver().query(c00.g.f19060a, null, null, null, null));
        HashMap map = new HashMap(aVar.getCount());
        while (aVar.moveToNext()) {
            ComponentName componentNameUnflattenFromString = ComponentName.unflattenFromString(aVar.getString(aVar.f19033b));
            UserHandle userHandleE = ((ja.h) ja.h.f69294h.h(aVar.f19032a)).e(aVar.getLong(aVar.f19034c));
            c00.b bVar = null;
            if (componentNameUnflattenFromString != null && userHandleE != null) {
                String string = aVar.getString(aVar.f19035d);
                String string2 = aVar.getString(aVar.f19036e);
                NovaIconSource novaIconSourceX = string2 != null ? cl.l0.x(string2) : null;
                int i5 = aVar.getInt(aVar.f19037f);
                iz.c cVar = new iz.c(i5);
                if (string != null || novaIconSourceX != null || i5 != 0) {
                    bVar = new c00.b(new ComponentKey(componentNameUnflattenFromString, userHandleE), string, novaIconSourceX, cVar);
                }
            }
            if (bVar != null) {
                map.put(bVar.f19038a, bVar);
            }
        }
        aVar.close();
        return map;
    }

    public final ArrayList d() {
        ArrayList arrayList = new ArrayList();
        q qVar = this.f54388c;
        qVar.f54469f.clear();
        if ((this.f54387b.f54380h & 1) != 0) {
            for (UserHandle userHandle : this.f54393h.f()) {
                if (this.f54392g.isUserUnlocked(userHandle)) {
                    qa.b bVarC = new androidx.room.h(this.f54386a.f80132a, userHandle).c(11);
                    arrayList.addAll(bVarC);
                    qVar.g(null, bVarC, userHandle);
                }
            }
        }
        return arrayList;
    }

    public final void e() {
        Context context = this.f54386a.f80132a;
        ArrayList arrayList = this.f54387b.f54373a;
        ya.s sVar = this.f54388c.f54467d;
        FolderNameProvider folderNameProviderC = FolderNameProvider.c(context, arrayList);
        synchronized (this.f54388c) {
            for (int i5 = 0; i5 < this.f54388c.f54467d.size(); i5++) {
                try {
                    c00.d dVar = new c00.d(14);
                    ga.c cVar = (ga.c) this.f54388c.f54467d.valueAt(i5);
                    if (cVar.G == null) {
                        folderNameProviderC.a(this.f54386a.f80132a, cVar.H, dVar);
                        cVar.G = dVar;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }

    /* JADX WARN: Can't wrap try/catch for region: R(16:303|(1:309)(1:308)|(1:346)(16:706|312|313|(3:676|315|(3:319|339|(1:341))(6:320|321|684|322|(1:324)(1:325)|(4:327|328|772|329)(5:814|335|336|378|820)))|754|347|(1:800)(3:689|350|(2:352|(2:355|(2:802|357)(5:815|358|336|378|820))(1:801))(24:360|733|361|(1:369)(1:367)|(2:803|371)(1:(2:804|374)(4:816|377|378|820))|372|702|382|383|(1:385)|(1:388)|389|(1:396)(1:394)|395|397|(1:399)(2:401|(1:403)(9:405|(9:744|407|408|729|409|410|737|411|(22:413|704|414|(4:(8:417|418|731|419|774|420|421|(6:423|756|424|(6:427|428|750|429|430|425)|824|435)(4:440|780|441|442))(1:449)|674|450|(3:452|453|819)(1:457))(1:459)|725|460|(1:462)|463|(2:465|466)(3:467|468|469)|470|471|680|472|(1:478)(1:477)|(1:485)(1:482)|(1:487)|490|491|713|492|493|504)(5:501|739|502|503|504))(7:514|717|515|(7:517|518|697|519|(1:525)(1:524)|(1:531)(1:530)|(1:533))|534|(1:542)|543)|(10:678|545|546|770|547|(1:551)|554|(4:695|556|557|558)(1:561)|562|(13:569|576|719|577|(1:579)(1:580)|583|764|584|(1:586)(1:587)|590|591|453|819)(15:566|(1:568)(13:(4:571|572|752|573)|576|719|577|(0)(0)|583|764|584|(0)(0)|590|591|453|819)|569|576|719|577|(0)(0)|583|764|584|(0)(0)|590|591|453|819))(3:594|595|817)|574|575|611|591|453|819))|400|(0)(0)|574|575|611|591|453|819))|354|381|702|382|383|(0)|(1:388)|389|(14:391|393|396|395|397|(0)(0)|400|(0)(0)|574|575|611|591|453|819)(0))|343|754|347|(1:800)(1:799)|354|381|702|382|383|(0)|(0)|389|(0)(0)) */
    /* JADX WARN: Can't wrap try/catch for region: R(21:413|(2:704|414)|(4:(8:417|418|731|419|774|420|421|(6:423|756|424|(6:427|428|750|429|430|425)|824|435)(4:440|780|441|442))(1:449)|674|450|(3:452|453|819)(1:457))(1:459)|725|460|(1:462)|463|(2:465|466)(3:467|468|469)|470|471|680|472|(1:478)(1:477)|(1:485)(1:482)|(1:487)|490|491|713|492|493|504) */
    /* JADX WARN: Can't wrap try/catch for region: R(22:413|704|414|(4:(8:417|418|731|419|774|420|421|(6:423|756|424|(6:427|428|750|429|430|425)|824|435)(4:440|780|441|442))(1:449)|674|450|(3:452|453|819)(1:457))(1:459)|725|460|(1:462)|463|(2:465|466)(3:467|468|469)|470|471|680|472|(1:478)(1:477)|(1:485)(1:482)|(1:487)|490|491|713|492|493|504) */
    /* JADX WARN: Can't wrap try/catch for region: R(27:230|(2:727|231)|(3:762|233|(2:235|(7:811|237|182|183|184|378|820)(27:798|240|(1:242)|243|(1:248)|249|721|250|(1:252)|253|711|254|(1:256)(1:257)|260|691|261|(1:263)(1:264)|267|(1:269)|270|271|715|272|273|591|453|819))(1:797))(1:796)|246|(0)|249|721|250|(0)|253|711|254|(0)(0)|260|691|261|(0)(0)|267|(0)|270|271|715|272|273|591|453|819) */
    /* JADX WARN: Can't wrap try/catch for region: R(33:(1:71)(1:72)|682|73|74|(2:76|(2:807|78))(1:81)|80|693|83|84|(2:766|85)|(14:87|(6:670|89|90|686|91|(1:93))(1:101)|768|102|103|786|104|105|106|(2:107|(2:109|(2:822|111)(1:823))(2:821|112))|113|778|122|(22:(3:130|(1:133)|134)(7:136|(1:138)(1:140)|139|141|(1:(1:145)(1:(6:808|148|149|47|378|820)))|(1:151)(1:152)|153)|135|154|(1:156)|157|158|748|159|742|160|161|162|758|163|164|699|165|(7:179|(2:809|181)|182|183|184|378|820)(1:170)|(1:186)(2:187|(1:189)(1:190))|191|(1:197)(1:196)|(7:810|199|182|183|184|378|820)(5:795|(2:201|(1:205))|206|(1:208)|209))(6:776|128|273|591|453|819))(1:121)|94|778|122|(0)|(0)(0)|135|154|(0)|157|158|748|159|742|160|161|162|758|163|164|699|165|(9:167|169|179|(3:(0)(0)|191|(4:193|195|197|(0)(0))(0))(0)|182|183|184|378|820)(0)) */
    /* JADX WARN: Can't wrap try/catch for region: R(34:(1:71)(1:72)|682|73|74|(2:76|(2:807|78))(1:81)|80|693|83|84|766|85|(14:87|(6:670|89|90|686|91|(1:93))(1:101)|768|102|103|786|104|105|106|(2:107|(2:109|(2:822|111)(1:823))(2:821|112))|113|778|122|(22:(3:130|(1:133)|134)(7:136|(1:138)(1:140)|139|141|(1:(1:145)(1:(6:808|148|149|47|378|820)))|(1:151)(1:152)|153)|135|154|(1:156)|157|158|748|159|742|160|161|162|758|163|164|699|165|(7:179|(2:809|181)|182|183|184|378|820)(1:170)|(1:186)(2:187|(1:189)(1:190))|191|(1:197)(1:196)|(7:810|199|182|183|184|378|820)(5:795|(2:201|(1:205))|206|(1:208)|209))(6:776|128|273|591|453|819))(1:121)|94|778|122|(0)|(0)(0)|135|154|(0)|157|158|748|159|742|160|161|162|758|163|164|699|165|(9:167|169|179|(3:(0)(0)|191|(4:193|195|197|(0)(0))(0))(0)|182|183|184|378|820)(0)) */
    /* JADX WARN: Code restructure failed: missing block: B:171:0x03e3, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:173:0x03e8, code lost:
    
        r25 = r2;
        r30 = r9;
        r41 = r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:211:0x04a5, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:213:0x04a8, code lost:
    
        r25 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:215:0x04b2, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:216:0x04b3, code lost:
    
        r9 = r26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:217:0x04b8, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:218:0x04b9, code lost:
    
        r11 = r41;
        r9 = r26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:219:0x04bf, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:220:0x04c0, code lost:
    
        r9 = r26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:259:0x05a9, code lost:
    
        android.util.Log.e("LoaderCursor", "Error parsing Intent");
     */
    /* JADX WARN: Code restructure failed: missing block: B:266:0x05cd, code lost:
    
        android.util.Log.e("LoaderCursor", "Error parsing Intent");
     */
    /* JADX WARN: Code restructure failed: missing block: B:274:0x05fc, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:278:0x0605, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:484:0x095f, code lost:
    
        r23 = r2;
        r9 = r29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:488:0x0971, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:494:0x0980, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:496:0x0982, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:600:0x0b10, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:601:0x0b11, code lost:
    
        r23 = r2;
        r14 = r6;
        r30 = r9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:602:0x0b19, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:603:0x0b1a, code lost:
    
        r23 = r2;
        r30 = r9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:604:0x0b20, code lost:
    
        r14 = r22;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:130:0x0309 A[Catch: all -> 0x013f, Exception -> 0x02c0, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:136:0x0320 A[Catch: all -> 0x013f, Exception -> 0x04bf, TRY_ENTER, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:156:0x038f A[Catch: all -> 0x013f, Exception -> 0x02c0, TRY_ENTER, TRY_LEAVE, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:179:0x03f9 A[Catch: all -> 0x013f, Exception -> 0x03e3, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:186:0x042f A[Catch: all -> 0x013f, Exception -> 0x03e3, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:187:0x043b A[Catch: all -> 0x013f, Exception -> 0x03e3, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:197:0x0452  */
    /* JADX WARN: Removed duplicated region for block: B:248:0x0562 A[Catch: all -> 0x013f, Exception -> 0x03e3, TRY_LEAVE, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:252:0x0585 A[Catch: all -> 0x013f, Exception -> 0x0605, TRY_LEAVE, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:256:0x059b  */
    /* JADX WARN: Removed duplicated region for block: B:257:0x059e A[Catch: all -> 0x013f, URISyntaxException -> 0x05a9, Exception -> 0x0601, TRY_LEAVE, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:263:0x05bf  */
    /* JADX WARN: Removed duplicated region for block: B:264:0x05c2 A[Catch: all -> 0x013f, URISyntaxException -> 0x05cd, Exception -> 0x0601, TRY_LEAVE, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:269:0x05df A[Catch: all -> 0x013f, Exception -> 0x03e3, TRY_ENTER, TRY_LEAVE, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:284:0x0614 A[Catch: all -> 0x013f, Exception -> 0x0b32, TRY_ENTER, TRY_LEAVE, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:385:0x07e7  */
    /* JADX WARN: Removed duplicated region for block: B:387:0x07ea A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:391:0x07fc  */
    /* JADX WARN: Removed duplicated region for block: B:396:0x0805  */
    /* JADX WARN: Removed duplicated region for block: B:399:0x080e A[Catch: all -> 0x013f, Exception -> 0x07ae, TRY_ENTER, TRY_LEAVE, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:401:0x081c A[Catch: all -> 0x013f, Exception -> 0x0b10, TRY_ENTER, TRY_LEAVE, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:579:0x0aaa  */
    /* JADX WARN: Removed duplicated region for block: B:580:0x0aad A[Catch: all -> 0x013f, Exception -> 0x0a9b, URISyntaxException -> 0x0ab8, TRY_LEAVE, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:586:0x0ace  */
    /* JADX WARN: Removed duplicated region for block: B:587:0x0ad1 A[Catch: all -> 0x013f, Exception -> 0x0a9b, URISyntaxException -> 0x0adc, TRY_LEAVE, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:594:0x0afa A[Catch: all -> 0x013f, Exception -> 0x0a9b, TryCatch #16 {all -> 0x013f, blocks: (B:22:0x00b5, B:23:0x00f5, B:25:0x00fb, B:27:0x0113, B:29:0x0123, B:30:0x0127, B:32:0x012d, B:37:0x0147, B:38:0x0153, B:39:0x015e, B:41:0x0162, B:43:0x0168, B:45:0x016c, B:52:0x019f, B:55:0x01a5, B:73:0x01ed, B:76:0x01ff, B:78:0x0205, B:83:0x0219, B:85:0x0226, B:89:0x0237, B:91:0x023d, B:93:0x0245, B:122:0x02d3, B:128:0x02e9, B:130:0x0309, B:133:0x0318, B:134:0x031a, B:154:0x0389, B:156:0x038f, B:157:0x0395, B:159:0x039a, B:160:0x039e, B:161:0x03a4, B:163:0x03a8, B:165:0x03be, B:167:0x03d5, B:186:0x042f, B:191:0x0445, B:199:0x0455, B:201:0x045d, B:203:0x0469, B:205:0x046f, B:206:0x0486, B:208:0x048a, B:209:0x049e, B:187:0x043b, B:190:0x0442, B:179:0x03f9, B:181:0x03ff, B:611:0x0b49, B:136:0x0320, B:141:0x034c, B:145:0x0355, B:148:0x035f, B:153:0x0385, B:152:0x0381, B:140:0x0340, B:102:0x0284, B:104:0x028a, B:106:0x028e, B:107:0x02a1, B:109:0x02a7, B:111:0x02b5, B:113:0x02bc, B:81:0x0214, B:231:0x04f9, B:233:0x04ff, B:235:0x050e, B:237:0x0529, B:240:0x054f, B:242:0x0553, B:243:0x0555, B:248:0x0562, B:249:0x056a, B:250:0x0581, B:252:0x0585, B:253:0x058f, B:254:0x0595, B:260:0x05b1, B:261:0x05b9, B:267:0x05d5, B:269:0x05df, B:270:0x05e2, B:272:0x05e6, B:264:0x05c2, B:266:0x05cd, B:257:0x059e, B:259:0x05a9, B:245:0x0559, B:280:0x0607, B:282:0x060d, B:284:0x0614, B:286:0x0619, B:290:0x0623, B:292:0x0629, B:297:0x0644, B:299:0x064a, B:301:0x064f, B:303:0x065a, B:305:0x0660, B:312:0x0672, B:315:0x0679, B:317:0x0683, B:320:0x0696, B:322:0x069a, B:327:0x06b9, B:329:0x06c5, B:347:0x0710, B:350:0x0718, B:352:0x071c, B:355:0x0743, B:357:0x0749, B:358:0x0761, B:361:0x077b, B:365:0x0784, B:371:0x0799, B:382:0x07e1, B:388:0x07ec, B:389:0x07f6, B:397:0x0808, B:399:0x080e, B:545:0x0a2a, B:547:0x0a32, B:549:0x0a47, B:551:0x0a4d, B:554:0x0a59, B:556:0x0a5f, B:558:0x0a64, B:562:0x0a6d, B:564:0x0a71, B:566:0x0a77, B:568:0x0a85, B:571:0x0a8f, B:573:0x0a97, B:576:0x0a9e, B:577:0x0aa4, B:583:0x0ac0, B:584:0x0ac8, B:590:0x0ae4, B:587:0x0ad1, B:589:0x0adc, B:580:0x0aad, B:582:0x0ab8, B:594:0x0afa, B:595:0x0b06, B:401:0x081c, B:403:0x0820, B:407:0x0836, B:409:0x083f, B:411:0x0845, B:414:0x0853, B:419:0x0862, B:420:0x0864, B:421:0x0869, B:423:0x087a, B:424:0x0883, B:425:0x0887, B:427:0x088d, B:429:0x0895, B:450:0x08cc, B:452:0x08d4, B:457:0x08f4, B:460:0x0905, B:462:0x0916, B:463:0x091e, B:465:0x0926, B:470:0x0939, B:472:0x0940, B:474:0x094a, B:480:0x0955, B:487:0x0968, B:490:0x0973, B:492:0x0979, B:467:0x092c, B:469:0x0933, B:441:0x08ba, B:502:0x0996, B:515:0x09c3, B:517:0x09cd, B:519:0x09d0, B:521:0x09da, B:527:0x09e5, B:534:0x09f4, B:536:0x0a00, B:538:0x0a06, B:540:0x0a12, B:542:0x0a1e, B:374:0x079f, B:377:0x07b0, B:335:0x06e0, B:325:0x06a8, B:339:0x06f3, B:341:0x06f7, B:296:0x0640, B:612:0x0b51, B:614:0x0b5a, B:624:0x0b98, B:625:0x0b9c, B:626:0x0b9f, B:615:0x0b69, B:616:0x0b72, B:618:0x0b78, B:620:0x0b8c), top: B:701:0x00b5, outer: #9, inners: #59 }] */
    /* JADX WARN: Removed duplicated region for block: B:655:0x0c5a  */
    /* JADX WARN: Removed duplicated region for block: B:678:0x0a2a A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:6:0x0029  */
    /* JADX WARN: Removed duplicated region for block: B:795:0x045b A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:809:0x03ff A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:810:0x0455 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:812:0x060d A[SYNTHETIC] */
    /* JADX WARN: Unreachable blocks removed: 2, instructions: 2 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void f(ArrayList arrayList, Uri uri, a0 a0Var) throws Throwable {
        boolean z11;
        q qVar;
        int i5;
        int i11;
        LongSparseArray longSparseArray;
        HashMap map;
        PackageManager packageManager;
        int i12;
        AppWidgetManager appWidgetManager;
        ArrayList arrayList2;
        Map map2;
        PackageManager packageManager2;
        LauncherApps launcherApps;
        int i13;
        int i14;
        int i15;
        Intent intentS;
        ComponentName component;
        String packageName;
        int i16;
        boolean z12;
        int i17;
        int i18;
        ShortcutKey shortcutKeyD;
        int i19;
        LongSparseArray longSparseArray2;
        ga.j jVarM;
        ga.j jVar;
        ShortcutInfo shortcutInfo;
        Map map3;
        ApplicationInfo applicationInfo;
        ga.j jVarH;
        LauncherActivityInfo launcherActivityInfoP;
        String string;
        NamedIntent namedIntentN;
        String string2;
        NamedIntent namedIntentN2;
        ApplicationInfo applicationInfo2;
        int i21;
        Intent intentS2;
        ga.c cVarD;
        String string3;
        NamedIntent namedIntentN3;
        String string4;
        NamedIntent namedIntentN4;
        int iD1;
        int iF;
        int i22;
        String string5;
        ComponentName componentNameUnflattenFromString;
        ComponentName componentName;
        boolean zD;
        boolean zD2;
        ComponentKey componentKey;
        AppWidgetProviderInfo appWidgetProviderInfo;
        boolean zA;
        ga.g gVar;
        int i23;
        int i24;
        ArrayMap arrayMap;
        LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfoE;
        boolean z13;
        Context context = this.f54386a.f80132a;
        ContentResolver contentResolver = context.getContentResolver();
        Context applicationContext = context.getApplicationContext();
        PackageManager packageManager3 = applicationContext.getPackageManager();
        LauncherApps launcherApps2 = (LauncherApps) applicationContext.getSystemService(LauncherApps.class);
        boolean zIsSafeMode = packageManager3.isSafeMode();
        String str = w20.m.f93701k;
        if (str != null) {
            if (Settings.System.getInt(contentResolver, str) != 0) {
                z11 = true;
            } else {
                String str2 = w20.m.f93702l;
                if (str2 != null) {
                    try {
                        if (Settings.System.getInt(contentResolver, str2) != 0) {
                        }
                    } catch (Settings.SettingNotFoundException unused) {
                    }
                }
                z11 = false;
            }
        }
        boolean zO = g3.o();
        AppWidgetManager appWidgetManager2 = AppWidgetManager.getInstance(context);
        c00.h.b(context, t1.a(context));
        h2.a(contentResolver, "load_default_favorites");
        q qVar2 = this.f54388c;
        synchronized (qVar2) {
            try {
                try {
                    this.f54388c.b();
                    this.n.clear();
                    HashMap mapB = this.f54394i.b();
                    final fz.d0 d0VarB = this.f54386a.b();
                    Objects.requireNonNull(d0VarB);
                    mapB.forEach(new BiConsumer() { // from class: fa.c0
                        @Override // java.util.function.BiConsumer
                        public final void accept(Object obj, Object obj2) {
                            d0VarB.G((ya.g0) obj, (PackageInstaller.SessionInfo) obj2);
                        }
                    });
                    ya.g0 g0Var = new ya.g0((String) null, (UserHandle) null);
                    HashMap map4 = new HashMap();
                    qVar = qVar2;
                    boolean z14 = z11;
                    PackageManager packageManager4 = packageManager3;
                    AppWidgetManager appWidgetManager3 = appWidgetManager2;
                    y yVar = new y(contentResolver.query(uri, null, null, null, null), uri, this.f54386a, this.f54396k);
                    Bundle extras = yVar.getExtras();
                    this.f54399p = extras == null ? null : extras.getString("db_name");
                    try {
                        int columnIndexOrThrow = yVar.getColumnIndexOrThrow("appWidgetId");
                        int columnIndexOrThrow2 = yVar.getColumnIndexOrThrow("appWidgetProvider");
                        int columnIndexOrThrow3 = yVar.getColumnIndexOrThrow("spanX");
                        int columnIndexOrThrow4 = yVar.getColumnIndexOrThrow("spanY");
                        int columnIndexOrThrow5 = yVar.getColumnIndexOrThrow("options");
                        int columnIndexOrThrow6 = yVar.getColumnIndexOrThrow("appWidgetSource");
                        LauncherApps launcherApps3 = launcherApps2;
                        LongSparseArray longSparseArray3 = new LongSparseArray();
                        int i25 = columnIndexOrThrow6;
                        this.f54396k.r(this.f54393h, this.f54392g);
                        for (UserHandle userHandle : this.f54393h.f()) {
                            int i26 = columnIndexOrThrow3;
                            int i27 = columnIndexOrThrow4;
                            long jD = this.f54393h.d(userHandle);
                            boolean zIsUserUnlocked = this.f54392g.isUserUnlocked(userHandle);
                            if (zIsUserUnlocked) {
                                z13 = zIsUserUnlocked;
                                qa.b bVarC = new androidx.room.h(context, userHandle).c(2);
                                if (bVarC.f83909a) {
                                    for (Iterator it = bVarC.iterator(); it.hasNext(); it = it) {
                                        ShortcutInfo shortcutInfo2 = (ShortcutInfo) it.next();
                                        map4.put(ShortcutKey.b(shortcutInfo2), shortcutInfo2);
                                    }
                                } else {
                                    z13 = false;
                                }
                            } else {
                                z13 = zIsUserUnlocked;
                            }
                            longSparseArray3.put(jD, Boolean.valueOf(z13));
                            columnIndexOrThrow3 = i26;
                            columnIndexOrThrow4 = i27;
                        }
                        int i28 = columnIndexOrThrow3;
                        int i29 = columnIndexOrThrow4;
                        ArrayList arrayList3 = new ArrayList();
                        Map map5 = null;
                        while (!this.f54398m && yVar.moveToNext()) {
                            try {
                            } catch (Exception e3) {
                                e = e3;
                                i5 = columnIndexOrThrow;
                                i11 = columnIndexOrThrow2;
                            }
                            if (yVar.f54554y == null) {
                                try {
                                    yVar.P("User has been deleted");
                                } catch (Exception e11) {
                                    e = e11;
                                    i5 = columnIndexOrThrow;
                                    i11 = columnIndexOrThrow2;
                                    longSparseArray = longSparseArray3;
                                    map = map4;
                                    packageManager = packageManager4;
                                    i12 = i29;
                                    appWidgetManager = appWidgetManager3;
                                    Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                    packageManager4 = packageManager;
                                    appWidgetManager3 = appWidgetManager;
                                    i29 = i12;
                                    columnIndexOrThrow = i5;
                                    columnIndexOrThrow2 = i11;
                                    map4 = map;
                                    longSparseArray3 = longSparseArray;
                                }
                            } else if (yVar.f54555z != -1) {
                                int i31 = yVar.B;
                                if (i31 == 0 || i31 == 1) {
                                    arrayList2 = arrayList3;
                                    i5 = columnIndexOrThrow;
                                    i11 = columnIndexOrThrow2;
                                    map2 = map5;
                                    longSparseArray = longSparseArray3;
                                    map = map4;
                                    i14 = i28;
                                    i13 = i29;
                                    int i32 = 8;
                                    i15 = i25;
                                    try {
                                        intentS = yVar.S();
                                    } catch (Exception e12) {
                                        e = e12;
                                        i28 = i14;
                                        i12 = i13;
                                        i25 = i15;
                                        appWidgetManager = appWidgetManager3;
                                    }
                                    if (intentS != null) {
                                        yVar.P("Invalid or null intent");
                                        i28 = i14;
                                        i25 = i15;
                                        appWidgetManager = appWidgetManager3;
                                        packageManager2 = packageManager4;
                                        launcherApps = launcherApps3;
                                        launcherApps3 = launcherApps;
                                        packageManager4 = packageManager2;
                                        appWidgetManager3 = appWidgetManager;
                                        columnIndexOrThrow = i5;
                                        columnIndexOrThrow2 = i11;
                                        arrayList3 = arrayList2;
                                        map4 = map;
                                        longSparseArray3 = longSparseArray;
                                        i29 = i13;
                                        map5 = map2;
                                    } else {
                                        i25 = i15;
                                        AppWidgetManager appWidgetManager4 = appWidgetManager3;
                                        try {
                                            if (!this.f54396k.t(yVar.f54553x)) {
                                                i32 = 0;
                                            }
                                            component = intentS.getComponent();
                                            if (component == null) {
                                                try {
                                                    packageName = intentS.getPackage();
                                                } catch (Exception e13) {
                                                    e = e13;
                                                    i28 = i14;
                                                    appWidgetManager = appWidgetManager4;
                                                    i12 = i13;
                                                    packageManager = packageManager4;
                                                    map5 = map2;
                                                    arrayList3 = arrayList2;
                                                }
                                            } else {
                                                packageName = component.getPackageName();
                                            }
                                        } catch (Exception e14) {
                                            e = e14;
                                            i28 = i14;
                                            appWidgetManager = appWidgetManager4;
                                            i12 = i13;
                                            packageManager = packageManager4;
                                            arrayList3 = arrayList2;
                                            map5 = map2;
                                            Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                            packageManager4 = packageManager;
                                            appWidgetManager3 = appWidgetManager;
                                            i29 = i12;
                                            columnIndexOrThrow = i5;
                                            columnIndexOrThrow2 = i11;
                                            map4 = map;
                                            longSparseArray3 = longSparseArray;
                                        }
                                        if (!TextUtils.isEmpty(packageName) || yVar.B == 1) {
                                            boolean z15 = TextUtils.isEmpty(packageName) || this.f54391f.isPackageEnabled(packageName, yVar.f54554y);
                                            if (component == null || !z15) {
                                                i28 = i14;
                                            } else {
                                                try {
                                                    i28 = i14;
                                                    if (yVar.B != 6) {
                                                        try {
                                                            if (this.f54391f.isActivityEnabled(component, yVar.f54554y) || "com.teslacoilsw.launcher".equals(component.getPackageName())) {
                                                                appWidgetManager = appWidgetManager4;
                                                                launcherApps = launcherApps3;
                                                                i16 = i32;
                                                                if (yVar.C != 0) {
                                                                    yVar.f54539h.c(yVar.f54555z);
                                                                    yVar.C = 0;
                                                                }
                                                            } else {
                                                                launcherApps = launcherApps3;
                                                                try {
                                                                    List<LauncherActivityInfo> activityList = launcherApps.getActivityList(packageName, yVar.f54554y);
                                                                    if (activityList.isEmpty()) {
                                                                        intentS = null;
                                                                        i21 = 0;
                                                                    } else {
                                                                        i21 = 0;
                                                                        intentS = ga.a.N0(activityList.get(0).getComponentName());
                                                                    }
                                                                    if (intentS != null) {
                                                                        yVar.C = i21;
                                                                        ya.b bVarV = yVar.V();
                                                                        i16 = i32;
                                                                        appWidgetManager = appWidgetManager4;
                                                                        try {
                                                                            bVarV.k("intent", intentS.toUri(i21));
                                                                            bVarV.a();
                                                                            intentS.getComponent();
                                                                        } catch (Exception e15) {
                                                                            e = e15;
                                                                            launcherApps3 = launcherApps;
                                                                            i12 = i13;
                                                                            packageManager = packageManager4;
                                                                            map5 = map2;
                                                                            arrayList3 = arrayList2;
                                                                            Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                                            packageManager4 = packageManager;
                                                                            appWidgetManager3 = appWidgetManager;
                                                                            i29 = i12;
                                                                            columnIndexOrThrow = i5;
                                                                            columnIndexOrThrow2 = i11;
                                                                            map4 = map;
                                                                            longSparseArray3 = longSparseArray;
                                                                        }
                                                                    } else {
                                                                        appWidgetManager = appWidgetManager4;
                                                                        yVar.P("Unable to find a launch target");
                                                                        packageManager2 = packageManager4;
                                                                        launcherApps3 = launcherApps;
                                                                        packageManager4 = packageManager2;
                                                                        appWidgetManager3 = appWidgetManager;
                                                                        columnIndexOrThrow = i5;
                                                                        columnIndexOrThrow2 = i11;
                                                                        arrayList3 = arrayList2;
                                                                        map4 = map;
                                                                        longSparseArray3 = longSparseArray;
                                                                        i29 = i13;
                                                                        map5 = map2;
                                                                    }
                                                                } catch (Exception e16) {
                                                                    e = e16;
                                                                    appWidgetManager = appWidgetManager4;
                                                                }
                                                            }
                                                        } catch (Exception e17) {
                                                            e = e17;
                                                            appWidgetManager = appWidgetManager4;
                                                            i12 = i13;
                                                            packageManager = packageManager4;
                                                            map5 = map2;
                                                            arrayList3 = arrayList2;
                                                            Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                            packageManager4 = packageManager;
                                                            appWidgetManager3 = appWidgetManager;
                                                            i29 = i12;
                                                            columnIndexOrThrow = i5;
                                                            columnIndexOrThrow2 = i11;
                                                            map4 = map;
                                                            longSparseArray3 = longSparseArray;
                                                        }
                                                    }
                                                } catch (Exception e18) {
                                                    e = e18;
                                                    i28 = i14;
                                                }
                                                if (TextUtils.isEmpty(packageName) && !z15) {
                                                    try {
                                                    } catch (Exception e19) {
                                                        e = e19;
                                                        packageManager2 = packageManager4;
                                                    }
                                                    if (yVar.C != 0) {
                                                        ea.b.a("LoaderTask", "package not yet restored: " + packageName);
                                                        g0Var.c(-1, yVar.f54554y, packageName);
                                                        if (!yVar.D(4)) {
                                                            if (mapB.containsKey(g0Var)) {
                                                                yVar.C |= 4;
                                                                ya.b bVarV2 = yVar.V();
                                                                bVarV2.h(Integer.valueOf(yVar.C), "restored");
                                                                bVarV2.a();
                                                            } else {
                                                                yVar.P("Unrestored app removed: " + packageName);
                                                                packageManager2 = packageManager4;
                                                                launcherApps3 = launcherApps;
                                                                packageManager4 = packageManager2;
                                                                appWidgetManager3 = appWidgetManager;
                                                                columnIndexOrThrow = i5;
                                                                columnIndexOrThrow2 = i11;
                                                                arrayList3 = arrayList2;
                                                                map4 = map;
                                                                longSparseArray3 = longSparseArray;
                                                                i29 = i13;
                                                                map5 = map2;
                                                            }
                                                        }
                                                    } else {
                                                        packageManager2 = packageManager4;
                                                        try {
                                                            try {
                                                                applicationInfo2 = packageManager2.getApplicationInfo(packageName, UserMetadata.MAX_INTERNAL_KEY_SIZE);
                                                            } catch (Exception e21) {
                                                                e = e21;
                                                                launcherApps3 = launcherApps;
                                                                packageManager = packageManager2;
                                                                i12 = i13;
                                                                map5 = map2;
                                                                arrayList3 = arrayList2;
                                                                Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                                packageManager4 = packageManager;
                                                                appWidgetManager3 = appWidgetManager;
                                                                i29 = i12;
                                                                columnIndexOrThrow = i5;
                                                                columnIndexOrThrow2 = i11;
                                                                map4 = map;
                                                                longSparseArray3 = longSparseArray;
                                                            }
                                                        } catch (PackageManager.NameNotFoundException unused2) {
                                                            applicationInfo2 = null;
                                                        }
                                                        if ((applicationInfo2 == null || (applicationInfo2.flags & SQLiteDatabase.OPEN_PRIVATECACHE) == 0) ? false : true) {
                                                            i17 = i16 | 2;
                                                        } else if (zO) {
                                                            yVar.P("Invalid package removed: " + packageName);
                                                            launcherApps3 = launcherApps;
                                                            packageManager4 = packageManager2;
                                                            appWidgetManager3 = appWidgetManager;
                                                            columnIndexOrThrow = i5;
                                                            columnIndexOrThrow2 = i11;
                                                            arrayList3 = arrayList2;
                                                            map4 = map;
                                                            longSparseArray3 = longSparseArray;
                                                            i29 = i13;
                                                            map5 = map2;
                                                        } else {
                                                            this.n.add(new ya.g0(packageName, yVar.f54554y));
                                                            i17 = i16;
                                                        }
                                                        z12 = true;
                                                        i18 = yVar.C;
                                                        if ((i18 & 8) != 0) {
                                                            z15 = false;
                                                        }
                                                        if (z15 && i18 != 0) {
                                                            yVar.f54539h.c(yVar.f54555z);
                                                            yVar.C = 0;
                                                        }
                                                        int i33 = yVar.A;
                                                        boolean z16 = !(i33 == -100 || i33 == -101);
                                                        if (yVar.C == 0) {
                                                            jVarH = yVar.w(intentS);
                                                        } else {
                                                            int i34 = yVar.B;
                                                            if (i34 == 0) {
                                                                jVarH = yVar.h(intentS, z12, z16, !u9.b.f90699l.b());
                                                            } else {
                                                                if (i34 == 6) {
                                                                    try {
                                                                        shortcutKeyD = ShortcutKey.d(intentS, yVar.f54554y);
                                                                        i19 = i17;
                                                                        packageManager = packageManager2;
                                                                        try {
                                                                            i12 = i13;
                                                                            longSparseArray2 = longSparseArray;
                                                                            try {
                                                                            } catch (Exception e22) {
                                                                                e = e22;
                                                                            }
                                                                        } catch (Exception e23) {
                                                                            e = e23;
                                                                            i12 = i13;
                                                                            launcherApps3 = launcherApps;
                                                                            map5 = map2;
                                                                            arrayList3 = arrayList2;
                                                                            Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                                            packageManager4 = packageManager;
                                                                            appWidgetManager3 = appWidgetManager;
                                                                            i29 = i12;
                                                                            columnIndexOrThrow = i5;
                                                                            columnIndexOrThrow2 = i11;
                                                                            map4 = map;
                                                                            longSparseArray3 = longSparseArray;
                                                                        }
                                                                    } catch (Exception e24) {
                                                                        e = e24;
                                                                        packageManager = packageManager2;
                                                                    }
                                                                    if (((Boolean) longSparseArray2.get(yVar.f54553x)).booleanValue()) {
                                                                        try {
                                                                            shortcutInfo = (ShortcutInfo) map.get(shortcutKeyD);
                                                                        } catch (Exception e25) {
                                                                            e = e25;
                                                                            map = map;
                                                                            longSparseArray = longSparseArray2;
                                                                            launcherApps3 = launcherApps;
                                                                            map5 = map2;
                                                                            arrayList3 = arrayList2;
                                                                            Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                                            packageManager4 = packageManager;
                                                                            appWidgetManager3 = appWidgetManager;
                                                                            i29 = i12;
                                                                            columnIndexOrThrow = i5;
                                                                            columnIndexOrThrow2 = i11;
                                                                            map4 = map;
                                                                            longSparseArray3 = longSparseArray;
                                                                        }
                                                                        if (shortcutInfo == null) {
                                                                            if (map2 == null) {
                                                                                map = map;
                                                                                try {
                                                                                } catch (Exception e26) {
                                                                                    e = e26;
                                                                                }
                                                                                try {
                                                                                    mc0.d.f76206a.h("Got no longer valid shortcut, checking PUBLISHED...", new Object[0]);
                                                                                    qa.b bVarC2 = new androidx.room.h(context, yVar.f54554y).c(9);
                                                                                    if (bVarC2.f83909a) {
                                                                                        HashMap map6 = new HashMap(bVarC2.size());
                                                                                        try {
                                                                                            Iterator<E> it2 = bVarC2.iterator();
                                                                                            while (it2.hasNext()) {
                                                                                                ShortcutInfo shortcutInfo3 = (ShortcutInfo) it2.next();
                                                                                                longSparseArray = longSparseArray2;
                                                                                                try {
                                                                                                    map6.put(ShortcutKey.b(shortcutInfo3), shortcutInfo3);
                                                                                                    longSparseArray2 = longSparseArray;
                                                                                                } catch (Exception e27) {
                                                                                                    e = e27;
                                                                                                    launcherApps3 = launcherApps;
                                                                                                    map5 = map6;
                                                                                                    arrayList3 = arrayList2;
                                                                                                    Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                                                                    packageManager4 = packageManager;
                                                                                                    appWidgetManager3 = appWidgetManager;
                                                                                                    i29 = i12;
                                                                                                    columnIndexOrThrow = i5;
                                                                                                    columnIndexOrThrow2 = i11;
                                                                                                    map4 = map;
                                                                                                    longSparseArray3 = longSparseArray;
                                                                                                }
                                                                                            }
                                                                                            longSparseArray = longSparseArray2;
                                                                                            map5 = map6;
                                                                                        } catch (Exception e28) {
                                                                                            e = e28;
                                                                                            longSparseArray = longSparseArray2;
                                                                                        }
                                                                                    } else {
                                                                                        longSparseArray = longSparseArray2;
                                                                                        try {
                                                                                            map5 = Collections.EMPTY_MAP;
                                                                                        } catch (Exception e29) {
                                                                                            e = e29;
                                                                                            launcherApps3 = launcherApps;
                                                                                            map5 = map2;
                                                                                            arrayList3 = arrayList2;
                                                                                            Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                                                            packageManager4 = packageManager;
                                                                                            appWidgetManager3 = appWidgetManager;
                                                                                            i29 = i12;
                                                                                            columnIndexOrThrow = i5;
                                                                                            columnIndexOrThrow2 = i11;
                                                                                            map4 = map;
                                                                                            longSparseArray3 = longSparseArray;
                                                                                        }
                                                                                    }
                                                                                } catch (Exception e31) {
                                                                                    e = e31;
                                                                                    longSparseArray = longSparseArray2;
                                                                                    launcherApps3 = launcherApps;
                                                                                    map5 = map2;
                                                                                    arrayList3 = arrayList2;
                                                                                    Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                                                    packageManager4 = packageManager;
                                                                                    appWidgetManager3 = appWidgetManager;
                                                                                    i29 = i12;
                                                                                    columnIndexOrThrow = i5;
                                                                                    columnIndexOrThrow2 = i11;
                                                                                    map4 = map;
                                                                                    longSparseArray3 = longSparseArray;
                                                                                }
                                                                            } else {
                                                                                map = map;
                                                                                longSparseArray = longSparseArray2;
                                                                                map5 = map2;
                                                                            }
                                                                            try {
                                                                                shortcutInfo = (ShortcutInfo) map5.get(shortcutKeyD);
                                                                            } catch (Exception e32) {
                                                                                e = e32;
                                                                                launcherApps3 = launcherApps;
                                                                                arrayList3 = arrayList2;
                                                                                Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                                                packageManager4 = packageManager;
                                                                                appWidgetManager3 = appWidgetManager;
                                                                                i29 = i12;
                                                                                columnIndexOrThrow = i5;
                                                                                columnIndexOrThrow2 = i11;
                                                                                map4 = map;
                                                                                longSparseArray3 = longSparseArray;
                                                                            }
                                                                            if (shortcutInfo == null) {
                                                                                yVar.P("Pinned shortcut not found");
                                                                                launcherApps3 = launcherApps;
                                                                                packageManager4 = packageManager;
                                                                                appWidgetManager3 = appWidgetManager;
                                                                                i29 = i12;
                                                                                columnIndexOrThrow = i5;
                                                                                columnIndexOrThrow2 = i11;
                                                                                arrayList3 = arrayList2;
                                                                                map4 = map;
                                                                                longSparseArray3 = longSparseArray;
                                                                            } else {
                                                                                mc0.d.f76206a.h("Recreating pinned shortcut", new Object[0]);
                                                                            }
                                                                        } else {
                                                                            map = map;
                                                                            longSparseArray = longSparseArray2;
                                                                            map5 = map2;
                                                                        }
                                                                        jVarM = new ga.j(context, shortcutInfo);
                                                                        iz.c cVarS = yVar.s();
                                                                        jVarM.f57303q = cVarS;
                                                                        if (cVarS.b()) {
                                                                            jVarM.f57300l = yVar.getString(yVar.f54544m);
                                                                        }
                                                                        if (jVarM.f57303q.a()) {
                                                                            yVar.K(jVarM);
                                                                            map3 = map5;
                                                                        } else {
                                                                            map3 = map5;
                                                                            this.f54395j.p(jVarM, shortcutInfo, new aa.y(yVar, 2));
                                                                        }
                                                                        ApplicationInfo applicationInfo3 = launcherApps.getApplicationInfo(shortcutInfo.getPackage(), 0, jVarM.o);
                                                                        ApplicationInfo applicationInfo4 = ((applicationInfo3.flags & 8388608) == 0 || !applicationInfo3.enabled) ? null : applicationInfo3;
                                                                        if ((applicationInfo4 == null || (applicationInfo4.flags & 1073741824) == 0) ? false : true) {
                                                                            jVarM.f57305s |= 4;
                                                                        }
                                                                        Intent intentD = jVarM.d();
                                                                        arrayList.add(shortcutInfo);
                                                                        intentS = intentD;
                                                                        map5 = map3;
                                                                        jVar = jVarM;
                                                                        i17 = i19;
                                                                    } else {
                                                                        longSparseArray = longSparseArray2;
                                                                        try {
                                                                            jVarM = yVar.M();
                                                                            jVarM.f57305s |= 32;
                                                                            map5 = map2;
                                                                            jVar = jVarM;
                                                                            i17 = i19;
                                                                        } catch (Exception e33) {
                                                                            e = e33;
                                                                            launcherApps3 = launcherApps;
                                                                            map5 = map2;
                                                                            arrayList3 = arrayList2;
                                                                            Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                                            packageManager4 = packageManager;
                                                                            appWidgetManager3 = appWidgetManager;
                                                                            i29 = i12;
                                                                            columnIndexOrThrow = i5;
                                                                            columnIndexOrThrow2 = i11;
                                                                            map4 = map;
                                                                            longSparseArray3 = longSparseArray;
                                                                        }
                                                                    }
                                                                } else {
                                                                    int i35 = i17;
                                                                    packageManager = packageManager2;
                                                                    i12 = i13;
                                                                    try {
                                                                        ga.j jVarM2 = yVar.M();
                                                                        if (!TextUtils.isEmpty(packageName)) {
                                                                            try {
                                                                                applicationInfo = launcherApps.getApplicationInfo(packageName, 0, yVar.f54554y);
                                                                            } catch (PackageManager.NameNotFoundException unused3) {
                                                                            }
                                                                            ApplicationInfo applicationInfo5 = ((applicationInfo.flags & 8388608) == 0 || !applicationInfo.enabled) ? null : applicationInfo;
                                                                            if ((applicationInfo5 == null || (applicationInfo5.flags & 1073741824) == 0) ? false : true) {
                                                                                i35 |= 4;
                                                                            }
                                                                        }
                                                                        jVarM2.C = yVar.getInt(columnIndexOrThrow5);
                                                                        if (intentS.getAction() != null && intentS.getCategories() != null && intentS.getAction().equals("android.intent.action.MAIN") && intentS.getCategories().contains("android.intent.category.LAUNCHER")) {
                                                                            intentS.addFlags(270532608);
                                                                        }
                                                                        jVar = jVarM2;
                                                                        i17 = i35;
                                                                        map5 = map2;
                                                                    } catch (Exception e34) {
                                                                        e = e34;
                                                                        launcherApps3 = launcherApps;
                                                                        arrayList3 = arrayList2;
                                                                        map5 = map2;
                                                                        Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                                        packageManager4 = packageManager;
                                                                        appWidgetManager3 = appWidgetManager;
                                                                        i29 = i12;
                                                                        columnIndexOrThrow = i5;
                                                                        columnIndexOrThrow2 = i11;
                                                                        map4 = map;
                                                                        longSparseArray3 = longSparseArray;
                                                                    }
                                                                }
                                                                if (jVar == null) {
                                                                    launcherApps3 = launcherApps;
                                                                    arrayList3 = arrayList2;
                                                                    throw new RuntimeException("Unexpected null WorkspaceItemInfo");
                                                                }
                                                                try {
                                                                    launcherApps3 = launcherApps;
                                                                    arrayList3 = arrayList2;
                                                                    try {
                                                                        arrayList3.add(yVar.f(jVar, z16));
                                                                        yVar.a(jVar);
                                                                        jVar.f57322x = intentS;
                                                                        n30.b bVar = n30.b.f77779c;
                                                                        jVar.f57295g = bVar;
                                                                        jVar.f57296h = bVar;
                                                                        jVar.f57305s = i17 | jVar.f57305s;
                                                                        if (zIsSafeMode && !x7.e.z(context, intentS)) {
                                                                            jVar.f57305s |= 1;
                                                                        }
                                                                        launcherActivityInfoP = yVar.p();
                                                                        if (launcherActivityInfoP != null) {
                                                                            try {
                                                                                jVar.C0(x7.e.u(launcherActivityInfoP), 2);
                                                                            } catch (Exception e35) {
                                                                                e = e35;
                                                                            }
                                                                        }
                                                                    } catch (Exception e36) {
                                                                        e = e36;
                                                                    }
                                                                } catch (Exception e37) {
                                                                    e = e37;
                                                                    launcherApps3 = launcherApps;
                                                                    arrayList3 = arrayList2;
                                                                    Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                                    packageManager4 = packageManager;
                                                                    appWidgetManager3 = appWidgetManager;
                                                                    i29 = i12;
                                                                    columnIndexOrThrow = i5;
                                                                    columnIndexOrThrow2 = i11;
                                                                    map4 = map;
                                                                    longSparseArray3 = longSparseArray;
                                                                }
                                                                if (yVar.C == 0 || TextUtils.isEmpty(packageName)) {
                                                                    string = yVar.getString(yVar.E);
                                                                    try {
                                                                    } catch (URISyntaxException unused4) {
                                                                        Log.e("LoaderCursor", "Error parsing Intent");
                                                                    }
                                                                    if (TextUtils.isEmpty(string)) {
                                                                        namedIntentN = null;
                                                                    } else {
                                                                        NamedIntent namedIntent = NamedIntent.f46367d;
                                                                        namedIntentN = w20.h.n(mx.g0.e(), string);
                                                                    }
                                                                    jVar.f57308v = namedIntentN;
                                                                    string2 = yVar.getString(yVar.F);
                                                                    try {
                                                                    } catch (URISyntaxException unused5) {
                                                                        Log.e("LoaderCursor", "Error parsing Intent");
                                                                    }
                                                                    if (TextUtils.isEmpty(string2)) {
                                                                        namedIntentN2 = null;
                                                                    } else {
                                                                        NamedIntent namedIntent2 = NamedIntent.f46367d;
                                                                        namedIntentN2 = w20.h.n(mx.g0.e(), string2);
                                                                    }
                                                                    jVar.f57309w = namedIntentN2;
                                                                    yVar.b(jVar, this.f54388c, a0Var);
                                                                    packageManager4 = packageManager;
                                                                    appWidgetManager3 = appWidgetManager;
                                                                    i29 = i12;
                                                                    columnIndexOrThrow = i5;
                                                                    columnIndexOrThrow2 = i11;
                                                                    map4 = map;
                                                                    longSparseArray3 = longSparseArray;
                                                                } else {
                                                                    g0Var.c(-1, yVar.f54554y, packageName);
                                                                    PackageInstaller.SessionInfo sessionInfo = (PackageInstaller.SessionInfo) mapB.get(g0Var);
                                                                    if (sessionInfo == null) {
                                                                        jVar.f57305s &= -1025;
                                                                    } else {
                                                                        if (launcherActivityInfoP == null) {
                                                                            try {
                                                                                jVar.C0((int) (sessionInfo.getProgress() * 100.0f), 1);
                                                                            } catch (Exception e38) {
                                                                                e = e38;
                                                                            }
                                                                        }
                                                                        string = yVar.getString(yVar.E);
                                                                        if (TextUtils.isEmpty(string)) {
                                                                        }
                                                                        jVar.f57308v = namedIntentN;
                                                                        string2 = yVar.getString(yVar.F);
                                                                        if (TextUtils.isEmpty(string2)) {
                                                                        }
                                                                        jVar.f57309w = namedIntentN2;
                                                                        yVar.b(jVar, this.f54388c, a0Var);
                                                                        packageManager4 = packageManager;
                                                                        appWidgetManager3 = appWidgetManager;
                                                                        i29 = i12;
                                                                        columnIndexOrThrow = i5;
                                                                        columnIndexOrThrow2 = i11;
                                                                        map4 = map;
                                                                        longSparseArray3 = longSparseArray;
                                                                    }
                                                                    string = yVar.getString(yVar.E);
                                                                    if (TextUtils.isEmpty(string)) {
                                                                    }
                                                                    jVar.f57308v = namedIntentN;
                                                                    string2 = yVar.getString(yVar.F);
                                                                    if (TextUtils.isEmpty(string2)) {
                                                                    }
                                                                    jVar.f57309w = namedIntentN2;
                                                                    yVar.b(jVar, this.f54388c, a0Var);
                                                                    packageManager4 = packageManager;
                                                                    appWidgetManager3 = appWidgetManager;
                                                                    i29 = i12;
                                                                    columnIndexOrThrow = i5;
                                                                    columnIndexOrThrow2 = i11;
                                                                    map4 = map;
                                                                    longSparseArray3 = longSparseArray;
                                                                }
                                                                e = e38;
                                                                Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                                packageManager4 = packageManager;
                                                                appWidgetManager3 = appWidgetManager;
                                                                i29 = i12;
                                                                columnIndexOrThrow = i5;
                                                                columnIndexOrThrow2 = i11;
                                                                map4 = map;
                                                                longSparseArray3 = longSparseArray;
                                                            }
                                                        }
                                                        packageManager = packageManager2;
                                                        jVar = jVarH;
                                                        i12 = i13;
                                                        map5 = map2;
                                                        if (jVar == null) {
                                                        }
                                                        e = e38;
                                                        Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                        packageManager4 = packageManager;
                                                        appWidgetManager3 = appWidgetManager;
                                                        i29 = i12;
                                                        columnIndexOrThrow = i5;
                                                        columnIndexOrThrow2 = i11;
                                                        map4 = map;
                                                        longSparseArray3 = longSparseArray;
                                                    }
                                                }
                                                packageManager2 = packageManager4;
                                                i17 = i16;
                                                z12 = false;
                                                i18 = yVar.C;
                                                if ((i18 & 8) != 0) {
                                                }
                                                if (z15) {
                                                    yVar.f54539h.c(yVar.f54555z);
                                                    yVar.C = 0;
                                                }
                                                int i332 = yVar.A;
                                                if (i332 == -100) {
                                                    boolean z162 = !(i332 == -100 || i332 == -101);
                                                    if (yVar.C == 0) {
                                                    }
                                                    packageManager = packageManager2;
                                                    jVar = jVarH;
                                                    i12 = i13;
                                                    map5 = map2;
                                                    if (jVar == null) {
                                                    }
                                                    e = e38;
                                                    Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                    packageManager4 = packageManager;
                                                    appWidgetManager3 = appWidgetManager;
                                                    i29 = i12;
                                                    columnIndexOrThrow = i5;
                                                    columnIndexOrThrow2 = i11;
                                                    map4 = map;
                                                    longSparseArray3 = longSparseArray;
                                                }
                                            }
                                            appWidgetManager = appWidgetManager4;
                                            launcherApps = launcherApps3;
                                            i16 = i32;
                                            if (TextUtils.isEmpty(packageName)) {
                                            }
                                            packageManager2 = packageManager4;
                                            i17 = i16;
                                            z12 = false;
                                            i18 = yVar.C;
                                            if ((i18 & 8) != 0) {
                                            }
                                            if (z15) {
                                            }
                                            int i3322 = yVar.A;
                                        } else {
                                            yVar.P("Only legacy shortcuts can have null package");
                                            i28 = i14;
                                            appWidgetManager = appWidgetManager4;
                                            packageManager2 = packageManager4;
                                            launcherApps = launcherApps3;
                                            launcherApps3 = launcherApps;
                                            packageManager4 = packageManager2;
                                            appWidgetManager3 = appWidgetManager;
                                            columnIndexOrThrow = i5;
                                            columnIndexOrThrow2 = i11;
                                            arrayList3 = arrayList2;
                                            map4 = map;
                                            longSparseArray3 = longSparseArray;
                                            i29 = i13;
                                            map5 = map2;
                                        }
                                    }
                                } else {
                                    if (i31 != 2) {
                                        if (i31 == 4 || i31 == 5) {
                                            boolean z17 = i31 == 5;
                                            try {
                                                i22 = yVar.getInt(columnIndexOrThrow);
                                                string5 = yVar.getString(columnIndexOrThrow2);
                                                if ((yVar.getInt(columnIndexOrThrow5) & 1) != 0) {
                                                    componentNameUnflattenFromString = QsbContainerView.a(context);
                                                    if (componentNameUnflattenFromString == null) {
                                                        yVar.P("Discarding SearchWidget without packagename ");
                                                    }
                                                } else {
                                                    componentNameUnflattenFromString = ComponentName.unflattenFromString(string5);
                                                }
                                                i5 = columnIndexOrThrow;
                                                i11 = columnIndexOrThrow2;
                                                componentName = componentNameUnflattenFromString;
                                            } catch (Exception e39) {
                                                e = e39;
                                                arrayList2 = arrayList3;
                                                i5 = columnIndexOrThrow;
                                                i11 = columnIndexOrThrow2;
                                            }
                                            try {
                                                zD = yVar.D(1);
                                                zD2 = yVar.D(2);
                                                map2 = map5;
                                            } catch (Exception e40) {
                                                e = e40;
                                                arrayList2 = arrayList3;
                                                map2 = map5;
                                                longSparseArray = longSparseArray3;
                                                map = map4;
                                                i13 = i29;
                                                i12 = i13;
                                                appWidgetManager = appWidgetManager3;
                                                packageManager = packageManager4;
                                                map5 = map2;
                                                arrayList3 = arrayList2;
                                                Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                packageManager4 = packageManager;
                                                appWidgetManager3 = appWidgetManager;
                                                i29 = i12;
                                                columnIndexOrThrow = i5;
                                                columnIndexOrThrow2 = i11;
                                                map4 = map;
                                                longSparseArray3 = longSparseArray;
                                            }
                                            try {
                                                componentKey = new ComponentKey(componentName, yVar.f54554y);
                                            } catch (Exception e41) {
                                                e = e41;
                                                arrayList2 = arrayList3;
                                                longSparseArray = longSparseArray3;
                                                map = map4;
                                                i13 = i29;
                                                i12 = i13;
                                                appWidgetManager = appWidgetManager3;
                                                packageManager = packageManager4;
                                                map5 = map2;
                                                arrayList3 = arrayList2;
                                                Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                packageManager4 = packageManager;
                                                appWidgetManager3 = appWidgetManager;
                                                i29 = i12;
                                                columnIndexOrThrow = i5;
                                                columnIndexOrThrow2 = i11;
                                                map4 = map;
                                                longSparseArray3 = longSparseArray;
                                            }
                                            if (this.f54397l.containsKey(componentKey)) {
                                                arrayList2 = arrayList3;
                                            } else {
                                                if (i22 <= -100) {
                                                    try {
                                                        arrayList2 = arrayList3;
                                                    } catch (Exception e42) {
                                                        e = e42;
                                                        longSparseArray = longSparseArray3;
                                                        map = map4;
                                                        packageManager = packageManager4;
                                                        i12 = i29;
                                                        map5 = map2;
                                                        appWidgetManager = appWidgetManager3;
                                                        Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                        packageManager4 = packageManager;
                                                        appWidgetManager3 = appWidgetManager;
                                                        i29 = i12;
                                                        columnIndexOrThrow = i5;
                                                        columnIndexOrThrow2 = i11;
                                                        map4 = map;
                                                        longSparseArray3 = longSparseArray;
                                                    }
                                                    try {
                                                        if (componentName.getClassName().startsWith("#custom-widget-")) {
                                                            this.f54397l.put(componentKey, ((bb.b) bb.b.f17790h.h(context)).a(i22));
                                                        }
                                                    } catch (Exception e43) {
                                                        e = e43;
                                                        longSparseArray = longSparseArray3;
                                                        map = map4;
                                                        packageManager = packageManager4;
                                                        i12 = i29;
                                                        map5 = map2;
                                                        arrayList3 = arrayList2;
                                                        appWidgetManager = appWidgetManager3;
                                                        Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                        packageManager4 = packageManager;
                                                        appWidgetManager3 = appWidgetManager;
                                                        i29 = i12;
                                                        columnIndexOrThrow = i5;
                                                        columnIndexOrThrow2 = i11;
                                                        map4 = map;
                                                        longSparseArray3 = longSparseArray;
                                                    }
                                                } else {
                                                    arrayList2 = arrayList3;
                                                }
                                                try {
                                                    arrayMap = this.f54397l;
                                                    map = map4;
                                                } catch (Exception e44) {
                                                    e = e44;
                                                    longSparseArray = longSparseArray3;
                                                    map = map4;
                                                }
                                                try {
                                                    longSparseArray = longSparseArray3;
                                                    ya.g0 g0Var2 = new ya.g0(componentName.getPackageName(), yVar.f54554y);
                                                    Iterator<AppWidgetProviderInfo> it3 = appWidgetManager3.getInstalledProvidersForPackage(g0Var2.f97138a, g0Var2.f97140c).iterator();
                                                    while (true) {
                                                        if (!it3.hasNext()) {
                                                            launcherAppWidgetProviderInfoE = null;
                                                            break;
                                                        }
                                                        AppWidgetProviderInfo next = it3.next();
                                                        if (next.provider.equals(componentName)) {
                                                            launcherAppWidgetProviderInfoE = LauncherAppWidgetProviderInfo.e(context, next);
                                                            break;
                                                        }
                                                    }
                                                    arrayMap.put(componentKey, launcherAppWidgetProviderInfoE);
                                                    appWidgetProviderInfo = (AppWidgetProviderInfo) this.f54397l.get(componentKey);
                                                    zA = a(appWidgetProviderInfo);
                                                } catch (Exception e45) {
                                                    e = e45;
                                                    longSparseArray = longSparseArray3;
                                                    packageManager = packageManager4;
                                                    i12 = i29;
                                                    map5 = map2;
                                                    arrayList3 = arrayList2;
                                                    appWidgetManager = appWidgetManager3;
                                                    Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                    packageManager4 = packageManager;
                                                    appWidgetManager3 = appWidgetManager;
                                                    i29 = i12;
                                                    columnIndexOrThrow = i5;
                                                    columnIndexOrThrow2 = i11;
                                                    map4 = map;
                                                    longSparseArray3 = longSparseArray;
                                                }
                                                if (!zIsSafeMode || z17 || zD2 || zA || z14) {
                                                    if (zA) {
                                                        ga.g gVar2 = new ga.g(componentName, i22);
                                                        gVar2.f57312t = yVar.C;
                                                        g0Var.c(-1, yVar.f54554y, componentName.getPackageName());
                                                        PackageInstaller.SessionInfo sessionInfo2 = (PackageInstaller.SessionInfo) mapB.get(g0Var);
                                                        Integer numValueOf = sessionInfo2 == null ? null : Integer.valueOf((int) (sessionInfo2.getProgress() * 100.0f));
                                                        if (!yVar.D(8)) {
                                                            if (numValueOf != null) {
                                                                gVar2.f57312t |= 8;
                                                            } else if (!zIsSafeMode && !z14) {
                                                                yVar.P("Unrestored widget removed: " + componentName);
                                                                packageManager2 = packageManager4;
                                                                launcherApps = launcherApps3;
                                                                i13 = i29;
                                                                appWidgetManager = appWidgetManager3;
                                                                launcherApps3 = launcherApps;
                                                                packageManager4 = packageManager2;
                                                                appWidgetManager3 = appWidgetManager;
                                                                columnIndexOrThrow = i5;
                                                                columnIndexOrThrow2 = i11;
                                                                arrayList3 = arrayList2;
                                                                map4 = map;
                                                                longSparseArray3 = longSparseArray;
                                                                i29 = i13;
                                                                map5 = map2;
                                                            }
                                                        }
                                                        gVar2.f57313u = numValueOf == null ? 0 : numValueOf.intValue();
                                                        gVar = gVar2;
                                                    } else {
                                                        gVar = new ga.g(appWidgetProviderInfo.provider, i22);
                                                        int i36 = yVar.C & (-11);
                                                        if (zD2 && !zD) {
                                                            i36 |= 4;
                                                        }
                                                        gVar.f57312t = i36;
                                                    }
                                                    if (gVar.p0(32)) {
                                                        gVar.f57314v = yVar.S();
                                                    }
                                                    yVar.a(gVar);
                                                    i14 = i28;
                                                    float f11 = yVar.getFloat(i14);
                                                    n30.b bVar2 = n30.b.f77778b;
                                                    gVar.f57295g = fg.a.l(f11);
                                                    i13 = i29;
                                                    gVar.f57296h = fg.a.l(yVar.getFloat(i13));
                                                    gVar.f57315w = yVar.getInt(columnIndexOrThrow5);
                                                    gVar.o = yVar.f54554y;
                                                    i15 = i25;
                                                    gVar.f57318z = yVar.getInt(i15);
                                                    gVar.A = yVar.l();
                                                    if (gVar.f57295g.a() > 0.0f || gVar.f57296h.a() <= 0.0f) {
                                                        i23 = -100;
                                                        if (gVar.f57310r == -100) {
                                                            yVar.P("Widget has invalid size: " + gVar.f57295g + "x" + gVar.f57296h);
                                                        }
                                                        i28 = i14;
                                                        i25 = i15;
                                                        appWidgetManager = appWidgetManager3;
                                                        packageManager2 = packageManager4;
                                                        launcherApps = launcherApps3;
                                                        launcherApps3 = launcherApps;
                                                        packageManager4 = packageManager2;
                                                        appWidgetManager3 = appWidgetManager;
                                                        columnIndexOrThrow = i5;
                                                        columnIndexOrThrow2 = i11;
                                                        arrayList3 = arrayList2;
                                                        map4 = map;
                                                        longSparseArray3 = longSparseArray;
                                                        i29 = i13;
                                                        map5 = map2;
                                                    } else {
                                                        i23 = -100;
                                                    }
                                                    if (i22 > i23) {
                                                        ((bb.b) bb.b.f17790h.h(context)).a(i22);
                                                    } else {
                                                        AppWidgetProviderInfo appWidgetInfo = appWidgetManager3.getAppWidgetInfo(i22);
                                                        if (appWidgetInfo != null) {
                                                            LauncherAppWidgetProviderInfo.e(context, appWidgetInfo);
                                                        }
                                                    }
                                                    i24 = yVar.A;
                                                    if (i24 != -100 || i24 == -101) {
                                                        yVar.P("Widget found where container != CONTAINER_DESKTOP nor CONTAINER_HOTSEAT - ignoring!");
                                                        i28 = i14;
                                                        i25 = i15;
                                                        appWidgetManager = appWidgetManager3;
                                                        packageManager2 = packageManager4;
                                                        launcherApps = launcherApps3;
                                                        launcherApps3 = launcherApps;
                                                        packageManager4 = packageManager2;
                                                        appWidgetManager3 = appWidgetManager;
                                                        columnIndexOrThrow = i5;
                                                        columnIndexOrThrow2 = i11;
                                                        arrayList3 = arrayList2;
                                                        map4 = map;
                                                        longSparseArray3 = longSparseArray;
                                                        i29 = i13;
                                                        map5 = map2;
                                                    } else {
                                                        if (!z17) {
                                                            String strFlattenToString = gVar.f57311s.flattenToString();
                                                            if (!strFlattenToString.equals(string5) || gVar.f57312t != yVar.C) {
                                                                ya.b bVarV3 = yVar.V();
                                                                bVarV3.k("appWidgetProvider", strFlattenToString);
                                                                bVarV3.h(Integer.valueOf(gVar.f57312t), "restored");
                                                                bVarV3.a();
                                                            }
                                                        }
                                                        if (gVar.f57312t != 0) {
                                                            ga.h hVarR = v6.r(this.f54386a.f80132a, gVar.f57311s, gVar.o);
                                                            gVar.f57316x = hVarR;
                                                            this.f54395j.u(hVarR, false);
                                                        }
                                                        yVar.c(gVar, this.f54388c);
                                                    }
                                                } else {
                                                    try {
                                                        yVar.P("Deleting widget that isn't installed anymore: " + componentName);
                                                        i15 = i25;
                                                        i14 = i28;
                                                        i13 = i29;
                                                        i28 = i14;
                                                        i12 = i13;
                                                        i25 = i15;
                                                        appWidgetManager = appWidgetManager3;
                                                        packageManager = packageManager4;
                                                        map5 = map2;
                                                        arrayList3 = arrayList2;
                                                    } catch (Exception e46) {
                                                        e = e46;
                                                        packageManager = packageManager4;
                                                        i12 = i29;
                                                        map5 = map2;
                                                        arrayList3 = arrayList2;
                                                        appWidgetManager = appWidgetManager3;
                                                        Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                                        packageManager4 = packageManager;
                                                        appWidgetManager3 = appWidgetManager;
                                                        i29 = i12;
                                                        columnIndexOrThrow = i5;
                                                        columnIndexOrThrow2 = i11;
                                                        map4 = map;
                                                        longSparseArray3 = longSparseArray;
                                                    }
                                                    packageManager4 = packageManager;
                                                    appWidgetManager3 = appWidgetManager;
                                                    i29 = i12;
                                                    columnIndexOrThrow = i5;
                                                    columnIndexOrThrow2 = i11;
                                                    map4 = map;
                                                    longSparseArray3 = longSparseArray;
                                                }
                                            }
                                            longSparseArray = longSparseArray3;
                                            map = map4;
                                            appWidgetProviderInfo = (AppWidgetProviderInfo) this.f54397l.get(componentKey);
                                            zA = a(appWidgetProviderInfo);
                                            if (zIsSafeMode) {
                                            }
                                            if (zA) {
                                            }
                                            if (gVar.p0(32)) {
                                            }
                                            yVar.a(gVar);
                                            i14 = i28;
                                            float f112 = yVar.getFloat(i14);
                                            n30.b bVar22 = n30.b.f77778b;
                                            gVar.f57295g = fg.a.l(f112);
                                            i13 = i29;
                                            gVar.f57296h = fg.a.l(yVar.getFloat(i13));
                                            gVar.f57315w = yVar.getInt(columnIndexOrThrow5);
                                            gVar.o = yVar.f54554y;
                                            i15 = i25;
                                            gVar.f57318z = yVar.getInt(i15);
                                            gVar.A = yVar.l();
                                            if (gVar.f57295g.a() > 0.0f) {
                                                i23 = -100;
                                                if (gVar.f57310r == -100) {
                                                    if (i22 > i23) {
                                                    }
                                                    i24 = yVar.A;
                                                    if (i24 != -100) {
                                                        if (i24 != -100 || i24 == -101) {
                                                        }
                                                    }
                                                }
                                                i28 = i14;
                                                i25 = i15;
                                                appWidgetManager = appWidgetManager3;
                                                packageManager2 = packageManager4;
                                                launcherApps = launcherApps3;
                                                launcherApps3 = launcherApps;
                                                packageManager4 = packageManager2;
                                                appWidgetManager3 = appWidgetManager;
                                                columnIndexOrThrow = i5;
                                                columnIndexOrThrow2 = i11;
                                                arrayList3 = arrayList2;
                                                map4 = map;
                                                longSparseArray3 = longSparseArray;
                                                i29 = i13;
                                                map5 = map2;
                                            }
                                        } else {
                                            if (i31 != 6) {
                                                arrayList2 = arrayList3;
                                                i5 = columnIndexOrThrow;
                                                i11 = columnIndexOrThrow2;
                                                map2 = map5;
                                                longSparseArray = longSparseArray3;
                                                map = map4;
                                                i14 = i28;
                                                i13 = i29;
                                                i15 = i25;
                                            }
                                            arrayList2 = arrayList3;
                                            i5 = columnIndexOrThrow;
                                            i11 = columnIndexOrThrow2;
                                            map2 = map5;
                                            longSparseArray = longSparseArray3;
                                            map = map4;
                                            i14 = i28;
                                            i13 = i29;
                                            int i322 = 8;
                                            i15 = i25;
                                            intentS = yVar.S();
                                            if (intentS != null) {
                                            }
                                        }
                                        i28 = i14;
                                        i12 = i13;
                                        i25 = i15;
                                        appWidgetManager = appWidgetManager3;
                                        packageManager = packageManager4;
                                        map5 = map2;
                                        arrayList3 = arrayList2;
                                        packageManager4 = packageManager;
                                        appWidgetManager3 = appWidgetManager;
                                        i29 = i12;
                                        columnIndexOrThrow = i5;
                                        columnIndexOrThrow2 = i11;
                                        map4 = map;
                                        longSparseArray3 = longSparseArray;
                                    } else {
                                        arrayList2 = arrayList3;
                                        i5 = columnIndexOrThrow;
                                        i11 = columnIndexOrThrow2;
                                        map2 = map5;
                                        longSparseArray = longSparseArray3;
                                        map = map4;
                                        i14 = i28;
                                        i13 = i29;
                                        i15 = i25;
                                        try {
                                            intentS2 = yVar.S();
                                        } catch (Exception e47) {
                                            e = e47;
                                        }
                                        if (intentS2 != null) {
                                            try {
                                                iD1 = iz.a.d1(intentS2.getComponent());
                                                iF = uy.q.f(iD1);
                                            } catch (Exception e48) {
                                                e48.printStackTrace();
                                            }
                                            if (iF != -1) {
                                                ga.c cVarD2 = this.f54388c.d(iD1);
                                                iz.a aVar = new iz.a();
                                                aVar.H = cVarD2.H;
                                                uy.q qVar3 = (uy.q) uy.d0.i().h(iF);
                                                if (qVar3 == null) {
                                                    yVar.P("Invalid DrawerFolder shortcut removed: " + yVar.getString(yVar.f54544m) + " #" + iF);
                                                    i28 = i14;
                                                    i25 = i15;
                                                    appWidgetManager = appWidgetManager3;
                                                    packageManager2 = packageManager4;
                                                    launcherApps = launcherApps3;
                                                    launcherApps3 = launcherApps;
                                                    packageManager4 = packageManager2;
                                                    appWidgetManager3 = appWidgetManager;
                                                    columnIndexOrThrow = i5;
                                                    columnIndexOrThrow2 = i11;
                                                    arrayList3 = arrayList2;
                                                    map4 = map;
                                                    longSparseArray3 = longSparseArray;
                                                    i29 = i13;
                                                    map5 = map2;
                                                } else {
                                                    BitmapInfo bitmapInfo = qVar3.f91746j;
                                                    if (bitmapInfo != null) {
                                                        aVar.f57304r = bitmapInfo;
                                                    }
                                                    aVar.g1(qVar3);
                                                    cVarD = aVar;
                                                    if (cVarD == null) {
                                                        cVarD = this.f54388c.d(yVar.f54555z);
                                                    }
                                                    yVar.a(cVarD);
                                                    cVarD.f57300l = yVar.getString(yVar.f54544m);
                                                    n30.b bVar3 = n30.b.f77779c;
                                                    cVarD.f57295g = bVar3;
                                                    cVarD.f57296h = bVar3;
                                                    cVarD.F = yVar.getInt(columnIndexOrThrow5);
                                                    if (yVar.C != 0) {
                                                        yVar.f54539h.c(yVar.f54555z);
                                                        yVar.C = 0;
                                                    }
                                                    string3 = yVar.getString(yVar.E);
                                                    if (TextUtils.isEmpty(string3)) {
                                                        NamedIntent namedIntent3 = NamedIntent.f46367d;
                                                        namedIntentN3 = w20.h.n(mx.g0.e(), string3);
                                                    } else {
                                                        namedIntentN3 = null;
                                                    }
                                                    cVarD.f57308v = namedIntentN3;
                                                    string4 = yVar.getString(yVar.F);
                                                    if (TextUtils.isEmpty(string4)) {
                                                        NamedIntent namedIntent4 = NamedIntent.f46367d;
                                                        namedIntentN4 = w20.h.n(mx.g0.e(), string4);
                                                    } else {
                                                        namedIntentN4 = null;
                                                    }
                                                    cVarD.f57309w = namedIntentN4;
                                                    if (cVarD.f57303q.a()) {
                                                        yVar.K(cVarD);
                                                    }
                                                    yVar.b(cVarD, this.f54388c, a0Var);
                                                    i28 = i14;
                                                    i12 = i13;
                                                    i25 = i15;
                                                    appWidgetManager = appWidgetManager3;
                                                    packageManager = packageManager4;
                                                    map5 = map2;
                                                    arrayList3 = arrayList2;
                                                    packageManager4 = packageManager;
                                                    appWidgetManager3 = appWidgetManager;
                                                    i29 = i12;
                                                    columnIndexOrThrow = i5;
                                                    columnIndexOrThrow2 = i11;
                                                    map4 = map;
                                                    longSparseArray3 = longSparseArray;
                                                }
                                            }
                                        }
                                        cVarD = null;
                                        if (cVarD == null) {
                                        }
                                        yVar.a(cVarD);
                                        cVarD.f57300l = yVar.getString(yVar.f54544m);
                                        n30.b bVar32 = n30.b.f77779c;
                                        cVarD.f57295g = bVar32;
                                        cVarD.f57296h = bVar32;
                                        cVarD.F = yVar.getInt(columnIndexOrThrow5);
                                        if (yVar.C != 0) {
                                        }
                                        string3 = yVar.getString(yVar.E);
                                        if (TextUtils.isEmpty(string3)) {
                                        }
                                        cVarD.f57308v = namedIntentN3;
                                        string4 = yVar.getString(yVar.F);
                                        if (TextUtils.isEmpty(string4)) {
                                        }
                                        cVarD.f57309w = namedIntentN4;
                                        if (cVarD.f57303q.a()) {
                                        }
                                        yVar.b(cVarD, this.f54388c, a0Var);
                                        i28 = i14;
                                        i12 = i13;
                                        i25 = i15;
                                        appWidgetManager = appWidgetManager3;
                                        packageManager = packageManager4;
                                        map5 = map2;
                                        arrayList3 = arrayList2;
                                        packageManager4 = packageManager;
                                        appWidgetManager3 = appWidgetManager;
                                        i29 = i12;
                                        columnIndexOrThrow = i5;
                                        columnIndexOrThrow2 = i11;
                                        map4 = map;
                                        longSparseArray3 = longSparseArray;
                                    }
                                    Log.e("LoaderTask", "Desktop items loading interrupted", e);
                                    packageManager4 = packageManager;
                                    appWidgetManager3 = appWidgetManager;
                                    i29 = i12;
                                    columnIndexOrThrow = i5;
                                    columnIndexOrThrow2 = i11;
                                    map4 = map;
                                    longSparseArray3 = longSparseArray;
                                }
                            }
                            arrayList2 = arrayList3;
                            i5 = columnIndexOrThrow;
                            i11 = columnIndexOrThrow2;
                            map2 = map5;
                            longSparseArray = longSparseArray3;
                            map = map4;
                            packageManager2 = packageManager4;
                            launcherApps = launcherApps3;
                            i13 = i29;
                            appWidgetManager = appWidgetManager3;
                            launcherApps3 = launcherApps;
                            packageManager4 = packageManager2;
                            appWidgetManager3 = appWidgetManager;
                            columnIndexOrThrow = i5;
                            columnIndexOrThrow2 = i11;
                            arrayList3 = arrayList2;
                            map4 = map;
                            longSparseArray3 = longSparseArray;
                            i29 = i13;
                            map5 = map2;
                        }
                        if (u9.b.f90699l.b()) {
                            Trace.beginSection("LoadWorkspaceIconsInBulk");
                            String strJ = ((mx.l0) this.f54386a.f80136e).j();
                            try {
                                this.f54395j.w(arrayList3);
                                Iterator it4 = arrayList3.iterator();
                                while (it4.hasNext()) {
                                    ga.d dVar = (ga.d) it4.next();
                                    ga.f fVar = dVar.f57281a;
                                    if (this.f54395j.x(fVar.f57304r, fVar.o)) {
                                        dVar.a(this.f54386a.f80132a, this.f54395j, strJ);
                                    }
                                }
                                Trace.endSection();
                            } catch (Throwable th2) {
                                Trace.endSection();
                                throw th2;
                            }
                        }
                        ya.l0.a(yVar);
                        this.f54389d.getClass();
                        if (this.f54398m) {
                            this.f54388c.b();
                            return;
                        }
                        this.o = yVar.d();
                        y2 y2Var = y2.f51877a;
                        e10.i0 i0Var = (e10.i0) y2Var.i0().l();
                        y9.q qVar4 = new y9.q(this.f54386a.f80136e.a(context), i0Var.d().a(i0Var.e()), ((e10.n0) y2Var.j0().l()).f() == e10.p0.f51735c);
                        Iterator it5 = this.f54388c.f54467d.iterator();
                        while (true) {
                            ma0.i iVar = (ma0.i) it5;
                            if (!iVar.hasNext()) {
                                yVar.e();
                                return;
                            }
                            ga.c cVar = (ga.c) iVar.next();
                            Collections.sort(cVar.H, Folder.f21094k0);
                            qVar4.d(cVar);
                            int size = cVar.H.size();
                            v70.o.l(cVar.H);
                            for (int i37 = 0; i37 < size; i37++) {
                                ga.j jVar2 = (ga.j) cVar.H.get(i37);
                                jVar2.f57299k = i37;
                                if (jVar2.L0() && jVar2.f57290b == 0 && !jVar2.f57303q.a()) {
                                    if (qVar4.f96951i.a(size, jVar2.f57299k, qVar4.f96948f) >= 0) {
                                        this.f54395j.t(jVar2, false);
                                    }
                                }
                            }
                        }
                    } catch (Throwable th3) {
                        ya.l0.a(yVar);
                        throw th3;
                    }
                } catch (Throwable th4) {
                    th = th4;
                    throw th;
                }
            } catch (Throwable th5) {
                th = th5;
                qVar = qVar2;
                throw th;
            }
        }
    }

    public final void g() {
        Context context = this.f54386a.f80132a;
        ContentResolver contentResolver = context.getContentResolver();
        if (this.o) {
            int[] intArray = h2.a(contentResolver, "delete_empty_folders").getIntArray("value");
            synchronized (this.f54388c) {
                try {
                    for (int i5 : intArray) {
                        q qVar = this.f54388c;
                        qVar.f54465b.remove(qVar.f54467d.get(i5));
                        this.f54388c.f54467d.remove(i5);
                        this.f54388c.f54464a.remove(i5);
                    }
                } finally {
                }
            }
        }
        q qVar2 = this.f54388c;
        qVar2.getClass();
        Iterator it = ((ja.h) ja.h.f69294h.h(context)).f().iterator();
        while (it.hasNext()) {
            qVar2.h(context, (UserHandle) it.next());
        }
        if (g3.o() || this.n.isEmpty()) {
            return;
        }
        context.registerReceiver(new v0(this.f54386a, this.n), new IntentFilter("android.intent.action.BOOT_COMPLETED"), null, ya.j.f97149d.f97215a);
    }

    public final void h(ba.h hVar) {
        synchronized (this.f54388c) {
            try {
                ya.s sVar = this.f54388c.f54464a;
                sVar.getClass();
                int i5 = 0;
                while (i5 < sVar.size()) {
                    int i11 = i5 + 1;
                    ga.e eVar = (ga.e) sVar.valueAt(i5);
                    if (eVar instanceof ga.j) {
                        ga.j jVar = (ga.j) eVar;
                        if (jVar.O0(3) && jVar.i() != null) {
                            UserHandle userHandle = jVar.o;
                            String packageName = jVar.i().getPackageName();
                            ArrayMap arrayMap = hVar.f17760c;
                            Set hashSet = (Set) arrayMap.get(userHandle);
                            if (hashSet == null) {
                                hashSet = new HashSet();
                                arrayMap.put(userHandle, hashSet);
                            }
                            hashSet.add(packageName);
                        }
                    } else if (eVar instanceof ga.g) {
                        ga.g gVar = (ga.g) eVar;
                        if (gVar.p0(2)) {
                            UserHandle userHandle2 = gVar.o;
                            String packageName2 = gVar.f57311s.getPackageName();
                            ArrayMap arrayMap2 = hVar.f17760c;
                            Set hashSet2 = (Set) arrayMap2.get(userHandle2);
                            if (hashSet2 == null) {
                                hashSet2 = new HashSet();
                                arrayMap2.put(userHandle2, hashSet2);
                            }
                            hashSet2.add(packageName2);
                        }
                    }
                    i5 = i11;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final synchronized void i() {
        if (this.f54398m) {
            throw new CancellationException("Loader stopped");
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x0040, code lost:
    
        mc0.d.f76206a.d("waitForIdle exceeded 10sec", new java.lang.Object[0]);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final synchronized void j() {
        ya.x xVar = (ya.x) this.f54390e.f17725b;
        ya.y yVar = new ya.y(this, xVar.f97215a.getLooper());
        if (xVar.f97215a.getLooper().getQueue().isIdle()) {
            yVar.queueIdle();
        }
        int i5 = 0;
        while (true) {
            if (!this.f54398m) {
                if (yVar.f97217b) {
                    try {
                        yVar.f97216a.wait(1000L);
                    } catch (InterruptedException unused) {
                    }
                }
                if (!yVar.f97217b) {
                    break;
                }
                int i11 = i5 + 1;
                if (i5 > 10) {
                    break;
                } else {
                    i5 = i11;
                }
            } else {
                break;
            }
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        synchronized (this) {
            try {
                if (this.f54398m) {
                    return;
                }
                Trace.beginSection("LoaderTask");
                TimingLogger timingLogger = new TimingLogger("LoaderTask", "run");
                final int i5 = 0;
                a0 a0Var = new a0(0);
                try {
                    try {
                        c2 c2Var = this.f54386a.f80133b;
                        c2Var.getClass();
                        a2 a2Var = new a2(c2Var, this);
                        try {
                            uy.d0.f91699e.o(this.f54386a.f80132a);
                            HashMap mapC = c();
                            this.f54395j.f56217z.f45772b = mapC;
                            Continuation continuation = null;
                            ArrayList arrayListF = fz.h0.f(this.f54386a.f80132a, null);
                            ArrayList arrayList = this.f54395j.O().f56254i;
                            arrayList.clear();
                            arrayList.addAll(arrayListF);
                            ArrayList arrayList2 = new ArrayList();
                            Trace.beginSection("LoadWorkspace");
                            try {
                                f(arrayList2, g2.f79844a, a0Var);
                                Trace.endSection();
                                timingLogger.addSplit("loadWorkspace");
                                if (this.f54386a.f80136e.o.equals(this.f54399p)) {
                                    i();
                                    g();
                                    timingLogger.addSplit("sanitizeData");
                                }
                                i();
                                final int i11 = 1;
                                this.f54390e.d(true);
                                timingLogger.addSplit("bindWorkspace");
                                this.f54389d.getClass();
                                j();
                                timingLogger.addSplit("step 1 complete");
                                i();
                                Trace.beginSection("LoadAllApps");
                                try {
                                    ArrayList arrayListB = b(mapC);
                                    Trace.endSection();
                                    timingLogger.addSplit("loadAllApps");
                                    i();
                                    b90.p pVar = this.f54390e;
                                    d dVar = (d) pVar.f17728e;
                                    ga.a[] aVarArr = (ga.a[]) dVar.f54373a.toArray(ga.a.D);
                                    Arrays.sort(aVarArr, ga.a.E);
                                    int i12 = 5;
                                    ((ya.x) pVar.f17725b).execute(new b80.a(i12, pVar, new e(aVarArr, dVar.f54380h, 0)));
                                    timingLogger.addSplit("bindAllApps");
                                    i();
                                    fz.d0 d0Var = this.f54395j;
                                    d0Var.H();
                                    ba.h hVar = new ba.h(d0Var);
                                    h(hVar);
                                    NovaLauncherActivityCachingLogic novaLauncherActivityCachingLogic = new NovaLauncherActivityCachingLogic(this.f54395j);
                                    novaLauncherActivityCachingLogic.f45772b = mapC;
                                    final c2 c2Var2 = this.f54386a.f80133b;
                                    Objects.requireNonNull(c2Var2);
                                    hVar.b(arrayListB, novaLauncherActivityCachingLogic, new ba.f() { // from class: fa.b0
                                        @Override // ba.f
                                        public final void a(HashSet hashSet, UserHandle userHandle) {
                                            switch (i5) {
                                                case 0:
                                                    c2 c2Var3 = c2Var2;
                                                    c2Var3.getClass();
                                                    c2Var3.c(new s(1, userHandle, hashSet));
                                                    break;
                                                default:
                                                    c2 c2Var4 = c2Var2;
                                                    c2Var4.getClass();
                                                    c2Var4.c(new x1(hashSet, userHandle));
                                                    break;
                                            }
                                        }
                                    });
                                    timingLogger.addSplit("update icon cache");
                                    sg.h0 h0Var = u9.b.f90697j;
                                    if (h0Var.b()) {
                                        i();
                                        timingLogger.addSplit("save shortcuts in icon cache");
                                        ba.d i8Var = new i8(2);
                                        final c2 c2Var3 = this.f54386a.f80133b;
                                        Objects.requireNonNull(c2Var3);
                                        hVar.b(arrayList2, i8Var, new ba.f() { // from class: fa.b0
                                            @Override // ba.f
                                            public final void a(HashSet hashSet, UserHandle userHandle) {
                                                switch (i5) {
                                                    case 0:
                                                        c2 c2Var32 = c2Var3;
                                                        c2Var32.getClass();
                                                        c2Var32.c(new s(1, userHandle, hashSet));
                                                        break;
                                                    default:
                                                        c2 c2Var4 = c2Var3;
                                                        c2Var4.getClass();
                                                        c2Var4.c(new x1(hashSet, userHandle));
                                                        break;
                                                }
                                            }
                                        });
                                    }
                                    j();
                                    timingLogger.addSplit("step 2 complete");
                                    i();
                                    ArrayList arrayListD = d();
                                    timingLogger.addSplit("loadDeepShortcuts");
                                    i();
                                    this.f54390e.c();
                                    timingLogger.addSplit("bindDeepShortcuts");
                                    if (h0Var.b()) {
                                        i();
                                        timingLogger.addSplit("save deep shortcuts in icon cache");
                                        hVar.b(arrayListD, new i8(2), new bb.a(20));
                                    }
                                    j();
                                    timingLogger.addSplit("step 3 complete");
                                    i();
                                    Context context = mx.g0.f77088a;
                                    g20.w wVarC = mx.g0.c();
                                    d dVar2 = this.f54387b;
                                    ArrayList arrayListT = bh.g.T(dVar2, this.f54386a.f80132a, arrayListD, dVar2.f54382j);
                                    y70.d dVar3 = wVarC.f57003b;
                                    a80.e eVar = t70.y0.f88884a;
                                    t70.m0.t(dVar3, a80.d.f488c, null, new g20.q(wVarC, arrayListT, continuation, i5), 2);
                                    ArrayList arrayListD2 = this.f54388c.f54470g.D(this.f54386a, null);
                                    timingLogger.addSplit("load widgets");
                                    i();
                                    b90.p pVar2 = this.f54390e;
                                    ((ya.x) pVar2.f17725b).execute(new b80.a(i12, pVar2, new l(((q) pVar2.f17727d).f54470g.p(((t1) pVar2.f17726c).f80132a), 1)));
                                    timingLogger.addSplit("bindWidgets");
                                    i();
                                    ba.d iVar = new aa.i(this.f54386a.f80132a, true);
                                    final c2 c2Var4 = this.f54386a.f80133b;
                                    Objects.requireNonNull(c2Var4);
                                    hVar.b(arrayListD2, iVar, new ba.f() { // from class: fa.b0
                                        @Override // ba.f
                                        public final void a(HashSet hashSet, UserHandle userHandle) {
                                            switch (i11) {
                                                case 0:
                                                    c2 c2Var32 = c2Var4;
                                                    c2Var32.getClass();
                                                    c2Var32.c(new s(1, userHandle, hashSet));
                                                    break;
                                                default:
                                                    c2 c2Var42 = c2Var4;
                                                    c2Var42.getClass();
                                                    c2Var42.c(new x1(hashSet, userHandle));
                                                    break;
                                            }
                                        }
                                    });
                                    timingLogger.addSplit("save widgets in icon cache");
                                    if (u9.b.f90695h.f90687d) {
                                        e();
                                    }
                                    i();
                                    hVar.a();
                                    timingLogger.addSplit("finish icon update");
                                    this.f54389d.getClass();
                                    synchronized (c2Var.f79788b) {
                                        c2Var.f79791e = true;
                                    }
                                    h2.a(this.f54386a.f80132a.getContentResolver(), "refresh_backup_table");
                                    a0Var.f54360a.clear();
                                    a2Var.close();
                                } finally {
                                }
                            } finally {
                            }
                        } finally {
                            try {
                                a2Var.close();
                            } catch (Throwable th2) {
                                th.addSuppressed(th2);
                            }
                        }
                    } finally {
                        timingLogger.dumpToLog();
                    }
                } catch (CancellationException unused) {
                    timingLogger.addSplit("Cancelled");
                } catch (Exception e3) {
                    ArrayList arrayList3 = a0Var.f54360a;
                    Iterator it = arrayList3.iterator();
                    while (it.hasNext()) {
                        z zVar = (z) it.next();
                        zVar.getClass();
                        Log.println(3, "LoaderMemoryLogger: BgDataModel", zVar.f54560a);
                    }
                    arrayList3.clear();
                    throw e3;
                }
            } finally {
            }
        }
    }
}
