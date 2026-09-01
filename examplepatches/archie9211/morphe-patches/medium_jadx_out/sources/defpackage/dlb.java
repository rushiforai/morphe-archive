package defpackage;

import android.app.ActivityManager;
import android.content.Context;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dlb {
    public static final dlb AUTOMATIC;
    public static final dlb TRUNCATE;
    public static final dlb WRITE_AHEAD_LOGGING;
    public static final /* synthetic */ dlb[] a;
    public static final /* synthetic */ i04 b;

    static {
        dlb dlbVar = new dlb("AUTOMATIC", 0);
        AUTOMATIC = dlbVar;
        dlb dlbVar2 = new dlb("TRUNCATE", 1);
        TRUNCATE = dlbVar2;
        dlb dlbVar3 = new dlb("WRITE_AHEAD_LOGGING", 2);
        WRITE_AHEAD_LOGGING = dlbVar3;
        dlb[] dlbVarArr = {dlbVar, dlbVar2, dlbVar3};
        a = dlbVarArr;
        b = new i04(dlbVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static dlb valueOf(String str) {
        return (dlb) Enum.valueOf(dlb.class, str);
    }

    public static dlb[] values() {
        return (dlb[]) a.clone();
    }

    public final dlb resolve$room_runtime(Context context) {
        context.getClass();
        if (this != AUTOMATIC) {
            return this;
        }
        Object systemService = context.getSystemService("activity");
        ActivityManager activityManager = systemService instanceof ActivityManager ? (ActivityManager) systemService : null;
        return (activityManager == null || activityManager.isLowRamDevice()) ? TRUNCATE : WRITE_AHEAD_LOGGING;
    }
}
