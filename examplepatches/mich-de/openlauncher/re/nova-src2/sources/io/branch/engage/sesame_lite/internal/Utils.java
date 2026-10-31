package io.branch.engage.sesame_lite.internal;

import android.app.AppOpsManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.LauncherApps;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Build;
import android.os.Process;
import android.os.UserHandle;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;
import u40.l;

@Metadata(d1 = {"\u0000b\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bÆ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000e\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\bJ\u0010\u0010\n\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u000b\u001a\u00020\fJ\u0010\u0010\r\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u000e\u001a\u00020\u000fJ\u0016\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\u0012\u001a\u00020\u0004J0\u0010\u0013\u001a\u00020\u00112\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\u0014\u001a\u00020\u00152\b\u0010\u0016\u001a\u0004\u0018\u00010\u00172\u0006\u0010\u0018\u001a\u00020\u00062\u0006\u0010\u0019\u001a\u00020\u001aJ\u000e\u0010\u001b\u001a\u00020\u00112\u0006\u0010\u000b\u001a\u00020\fJ\u0016\u0010\u001c\u001a\u00020\u000f2\u0006\u0010\u001d\u001a\u00020\u00042\u0006\u0010\u001e\u001a\u00020\u001fJ\u000e\u0010 \u001a\u00020\b2\u0006\u0010!\u001a\u00020\bJ$\u0010\"\u001a\u0004\u0018\u00010#2\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010$\u001a\u00020%2\n\b\u0002\u0010&\u001a\u0004\u0018\u00010\u0004J\n\u0010'\u001a\u00020\u000f*\u00020\u0004R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006("}, d2 = {"Lio/branch/engage/sesame_lite/internal/Utils;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()V", "TAG", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "launcherCmp", "Landroid/content/ComponentName;", "dp2Px", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "dp", "getLauncherCmp", "ctx", "Landroid/content/Context;", "getLookupKey", "lookupUri", "Landroid/net/Uri;", "hasPermission", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "perm", "isActivityLaunchable", "launcherApps", "Landroid/content/pm/LauncherApps;", "act", "Landroid/content/pm/ActivityInfo;", "cmp", "user", "Landroid/os/UserHandle;", "isUsageStatsGranted", "makeResUri", "pkgName", "resId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "px2Dp", "px", "resolveIntent", "Landroid/content/pm/ResolveInfo;", "intent", "Landroid/content/Intent;", "targetPkg", "toUri", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class Utils {

    @NotNull
    public static final Utils INSTANCE = new Utils();

    @NotNull
    private static final String TAG = "SSML-Utils";

    @Nullable
    private static ComponentName launcherCmp;

    private Utils() {
    }

    public static /* synthetic */ ResolveInfo resolveIntent$default(Utils utils, Context context, Intent intent, String str, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            str = null;
        }
        return utils.resolveIntent(context, intent, str);
    }

    public final float dp2Px(float dp2) {
        return dp2 * Resources.getSystem().getDisplayMetrics().density;
    }

    @Nullable
    public final ComponentName getLauncherCmp(@NotNull Context ctx) {
        Intrinsics.g(ctx, "ctx");
        try {
            Intent intentAddCategory = new Intent("android.intent.action.MAIN").addCategory("android.intent.category.HOME");
            Intrinsics.f(intentAddCategory, "Intent(Intent.ACTION_MAI…ory(Intent.CATEGORY_HOME)");
            ResolveInfo resolveInfoResolveActivity = ctx.getPackageManager().resolveActivity(intentAddCategory, SQLiteDatabase.OPEN_FULLMUTEX);
            if ((resolveInfoResolveActivity != null ? resolveInfoResolveActivity.activityInfo : null) != null && !Intrinsics.b(resolveInfoResolveActivity.activityInfo.packageName, "android")) {
                ActivityInfo activityInfo = resolveInfoResolveActivity.activityInfo;
                ComponentName componentName = new ComponentName(activityInfo.packageName, activityInfo.name);
                launcherCmp = componentName;
                return componentName;
            }
        } catch (Throwable th2) {
            l log = State.INSTANCE.getLog();
            if (log.getLevel().ordinal() >= 1) {
                log.getWriter().error(TAG, th2);
            }
        }
        return launcherCmp;
    }

    @Nullable
    public final String getLookupKey(@NotNull Uri lookupUri) {
        int i5;
        Intrinsics.g(lookupUri, "lookupUri");
        List<String> pathSegments = lookupUri.getPathSegments();
        int iIndexOf = pathSegments.indexOf("lookup");
        if (iIndexOf == -1 || (i5 = iIndexOf + 1) >= pathSegments.size()) {
            return null;
        }
        return pathSegments.get(i5);
    }

    public final boolean hasPermission(@NotNull Context ctx, @NotNull String perm) {
        Intrinsics.g(ctx, "ctx");
        Intrinsics.g(perm, "perm");
        return ctx.checkSelfPermission(perm) == 0;
    }

    public final boolean isActivityLaunchable(@NotNull Context ctx, @NotNull LauncherApps launcherApps, @Nullable ActivityInfo act, @NotNull ComponentName cmp, @NotNull UserHandle user) {
        String str;
        String str2;
        String str3;
        Intrinsics.g(ctx, "ctx");
        Intrinsics.g(launcherApps, "launcherApps");
        Intrinsics.g(cmp, "cmp");
        Intrinsics.g(user, "user");
        if (act != null && ((str2 = act.packageName) == null || k.U0(str2) || (str3 = act.name) == null || k.U0(str3))) {
            return false;
        }
        if (act != null && !act.exported) {
            return false;
        }
        if (act == null || act.isEnabled() || launcherApps.isActivityEnabled(cmp, user) || ctx.getPackageManager().getComponentEnabledSetting(cmp) == 4) {
            return act == null || (str = act.permission) == null || k.U0(str) || o4.a.a(ctx, act.permission) == 0;
        }
        return false;
    }

    public final boolean isUsageStatsGranted(@NotNull Context ctx) {
        Intrinsics.g(ctx, "ctx");
        try {
            AppOpsManager appOpsManager = (AppOpsManager) ctx.getSystemService(AppOpsManager.class);
            if (appOpsManager == null) {
                l log = State.INSTANCE.getLog();
                if (log.getLevel().ordinal() >= 2) {
                    log.getWriter().warn(TAG, "Unable to get system service appops");
                    return false;
                }
            } else {
                int iUnsafeCheckOpNoThrow = Build.VERSION.SDK_INT >= 29 ? appOpsManager.unsafeCheckOpNoThrow("android:get_usage_stats", Process.myUid(), ctx.getPackageName()) : appOpsManager.checkOpNoThrow("android:get_usage_stats", Process.myUid(), ctx.getPackageName());
                if (iUnsafeCheckOpNoThrow == 3) {
                    return hasPermission(ctx, "android.permission.PACKAGE_USAGE_STATS");
                }
                if (iUnsafeCheckOpNoThrow == 0) {
                    return true;
                }
            }
        } catch (Throwable th2) {
            l log2 = State.INSTANCE.getLog();
            if (log2.getLevel().ordinal() >= 1) {
                log2.getWriter().error(TAG, th2);
            }
        }
        return false;
    }

    @NotNull
    public final Uri makeResUri(@NotNull String pkgName, int resId) {
        Intrinsics.g(pkgName, "pkgName");
        Uri uri = Uri.parse("android.resource://" + pkgName + '/' + resId);
        Intrinsics.f(uri, "parse(\"${ContentResolver…URCE}://$pkgName/$resId\")");
        return uri;
    }

    public final float px2Dp(float px2) {
        return px2 / Resources.getSystem().getDisplayMetrics().density;
    }

    @Nullable
    public final ResolveInfo resolveIntent(@NotNull Context ctx, @NotNull Intent intent, @Nullable String targetPkg) {
        Object next;
        Object next2;
        ApplicationInfo applicationInfo;
        Intrinsics.g(ctx, "ctx");
        Intrinsics.g(intent, "intent");
        if (targetPkg != null) {
            try {
                if (!k.U0(targetPkg)) {
                    Intent intent2 = new Intent(intent).setPackage(targetPkg);
                    Intrinsics.f(intent2, "Intent(intent).setPackage(targetPkg)");
                    ResolveInfo resolveInfoResolveActivity = ctx.getPackageManager().resolveActivity(intent2, 0);
                    if (resolveInfoResolveActivity != null) {
                        ActivityInfo activityInfo = resolveInfoResolveActivity.activityInfo;
                        if (!Intrinsics.b(activityInfo != null ? activityInfo.packageName : null, "android")) {
                            return resolveInfoResolveActivity;
                        }
                    }
                }
            } catch (Throwable th2) {
                l log = State.INSTANCE.getLog();
                if (log.getLevel().ordinal() >= 1) {
                    log.getWriter().error(TAG, th2);
                }
                return null;
            }
        }
        ResolveInfo resolveInfoResolveActivity2 = ctx.getPackageManager().resolveActivity(intent, 0);
        if (resolveInfoResolveActivity2 != null) {
            ActivityInfo activityInfo2 = resolveInfoResolveActivity2.activityInfo;
            if (!Intrinsics.b(activityInfo2 != null ? activityInfo2.packageName : null, "android")) {
                return resolveInfoResolveActivity2;
            }
        }
        List<ResolveInfo> listQueryIntentActivities = ctx.getPackageManager().queryIntentActivities(intent, SQLiteDatabase.OPEN_SHAREDCACHE);
        Intrinsics.f(listQueryIntentActivities, "ctx.packageManager.query…PackageManager.MATCH_ALL)");
        Iterator<T> it = listQueryIntentActivities.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            ActivityInfo activityInfo3 = ((ResolveInfo) next).activityInfo;
            if ((((activityInfo3 == null || (applicationInfo = activityInfo3.applicationInfo) == null) ? 0 : applicationInfo.flags) & Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE) != 0) {
                break;
            }
        }
        ResolveInfo resolveInfo = (ResolveInfo) next;
        if (resolveInfo != null) {
            return resolveInfo;
        }
        Iterator<T> it2 = listQueryIntentActivities.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next2 = null;
                break;
            }
            next2 = it2.next();
            ActivityInfo activityInfo4 = ((ResolveInfo) next2).activityInfo;
            if (!Intrinsics.b(activityInfo4 != null ? activityInfo4.packageName : null, "android")) {
                break;
            }
        }
        return (ResolveInfo) next2;
    }

    @NotNull
    public final Uri toUri(@NotNull String str) {
        Intrinsics.g(str, "<this>");
        Uri uri = Uri.parse(str);
        Intrinsics.f(uri, "parse(this)");
        return uri;
    }
}
