package aa;

import android.content.ComponentName;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.content.pm.PackageInfo;
import android.content.pm.PackageInstaller;
import android.content.pm.PackageManager;
import android.content.pm.ShortcutInfo;
import android.content.res.Resources;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteFullException;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.LocaleList;
import android.os.Looper;
import android.os.Message;
import android.os.Process;
import android.os.Trace;
import android.os.UserHandle;
import android.text.TextUtils;
import android.util.Log;
import b.i8;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.android.launcher3.util.ComponentKey;
import com.android.launcher3.util.InstantAppResolver;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.teslacoilsw.launcher.icon.NovaLauncherActivityCachingLogic;
import com.teslacoilsw.launcher.launcher3.NovaBitmapInfo;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import kotlin.jvm.internal.Intrinsics;
import o9.g3;
import o9.z0;

/* loaded from: classes.dex */
public abstract class d0 {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f555a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f556b;

    /* renamed from: c, reason: collision with root package name */
    public final PackageManager f557c;

    /* renamed from: d, reason: collision with root package name */
    public final z.e f558d;

    /* renamed from: e, reason: collision with root package name */
    public final Handler f559e;

    /* renamed from: f, reason: collision with root package name */
    public int f560f;

    /* renamed from: g, reason: collision with root package name */
    public ba.c f561g;

    /* renamed from: h, reason: collision with root package name */
    public LocaleList f562h;

    /* renamed from: i, reason: collision with root package name */
    public String f563i;

    /* renamed from: j, reason: collision with root package name */
    public final String f564j;

    /* renamed from: k, reason: collision with root package name */
    public final Looper f565k;

    /* renamed from: l, reason: collision with root package name */
    public final BitmapFactory.Options f566l;

    /* renamed from: m, reason: collision with root package name */
    public final y f567m;
    public final h n;
    public final NovaLauncherActivityCachingLogic o;

    /* renamed from: p, reason: collision with root package name */
    public final i8 f568p;

    /* renamed from: q, reason: collision with root package name */
    public final LauncherApps f569q;

    /* renamed from: r, reason: collision with root package name */
    public final ja.h f570r;

    /* renamed from: s, reason: collision with root package name */
    public final InstantAppResolver f571s;

    /* renamed from: t, reason: collision with root package name */
    public final fz.h0 f572t;

    /* renamed from: u, reason: collision with root package name */
    public int f573u;

    public d0(Context context, z0 z0Var, String str, fz.h0 h0Var) {
        Looper looper = ya.j.f97149d.f97215a.getLooper();
        int i5 = z0Var.f80271d;
        int i11 = z0Var.f80270c;
        this.f555a = new HashMap();
        this.f562h = LocaleList.getEmptyLocaleList();
        this.f563i = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f556b = context;
        this.f564j = str;
        this.f557c = context.getPackageManager();
        this.f565k = looper;
        this.f559e = new Handler(looper);
        this.f558d = new z.e(50);
        H();
        this.f560f = i5;
        this.f561g = new ba.c(context, str, i11);
        if (f.No) {
            BitmapFactory.Options options = new BitmapFactory.Options();
            this.f566l = options;
            options.inPreferredConfig = Bitmap.Config.HARDWARE;
        } else {
            this.f566l = null;
        }
        fz.d0 d0Var = (fz.d0) this;
        this.f567m = new y(d0Var, 0);
        this.f573u = 0;
        this.n = new h(context, false);
        this.o = new NovaLauncherActivityCachingLogic(d0Var);
        this.f568p = new i8(2);
        this.f569q = (LauncherApps) this.f556b.getSystemService(LauncherApps.class);
        this.f570r = (ja.h) ja.h.f69294h.h(this.f556b);
        this.f571s = (InstantAppResolver) ya.l0.e(InstantAppResolver.class, this.f556b, 2132018044);
        this.f572t = h0Var;
    }

    public static ComponentKey m(String str, UserHandle userHandle) {
        return new ComponentKey(new ComponentName(str, b.c0.E(str, ".")), userHandle);
    }

    public final synchronized void A(ComponentName componentName, UserHandle userHandle) {
        this.f558d.remove(new ComponentKey(componentName, userHandle));
    }

    public final void B(String str, UserHandle userHandle) {
        HashSet hashSet = new HashSet();
        z.e eVar = this.f558d;
        Iterator it = ((z.b) eVar.keySet()).iterator();
        while (true) {
            z.a aVar = (z.a) it;
            if (!aVar.hasNext()) {
                break;
            }
            ComponentKey componentKey = (ComponentKey) aVar.next();
            if (componentKey.f21251a.getPackageName().equals(str) && componentKey.f21252b.equals(userHandle)) {
                hashSet.add(componentKey);
            }
        }
        Iterator it2 = hashSet.iterator();
        while (it2.hasNext()) {
            eVar.remove((ComponentKey) it2.next());
        }
    }

    public final synchronized void C(String str, UserHandle userHandle) {
        B(str, userHandle);
        long jD = this.f570r.d(userHandle);
        this.f561g.a("componentName LIKE ? AND profileId = ?", new String[]{str + "/%", Long.toString(jD)});
    }

    public final ba.e D(c0 c0Var, ga.f fVar) throws SecurityException, IllegalArgumentException {
        if (this.f573u <= 0) {
            ya.j.f97149d.b(-2);
        }
        this.f573u++;
        int i5 = 0;
        q qVar = new q(i5, this, fVar);
        ya.x xVar = ya.j.f97147b;
        Objects.requireNonNull(c0Var);
        w wVar = new w(c0Var, i5);
        x xVar2 = new x(this, i5);
        Handler handler = this.f559e;
        ba.e eVar = new ba.e(handler, qVar, xVar, wVar, xVar2);
        Pattern pattern = g3.f79846a;
        Message messageObtain = Message.obtain(handler, eVar);
        messageObtain.setAsynchronous(true);
        handler.sendMessage(messageObtain);
        return eVar;
    }

    public final synchronized void E(int i5, int i11) {
        this.f560f = i5;
        this.f555a.clear();
        ba.c cVar = this.f561g;
        if (cVar.f17741c) {
            throw new IllegalStateException("Attempt to write to read-only database");
        }
        ya.i0 i0Var = cVar.f17739a;
        i0Var.a(i0Var.getWritableDatabase());
        this.f561g.f17739a.close();
        this.f561g = new ba.c(this.f556b, this.f564j, i11);
        this.f558d.clear();
    }

    public final synchronized void F(String str, UserHandle userHandle) throws Throwable {
        try {
            try {
                C(str, userHandle);
                try {
                    PackageInfo packageInfo = this.f557c.getPackageInfo(str, UserMetadata.MAX_INTERNAL_KEY_SIZE);
                    long jD = this.f570r.d(userHandle);
                    Iterator<LauncherActivityInfo> it = this.f569q.getActivityList(str, userHandle).iterator();
                    while (it.hasNext()) {
                        try {
                            b(it.next(), this.o, packageInfo, jD, false);
                        } catch (PackageManager.NameNotFoundException unused) {
                        }
                    }
                } catch (PackageManager.NameNotFoundException unused2) {
                }
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            throw th;
        }
    }

    public final void G(ya.g0 g0Var, PackageInstaller.SessionInfo sessionInfo) {
        String str = g0Var.f97138a;
        UserHandle userHandle = g0Var.f97140c;
        Bitmap appIcon = sessionInfo.getAppIcon();
        CharSequence appLabel = sessionInfo.getAppLabel();
        synchronized (this) {
            try {
                B(str, userHandle);
                ComponentKey componentKeyM = m(str, userHandle);
                ba.b bVar = (ba.b) this.f558d.get(componentKeyM);
                if (bVar == null) {
                    bVar = new ba.b();
                }
                if (!TextUtils.isEmpty(appLabel)) {
                    bVar.f17735b = appLabel;
                }
                if (appIcon != null) {
                    mx.k0 k0VarN = ((fz.d0) this).N();
                    Drawable bVar2 = new b(null, appIcon);
                    if (c.f541k) {
                        float extraInsetFraction = AdaptiveIconDrawable.getExtraInsetFraction();
                        float f11 = extraInsetFraction / ((2.0f * extraInsetFraction) + 1.0f);
                        bVar2 = new AdaptiveIconDrawable(new ColorDrawable(-16777216), new InsetDrawable(bVar2, f11, f11, f11, f11));
                    }
                    bVar.f17734a = k0VarN.d(bVar2, userHandle, true);
                    k0VarN.D();
                }
                if (!TextUtils.isEmpty(appLabel) && bVar.f17734a.f21151a != null) {
                    this.f558d.put(componentKeyM, bVar);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void H() {
        this.f562h = this.f556b.getResources().getConfiguration().getLocales();
        this.f563i = this.f562h.toLanguageTags() + "," + Build.VERSION.SDK_INT;
    }

    public final boolean I(ComponentKey componentKey, ba.b bVar, Cursor cursor, boolean z11) {
        Bitmap bitmapDecodeByteArray;
        bVar.f17734a = new BitmapInfo(BitmapInfo.f21149c, p.d(cursor.getInt(0), 255));
        String string = cursor.getString(1);
        bVar.f17735b = string;
        if (string == null) {
            bVar.f17735b = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            bVar.f17736c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            bVar.f17736c = this.f557c.getUserBadgedLabel(string, componentKey.f21252b);
        }
        if (!z11) {
            byte[] blob = cursor.getBlob(2);
            if (blob == null) {
                return false;
            }
            try {
                bitmapDecodeByteArray = BitmapFactory.decodeByteArray(blob, 0, blob.length, this.f566l);
            } catch (Exception e3) {
                e3.printStackTrace();
                bitmapDecodeByteArray = null;
            }
            Bitmap bitmap = bitmapDecodeByteArray;
            if (bitmap != null) {
                int i5 = bVar.f17734a.f21152b;
                int i11 = cursor.getInt(cursor.getColumnIndexOrThrow("novaFlags"));
                bVar.f17734a = new NovaBitmapInfo(bitmap, i5, (i11 & 1) != 0, (i11 & 2) != 0, (i11 & 4) != 0);
            }
        }
        return true;
    }

    public final void a(ContentValues contentValues, ComponentName componentName, PackageInfo packageInfo, long j11, long j12) {
        contentValues.put("componentName", componentName.flattenToString());
        contentValues.put("profileId", Long.valueOf(j11));
        contentValues.put("lastUpdated", Long.valueOf(j12));
        contentValues.put("version", Integer.valueOf(packageInfo.versionCode));
        ba.c cVar = this.f561g;
        if (cVar.f17741c) {
            throw new IllegalStateException("Attempt to write to read-only database");
        }
        if (cVar.f17740b) {
            return;
        }
        try {
            cVar.f17739a.getWritableDatabase().insertWithOnConflict("icons", null, contentValues, 5);
        } catch (SQLiteFullException e3) {
            Log.e("SQLiteCacheHelper", "Disk full, all write operations will be ignored", e3);
            cVar.f17740b = true;
        } catch (SQLiteException unused) {
        }
    }

    public final synchronized void b(Object obj, ba.d dVar, PackageInfo packageInfo, long j11, boolean z11) throws Throwable {
        Throwable th2;
        try {
            try {
                UserHandle userHandleI = dVar.i(obj);
                ComponentName componentNameM = dVar.m(obj);
                ComponentKey componentKey = new ComponentKey(componentNameM, userHandleI);
                ba.b bVar = null;
                if (!z11) {
                    try {
                        ba.b bVar2 = (ba.b) this.f558d.get(componentKey);
                        if (bVar2 != null && !bVar2.f17734a.e()) {
                            bVar = bVar2;
                        }
                    } catch (Throwable th3) {
                        th2 = th3;
                        throw th2;
                    }
                }
                if (bVar == null) {
                    bVar = new ba.b();
                    bVar.f17734a = dVar.e(this.f556b, obj);
                }
                if (bVar.f17734a.e()) {
                    return;
                }
                CharSequence charSequenceD = dVar.d(obj);
                if (charSequenceD == null) {
                    dVar.toString();
                    return;
                }
                bVar.f17735b = charSequenceD;
                bVar.f17736c = this.f557c.getUserBadgedLabel(charSequenceD, userHandleI);
                if (dVar.l()) {
                    this.f558d.put(componentKey, bVar);
                }
                a(y(bVar.f17734a, bVar.f17735b.toString(), componentNameM.getPackageName()), componentNameM, packageInfo, j11, dVar.k(obj, packageInfo));
            } catch (Throwable th4) {
                th = th4;
                th2 = th;
                throw th2;
            }
        } catch (Throwable th5) {
            th = th5;
        }
    }

    public final void c(ba.b bVar, ga.f fVar) {
        if (!fVar.f57303q.b() && (!TextUtils.isEmpty(bVar.f17735b) || fVar.f57300l == null)) {
            fVar.f57300l = g3.w(bVar.f17735b);
        }
        fVar.f57301m = bVar.f17736c;
        if (fVar.f57303q.a() || bVar.f17734a.e()) {
            return;
        }
        BitmapInfo bitmapInfoH = bVar.f17734a;
        if (bitmapInfoH == null) {
            bitmapInfoH = h(fVar.o);
        }
        fVar.f57304r = bitmapInfoH;
    }

    public final void d() {
        if (Looper.myLooper() == this.f565k) {
            return;
        }
        throw new IllegalStateException("Cache accessed on wrong thread " + Looper.myLooper());
    }

    public final ba.b e(ComponentName componentName, UserHandle userHandle, Supplier supplier, ba.d dVar, Cursor cursor, boolean z11, boolean z12) throws PackageManager.NameNotFoundException {
        Object obj;
        d();
        ComponentKey componentKey = new ComponentKey(componentName, userHandle);
        z.e eVar = this.f558d;
        ba.b bVar = (ba.b) eVar.get(componentKey);
        if (bVar != null) {
            if (BitmapInfo.f21149c != bVar.f17734a.f21151a || z12) {
                return bVar;
            }
        }
        ba.b bVar2 = new ba.b();
        if (dVar.l()) {
            eVar.put(componentKey, bVar2);
        }
        boolean zJ = cursor == null ? j(componentKey, bVar2, z12) : I(componentKey, bVar2, cursor, z12);
        boolean z13 = false;
        if (zJ) {
            obj = null;
        } else {
            obj = supplier.get();
            if (obj != null) {
                bVar2.f17734a = dVar.e(this.f556b, obj);
            } else {
                if (z11) {
                    ba.b bVarI = i(componentName.getPackageName(), userHandle, false);
                    bVar2.f17734a = bVarI.f17734a;
                    bVar2.f17735b = bVarI.f17735b;
                    bVar2.f17736c = bVarI.f17736c;
                }
                if (bVar2.f17734a == null) {
                    bVar2.f17734a = h(userHandle);
                }
            }
            z13 = true;
        }
        if (TextUtils.isEmpty(bVar2.f17735b)) {
            if (obj == null && !z13) {
                obj = supplier.get();
            }
            if (obj != null) {
                CharSequence charSequenceD = dVar.d(obj);
                bVar2.f17735b = charSequenceD;
                bVar2.f17736c = this.f557c.getUserBadgedLabel(dVar.f(obj, charSequenceD), userHandle);
            }
        }
        return bVar2;
    }

    public final synchronized void f() {
        d();
        ba.c cVar = this.f561g;
        if (cVar.f17741c) {
            throw new IllegalStateException("Attempt to write to read-only database");
        }
        ya.i0 i0Var = cVar.f17739a;
        i0Var.a(i0Var.getWritableDatabase());
    }

    public final Cursor g(List list, UserHandle userHandle, boolean z11) {
        return this.f561g.f17739a.getReadableDatabase().query("icons", z11 ? ba.c.f17738e : ba.c.f17737d, b.c0.l("componentName IN ( ", TextUtils.join(",", Collections.nCopies(r4.length - 1, "?")), " ) AND profileId = ?"), (String[]) Stream.concat(list.stream().map(new t(2)).filter(new z(0)).distinct().map(new t(3)), Stream.of(Long.toString(this.f570r.d(userHandle)))).toArray(new a0(0)), null, null, null);
    }

    public final synchronized BitmapInfo h(UserHandle userHandle) {
        if (!this.f555a.containsKey(userHandle)) {
            HashMap map = this.f555a;
            mx.k0 k0VarN = ((fz.d0) this).N();
            try {
                BitmapInfo bitmapInfoC = k0VarN.c(Resources.getSystem().getDrawableForDensity(17301651, k0VarN.f550g), userHandle, Build.VERSION.SDK_INT);
                k0VarN.D();
                map.put(userHandle, bitmapInfoC);
            } finally {
            }
        }
        return (BitmapInfo) this.f555a.get(userHandle);
    }

    public final ba.b i(String str, UserHandle userHandle, boolean z11) throws PackageManager.NameNotFoundException {
        PackageManager packageManager = this.f557c;
        d();
        ComponentKey componentKeyM = m(str, userHandle);
        z.e eVar = this.f558d;
        ba.b bVar = (ba.b) eVar.get(componentKeyM);
        if (bVar != null) {
            if (BitmapInfo.f21149c != bVar.f17734a.f21151a || z11) {
                return bVar;
            }
        }
        ba.b bVar2 = new ba.b();
        if (j(componentKeyM, bVar2, z11)) {
            eVar.put(componentKeyM, bVar2);
        } else {
            try {
                PackageInfo packageInfo = packageManager.getPackageInfo(str, Process.myUserHandle().equals(userHandle) ? 0 : UserMetadata.MAX_INTERNAL_KEY_SIZE);
                ApplicationInfo applicationInfo = packageInfo.applicationInfo;
                if (applicationInfo == null) {
                    throw new PackageManager.NameNotFoundException("ApplicationInfo is null");
                }
                mx.k0 k0VarN = ((fz.d0) this).N();
                Drawable drawableLoadIcon = applicationInfo.loadIcon(packageManager);
                int i5 = applicationInfo.targetSdkVersion;
                this.f571s.getClass();
                BitmapInfo bitmapInfoC = k0VarN.c(drawableLoadIcon, userHandle, i5);
                k0VarN.D();
                CharSequence charSequenceLoadLabel = applicationInfo.loadLabel(packageManager);
                bVar2.f17735b = charSequenceLoadLabel;
                try {
                    bVar2.f17736c = packageManager.getUserBadgedLabel(charSequenceLoadLabel, userHandle);
                } catch (SecurityException unused) {
                    bVar2.f17736c = bVar2.f17735b;
                }
                bVar2.f17734a = new BitmapInfo(z11 ? BitmapInfo.f21149c : bitmapInfoC.f21151a, bitmapInfoC.f21152b);
                ContentValues contentValuesY = y(bitmapInfoC, bVar2.f17735b.toString(), str);
                if (!this.f561g.f17741c) {
                    a(contentValuesY, componentKeyM.f21251a, packageInfo, this.f570r.d(userHandle), packageInfo.lastUpdateTime);
                }
                eVar.put(componentKeyM, bVar2);
            } catch (PackageManager.NameNotFoundException unused2) {
            }
        }
        return bVar2;
    }

    public final boolean j(ComponentKey componentKey, ba.b bVar, boolean z11) {
        Trace.beginSection("loadIconIndividually");
        Cursor cursorQuery = null;
        try {
            ba.c cVar = this.f561g;
            cursorQuery = cVar.f17739a.getReadableDatabase().query("icons", z11 ? ba.c.f17738e : ba.c.f17737d, "componentName = ? AND profileId = ?", new String[]{componentKey.f21251a.flattenToString(), Long.toString(this.f570r.d(componentKey.f21252b))}, null, null, null);
            if (cursorQuery.moveToNext()) {
                boolean zI = I(componentKey, bVar, cursorQuery, z11);
                cursorQuery.close();
                Trace.endSection();
                return zI;
            }
        } catch (SQLiteException unused) {
            if (cursorQuery != null) {
            }
        } catch (Throwable th2) {
            if (cursorQuery != null) {
                cursorQuery.close();
            }
            Trace.endSection();
            throw th2;
        }
        cursorQuery.close();
        Trace.endSection();
        return false;
    }

    public final Drawable k(ActivityInfo activityInfo) throws PackageManager.NameNotFoundException {
        try {
            Resources resourcesForApplication = this.f557c.getResourcesForApplication(activityInfo.applicationInfo);
            int iconResource = activityInfo.getIconResource();
            if (resourcesForApplication != null && iconResource != 0) {
                try {
                    return resourcesForApplication.getDrawableForDensity(iconResource, this.f560f);
                } catch (Resources.NotFoundException unused) {
                }
            }
            int i5 = this.f560f;
            boolean z11 = c.f541k;
            return Resources.getSystem().getDrawableForDensity(17301651, i5);
        } catch (PackageManager.NameNotFoundException unused2) {
            int i11 = this.f560f;
            boolean z12 = c.f541k;
            return Resources.getSystem().getDrawableForDensity(17301651, i11);
        }
    }

    public final String l(String str) {
        Object next;
        String str2 = this.f563i;
        fz.h0 h0Var = this.f572t;
        String str3 = str2 + "/" + ((fz.d) h0Var.f56253h.f56362d).b() + "/" + ((gz.f) h0Var.f56253h.f56363e).getPackageName() + "/" + ((gz.f) h0Var.f56253h.f56363e).d();
        if (((gz.f) h0Var.f56253h.f56363e).b()) {
            str3 = str3 + "/" + ((gz.f) h0Var.f56253h.f56363e).h();
        }
        Iterator it = h0Var.f56254i.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (Intrinsics.b(((ComponentName) next).getPackageName(), str)) {
                break;
            }
        }
        if (next == null && !Intrinsics.b(w20.m.a(), str) && !((gz.f) h0Var.f56253h.f56363e).g().contains(str)) {
            return str3;
        }
        return str3 + " " + f0.a();
    }

    public final void n(ga.f fVar, ShortcutInfo shortcutInfo) throws Throwable {
        o(fVar, shortcutInfo, true, this.f567m);
    }

    public final synchronized void o(ga.f fVar, ShortcutInfo shortcutInfo, boolean z11, Predicate predicate) throws Throwable {
        d0 d0Var;
        BitmapInfo bitmapInfoZ;
        try {
            try {
                if (u9.b.f90697j.b()) {
                    d0Var = this;
                    bitmapInfoZ = d0Var.e(ShortcutKey.b(shortcutInfo).f21251a, shortcutInfo.getUserHandle(), new v(shortcutInfo, 1), this.f568p, null, false, false).f17734a;
                } else {
                    d0Var = this;
                    i8 i8Var = d0Var.f568p;
                    Context context = d0Var.f556b;
                    i8Var.getClass();
                    bitmapInfoZ = i8.z(context, shortcutInfo);
                }
                if (bitmapInfoZ.e()) {
                    bitmapInfoZ = h(shortcutInfo.getUserHandle());
                }
                if (x(bitmapInfoZ, shortcutInfo.getUserHandle()) && predicate.test(fVar)) {
                    return;
                }
                fVar.f57304r = bitmapInfoZ;
                if (z11) {
                    BitmapInfo bitmapInfoQ = fVar.f57303q.c() ? null : q(shortcutInfo);
                    g0 g0VarW = g0.w(d0Var.f556b);
                    try {
                        fVar.f57304r = g0VarW.a(fVar.f57304r.f21151a, bitmapInfoQ);
                        g0VarW.D();
                    } finally {
                    }
                }
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            throw th;
        }
    }

    public final void p(ga.j jVar, ShortcutInfo shortcutInfo, y yVar) throws Throwable {
        o(jVar, shortcutInfo, true, yVar);
    }

    public final BitmapInfo q(ShortcutInfo shortcutInfo) {
        ComponentName activity = shortcutInfo.getActivity();
        if (activity == null) {
            ga.h hVar = new ga.h(-1, shortcutInfo.getUserHandle(), shortcutInfo.getPackage());
            u(hVar, false);
            return hVar.f57304r;
        }
        ga.a aVar = new ga.a();
        aVar.o = shortcutInfo.getUserHandle();
        aVar.f57279y = activity;
        aVar.f57278x = new Intent("android.intent.action.MAIN").addCategory("android.intent.category.LAUNCHER").setComponent(activity);
        t(aVar, false);
        return aVar.f57304r;
    }

    public final synchronized void r(ga.f fVar, LauncherActivityInfo launcherActivityInfo, boolean z11) {
        s(fVar, new r(launcherActivityInfo, 1), false, z11);
    }

    public final synchronized void s(ga.f fVar, Supplier supplier, boolean z11, boolean z12) throws Throwable {
        try {
            try {
                c(e(fVar.i(), fVar.o, supplier, this.o, null, z11, z12), fVar);
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            throw th;
        }
    }

    public abstract void t(ga.f fVar, boolean z11);

    public final synchronized void u(ga.h hVar, boolean z11) {
        c(i(hVar.f57319x, hVar.o, z11), hVar);
        if (hVar.f57320y != -1) {
            String string = this.f556b.getString(((ab.d0) ab.e0.G(this.f556b).get(hVar.f57320y)).f704b);
            hVar.f57300l = string;
            hVar.f57301m = this.f557c.getUserBadgedLabel(string, hVar.o);
        }
    }

    public final synchronized String v(j jVar) throws Throwable {
        try {
            try {
                return g3.w(e(jVar.d(), jVar.getUser(), new r(jVar, 0), this.n, null, false, true).f17735b);
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            throw th;
        }
    }

    public final synchronized void w(ArrayList arrayList) {
        Map map = (Map) arrayList.stream().collect(Collectors.groupingBy(new t(0)));
        Trace.beginSection("loadIconsInBulk");
        map.forEach(new u((fz.d0) this, 0));
        Trace.endSection();
    }

    public final boolean x(BitmapInfo bitmapInfo, UserHandle userHandle) {
        return h(userHandle).f21151a == bitmapInfo.f21151a;
    }

    public final ContentValues y(BitmapInfo bitmapInfo, String str, String str2) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("icon", bitmapInfo.l());
        contentValues.put("icon_color", Integer.valueOf(bitmapInfo.f21152b));
        contentValues.put("label", str);
        contentValues.put("system_state", l(str2));
        contentValues.put("keywords", (String) null);
        contentValues.put("novaFlags", Integer.valueOf(bitmapInfo.d()));
        return contentValues;
    }

    public final BitmapInfo z(ComponentName componentName, UserHandle userHandle) {
        ba.b bVar;
        synchronized (this.f558d) {
            bVar = (ba.b) this.f558d.get(new ComponentKey(componentName, userHandle));
        }
        if (bVar == null) {
            return null;
        }
        return bVar.f17734a;
    }
}
