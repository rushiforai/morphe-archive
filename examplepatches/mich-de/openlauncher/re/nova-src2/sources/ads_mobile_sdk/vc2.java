package ads_mobile_sdk;

import b.r0;
import b.t4;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class vc2 implements r0, b.ka {

    /* renamed from: a, reason: collision with root package name */
    public final hd2 f10726a;

    /* renamed from: b, reason: collision with root package name */
    public final pe2 f10727b;

    /* renamed from: c, reason: collision with root package name */
    public final ni.q f10728c;

    /* renamed from: d, reason: collision with root package name */
    public final qw2 f10729d;

    /* renamed from: e, reason: collision with root package name */
    public final int f10730e;

    /* renamed from: f, reason: collision with root package name */
    public final ci3 f10731f;

    /* renamed from: g, reason: collision with root package name */
    public final t4 f10732g;

    /* renamed from: h, reason: collision with root package name */
    public ue2 f10733h;

    public vc2(hd2 persistentCacheFillManager, pe2 persistentCacheManager, ni.q baseRequest, qw2 requestType, int i5, ci3 traceLogger, t4 flags) {
        Intrinsics.g(persistentCacheFillManager, "persistentCacheFillManager");
        Intrinsics.g(persistentCacheManager, "persistentCacheManager");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(flags, "flags");
        this.f10726a = persistentCacheFillManager;
        this.f10727b = persistentCacheManager;
        this.f10728c = baseRequest;
        this.f10729d = requestType;
        this.f10730e = i5;
        this.f10731f = traceLogger;
        this.f10732g = flags;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.r0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(pu0 pu0Var, ni.g0 g0Var, Continuation continuation) {
        uc2 uc2Var;
        vc2 vc2Var;
        ni.k kVar;
        if (continuation instanceof uc2) {
            uc2Var = (uc2) continuation;
            int i5 = uc2Var.f10313d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uc2Var.f10313d = i5 - Integer.MIN_VALUE;
            } else {
                uc2Var = new uc2(this, (ContinuationImpl) continuation);
            }
        }
        Object objB = uc2Var.f10311b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uc2Var.f10313d;
        if (i11 == 0) {
            ResultKt.b(objB);
            ue2 ue2Var = this.f10733h;
            if (ue2Var == null) {
                vc2Var = this;
                ni.q qVar = vc2Var.f10728c;
                kVar = !(qVar instanceof ni.k) ? (ni.k) qVar : null;
                if (kVar != null) {
                    vc2Var.f10726a.a(kVar, vc2Var.f10729d, vc2Var.f10730e, (ue2) null);
                }
                return Unit.f71706a;
            }
            uc2Var.f10310a = this;
            uc2Var.f10313d = 1;
            pe2 pe2Var = this.f10727b;
            pe2Var.getClass();
            objB = pe2.b(pe2Var, ue2Var, uc2Var);
            if (objB == coroutineSingletons) {
                return coroutineSingletons;
            }
            vc2Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            vc2Var = uc2Var.f10310a;
            ResultKt.b(objB);
        }
        b.a1 a1Var = (b.a1) objB;
        if (a1Var instanceof pu0) {
            ci3 ci3Var = vc2Var.f10731f;
            Throwable thB = ((pu0) a1Var).b();
            if (thB == null) {
                thB = new Exception(a1Var.toString());
            }
            ci3Var.a("Failed to evict cached ad upon load/render failure", thB);
        }
        ni.q qVar2 = vc2Var.f10728c;
        if (!(qVar2 instanceof ni.k)) {
        }
        if (kVar != null) {
        }
        return Unit.f71706a;
    }

    @Override // b.r0
    public final Object a(d33 d33Var, z1 z1Var, ni.g0 g0Var, Continuation continuation) {
        if (d33Var.f2167c && this.f10732g.j()) {
            return Unit.f71706a;
        }
        ni.q qVar = this.f10728c;
        ni.k kVar = qVar instanceof ni.k ? (ni.k) qVar : null;
        if (kVar != null) {
            this.f10726a.a(kVar, this.f10729d, this.f10730e, (ue2) null);
        }
        return Unit.f71706a;
    }

    @Override // b.ka
    public final Object a(d33 d33Var, Continuation continuation) {
        if (d33Var.f2167c) {
            this.f10733h = d33Var.f2168d;
        }
        return Unit.f71706a;
    }
}
