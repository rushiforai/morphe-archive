package x7;

import android.app.Application;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.database.Cursor;
import android.graphics.Rect;
import android.icu.text.AlphabeticIndex;
import android.net.Uri;
import android.os.Bundle;
import android.os.LocaleList;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import android.view.View;
import androidx.fragment.app.h0;
import androidx.fragment.app.h1;
import androidx.fragment.app.m0;
import androidx.fragment.app.v0;
import b.c0;
import com.google.android.gms.internal.consent_sdk.k0;
import com.google.android.gms.internal.consent_sdk.k7;
import com.google.android.gms.internal.consent_sdk.l7;
import e10.s2;
import e10.y2;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.concurrent.CopyOnWriteArrayList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import o9.g3;
import o9.t2;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class e implements l7 {

    /* renamed from: a, reason: collision with root package name */
    public Object f95130a;

    /* renamed from: b, reason: collision with root package name */
    public Object f95131b;

    public /* synthetic */ e(Object obj, Object obj2) {
        this.f95130a = obj;
        this.f95131b = obj2;
    }

    public static Pair s(PackageManager packageManager, String str) {
        Iterator<ResolveInfo> it = packageManager.queryBroadcastReceivers(new Intent(str), 1048576).iterator();
        while (it.hasNext()) {
            String str2 = it.next().activityInfo.packageName;
            try {
                return Pair.create(str2, packageManager.getResourcesForApplication(str2));
            } catch (PackageManager.NameNotFoundException unused) {
                Log.w("PackageManagerHelper", "Failed to find resources for " + str2);
            }
        }
        return null;
    }

    public static int u(LauncherActivityInfo launcherActivityInfo) {
        if (g3.f79853h) {
            return (int) (launcherActivityInfo.getLoadingProgress() * 100.0f);
        }
        return 100;
    }

    public static boolean y(Intent intent) {
        if (intent == null || !"android.intent.action.MAIN".equals(intent.getAction()) || intent.getComponent() == null || intent.getCategories() == null || intent.getCategories().size() != 1 || !intent.hasCategory("android.intent.category.LAUNCHER") || !TextUtils.isEmpty(intent.getDataString())) {
            return false;
        }
        Bundle extras = intent.getExtras();
        return extras == null || extras.keySet().isEmpty();
    }

    public static boolean z(Context context, Intent intent) throws PackageManager.NameNotFoundException {
        String packageName;
        ApplicationInfo applicationInfo;
        ActivityInfo activityInfo;
        PackageManager packageManager = context.getPackageManager();
        ComponentName component = intent.getComponent();
        if (component == null) {
            ResolveInfo resolveInfoResolveActivity = packageManager.resolveActivity(intent, SQLiteDatabase.OPEN_FULLMUTEX);
            packageName = (resolveInfoResolveActivity == null || (activityInfo = resolveInfoResolveActivity.activityInfo) == null) ? null : activityInfo.packageName;
        } else {
            packageName = component.getPackageName();
        }
        if (packageName == null) {
            packageName = intent.getPackage();
        }
        if (packageName != null) {
            try {
                PackageInfo packageInfo = packageManager.getPackageInfo(packageName, 0);
                if (packageInfo != null && (applicationInfo = packageInfo.applicationInfo) != null) {
                    if ((applicationInfo.flags & 1) != 0) {
                        return true;
                    }
                }
            } catch (PackageManager.NameNotFoundException unused) {
            }
        }
        return false;
    }

    public pm.b A() throws IOException {
        JSONObject jSONObject;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] bArr = new byte[ReaderJsonLexerKt.BATCH_SIZE];
        try {
            FileInputStream fileInputStream = new FileInputStream(t());
            while (true) {
                try {
                    int i5 = fileInputStream.read(bArr, 0, ReaderJsonLexerKt.BATCH_SIZE);
                    if (i5 < 0) {
                        break;
                    }
                    byteArrayOutputStream.write(bArr, 0, i5);
                } finally {
                }
            }
            jSONObject = new JSONObject(byteArrayOutputStream.toString());
            fileInputStream.close();
        } catch (IOException | JSONException unused) {
            jSONObject = new JSONObject();
        }
        String strOptString = jSONObject.optString("Fid", null);
        int iOptInt = jSONObject.optInt("Status", 0);
        String strOptString2 = jSONObject.optString("AuthToken", null);
        String strOptString3 = jSONObject.optString("RefreshToken", null);
        long jOptLong = jSONObject.optLong("TokenCreationEpochInSecs", 0L);
        long jOptLong2 = jSONObject.optLong("ExpiresInSecs", 0L);
        String strOptString4 = jSONObject.optString("FisError", null);
        int i11 = pm.b.f82664h;
        byte b11 = (byte) (((byte) (0 | 2)) | 1);
        int i12 = c0.G(5)[iOptInt];
        if (i12 == 0) {
            throw new NullPointerException("Null registrationStatus");
        }
        byte b12 = (byte) (((byte) (b11 | 2)) | 1);
        if (b12 == 3 && i12 != 0) {
            return new pm.b(strOptString, i12, strOptString2, strOptString3, jOptLong2, jOptLong, strOptString4);
        }
        StringBuilder sb2 = new StringBuilder();
        if (i12 == 0) {
            sb2.append(" registrationStatus");
        }
        if ((b12 & 1) == 0) {
            sb2.append(" expiresInSecs");
        }
        if ((b12 & 2) == 0) {
            sb2.append(" tokenCreationEpochInSecs");
        }
        throw new IllegalStateException(a2.c.k("Missing required properties:", sb2));
    }

    public void B(ga.e eVar, Rect rect, Bundle bundle) {
        Context context = (Context) this.f95130a;
        if (eVar instanceof ga.f) {
            ga.f fVar = (ga.f) eVar;
            if ((fVar.f57305s & 1024) != 0) {
                context.startActivity(new Intent("android.intent.action.VIEW").setData(new Uri.Builder().scheme("market").authority("details").appendQueryParameter("id", fVar.i().getPackageName()).build()).putExtra("android.intent.extra.REFERRER", new Uri.Builder().scheme("android-app").authority(((Context) new e(context).f95130a).getPackageName()).build()));
                return;
            }
        }
        ComponentName componentNameI = eVar instanceof ga.a ? ((ga.a) eVar).f57279y : eVar instanceof ga.j ? eVar.i() : eVar instanceof t2 ? ((t2) eVar).f80139r : eVar instanceof ga.g ? ((ga.g) eVar).f57311s : null;
        if (componentNameI != null) {
            try {
                ((LauncherApps) this.f95131b).startAppDetailsActivity(componentNameI, eVar.o, rect, bundle);
            } catch (ActivityNotFoundException | SecurityException e3) {
                k0.w(context, 2132017222, 0).show();
                Log.e("PackageManagerHelper", "Unable to launch settings", e3);
            }
        }
    }

    @Override // com.google.android.gms.internal.consent_sdk.m7
    /* renamed from: C, reason: merged with bridge method [inline-methods] */
    public c zzb() {
        return new c((Application) ((vm.c) this.f95130a).f92857b, (com.google.android.gms.internal.consent_sdk.h) ((k7) this.f95131b).zzb());
    }

    public void a(Enum r22, Object obj) {
        ((HashMap) this.f95130a).put(r22, obj);
        ((HashMap) this.f95131b).put(obj, r22);
    }

    public l b() {
        return new l(Collections.unmodifiableMap((HashMap) this.f95130a), Collections.unmodifiableMap((HashMap) this.f95131b));
    }

    public String c(ga.a aVar) {
        if (aVar instanceof iz.a) {
            y2.f51877a.getClass();
            s2 s2Var = y2.Q0;
            KProperty kProperty = y2.f51881b[90];
            s2Var.getClass();
            if (((Boolean) s2Var.l()).booleanValue()) {
                return ":FOLDER:";
            }
        }
        return d(aVar.f57300l);
    }

    public String d(CharSequence charSequence) {
        String strW = g3.w(charSequence);
        AlphabeticIndex.ImmutableIndex immutableIndex = (AlphabeticIndex.ImmutableIndex) this.f95131b;
        String label = immutableIndex.getBucket(immutableIndex.getBucketIndex(strW)).getLabel();
        if ((!g3.w(label).isEmpty() && !"…".equals(label)) || strW.length() <= 0) {
            return label;
        }
        int iCodePointAt = strW.codePointAt(0);
        return Character.isDigit(iCodePointAt) ? "#" : Character.isLetter(iCodePointAt) ? (String) this.f95130a : "∙";
    }

    public void e(h0 f11, Bundle bundle, boolean z11) {
        Intrinsics.g(f11, "f");
        h1 h1Var = (h1) this.f95130a;
        h0 h0Var = h1Var.f14591y;
        if (h0Var != null) {
            h1 parentFragmentManager = h0Var.getParentFragmentManager();
            Intrinsics.f(parentFragmentManager, "parent.getParentFragmentManager()");
            parentFragmentManager.o.e(f11, bundle, true);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f95131b).iterator();
        while (it.hasNext()) {
            v0 v0Var = (v0) it.next();
            if (z11) {
                v0Var.getClass();
            }
            v0Var.a().onFragmentActivityCreated(h1Var, f11, bundle);
        }
    }

    public void f(h0 f11, boolean z11) {
        Intrinsics.g(f11, "f");
        h1 h1Var = (h1) this.f95130a;
        m0 m0Var = h1Var.f14589w.f14682b;
        h0 h0Var = h1Var.f14591y;
        if (h0Var != null) {
            h1 parentFragmentManager = h0Var.getParentFragmentManager();
            Intrinsics.f(parentFragmentManager, "parent.getParentFragmentManager()");
            parentFragmentManager.o.f(f11, true);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f95131b).iterator();
        while (it.hasNext()) {
            v0 v0Var = (v0) it.next();
            if (z11) {
                v0Var.getClass();
            }
            v0Var.a().onFragmentAttached(h1Var, f11, m0Var);
        }
    }

    public void g(h0 f11, Bundle bundle, boolean z11) {
        Intrinsics.g(f11, "f");
        h1 h1Var = (h1) this.f95130a;
        h0 h0Var = h1Var.f14591y;
        if (h0Var != null) {
            h1 parentFragmentManager = h0Var.getParentFragmentManager();
            Intrinsics.f(parentFragmentManager, "parent.getParentFragmentManager()");
            parentFragmentManager.o.g(f11, bundle, true);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f95131b).iterator();
        while (it.hasNext()) {
            v0 v0Var = (v0) it.next();
            if (z11) {
                v0Var.getClass();
            }
            v0Var.a().onFragmentCreated(h1Var, f11, bundle);
        }
    }

    public void h(h0 f11, boolean z11) {
        Intrinsics.g(f11, "f");
        h1 h1Var = (h1) this.f95130a;
        h0 h0Var = h1Var.f14591y;
        if (h0Var != null) {
            h1 parentFragmentManager = h0Var.getParentFragmentManager();
            Intrinsics.f(parentFragmentManager, "parent.getParentFragmentManager()");
            parentFragmentManager.o.h(f11, true);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f95131b).iterator();
        while (it.hasNext()) {
            v0 v0Var = (v0) it.next();
            if (z11) {
                v0Var.getClass();
            }
            v0Var.a().onFragmentDestroyed(h1Var, f11);
        }
    }

    public void i(h0 f11, boolean z11) {
        Intrinsics.g(f11, "f");
        h1 h1Var = (h1) this.f95130a;
        h0 h0Var = h1Var.f14591y;
        if (h0Var != null) {
            h1 parentFragmentManager = h0Var.getParentFragmentManager();
            Intrinsics.f(parentFragmentManager, "parent.getParentFragmentManager()");
            parentFragmentManager.o.i(f11, true);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f95131b).iterator();
        while (it.hasNext()) {
            v0 v0Var = (v0) it.next();
            if (z11) {
                v0Var.getClass();
            }
            v0Var.a().onFragmentDetached(h1Var, f11);
        }
    }

    public void j(h0 f11, boolean z11) {
        Intrinsics.g(f11, "f");
        h1 h1Var = (h1) this.f95130a;
        h0 h0Var = h1Var.f14591y;
        if (h0Var != null) {
            h1 parentFragmentManager = h0Var.getParentFragmentManager();
            Intrinsics.f(parentFragmentManager, "parent.getParentFragmentManager()");
            parentFragmentManager.o.j(f11, true);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f95131b).iterator();
        while (it.hasNext()) {
            v0 v0Var = (v0) it.next();
            if (z11) {
                v0Var.getClass();
            }
            v0Var.a().onFragmentPaused(h1Var, f11);
        }
    }

    public void k(h0 f11, boolean z11) {
        Intrinsics.g(f11, "f");
        h1 h1Var = (h1) this.f95130a;
        m0 m0Var = h1Var.f14589w.f14682b;
        h0 h0Var = h1Var.f14591y;
        if (h0Var != null) {
            h1 parentFragmentManager = h0Var.getParentFragmentManager();
            Intrinsics.f(parentFragmentManager, "parent.getParentFragmentManager()");
            parentFragmentManager.o.k(f11, true);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f95131b).iterator();
        while (it.hasNext()) {
            v0 v0Var = (v0) it.next();
            if (z11) {
                v0Var.getClass();
            }
            v0Var.a().onFragmentPreAttached(h1Var, f11, m0Var);
        }
    }

    public void l(h0 f11, Bundle bundle, boolean z11) {
        Intrinsics.g(f11, "f");
        h1 h1Var = (h1) this.f95130a;
        h0 h0Var = h1Var.f14591y;
        if (h0Var != null) {
            h1 parentFragmentManager = h0Var.getParentFragmentManager();
            Intrinsics.f(parentFragmentManager, "parent.getParentFragmentManager()");
            parentFragmentManager.o.l(f11, bundle, true);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f95131b).iterator();
        while (it.hasNext()) {
            v0 v0Var = (v0) it.next();
            if (z11) {
                v0Var.getClass();
            }
            v0Var.a().onFragmentPreCreated(h1Var, f11, bundle);
        }
    }

    public void m(h0 f11, boolean z11) {
        Intrinsics.g(f11, "f");
        h1 h1Var = (h1) this.f95130a;
        h0 h0Var = h1Var.f14591y;
        if (h0Var != null) {
            h1 parentFragmentManager = h0Var.getParentFragmentManager();
            Intrinsics.f(parentFragmentManager, "parent.getParentFragmentManager()");
            parentFragmentManager.o.m(f11, true);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f95131b).iterator();
        while (it.hasNext()) {
            v0 v0Var = (v0) it.next();
            if (z11) {
                v0Var.getClass();
            }
            v0Var.a().onFragmentResumed(h1Var, f11);
        }
    }

    public void n(h0 f11, Bundle bundle, boolean z11) {
        Intrinsics.g(f11, "f");
        h1 h1Var = (h1) this.f95130a;
        h0 h0Var = h1Var.f14591y;
        if (h0Var != null) {
            h1 parentFragmentManager = h0Var.getParentFragmentManager();
            Intrinsics.f(parentFragmentManager, "parent.getParentFragmentManager()");
            parentFragmentManager.o.n(f11, bundle, true);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f95131b).iterator();
        while (it.hasNext()) {
            v0 v0Var = (v0) it.next();
            if (z11) {
                v0Var.getClass();
            }
            v0Var.a().onFragmentSaveInstanceState(h1Var, f11, bundle);
        }
    }

    public void o(h0 f11, boolean z11) {
        Intrinsics.g(f11, "f");
        h1 h1Var = (h1) this.f95130a;
        h0 h0Var = h1Var.f14591y;
        if (h0Var != null) {
            h1 parentFragmentManager = h0Var.getParentFragmentManager();
            Intrinsics.f(parentFragmentManager, "parent.getParentFragmentManager()");
            parentFragmentManager.o.o(f11, true);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f95131b).iterator();
        while (it.hasNext()) {
            v0 v0Var = (v0) it.next();
            if (z11) {
                v0Var.getClass();
            }
            v0Var.a().onFragmentStarted(h1Var, f11);
        }
    }

    public void p(h0 f11, boolean z11) {
        Intrinsics.g(f11, "f");
        h1 h1Var = (h1) this.f95130a;
        h0 h0Var = h1Var.f14591y;
        if (h0Var != null) {
            h1 parentFragmentManager = h0Var.getParentFragmentManager();
            Intrinsics.f(parentFragmentManager, "parent.getParentFragmentManager()");
            parentFragmentManager.o.p(f11, true);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f95131b).iterator();
        while (it.hasNext()) {
            v0 v0Var = (v0) it.next();
            if (z11) {
                v0Var.getClass();
            }
            v0Var.a().onFragmentStopped(h1Var, f11);
        }
    }

    public void q(h0 f11, View v11, Bundle bundle, boolean z11) {
        Intrinsics.g(f11, "f");
        Intrinsics.g(v11, "v");
        h1 h1Var = (h1) this.f95130a;
        h0 h0Var = h1Var.f14591y;
        if (h0Var != null) {
            h1 parentFragmentManager = h0Var.getParentFragmentManager();
            Intrinsics.f(parentFragmentManager, "parent.getParentFragmentManager()");
            parentFragmentManager.o.q(f11, v11, bundle, true);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f95131b).iterator();
        while (it.hasNext()) {
            v0 v0Var = (v0) it.next();
            if (z11) {
                v0Var.getClass();
            }
            v0Var.a().onFragmentViewCreated(h1Var, f11, v11, bundle);
        }
    }

    public void r(h0 f11, boolean z11) {
        Intrinsics.g(f11, "f");
        h1 h1Var = (h1) this.f95130a;
        h0 h0Var = h1Var.f14591y;
        if (h0Var != null) {
            h1 parentFragmentManager = h0Var.getParentFragmentManager();
            Intrinsics.f(parentFragmentManager, "parent.getParentFragmentManager()");
            parentFragmentManager.o.r(f11, true);
        }
        Iterator it = ((CopyOnWriteArrayList) this.f95131b).iterator();
        while (it.hasNext()) {
            v0 v0Var = (v0) it.next();
            if (z11) {
                v0Var.getClass();
            }
            v0Var.a().onFragmentViewDestroyed(h1Var, f11);
        }
    }

    public File t() {
        if (((File) this.f95130a) == null) {
            synchronized (this) {
                try {
                    if (((File) this.f95130a) == null) {
                        String str = "PersistedInstallation." + ((ul.g) this.f95131b).d() + ".json";
                        ul.g gVar = (ul.g) this.f95131b;
                        gVar.a();
                        File file = new File(gVar.f91320a.getNoBackupFilesDir(), str);
                        this.f95130a = file;
                        if (file.exists()) {
                            return (File) this.f95130a;
                        }
                        ul.g gVar2 = (ul.g) this.f95131b;
                        gVar2.a();
                        File file2 = new File(gVar2.f91320a.getFilesDir(), str);
                        if (file2.exists() && !file2.renameTo((File) this.f95130a)) {
                            Log.e("PersistedInstallation", "Unable to move the file from back up to non back up directory", new IOException("Unable to move the file from back up to non back up directory"));
                            return file2;
                        }
                    }
                } finally {
                }
            }
        }
        return (File) this.f95130a;
    }

    public Long v(String str) throws IOException {
        androidx.room.o oVar = (androidx.room.o) this.f95130a;
        androidx.room.t tVarC = androidx.room.t.c(1, "SELECT long_value FROM Preference where `key`=?");
        tVarC.bindString(1, str);
        oVar.assertNotSuspendingTransaction();
        Cursor cursorL = vm.d.l(oVar, tVarC, false);
        try {
            Long lValueOf = null;
            if (cursorL.moveToFirst() && !cursorL.isNull(0)) {
                lValueOf = Long.valueOf(cursorL.getLong(0));
            }
            return lValueOf;
        } finally {
            cursorL.close();
            tVarC.d();
        }
    }

    public void w(pm.b bVar) throws JSONException, IOException {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("Fid", bVar.f82665a);
            jSONObject.put("Status", c0.F(bVar.f82666b));
            jSONObject.put("AuthToken", bVar.f82667c);
            jSONObject.put("RefreshToken", bVar.f82668d);
            jSONObject.put("TokenCreationEpochInSecs", bVar.f82670f);
            jSONObject.put("ExpiresInSecs", bVar.f82669e);
            jSONObject.put("FisError", bVar.f82671g);
            ul.g gVar = (ul.g) this.f95131b;
            gVar.a();
            File fileCreateTempFile = File.createTempFile("PersistedInstallation", "tmp", gVar.f91320a.getFilesDir());
            FileOutputStream fileOutputStream = new FileOutputStream(fileCreateTempFile);
            fileOutputStream.write(jSONObject.toString().getBytes("UTF-8"));
            fileOutputStream.close();
            if (fileCreateTempFile.renameTo(t())) {
            } else {
                throw new IOException("unable to rename the tmpfile to PersistedInstallation");
            }
        } catch (IOException | JSONException unused) {
        }
    }

    public void x(d dVar) {
        androidx.room.o oVar = (androidx.room.o) this.f95130a;
        oVar.assertNotSuspendingTransaction();
        oVar.beginTransaction();
        try {
            ((b) this.f95131b).insert(dVar);
            oVar.setTransactionSuccessful();
        } finally {
            oVar.endTransaction();
        }
    }

    public e(LocaleList localeList) {
        int size = localeList.size();
        Locale locale = size == 0 ? Locale.ENGLISH : localeList.get(0);
        AlphabeticIndex alphabeticIndex = new AlphabeticIndex(locale);
        for (int i5 = 1; i5 < size; i5++) {
            alphabeticIndex.addLabels(localeList.get(i5));
        }
        alphabeticIndex.addLabels(Locale.ENGLISH);
        this.f95131b = alphabeticIndex.buildImmutableIndex();
        if (locale.getLanguage().equals(Locale.JAPANESE.getLanguage())) {
            this.f95130a = "他";
        } else {
            this.f95130a = "∙";
        }
    }

    public e(Context context) {
        Context applicationContext = context.getApplicationContext();
        this.f95130a = applicationContext;
        applicationContext.getPackageManager();
        this.f95131b = (LauncherApps) applicationContext.getSystemService(LauncherApps.class);
    }
}
