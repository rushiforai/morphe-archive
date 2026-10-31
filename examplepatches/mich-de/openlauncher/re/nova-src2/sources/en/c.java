package en;

import android.os.Build;
import android.util.Log;
import b.i8;
import bn.h1;
import bn.v;
import e00.z4;
import java.util.Map;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.m0;

/* loaded from: classes.dex */
public final class c implements p {

    /* renamed from: g, reason: collision with root package name */
    public static final int f52815g;

    /* renamed from: h, reason: collision with root package name */
    public static final Regex f52816h;

    /* renamed from: a, reason: collision with root package name */
    public final h1 f52817a;

    /* renamed from: b, reason: collision with root package name */
    public final om.e f52818b;

    /* renamed from: c, reason: collision with root package name */
    public final bn.b f52819c;

    /* renamed from: d, reason: collision with root package name */
    public final e f52820d;

    /* renamed from: e, reason: collision with root package name */
    public final l f52821e;

    /* renamed from: f, reason: collision with root package name */
    public final c80.d f52822f;

    static {
        Duration.Companion companion = Duration.f72038b;
        f52815g = (int) Duration.q(DurationKt.g(24, DurationUnit.f72048g), DurationUnit.f72046e);
        f52816h = new Regex("com/google/firebase/sessions//");
    }

    public c(h1 timeProvider, om.e firebaseInstallationsApi, bn.b appInfo, e configsFetcher, l settingsCache) {
        Intrinsics.g(timeProvider, "timeProvider");
        Intrinsics.g(firebaseInstallationsApi, "firebaseInstallationsApi");
        Intrinsics.g(appInfo, "appInfo");
        Intrinsics.g(configsFetcher, "configsFetcher");
        Intrinsics.g(settingsCache, "settingsCache");
        this.f52817a = timeProvider;
        this.f52818b = firebaseInstallationsApi;
        this.f52819c = appInfo;
        this.f52820d = configsFetcher;
        this.f52821e = settingsCache;
        this.f52822f = new c80.d();
    }

    @Override // en.p
    public final Boolean a() {
        return ((o) this.f52821e).e();
    }

    @Override // en.p
    public final Duration b() {
        Integer numC = ((o) this.f52821e).c();
        if (numC == null) {
            return null;
        }
        Duration.Companion companion = Duration.f72038b;
        return new Duration(DurationKt.g(numC.intValue(), DurationUnit.f72046e));
    }

    @Override // en.p
    public final Double c() {
        return ((o) this.f52821e).d();
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x00a4 A[Catch: all -> 0x004c, TRY_LEAVE, TryCatch #1 {all -> 0x004c, blocks: (B:21:0x0048, B:44:0x009a, B:46:0x00a4, B:49:0x00b3, B:52:0x0138, B:36:0x007a, B:38:0x0082, B:41:0x008a), top: B:63:0x002c }] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00b3 A[Catch: all -> 0x004c, TRY_ENTER, TryCatch #1 {all -> 0x004c, blocks: (B:21:0x0048, B:44:0x009a, B:46:0x00a4, B:49:0x00b3, B:52:0x0138, B:36:0x007a, B:38:0x0082, B:41:0x008a), top: B:63:0x002c }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Type inference failed for: r5v0, types: [int] */
    @Override // en.p
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) throws Throwable {
        b bVar;
        c80.a aVar;
        c80.a aVar2;
        String str;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f52814w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f52814w = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, (ContinuationImpl) continuation);
            }
        }
        Object objS = bVar.f52812u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r52 = bVar.f52814w;
        l lVar = this.f52821e;
        Continuation continuation2 = null;
        try {
            if (r52 == 0) {
                ResultKt.b(objS);
                c80.d dVar = this.f52822f;
                if (!dVar.d() && !((o) lVar).b()) {
                    return Unit.f71706a;
                }
                bVar.f52811t = dVar;
                bVar.f52814w = 1;
                if (dVar.e(bVar) != coroutineSingletons) {
                    aVar2 = dVar;
                }
                return coroutineSingletons;
            }
            if (r52 != 1) {
                if (r52 != 2) {
                    if (r52 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    aVar = bVar.f52811t;
                    try {
                        ResultKt.b(objS);
                        Unit unit = Unit.f71706a;
                        ((c80.d) aVar).g(null);
                        return Unit.f71706a;
                    } catch (Throwable th2) {
                        th = th2;
                        ((c80.d) aVar).g(null);
                        throw th;
                    }
                }
                aVar2 = bVar.f52811t;
                ResultKt.b(objS);
                str = ((v) objS).f18294a;
                if (!str.equals(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) {
                    Log.w("FirebaseSessions", "Error getting Firebase Installation ID. Skipping this Session Event.");
                    Unit unit2 = Unit.f71706a;
                    ((c80.d) aVar2).g(null);
                    return unit2;
                }
                Pair pair = new Pair("X-Crashlytics-Installation-ID", str);
                String str2 = Build.MANUFACTURER + Build.MODEL;
                Regex regex = f52816h;
                Pair pair2 = new Pair("X-Crashlytics-Device-Model", regex.h(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, str2));
                String INCREMENTAL = Build.VERSION.INCREMENTAL;
                Intrinsics.f(INCREMENTAL, "INCREMENTAL");
                Pair pair3 = new Pair("X-Crashlytics-OS-Build-Version", regex.h(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, INCREMENTAL));
                String RELEASE = Build.VERSION.RELEASE;
                Intrinsics.f(RELEASE, "RELEASE");
                Pair pair4 = new Pair("X-Crashlytics-OS-Display-Version", regex.h(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, RELEASE));
                this.f52819c.getClass();
                Map mapJ0 = MapsKt.j0(pair, pair2, pair3, pair4, new Pair("X-Crashlytics-API-Client-Version", "3.0.7"));
                e eVar = this.f52820d;
                c4.k kVar = new c4.k(this, continuation2, 15);
                z4 z4Var = new z4(13);
                bVar.f52811t = aVar2;
                bVar.f52814w = 3;
                Object objY = m0.y(eVar.f52829b, new d(eVar, mapJ0, kVar, z4Var, null), bVar);
                if (objY != coroutineSingletons) {
                    objY = Unit.f71706a;
                }
                if (objY != coroutineSingletons) {
                    aVar = aVar2;
                    Unit unit3 = Unit.f71706a;
                    ((c80.d) aVar).g(null);
                    return Unit.f71706a;
                }
                return coroutineSingletons;
            }
            aVar2 = bVar.f52811t;
            ResultKt.b(objS);
            if (!((o) lVar).b()) {
                Unit unit4 = Unit.f71706a;
                ((c80.d) aVar2).g(null);
                return unit4;
            }
            i8 i8Var = v.f18293c;
            om.e eVar2 = this.f52818b;
            bVar.f52811t = aVar2;
            bVar.f52814w = 2;
            objS = i8Var.s(eVar2, bVar);
            if (objS != coroutineSingletons) {
                str = ((v) objS).f18294a;
                if (!str.equals(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th3) {
            th = th3;
            aVar = r52;
        }
    }
}
