package ads_mobile_sdk;

import b.o2;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class kz2 {

    /* renamed from: a, reason: collision with root package name */
    public final g0 f6019a;

    /* renamed from: b, reason: collision with root package name */
    public final ci3 f6020b;

    /* renamed from: c, reason: collision with root package name */
    public final o2 f6021c;

    public kz2(g0 activityTracker, ci3 traceLogger, o2 clock) {
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(clock, "clock");
        this.f6019a = activityTracker;
        this.f6020b = traceLogger;
        this.f6021c = clock;
    }

    public static em2 a(kz2 kz2Var, wv0 cuiName, List tags, mi3 traceMetaSet) {
        kz2Var.getClass();
        Intrinsics.g(cuiName, "cuiName");
        Intrinsics.g(tags, "tags");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        o2 clock = kz2Var.f6021c;
        ci3 traceLogger = kz2Var.f6020b;
        Intrinsics.g(clock, "clock");
        Intrinsics.g(traceLogger, "traceLogger");
        c7 c7Var = new c7(4, (byte) 0);
        UUID uuidRandomUUID = UUID.randomUUID();
        Intrinsics.f(uuidRandomUUID, "randomUUID(...)");
        em2 em2Var = new em2(cuiName, tags, uuidRandomUUID, traceMetaSet, c7Var, clock, traceLogger, 0, null, true, 1280);
        ((AtomicReference) c7Var.f1694a).set(em2Var);
        ji3.a(ji3.b(), null);
        ji3.a(ji3.b(), em2Var);
        em2Var.f2924k.f1807x = kz2Var.f6019a.c() ? aw0.PROCESS_STATE_BACKGROUND : aw0.PROCESS_STATE_FOREGROUND;
        return em2Var;
    }
}
