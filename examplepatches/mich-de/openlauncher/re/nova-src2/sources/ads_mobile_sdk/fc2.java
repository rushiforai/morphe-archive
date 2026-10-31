package ads_mobile_sdk;

import b.t4;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.optionals.OptionalsKt;

/* loaded from: classes.dex */
public final class fc2 implements b.va {

    /* renamed from: a, reason: collision with root package name */
    public final d33 f3302a;

    /* renamed from: b, reason: collision with root package name */
    public final pe2 f3303b;

    /* renamed from: c, reason: collision with root package name */
    public final hd2 f3304c;

    /* renamed from: d, reason: collision with root package name */
    public final ni.q f3305d;

    /* renamed from: e, reason: collision with root package name */
    public final qw2 f3306e;

    /* renamed from: f, reason: collision with root package name */
    public final Optional f3307f;

    /* renamed from: g, reason: collision with root package name */
    public final t4 f3308g;

    /* renamed from: h, reason: collision with root package name */
    public final ci3 f3309h;

    /* renamed from: i, reason: collision with root package name */
    public final AtomicBoolean f3310i;

    public fc2(d33 serverTransaction, pe2 persistentCacheManager, hd2 persistentCacheFillManager, ni.q baseRequest, qw2 requestType, Optional numberOfAdsRequested, t4 flags, ci3 traceLogger) {
        Intrinsics.g(serverTransaction, "serverTransaction");
        Intrinsics.g(persistentCacheManager, "persistentCacheManager");
        Intrinsics.g(persistentCacheFillManager, "persistentCacheFillManager");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(numberOfAdsRequested, "numberOfAdsRequested");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(traceLogger, "traceLogger");
        this.f3302a = serverTransaction;
        this.f3303b = persistentCacheManager;
        this.f3304c = persistentCacheFillManager;
        this.f3305d = baseRequest;
        this.f3306e = requestType;
        this.f3307f = numberOfAdsRequested;
        this.f3308g = flags;
        this.f3309h = traceLogger;
        this.f3310i = new AtomicBoolean(false);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.va
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Continuation continuation) {
        dc2 dc2Var;
        ue2 ue2Var;
        fc2 fc2Var;
        if (continuation instanceof dc2) {
            dc2Var = (dc2) continuation;
            int i5 = dc2Var.f2436d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dc2Var.f2436d = i5 - Integer.MIN_VALUE;
            } else {
                dc2Var = new dc2(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = dc2Var.f2434b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dc2Var.f2436d;
        if (i11 == 0) {
            ResultKt.b(objA);
            if (this.f3308g.j()) {
                d33 d33Var = this.f3302a;
                if (d33Var.f2167c && !this.f3310i.get() && (ue2Var = d33Var.f2168d) != null) {
                    dc2Var.f2433a = this;
                    dc2Var.f2436d = 1;
                    pe2 pe2Var = this.f3303b;
                    pe2Var.getClass();
                    objA = pe2.a(pe2Var, ue2Var, dc2Var);
                    if (objA == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    fc2Var = this;
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        fc2Var = dc2Var.f2433a;
        ResultKt.b(objA);
        b.a1 a1Var = (b.a1) objA;
        if (a1Var instanceof pu0) {
            ci3 ci3Var = fc2Var.f3309h;
            Throwable thB = ((pu0) a1Var).b();
            if (thB == null) {
                thB = new Exception(a1Var.toString());
            }
            ci3Var.a("Cache status reset failure on ad destroyed", thB);
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.va
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object q(Continuation continuation) {
        ec2 ec2Var;
        ue2 ue2Var;
        fc2 fc2Var;
        if (continuation instanceof ec2) {
            ec2Var = (ec2) continuation;
            int i5 = ec2Var.f2848d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ec2Var.f2848d = i5 - Integer.MIN_VALUE;
            } else {
                ec2Var = new ec2(this, (ContinuationImpl) continuation);
            }
        }
        Object objB = ec2Var.f2846b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ec2Var.f2848d;
        if (i11 == 0) {
            ResultKt.b(objB);
            if (this.f3308g.j()) {
                d33 d33Var = this.f3302a;
                if (d33Var.f2167c && this.f3310i.compareAndSet(false, true) && (ue2Var = d33Var.f2168d) != null) {
                    ec2Var.f2845a = this;
                    ec2Var.f2848d = 1;
                    pe2 pe2Var = this.f3303b;
                    pe2Var.getClass();
                    objB = pe2.b(pe2Var, ue2Var, ec2Var);
                    if (objB == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    fc2Var = this;
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        fc2Var = ec2Var.f2845a;
        ResultKt.b(objB);
        b.a1 a1Var = (b.a1) objB;
        if (a1Var instanceof pu0) {
            ci3 ci3Var = fc2Var.f3309h;
            Throwable thB = ((pu0) a1Var).b();
            if (thB == null) {
                thB = new Exception(a1Var.toString());
            }
            ci3Var.a("Cache eviction failure on impression", thB);
        } else {
            ni.q qVar = fc2Var.f3305d;
            ni.k kVar = qVar instanceof ni.k ? (ni.k) qVar : null;
            if (kVar != null) {
                fc2Var.f3304c.a(kVar, fc2Var.f3306e, ((Number) OptionalsKt.a(fc2Var.f3307f, 1)).intValue(), (ue2) null);
            }
        }
        return Unit.f71706a;
    }
}
