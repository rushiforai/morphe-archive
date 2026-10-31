package y7;

import android.content.Context;
import android.os.PowerManager;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class p {

    /* renamed from: a, reason: collision with root package name */
    public static final String f96760a;

    static {
        String strE = o7.r.e("WakeLocks");
        Intrinsics.f(strE, "tagWithPrefix(\"WakeLocks\")");
        f96760a = strE;
    }

    public static final PowerManager.WakeLock a(Context context, String tag) {
        Intrinsics.g(context, "context");
        Intrinsics.g(tag, "tag");
        Object systemService = context.getApplicationContext().getSystemService("power");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.os.PowerManager");
        String strConcat = "WorkManager: ".concat(tag);
        PowerManager.WakeLock wakeLock = ((PowerManager) systemService).newWakeLock(1, strConcat);
        synchronized (q.f96761a) {
        }
        Intrinsics.f(wakeLock, "wakeLock");
        return wakeLock;
    }
}
