package ads_mobile_sdk;

import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.SystemClock;
import b.o2;
import c80.d;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes2.dex */
public final class x60 {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f11585a;

    /* renamed from: b, reason: collision with root package name */
    public final jr0 f11586b;

    /* renamed from: c, reason: collision with root package name */
    public final o2 f11587c;

    /* renamed from: d, reason: collision with root package name */
    public final kx2 f11588d;

    /* renamed from: e, reason: collision with root package name */
    public final d f11589e;

    /* renamed from: f, reason: collision with root package name */
    public final LinkedHashMap f11590f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f11591g;

    /* renamed from: h, reason: collision with root package name */
    public final LinkedHashMap f11592h;

    public x60(t70.j0 backgroundScope, Context context, jr0 flags, o2 clock, kx2 urlPinger, qw2 requestType, di0 deviceProperties, hv commonConfiguration) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(context, "context");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(urlPinger, "urlPinger");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(deviceProperties, "deviceProperties");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        this.f11585a = backgroundScope;
        this.f11586b = flags;
        this.f11587c = clock;
        this.f11588d = urlPinger;
        this.f11589e = new d();
        Pair pair = new Pair("ad_format", requestType.f8869a);
        Pair pair2 = new Pair("api_v", String.valueOf(Build.VERSION.SDK_INT));
        Pair pair3 = new Pair("app", context.getPackageName());
        Pair pair4 = new Pair("s", "gmob_sdk");
        Pair pair5 = new Pair("v", "3");
        String str = Build.MANUFACTURER;
        String str2 = Build.MODEL;
        Intrinsics.d(str2);
        Intrinsics.d(str);
        this.f11590f = MapsKt.k0(pair, pair2, pair3, pair4, pair5, new Pair("device", r70.j.I0(str2, str, false) ? str2 : b.u4.m(str, " ", str2)), new Pair("is_bstar", ((Boolean) deviceProperties.f2532f.getValue()).booleanValue() ? "1" : "0"), new Pair("is_lite_sdk", "0"), new Pair("gqi", commonConfiguration.f4554h), new Pair("os", Build.VERSION.RELEASE));
        this.f11591g = new ArrayList();
        this.f11592h = new LinkedHashMap();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(x60 x60Var, String str, ContinuationImpl continuationImpl) {
        r60 r60Var;
        kh3 kh3Var;
        x60 x60Var2;
        kh3 kh3Var2;
        d dVar;
        if (continuationImpl instanceof r60) {
            r60Var = (r60) continuationImpl;
            int i5 = r60Var.f8933h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                r60Var.f8933h = i5 - Integer.MIN_VALUE;
            } else {
                r60Var = new r60(x60Var, continuationImpl);
            }
        }
        Object obj = r60Var.f8931f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = r60Var.f8933h;
        if (i11 == 0) {
            ResultKt.b(obj);
            Duration.Companion companion = Duration.f72038b;
            x60Var.f11587c.getClass();
            kh3Var = new kh3(DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d), str);
            d dVar2 = x60Var.f11589e;
            r60Var.f8926a = x60Var;
            r60Var.f8927b = str;
            r60Var.f8928c = kh3Var;
            r60Var.f8929d = kh3Var;
            r60Var.f8930e = dVar2;
            r60Var.f8933h = 1;
            if (dVar2.e(r60Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            x60Var2 = x60Var;
            kh3Var2 = kh3Var;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = r60Var.f8930e;
            kh3 kh3Var3 = r60Var.f8929d;
            kh3Var2 = r60Var.f8928c;
            String str2 = r60Var.f8927b;
            x60Var2 = r60Var.f8926a;
            ResultKt.b(obj);
            kh3Var = kh3Var3;
            str = str2;
        }
        try {
            x60Var2.f11592h.put(str, kh3Var);
            Unit unit = Unit.f71706a;
            return kh3Var2;
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) throws IOException {
        t60 t60Var;
        x60 x60Var;
        d dVar;
        if (continuationImpl instanceof t60) {
            t60Var = (t60) continuationImpl;
            int i5 = t60Var.f9790e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                t60Var.f9790e = i5 - Integer.MIN_VALUE;
            } else {
                t60Var = new t60(this, continuationImpl);
            }
        }
        Object obj = t60Var.f9788c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = t60Var.f9790e;
        if (i11 == 0) {
            ResultKt.b(obj);
            t60Var.f9786a = this;
            d dVar2 = this.f11589e;
            t60Var.f9787b = dVar2;
            t60Var.f9790e = 1;
            if (dVar2.e(t60Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            x60Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = t60Var.f9787b;
            x60Var = t60Var.f9786a;
            ResultKt.b(obj);
        }
        try {
            List listI1 = b70.g.I1(x60Var.f11591g);
            Map mapS0 = MapsKt.s0(x60Var.f11590f);
            dVar.g(null);
            List<p60> list = listI1;
            Map map = mapS0;
            String strF1 = b70.g.f1(list, ",", null, null, 0, u.a$11, 30);
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            for (p60 p60Var : list) {
                Long l9 = new Long(Duration.h(p60Var.f8109b.f5743b));
                Object arrayList = linkedHashMap.get(l9);
                if (arrayList == null) {
                    arrayList = new ArrayList();
                    linkedHashMap.put(l9, arrayList);
                }
                ((List) arrayList).add(p60Var.f8108a);
            }
            ArrayList arrayList2 = new ArrayList(linkedHashMap.size());
            for (Map.Entry entry : linkedHashMap.entrySet()) {
                String strF12 = b70.g.f1((Iterable) entry.getValue(), "+", null, null, 0, null, 62);
                b.i8 i8Var = rw0.f9327f;
                o2 timestampToElapsedRealTime = x60Var.f11587c;
                long jLongValue = ((Number) entry.getKey()).longValue();
                Intrinsics.g(timestampToElapsedRealTime, "$this$timestampToElapsedRealTime");
                long jCurrentTimeMillis = System.currentTimeMillis();
                long jElapsedRealtime = SystemClock.elapsedRealtime();
                Duration.Companion companion = Duration.f72038b;
                arrayList2.add(strF12 + "." + Duration.h(DurationKt.h(jElapsedRealtime - (jCurrentTimeMillis - jLongValue), DurationUnit.f72045d)));
            }
            String strF13 = b70.g.f1(arrayList2, ",", null, null, 0, null, 62);
            kx2 kx2Var = x60Var.f11588d;
            Uri.Builder builderBuildUpon = Uri.parse((String) x60Var.f11586b.a("gads:sdk_csi_server", "https://csi.gstatic.com/csi", u.a$7)).buildUpon();
            for (Map.Entry entry2 : map.entrySet()) {
                builderBuildUpon.appendQueryParameter((String) entry2.getKey(), (String) entry2.getValue());
            }
            Uri uri = Uri.parse(builderBuildUpon.build().toString() + "&it=" + strF1 + "&blat=" + strF13);
            Boolean bool = Boolean.FALSE;
            kx2Var.getClass();
            Intrinsics.g(uri, "uri");
            kx2Var.f6014c.a(uri, kx2Var.f6012a, kx2Var.f6013b, null, bool);
            return Unit.f71706a;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, String str2, boolean z11, ContinuationImpl continuationImpl) {
        v60 v60Var;
        d dVar;
        x60 x60Var;
        if (continuationImpl instanceof v60) {
            v60Var = (v60) continuationImpl;
            int i5 = v60Var.f10608h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                v60Var.f10608h = i5 - Integer.MIN_VALUE;
            } else {
                v60Var = new v60(this, continuationImpl);
            }
        }
        Object obj = v60Var.f10606f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = v60Var.f10608h;
        if (i11 == 0) {
            ResultKt.b(obj);
            v60Var.f10601a = this;
            v60Var.f10602b = str;
            v60Var.f10603c = str2;
            dVar = this.f11589e;
            v60Var.f10604d = dVar;
            v60Var.f10605e = z11;
            v60Var.f10608h = 1;
            if (dVar.e(v60Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            x60Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z11 = v60Var.f10605e;
            d dVar2 = v60Var.f10604d;
            str2 = v60Var.f10603c;
            String str3 = v60Var.f10602b;
            x60Var = v60Var.f10601a;
            ResultKt.b(obj);
            dVar = dVar2;
            str = str3;
        }
        try {
            if (z11) {
                x60Var.f11590f.put(str, str2);
                Unit unit = Unit.f71706a;
            } else {
                x60Var.f11590f.putIfAbsent(str, str2);
            }
            dVar.g(null);
            return Unit.f71706a;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, String str2, long j11, ContinuationImpl continuationImpl) {
        w60 w60Var;
        d dVar;
        x60 x60Var;
        if (continuationImpl instanceof w60) {
            w60Var = (w60) continuationImpl;
            int i5 = w60Var.f11063h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                w60Var.f11063h = i5 - Integer.MIN_VALUE;
            } else {
                w60Var = new w60(this, continuationImpl);
            }
        }
        Object obj = w60Var.f11061f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = w60Var.f11063h;
        if (i11 == 0) {
            ResultKt.b(obj);
            w60Var.f11056a = this;
            w60Var.f11057b = str;
            w60Var.f11058c = str2;
            dVar = this.f11589e;
            w60Var.f11059d = dVar;
            w60Var.f11060e = j11;
            w60Var.f11063h = 1;
            if (dVar.e(w60Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            x60Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = w60Var.f11060e;
            d dVar2 = w60Var.f11059d;
            str2 = w60Var.f11058c;
            String str3 = w60Var.f11057b;
            x60Var = w60Var.f11056a;
            ResultKt.b(obj);
            dVar = dVar2;
            str = str3;
        }
        try {
            kh3 kh3Var = (kh3) x60Var.f11592h.get(str2);
            if (kh3Var != null) {
                x60Var.f11591g.add(new p60(str, kh3Var, j11));
            }
            dVar.g(null);
            return Unit.f71706a;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }
}
