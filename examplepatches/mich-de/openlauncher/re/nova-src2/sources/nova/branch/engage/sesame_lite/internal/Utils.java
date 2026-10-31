package nova.branch.engage.sesame_lite.internal;

import android.app.AppOpsManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Build;
import android.os.Process;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0002\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0016\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u0005J\u000e\u0010\u000b\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tJ\u0016\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u0010J\n\u0010\u0011\u001a\u00020\r*\u00020\u0005J\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u00132\u0006\u0010\b\u001a\u00020\tJ$\u0010\u0015\u001a\u0004\u0018\u00010\u00162\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0017\u001a\u00020\u00182\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u0005J\u000e\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001bR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u0013X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u001d"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/Utils;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "TAG", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hasPermission", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "ctx", "Landroid/content/Context;", "perm", "isUsageStatsGranted", "makeResUri", "Landroid/net/Uri;", "pkgName", "resId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toUri", "launcherCmp", "Landroid/content/ComponentName;", "getLauncherCmp", "resolveIntent", "Landroid/content/pm/ResolveInfo;", "intent", "Landroid/content/Intent;", "targetPkg", "dp2Px", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "dp", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
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
            Intrinsics.f(intentAddCategory, "addCategory(...)");
            ResolveInfo resolveInfoResolveActivity = ctx.getPackageManager().resolveActivity(intentAddCategory, SQLiteDatabase.OPEN_FULLMUTEX);
            if ((resolveInfoResolveActivity != null ? resolveInfoResolveActivity.activityInfo : null) != null && !Intrinsics.b(resolveInfoResolveActivity.activityInfo.packageName, "android")) {
                ActivityInfo activityInfo = resolveInfoResolveActivity.activityInfo;
                ComponentName componentName = new ComponentName(activityInfo.packageName, activityInfo.name);
                launcherCmp = componentName;
                return componentName;
            }
        } catch (Throwable th2) {
            r80.p log = State.INSTANCE.getLog();
            int iOrdinal = log.getLevel().ordinal();
            r80.o oVar = r80.o.f85697a;
            if (iOrdinal >= 1) {
                log.getWriter().error(TAG, th2);
            }
        }
        return launcherCmp;
    }

    public final boolean hasPermission(@NotNull Context ctx, @NotNull String perm) {
        Intrinsics.g(ctx, "ctx");
        Intrinsics.g(perm, "perm");
        return ctx.checkSelfPermission(perm) == 0;
    }

    public final boolean isUsageStatsGranted(@NotNull Context ctx) {
        Intrinsics.g(ctx, "ctx");
        try {
            AppOpsManager appOpsManager = (AppOpsManager) ctx.getSystemService(AppOpsManager.class);
            if (appOpsManager == null) {
                r80.p log = State.INSTANCE.getLog();
                int iOrdinal = log.getLevel().ordinal();
                r80.o oVar = r80.o.f85697a;
                if (iOrdinal >= 2) {
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
            r80.p log2 = State.INSTANCE.getLog();
            int iOrdinal2 = log2.getLevel().ordinal();
            r80.o oVar2 = r80.o.f85697a;
            if (iOrdinal2 >= 1) {
                log2.getWriter().error(TAG, th2);
            }
        }
        return false;
    }

    @NotNull
    public final Uri makeResUri(@NotNull String pkgName, int resId) {
        Intrinsics.g(pkgName, "pkgName");
        Uri uri = Uri.parse("android.resource://" + pkgName + "/" + resId);
        Intrinsics.f(uri, "parse(...)");
        return uri;
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
                if (!r70.k.U0(targetPkg)) {
                    Intent intent2 = new Intent(intent).setPackage(targetPkg);
                    Intrinsics.f(intent2, "setPackage(...)");
                    ResolveInfo resolveInfoResolveActivity = ctx.getPackageManager().resolveActivity(intent2, 0);
                    if (resolveInfoResolveActivity != null) {
                        ActivityInfo activityInfo = resolveInfoResolveActivity.activityInfo;
                        if (!Intrinsics.b(activityInfo != null ? activityInfo.packageName : null, "android")) {
                            return resolveInfoResolveActivity;
                        }
                    }
                }
            } catch (Throwable th2) {
                r80.p log = State.INSTANCE.getLog();
                int iOrdinal = log.getLevel().ordinal();
                r80.o oVar = r80.o.f85697a;
                if (iOrdinal >= 1) {
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
        Intrinsics.f(listQueryIntentActivities, "queryIntentActivities(...)");
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
        Intrinsics.f(uri, "parse(...)");
        return uri;
    }
}
