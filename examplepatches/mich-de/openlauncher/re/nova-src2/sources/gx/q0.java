package gx;

import ai.w3;
import android.util.Log;
import com.amplitude.core.events.Identify;
import com.teslacoilsw.ads.internal.runtime.AdErrorException;
import dx.r0;
import dx.s0;
import dx.x0;
import e00.q4;
import f1.z1;
import java.util.Iterator;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import t70.g2;
import w70.i2;
import w70.m1;
import w70.o1;
import w70.u1;

/* loaded from: classes4.dex */
public final class q0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f58162a;

    /* renamed from: b, reason: collision with root package name */
    public final String f58163b;

    /* renamed from: c, reason: collision with root package name */
    public final q4 f58164c;

    /* renamed from: d, reason: collision with root package name */
    public final f f58165d;

    /* renamed from: e, reason: collision with root package name */
    public final d f58166e;

    /* renamed from: f, reason: collision with root package name */
    public final i0 f58167f;

    /* renamed from: g, reason: collision with root package name */
    public final t70.j0 f58168g;

    /* renamed from: h, reason: collision with root package name */
    public final dx.d0 f58169h;

    /* renamed from: i, reason: collision with root package name */
    public final Function0 f58170i;

    /* renamed from: j, reason: collision with root package name */
    public final Function0 f58171j;

    /* renamed from: k, reason: collision with root package name */
    public final m1 f58172k;

    /* renamed from: l, reason: collision with root package name */
    public final c80.d f58173l;

    /* renamed from: m, reason: collision with root package name */
    public final i2 f58174m;
    public final o1 n;
    public volatile c0 o;

    /* renamed from: p, reason: collision with root package name */
    public volatile c0 f58175p;

    /* renamed from: q, reason: collision with root package name */
    public volatile boolean f58176q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f58177r;

    /* renamed from: s, reason: collision with root package name */
    public g2 f58178s;

    /* renamed from: t, reason: collision with root package name */
    public g2 f58179t;

    /* renamed from: u, reason: collision with root package name */
    public int f58180u;

    /* renamed from: v, reason: collision with root package name */
    public volatile w3 f58181v;

    /* renamed from: w, reason: collision with root package name */
    public volatile boolean f58182w;

    /* renamed from: x, reason: collision with root package name */
    public final ArrayDeque f58183x;

    public q0(String str, String placement, q4 q4Var, f fVar, d pool, i0 i0Var, t70.j0 scope, dx.d0 d0Var, f fVar2, i2 i2Var) {
        z1 z1Var = new z1(19);
        Intrinsics.g(placement, "placement");
        Intrinsics.g(pool, "pool");
        Intrinsics.g(scope, "scope");
        this.f58162a = str;
        this.f58163b = placement;
        this.f58164c = q4Var;
        this.f58165d = fVar;
        this.f58166e = pool;
        this.f58167f = i0Var;
        this.f58168g = scope;
        this.f58169h = d0Var;
        this.f58170i = z1Var;
        this.f58171j = fVar2;
        this.f58172k = i2Var;
        this.f58173l = new c80.d();
        i2 i2VarC = u1.c(dx.x.f49819a);
        this.f58174m = i2VarC;
        this.n = new o1(i2VarC);
        this.f58183x = new ArrayDeque(20);
    }

    public static final void a(q0 q0Var) {
        if (q0Var.f58175p == null) {
            g2 g2Var = q0Var.f58178s;
            if ((g2Var == null || !g2Var.b()) && (q0Var.f58174m.getValue() instanceof dx.a0)) {
                q0Var.f58178s = t70.m0.t(q0Var.f58168g, null, null, new k0(q0Var, null), 3);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(q0 q0Var, Object obj, boolean z11, ContinuationImpl continuationImpl) throws Throwable {
        n0 n0Var;
        Object next;
        dx.n jVar;
        int i5;
        if (continuationImpl instanceof n0) {
            n0Var = (n0) continuationImpl;
            int i11 = n0Var.f58137y;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                n0Var.f58137y = i11 - Integer.MIN_VALUE;
            } else {
                n0Var = new n0(q0Var, continuationImpl);
            }
        }
        Object obj2 = n0Var.f58135w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = n0Var.f58137y;
        if (i12 == 0) {
            ResultKt.b(obj2);
            int i13 = Result.f71687b;
            if (!(obj instanceof Result.Failure)) {
                e0 e0Var = (e0) obj;
                f0 f0Var = e0Var.f58063a;
                dx.q0 q0Var2 = (dx.q0) q0Var.f58164c.invoke();
                if (q0Var2 == null) {
                    try {
                        f0Var.destroy();
                        Unit unit = Unit.f71706a;
                    } catch (Throwable th2) {
                        int i14 = Result.f71687b;
                        ResultKt.a(th2);
                    }
                    if (z11) {
                        i2 i2Var = q0Var.f58174m;
                        dx.y yVar = new dx.y(dx.i.f49709a);
                        i2Var.getClass();
                        i2Var.k(null, yVar);
                    }
                } else {
                    Iterator it = q0Var2.f49763b.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            next = null;
                            break;
                        }
                        next = it.next();
                        if (Intrinsics.b(((dx.f) next).a(), f0Var.a())) {
                            break;
                        }
                    }
                    dx.f fVar = (dx.f) next;
                    if (fVar == null) {
                        try {
                            int i15 = Result.f71687b;
                            f0Var.destroy();
                            Unit unit2 = Unit.f71706a;
                        } catch (Throwable th3) {
                            int i16 = Result.f71687b;
                            ResultKt.a(th3);
                        }
                        if (z11 && !(q0Var.f58174m.getValue() instanceof dx.a0)) {
                            i2 i2Var2 = q0Var.f58174m;
                            dx.x xVar = dx.x.f49819a;
                            i2Var2.getClass();
                            i2Var2.k(null, xVar);
                            q0Var.g();
                        }
                    } else {
                        c0 c0Var = new c0(f0Var, com.google.android.gms.internal.consent_sdk.k0.z(fVar), e0Var.f58064b);
                        Log.i("NovaAds", com.google.android.gms.internal.consent_sdk.e0.W(q0Var.f58162a, e0Var.f58064b, q0Var.f58163b) + " loaded: candidate=" + c0Var.f58052a.a() + " presentation=" + f0Var.e() + " warmth=Fresh");
                        if (z11) {
                            q0Var.o = c0Var;
                            q0Var.e(c0Var);
                            q0Var.f58180u = 0;
                            q0Var.f58181v = new w3(q0Var2.f49764c, q0Var.f58170i);
                            if (q0Var.f58176q) {
                                w3 w3Var = q0Var.f58181v;
                                Intrinsics.d(w3Var);
                                w3.f(w3Var);
                            }
                            if (((Boolean) q0Var.f58171j.invoke()).booleanValue()) {
                                String msg = "state → Showing(candidate=" + c0Var.f58052a.a() + ", warmth=" + (c0Var.f58057f > 0 ? x0.f49821b : x0.f49820a) + ")";
                                Intrinsics.g(msg, "msg");
                            }
                            i2 i2Var3 = q0Var.f58174m;
                            dx.a0 a0Var = new dx.a0(c0Var.f58052a.a(), f0Var.e(), false, c0Var.f58057f > 0 ? x0.f49821b : x0.f49820a);
                            i2Var3.getClass();
                            i2Var3.k(null, a0Var);
                        } else {
                            q0Var.f58175p = c0Var;
                            n0Var.f58132t = q0Var;
                            n0Var.f58133u = obj;
                            n0Var.f58134v = z11;
                            n0Var.f58137y = 1;
                            if (q0Var.h(n0Var) == coroutineSingletons) {
                                return coroutineSingletons;
                            }
                        }
                    }
                }
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z11 = n0Var.f58134v;
            obj = n0Var.f58133u;
            q0Var = n0Var.f58132t;
            ResultKt.b(obj2);
        }
        Throwable thA = Result.a(obj);
        if (thA != null) {
            AdErrorException adErrorException = thA instanceof AdErrorException ? (AdErrorException) thA : null;
            if (adErrorException == null || (jVar = adErrorException.f45528a) == null) {
                String message = thA.getMessage();
                if (message == null) {
                    message = "load failure";
                }
                jVar = new dx.j(message);
            }
            if (z11) {
                boolean z12 = (jVar instanceof dx.l) || (jVar instanceof dx.i);
                q0Var.f58180u++;
                q0Var.f58164c.invoke();
                s0 s0Var = ((dx.j0) q0Var.f58165d.invoke()).n;
                String strW = com.google.android.gms.internal.consent_sdk.e0.W(q0Var.f58162a, null, q0Var.f58163b);
                int i17 = q0Var.f58180u;
                s0Var.getClass();
                Log.w("NovaAds", strW + " load failed: error=" + jVar + " attempt=" + i17 + "/3" + (z12 ? " (terminal — no retry)" : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
                if (z12 || (i5 = q0Var.f58180u) > 3) {
                    Log.e("NovaAds", com.google.android.gms.internal.consent_sdk.e0.W(q0Var.f58162a, null, q0Var.f58163b) + " state → Failed: error=" + jVar);
                    i2 i2Var4 = q0Var.f58174m;
                    dx.y yVar2 = new dx.y(jVar);
                    i2Var4.getClass();
                    i2Var4.k(null, yVar2);
                } else {
                    int i18 = i5 - 1;
                    if (i18 > 20) {
                        i18 = 20;
                    }
                    long j11 = 5000 << i18;
                    if (j11 > 60000) {
                        j11 = 60000;
                    }
                    g2 g2Var = q0Var.f58179t;
                    if (g2Var != null) {
                        g2Var.c(null);
                    }
                    q0Var.f58179t = t70.m0.t(q0Var.f58168g, null, null, new e0.b(j11, q0Var, (Continuation) null), 3);
                }
            }
        }
        return Unit.f71706a;
    }

    public static final Object c(q0 q0Var, c0 c0Var, boolean z11, SuspendLambda suspendLambda) {
        if (!z11) {
            q0Var.f58175p = c0Var;
            Object objH = q0Var.h(suspendLambda);
            return objH == CoroutineSingletons.f71806a ? objH : Unit.f71706a;
        }
        dx.q0 q0Var2 = (dx.q0) q0Var.f58164c.invoke();
        if (q0Var2 == null) {
            Log.e("NovaAds", "placement " + q0Var.f58163b + " missing from AdConfig — Failed(ConfigError)");
            i2 i2Var = q0Var.f58174m;
            dx.y yVar = new dx.y(dx.i.f49709a);
            i2Var.getClass();
            i2Var.k(null, yVar);
        }
        if (q0Var2 == null) {
            try {
                int i5 = Result.f71687b;
                c0Var.f58052a.destroy();
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                ResultKt.a(th2);
            }
            return Unit.f71706a;
        }
        q0Var.o = c0Var;
        q0Var.e(c0Var);
        q0Var.f58180u = 0;
        q0Var.f58181v = new w3(q0Var2.f49764c, q0Var.f58170i);
        if (q0Var.f58176q) {
            w3 w3Var = q0Var.f58181v;
            Intrinsics.d(w3Var);
            w3.f(w3Var);
        }
        if (((Boolean) q0Var.f58171j.invoke()).booleanValue()) {
            String msg = "state → Showing(candidate=" + c0Var.f58052a.a() + ", warmth=" + (c0Var.f58057f > 0 ? x0.f49821b : x0.f49820a) + ")";
            Intrinsics.g(msg, "msg");
        }
        i2 i2Var2 = q0Var.f58174m;
        dx.a0 a0Var = new dx.a0(c0Var.f58052a.a(), c0Var.f58052a.e(), false, c0Var.f58057f > 0 ? x0.f49821b : x0.f49820a);
        i2Var2.getClass();
        i2Var2.k(null, a0Var);
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0083 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:35:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x007c -> B:28:0x007f). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object d(q0 q0Var, ContinuationImpl continuationImpl) {
        p0 p0Var;
        q0 q0Var2;
        Iterator it;
        if (continuationImpl instanceof p0) {
            p0Var = (p0) continuationImpl;
            int i5 = p0Var.f58154x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                p0Var.f58154x = i5 - Integer.MIN_VALUE;
            } else {
                p0Var = new p0(q0Var, continuationImpl);
            }
        }
        Object obj = p0Var.f58152v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = p0Var.f58154x;
        if (i11 == 0) {
            ResultKt.b(obj);
            dx.q0 q0Var3 = (dx.q0) q0Var.f58164c.invoke();
            if (q0Var3 == null) {
                return null;
            }
            dx.j0 j0Var = (dx.j0) q0Var.f58165d.invoke();
            if (!j0Var.f49718b || !j0Var.f49719c) {
                return null;
            }
            Iterator it2 = q0Var3.f49763b.iterator();
            q0Var2 = q0Var;
            it = it2;
            if (it.hasNext()) {
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            it = p0Var.f58151u;
            q0 q0Var4 = p0Var.f58150t;
            ResultKt.b(obj);
            c0 c0Var = (c0) obj;
            if (c0Var == null) {
                return c0Var;
            }
            q0Var2 = q0Var4;
            if (it.hasNext()) {
                return null;
            }
            dx.f fVar = (dx.f) it.next();
            d dVar = q0Var2.f58166e;
            String str = q0Var2.f58163b;
            p0Var.f58150t = q0Var2;
            p0Var.f58151u = it;
            p0Var.f58154x = 1;
            Object objC = dVar.c(str, fVar, p0Var);
            if (objC == coroutineSingletons) {
                return coroutineSingletons;
            }
            q0Var4 = q0Var2;
            obj = objC;
            c0 c0Var2 = (c0) obj;
            if (c0Var2 == null) {
            }
        }
    }

    public final void e(c0 c0Var) {
        ArrayDeque arrayDeque = this.f58183x;
        if (arrayDeque.f71724c >= 20) {
            arrayDeque.removeFirst();
        }
        this.f58183x.addLast(new r0(c0Var.f58052a.a(), c0Var.f58054c, ((Number) this.f58170i.invoke()).longValue(), null, c0Var.f58056e, c0Var.f58052a.f(), c0Var.f58052a.e(), c0Var.f58057f > 0 ? x0.f49821b : x0.f49820a, c0Var.f58057f));
    }

    public final void f() {
        Long l9;
        r0 r0Var = (r0) this.f58183x.j();
        if (r0Var != null && r0Var.f49776d == null) {
            c0 c0Var = this.o;
            Long l11 = (Long) this.f58170i.invoke();
            if (c0Var == null || (l9 = c0Var.f58056e) == null) {
                l9 = r0Var.f49777e;
            }
            r0 r0VarA = r0.a(r0Var, l11, l9, 487);
            this.f58183x.set(r1.f71724c - 1, r0VarA);
        }
    }

    public final void g() {
        if (!this.f58177r || !this.f58176q || (this.f58174m.getValue() instanceof dx.a0) || (this.f58174m.getValue() instanceof dx.z)) {
            return;
        }
        j();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object h(ContinuationImpl continuationImpl) {
        l0 l0Var;
        c0 c0Var;
        q0 q0Var;
        c0 c0Var2;
        if (continuationImpl instanceof l0) {
            l0Var = (l0) continuationImpl;
            int i5 = l0Var.f58120x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                l0Var.f58120x = i5 - Integer.MIN_VALUE;
            } else {
                l0Var = new l0(this, continuationImpl);
            }
        }
        Object obj = l0Var.f58118v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = l0Var.f58120x;
        if (i11 == 0) {
            ResultKt.b(obj);
            c0 c0Var3 = this.o;
            if (c0Var3 != null && (c0Var = this.f58175p) != null && ((dx.q0) this.f58164c.invoke()) != null) {
                if (c0Var3.f58055d && c0Var3.f58056e != null) {
                    long jLongValue = ((Number) this.f58170i.invoke()).longValue();
                    Long l9 = c0Var3.f58056e;
                    Intrinsics.d(l9);
                    if (jLongValue - l9.longValue() >= 1000 && this.f58176q) {
                        String str = this.f58162a;
                        String str2 = this.f58163b;
                        if (str == null) {
                            str = Identify.UNSET_VALUE;
                        }
                        if (str2 == null) {
                            str2 = Identify.UNSET_VALUE;
                        }
                        Log.i("NovaAds", b.c0.n("[", str, "/-/", str2, "]") + " swap from=" + c0Var3.f58052a.a() + " to=" + c0Var.f58052a.a());
                        d dVar = this.f58166e;
                        String str3 = this.f58163b;
                        l0Var.f58116t = this;
                        l0Var.f58117u = c0Var;
                        l0Var.f58120x = 1;
                        if (dVar.b(str3, c0Var3, l0Var) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        q0Var = this;
                        c0Var2 = c0Var;
                    }
                }
                return Unit.f71706a;
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        c0Var2 = l0Var.f58117u;
        q0Var = l0Var.f58116t;
        ResultKt.b(obj);
        q0Var.f();
        q0Var.o = c0Var2;
        q0Var.e(c0Var2);
        q0Var.f58175p = null;
        w3 w3Var = q0Var.f58181v;
        if (w3Var != null) {
            long jLongValue2 = ((Number) ((Function0) w3Var.f13398c).invoke()).longValue();
            w3Var.f13397b = 0L;
            w3Var.f13399d = ((Long) w3Var.f13399d) != null ? Long.valueOf(jLongValue2) : null;
        }
        i2 i2Var = q0Var.f58174m;
        dx.a0 a0Var = new dx.a0(c0Var2.f58052a.a(), c0Var2.f58052a.e(), false, c0Var2.f58057f > 0 ? x0.f49821b : x0.f49820a);
        i2Var.getClass();
        i2Var.k(null, a0Var);
        return Unit.f71706a;
    }

    public final void i() {
        i2 i2Var;
        Object value;
        dx.b0 a0Var;
        do {
            i2Var = this.f58174m;
            value = i2Var.getValue();
            a0Var = (dx.b0) value;
            if (a0Var instanceof dx.a0) {
                dx.a0 a0Var2 = (dx.a0) a0Var;
                if (!a0Var2.f49683c) {
                    String candidateId = a0Var2.f49681a;
                    dx.u presentationKind = a0Var2.f49682b;
                    x0 x0Var = a0Var2.f49684d;
                    Intrinsics.g(candidateId, "candidateId");
                    Intrinsics.g(presentationKind, "presentationKind");
                    a0Var = new dx.a0(candidateId, presentationKind, true, x0Var);
                }
            }
        } while (!i2Var.i(value, a0Var));
    }

    public final void j() {
        g2 g2Var = this.f58178s;
        if (g2Var != null) {
            g2Var.c(null);
        }
        String str = this.f58162a;
        String str2 = Identify.UNSET_VALUE;
        if (str == null) {
            str = Identify.UNSET_VALUE;
        }
        String str3 = this.f58163b;
        if (str3 != null) {
            str2 = str3;
        }
        Log.i("NovaAds", b.c0.n("[", str, "/-/", str2, "]") + " loading: state → Loading");
        i2 i2Var = this.f58174m;
        i2Var.getClass();
        i2Var.k(null, dx.z.f49824a);
        this.f58178s = t70.m0.t(this.f58168g, null, null, new o0(this, null), 3);
    }
}
