package ads_mobile_sdk;

import android.os.SystemClock;
import cw.l2;
import java.util.List;
import java.util.UUID;
import java.util.WeakHashMap;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes2.dex */
public abstract class ji3 {

    /* renamed from: a, reason: collision with root package name */
    public static final WeakHashMap f5253a = new WeakHashMap();

    /* renamed from: b, reason: collision with root package name */
    public static final b.a3 f5254b = new b.a3(0);

    public static th3 a(wv0 cuiName, List tags, boolean z11) {
        Intrinsics.g(cuiName, "cuiName");
        Intrinsics.g(tags, "tags");
        th3 th3Var = b().f4777a;
        th3 th3VarA = th3Var != null ? th3Var.a(cuiName, tags, z11) : b(cuiName, tags, z11);
        a(b(), th3VarA);
        return th3VarA;
    }

    public static xp1 b(wv0 wv0Var, List tags, boolean z11) {
        l2.a("Attempted to start a trace " + wv0Var.name() + " without a parent. Did you forget to start a root trace or propagate an existing one?");
        Intrinsics.g(tags, "tags");
        UUID uuidRandomUUID = UUID.randomUUID();
        Intrinsics.f(uuidRandomUUID, "randomUUID(...)");
        return new xp1(wv0Var, tags, uuidRandomUUID, new mi3(new ur2(), new fh1(), new tu2(), new s8()), 0, 0, null, z11);
    }

    public static th3 c() {
        return b().f4777a;
    }

    public static th3 a(ii3 ii3Var, th3 th3Var) {
        th3 th3Var2 = ii3Var.f4777a;
        if (th3Var2 == th3Var) {
            return th3Var;
        }
        long jCurrentThreadTimeMillis = SystemClock.currentThreadTimeMillis();
        if (th3Var2 != null) {
            Duration.Companion companion = Duration.f72038b;
            th3Var2.f9927e.addAndGet(Duration.h(DurationKt.h(jCurrentThreadTimeMillis - ii3Var.f4778b, DurationUnit.f72045d)));
        }
        ii3Var.f4778b = jCurrentThreadTimeMillis;
        ii3Var.f4777a = th3Var;
        au auVar = ii3Var.f4779c;
        if (auVar == null) {
            return th3Var2;
        }
        auVar.f1092a = th3Var;
        return th3Var2;
    }

    public static ii3 b() {
        b.a3 a3Var = f5254b;
        Object ii3Var = a3Var.get();
        if (ii3Var == null) {
            ii3Var = new ii3(SystemClock.currentThreadTimeMillis());
            Thread threadCurrentThread = Thread.currentThread();
            WeakHashMap weakHashMap = f5253a;
            synchronized (weakHashMap) {
            }
            a3Var.set(ii3Var);
        }
        return (ii3) ii3Var;
    }

    public static th3 a() {
        th3 th3Var = b().f4777a;
        if (th3Var != null) {
            return th3Var;
        }
        xp1 xp1VarB = b(wv0.CUI_NAME_UNKNOWN, EmptyList.f71733a, true);
        a(b(), xp1VarB);
        return xp1VarB;
    }
}
