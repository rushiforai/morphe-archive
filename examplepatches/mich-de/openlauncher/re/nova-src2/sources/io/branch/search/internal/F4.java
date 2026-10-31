package io.branch.search.internal;

import android.annotation.SuppressLint;
import android.app.ActivityManager;
import android.app.AppOpsManager;
import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Process;
import android.os.UserHandle;
import android.os.UserManager;
import io.branch.search.internal.Y2;
import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class F4 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f62438a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Lazy f62439b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Lazy f62440c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Lazy f62441d;

    public static final class a {
    }

    public static final class b extends Lambda implements Function0<Boolean> {
        public b() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return Boolean.valueOf(((ActivityManager) F4.this.f62438a.getSystemService(ActivityManager.class)).isLowRamDevice());
        }
    }

    public static final class c extends Lambda implements Function0<C3356rf> {
        public c() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            Object systemService = F4.this.f62438a.getSystemService((Class<Object>) UserManager.class);
            Intrinsics.f(systemService, "context.getSystemService(UserManager::class.java)");
            return new C3356rf(C3340qf.a((UserManager) systemService));
        }
    }

    public static final class d extends Lambda implements Function0<UserManager> {
        public d() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return (UserManager) F4.this.f62438a.getSystemService(UserManager.class);
        }
    }

    public F4(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f62438a = context;
        this.f62439b = LazyKt.a(new d());
        this.f62440c = LazyKt.a(new c());
        this.f62441d = LazyKt.a(new b());
    }

    public static Uri a(String str, String str2, Pair... pairArr) {
        Uri.Builder builderPath = new Uri.Builder().scheme("content").authority(str).path(str2);
        ArrayList arrayList = new ArrayList();
        for (Pair pair : pairArr) {
            if (pair.f71684b != null) {
                arrayList.add(pair);
            }
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            Pair pair2 = (Pair) it.next();
            builderPath.appendQueryParameter((String) pair2.f71683a, URLEncoder.encode((String) pair2.f71684b, StandardCharsets.UTF_8.name()));
        }
        Uri uriBuild = builderPath.build();
        Intrinsics.f(uriBuild, "Builder()\n            .s…  }\n            }.build()");
        return uriBuild;
    }

    @SuppressLint({"PrivateApi", "DiscouragedPrivateApi"})
    @NotNull
    public static String c() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        if (Build.VERSION.SDK_INT >= 28) {
            String processName = Application.getProcessName();
            Intrinsics.f(processName, "{\n            Applicatio…etProcessName()\n        }");
            return processName;
        }
        Object objInvoke = Class.forName("android.app.ActivityThread").getDeclaredMethod("currentProcessName", null).invoke(null, null);
        Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.String");
        return (String) objInvoke;
    }

    @NotNull
    public final Context b() {
        return this.f62438a;
    }

    public final int d() {
        Object systemService = this.f62438a.getSystemService("appops");
        if (systemService != null) {
            return ((AppOpsManager) systemService).checkOpNoThrow("android:get_usage_stats", Process.myUid(), this.f62438a.getPackageName());
        }
        throw new NullPointerException("null cannot be cast to non-null type android.app.AppOpsManager");
    }

    @NotNull
    public final C3356rf e() {
        return (C3356rf) this.f62440c.getValue();
    }

    public final boolean f() {
        return (this.f62438a.getApplicationInfo().flags & 2) != 0;
    }

    @NotNull
    public final LauncherApps g() {
        Object systemService = this.f62438a.getSystemService((Class<Object>) LauncherApps.class);
        Intrinsics.f(systemService, "context.getSystemService(LauncherApps::class.java)");
        return (LauncherApps) systemService;
    }

    @NotNull
    public final Uri a(@NotNull Pair... params) {
        Intrinsics.g(params, "params");
        return a(a(), "icon", (Pair[]) Arrays.copyOf(params, params.length));
    }

    public static Uri a(F4 f42, Pair[] params) {
        f42.getClass();
        Intrinsics.g(params, "params");
        return a(f42.f62438a.getPackageName() + ".BranchUserAgentLoader", null, (Pair[]) Arrays.copyOf(params, params.length));
    }

    @NotNull
    public final File a(@NotNull EnumC3073b2 branchDirectoryType) {
        Intrinsics.g(branchDirectoryType, "branchDirectoryType");
        int iOrdinal = branchDirectoryType.ordinal();
        if (iOrdinal == 0) {
            File parentFile = this.f62438a.getDatabasePath("anything").getParentFile();
            Intrinsics.d(parentFile);
            return parentFile;
        }
        if (iOrdinal == 1) {
            File filesDir = this.f62438a.getFilesDir();
            Intrinsics.f(filesDir, "context.filesDir");
            return filesDir;
        }
        if (iOrdinal == 2) {
            return new File(this.f62438a.getApplicationInfo().dataDir, "shared_prefs");
        }
        if (iOrdinal == 3) {
            return new File(this.f62438a.getCacheDir(), "branch_icons");
        }
        if (iOrdinal == 4) {
            String string = this.f62438a.getSharedPreferences("__ssml_lib_preferences", 0).getString("db_name", "__ssml.db");
            File databasePath = this.f62438a.getDatabasePath(string != null ? string : "__ssml.db");
            Intrinsics.f(databasePath, "{\n            val prefs …asePath(dbName)\n        }");
            return databasePath;
        }
        throw new NoWhenBranchMatchedException();
    }

    @NotNull
    public final SharedPreferences a(@NotNull Y2.b file) {
        Intrinsics.g(file, "file");
        Y2.a aVar = Y2.Companion;
        Context context = this.f62438a;
        aVar.getClass();
        return Y2.a.a(context, file);
    }

    @Nullable
    public final ComponentName a(@NotNull String packageName, @NotNull UserHandle user) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(user, "user");
        try {
            Intent intentAddCategory = new Intent("android.intent.action.MAIN").addCategory("android.intent.category.LAUNCHER");
            Intrinsics.f(intentAddCategory, "Intent(Intent.ACTION_MAI…Intent.CATEGORY_LAUNCHER)");
            intentAddCategory.setPackage(packageName);
            List<ResolveInfo> listQueryIntentActivities = this.f62438a.getPackageManager().queryIntentActivities(intentAddCategory, 0);
            Intrinsics.f(listQueryIntentActivities, "context.packageManager.q…vities(launcherIntent, 0)");
            if (listQueryIntentActivities.isEmpty()) {
                List<LauncherActivityInfo> activityList = ((LauncherApps) this.f62438a.getSystemService(LauncherApps.class)).getActivityList(packageName, user);
                Intrinsics.f(activityList, "activityList");
                LauncherActivityInfo launcherActivityInfo = (LauncherActivityInfo) b70.g.Y0(activityList);
                if (launcherActivityInfo != null) {
                    return launcherActivityInfo.getComponentName();
                }
            } else {
                ResolveInfo resolveInfo = (ResolveInfo) b70.g.Y0(listQueryIntentActivities);
                ActivityInfo activityInfo = resolveInfo != null ? resolveInfo.activityInfo : null;
                if (activityInfo != null) {
                    return new ComponentName(activityInfo.packageName, activityInfo.name);
                }
            }
        } catch (PackageManager.NameNotFoundException unused) {
        }
        return null;
    }

    @NotNull
    public final String a() {
        return this.f62438a.getPackageName() + ".BranchSearch";
    }
}
