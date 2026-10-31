package ga;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Process;
import android.os.UserHandle;
import android.os.UserManager;
import b3.h0;
import com.android.launcher3.util.ComponentKey;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.util.Objects;
import mx.g0;
import o9.g3;

/* loaded from: classes.dex */
public class a extends f {
    public static final a[] D = new a[0];
    public static final h0 E = new h0(4);
    public final long A;
    public final long B;
    public final long C;

    /* renamed from: x, reason: collision with root package name */
    public Intent f57278x;

    /* renamed from: y, reason: collision with root package name */
    public ComponentName f57279y;

    /* renamed from: z, reason: collision with root package name */
    public String f57280z;

    public a() {
        this.f57280z = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f57290b = 0;
        this.A = 0L;
        this.B = 0L;
        this.C = 0L;
    }

    public static Intent N0(ComponentName componentName) {
        return new Intent("android.intent.action.MAIN").addCategory("android.intent.category.LAUNCHER").setComponent(componentName).setFlags(270532608);
    }

    public static void Q0(f fVar, LauncherActivityInfo launcherActivityInfo) {
        ApplicationInfo applicationInfo = launcherActivityInfo.getApplicationInfo();
        int i5 = applicationInfo.flags;
        if ((1073741824 & i5) != 0) {
            fVar.f57305s |= 4;
        }
        fVar.f57305s = ((i5 & 1) == 0 ? 128 : 64) | fVar.f57305s;
        if (applicationInfo.targetSdkVersion >= 26 && Process.myUserHandle().equals(launcherActivityInfo.getUser())) {
            fVar.f57305s |= 256;
        }
        fVar.C0(x7.e.u(launcherActivityInfo), 2);
    }

    /* renamed from: M0, reason: merged with bridge method [inline-methods] */
    public a clone() {
        return new a(this);
    }

    public final j O0() {
        j jVar = new j(this);
        int i5 = this.f57305s;
        if ((i5 & 1024) != 0) {
            jVar.A |= 1030;
        }
        if ((i5 & 2048) != 0) {
            jVar.f57305s |= 2048;
        }
        return jVar;
    }

    public ComponentKey P0() {
        return new ComponentKey(this.f57279y, this.o);
    }

    @Override // ga.e
    public String b() {
        return super.b() + " componentName=" + this.f57279y;
    }

    @Override // ga.e
    public final Intent d() {
        return this.f57278x;
    }

    @Override // ga.e
    public ComponentName i() {
        ComponentName componentName = this.f57279y;
        Objects.requireNonNull(componentName);
        return componentName;
    }

    public a(Context context, LauncherActivityInfo launcherActivityInfo, UserHandle userHandle) {
        this(launcherActivityInfo, userHandle, ((UserManager) context.getSystemService(UserManager.class)).isQuietModeEnabled(userHandle));
    }

    public a(LauncherActivityInfo launcherActivityInfo, UserHandle userHandle, boolean z11) throws PackageManager.NameNotFoundException {
        long j11;
        long jC;
        long j12;
        this.f57280z = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f57279y = launcherActivityInfo.getComponentName();
        this.f57291c = -104;
        this.o = userHandle;
        this.f57278x = N0(launcherActivityInfo.getComponentName());
        if (z11) {
            this.f57305s |= 8;
        }
        Q0(this, launcherActivityInfo);
        try {
            Context context = g0.f77088a;
            PackageInfo packageInfo = g0.e().getPackageManager().getPackageInfo(this.f57279y.getPackageName(), UserMetadata.MAX_INTERNAL_KEY_SIZE);
            j11 = packageInfo.firstInstallTime;
            j12 = packageInfo.lastUpdateTime;
            if (Build.VERSION.SDK_INT >= 28) {
                jC = p4.a.c(packageInfo);
            } else {
                jC = packageInfo.versionCode;
            }
        } catch (PackageManager.NameNotFoundException unused) {
            j11 = 0;
            jC = 0;
            j12 = 0;
        }
        this.A = j11;
        this.B = j12;
        this.C = jC;
        int i5 = launcherActivityInfo.getApplicationInfo().flags;
    }

    public a(a aVar) {
        super(aVar);
        this.f57280z = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f57279y = aVar.f57279y;
        this.f57300l = g3.w(aVar.f57300l);
        this.f57278x = new Intent(aVar.f57278x);
        this.A = aVar.A;
        this.B = aVar.B;
        this.C = aVar.C;
    }

    public a(ComponentName componentName, CharSequence charSequence, UserHandle userHandle, Intent intent) {
        this.f57280z = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f57279y = componentName;
        this.f57300l = charSequence;
        this.o = userHandle;
        this.f57278x = intent;
        this.A = 0L;
        this.B = 0L;
        this.C = 0L;
    }

    public a(ja.d dVar) {
        this.f57280z = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f57279y = (ComponentName) dVar.f69285d;
        this.f57278x = new Intent("android.intent.action.MAIN").addCategory("android.intent.category.LAUNCHER").setComponent(this.f57279y).setFlags(270532608);
        K0(dVar);
        this.o = (UserHandle) dVar.f69287f;
        long jCurrentTimeMillis = System.currentTimeMillis();
        this.A = jCurrentTimeMillis;
        this.B = jCurrentTimeMillis;
        this.C = 0L;
    }
}
