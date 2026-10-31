package ads_mobile_sdk;

import android.os.SystemClock;
import b.o2;
import c80.d;
import java.util.LinkedHashMap;
import java.util.Locale;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes2.dex */
public final class bw2 {

    /* renamed from: a, reason: collision with root package name */
    public final jr0 f1592a;

    /* renamed from: b, reason: collision with root package name */
    public final o2 f1593b;

    /* renamed from: c, reason: collision with root package name */
    public final d f1594c;

    /* renamed from: d, reason: collision with root package name */
    public final LinkedHashMap f1595d;

    public bw2(jr0 flags, o2 clock) {
        Intrinsics.g(flags, "flags");
        Intrinsics.g(clock, "clock");
        this.f1592a = flags;
        this.f1593b = clock;
        this.f1594c = new d();
        this.f1595d = new LinkedHashMap();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(bw2 bw2Var, String str, ContinuationImpl continuationImpl) {
        yv2 yv2Var;
        d dVar;
        if (continuationImpl instanceof yv2) {
            yv2Var = (yv2) continuationImpl;
            int i5 = yv2Var.f12306f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                yv2Var.f12306f = i5 - Integer.MIN_VALUE;
            } else {
                yv2Var = new yv2(bw2Var, continuationImpl);
            }
        }
        Object obj = yv2Var.f12304d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = yv2Var.f12306f;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = bw2Var.f1594c;
            yv2Var.f12301a = bw2Var;
            yv2Var.f12302b = str;
            yv2Var.f12303c = dVar;
            yv2Var.f12306f = 1;
            if (dVar.e(yv2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = yv2Var.f12303c;
            str = yv2Var.f12302b;
            bw2 bw2Var2 = yv2Var.f12301a;
            ResultKt.b(obj);
            dVar = dVar2;
            bw2Var = bw2Var2;
        }
        if (str != null) {
            try {
                jr0 jr0Var = bw2Var.f1592a;
                o2 o2Var = bw2Var.f1593b;
                LinkedHashMap linkedHashMap = bw2Var.f1595d;
                Regex regex = new Regex((String) jr0Var.a("gads:ad_mob_ad_unit_pattern", "^(ca-app-pub-[a-zA-Z0-9\\-]+)\\/([a-zA-Z0-9_\\-]+)(\\/.*)?$", u.a$7));
                String lowerCase = str.toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
                if (regex.f(lowerCase)) {
                    ArrayDeque arrayDeque = (ArrayDeque) linkedHashMap.get(str);
                    if (arrayDeque == null) {
                        arrayDeque = new ArrayDeque();
                    }
                    o2Var.getClass();
                    arrayDeque.addLast(new Long(SystemClock.elapsedRealtime()));
                    while (!arrayDeque.isEmpty()) {
                        long jElapsedRealtime = SystemClock.elapsedRealtime() - ((Number) arrayDeque.first()).longValue();
                        jr0Var.getClass();
                        Duration.Companion companion = Duration.f72038b;
                        if (jElapsedRealtime <= Duration.h(((Duration) jr0Var.a("gads:request_throttler_window_ms", new Duration(DurationKt.g(3000, DurationUnit.f72045d)), u.a$1)).f72041a)) {
                            break;
                        }
                        b70.d.F0(arrayDeque);
                    }
                    int i12 = arrayDeque.f71724c;
                    jr0Var.getClass();
                    if (i12 > ((Number) jr0Var.a("gads:request_throttler:max_failed_queries", 3, jn.a$15)).intValue()) {
                        b70.d.F0(arrayDeque);
                    }
                    linkedHashMap.put(str, arrayDeque);
                    Unit unit = Unit.f71706a;
                    dVar.g(null);
                    return unit;
                }
            } catch (Throwable th2) {
                dVar.g(null);
                throw th2;
            }
        }
        Unit unit2 = Unit.f71706a;
        dVar.g(null);
        return unit2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(bw2 bw2Var, String str, ContinuationImpl continuationImpl) {
        zv2 zv2Var;
        bw2 bw2Var2;
        d dVar;
        if (continuationImpl instanceof zv2) {
            zv2Var = (zv2) continuationImpl;
            int i5 = zv2Var.f12694f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zv2Var.f12694f = i5 - Integer.MIN_VALUE;
            } else {
                zv2Var = new zv2(bw2Var, continuationImpl);
            }
        }
        Object obj = zv2Var.f12692d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zv2Var.f12694f;
        if (i11 == 0) {
            ResultKt.b(obj);
            d dVar2 = bw2Var.f1594c;
            zv2Var.f12689a = bw2Var;
            zv2Var.f12690b = str;
            zv2Var.f12691c = dVar2;
            zv2Var.f12694f = 1;
            if (dVar2.e(zv2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            bw2Var2 = bw2Var;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = zv2Var.f12691c;
            str = zv2Var.f12690b;
            bw2Var2 = zv2Var.f12689a;
            ResultKt.b(obj);
        }
        try {
            if (str == null) {
                return Unit.f71706a;
            }
            dVar.g(null);
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object c(bw2 bw2Var, String str, ContinuationImpl continuationImpl) {
        aw2 aw2Var;
        d dVar;
        if (continuationImpl instanceof aw2) {
            aw2Var = (aw2) continuationImpl;
            int i5 = aw2Var.f1176f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aw2Var.f1176f = i5 - Integer.MIN_VALUE;
            } else {
                aw2Var = new aw2(bw2Var, continuationImpl);
            }
        }
        Object obj = aw2Var.f1174d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aw2Var.f1176f;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = bw2Var.f1594c;
            aw2Var.f1171a = bw2Var;
            aw2Var.f1172b = str;
            aw2Var.f1173c = dVar;
            aw2Var.f1176f = 1;
            if (dVar.e(aw2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = aw2Var.f1173c;
            str = aw2Var.f1172b;
            bw2 bw2Var2 = aw2Var.f1171a;
            ResultKt.b(obj);
            dVar = dVar2;
            bw2Var = bw2Var2;
        }
        if (str != null) {
            try {
                jr0 jr0Var = bw2Var.f1592a;
                Regex regex = new Regex((String) jr0Var.a("gads:ad_mob_ad_unit_pattern", "^(ca-app-pub-[a-zA-Z0-9\\-]+)\\/([a-zA-Z0-9_\\-]+)(\\/.*)?$", u.a$7));
                String lowerCase = str.toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
                if (regex.f(lowerCase)) {
                    ArrayDeque arrayDeque = (ArrayDeque) bw2Var.f1595d.get(str);
                    if (arrayDeque != null && !arrayDeque.isEmpty()) {
                        int i12 = arrayDeque.f71724c;
                        jr0Var.getClass();
                        if (i12 >= ((Number) jr0Var.a("gads:request_throttler:max_failed_queries", 3, jn.a$15)).intValue()) {
                            Duration.Companion companion = Duration.f72038b;
                            long jH = Duration.h(((Duration) jr0Var.a("gads:request_throttler_timeout_ms", new Duration(DurationKt.g(5000, DurationUnit.f72045d)), u.a$1)).f72041a);
                            bw2Var.f1593b.getClass();
                            if (jH > SystemClock.elapsedRealtime() - ((Number) arrayDeque.last()).longValue()) {
                                return Boolean.TRUE;
                            }
                        }
                        return Boolean.FALSE;
                    }
                    return Boolean.FALSE;
                }
            } finally {
                dVar.g(null);
            }
        }
        return Boolean.FALSE;
    }

    public final Object a(String str, l32 l32Var) {
        return c(this, str, l32Var);
    }
}
