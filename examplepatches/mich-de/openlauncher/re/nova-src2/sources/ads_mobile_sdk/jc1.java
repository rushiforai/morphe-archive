package ads_mobile_sdk;

import b.f9;
import b.o;
import b.q8;
import e10.q2;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.p2;

/* loaded from: classes2.dex */
public final class jc1 extends jo implements b.g1 {

    /* renamed from: e, reason: collision with root package name */
    public final i8 f5214e;

    /* renamed from: f, reason: collision with root package name */
    public final q8 f5215f;

    /* renamed from: g, reason: collision with root package name */
    public final fb2 f5216g;

    /* renamed from: h, reason: collision with root package name */
    public final mi3 f5217h;

    /* renamed from: i, reason: collision with root package name */
    public final jr0 f5218i;

    /* renamed from: j, reason: collision with root package name */
    public final o f5219j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jc1(String requestId, int i5, i8 adSourceResponseInfoCollector, q8 transactionRequester, fb2 transactionRenderer, mi3 traceMetaSet, f9 internalAdRequestEventEmitter, jr0 flags, o internalAdLoadEventEmitter) {
        super(requestId, i5, traceMetaSet, internalAdRequestEventEmitter);
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(adSourceResponseInfoCollector, "adSourceResponseInfoCollector");
        Intrinsics.g(transactionRequester, "transactionRequester");
        Intrinsics.g(transactionRenderer, "transactionRenderer");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(internalAdRequestEventEmitter, "internalAdRequestEventEmitter");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(internalAdLoadEventEmitter, "internalAdLoadEventEmitter");
        this.f5214e = adSourceResponseInfoCollector;
        this.f5215f = transactionRequester;
        this.f5216g = transactionRenderer;
        this.f5217h = traceMetaSet;
        this.f5218i = flags;
        this.f5219j = internalAdLoadEventEmitter;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00c9  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00d5  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v0, types: [int] */
    /* JADX WARN: Type inference failed for: r2v13 */
    /* JADX WARN: Type inference failed for: r2v14 */
    /* JADX WARN: Type inference failed for: r2v7, types: [ads_mobile_sdk.jc1, java.lang.Object] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        hc1 hc1Var;
        ni.g0 g0Var;
        yu0 yu0Var;
        jc1 jc1Var;
        b.a1 a1Var;
        b.a1 a1Var2;
        ni.g0 g0Var2;
        if (continuationImpl instanceof hc1) {
            hc1Var = (hc1) continuationImpl;
            int i5 = hc1Var.f4329e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hc1Var.f4329e = i5 - Integer.MIN_VALUE;
            } else {
                hc1Var = new hc1(this, continuationImpl);
            }
        }
        Object objC = hc1Var.f4327c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        jc1 jc1Var2 = hc1Var.f4329e;
        int i11 = 1;
        try {
        } catch (TimeoutCancellationException e3) {
            ni.g0 g0VarA = jc1Var2.f5214e.a();
            yu0 yu0Var2 = new yu0(e3, 1);
            o oVar = jc1Var2.f5219j;
            hc1Var.f4325a = g0VarA;
            hc1Var.f4326b = yu0Var2;
            hc1Var.f4329e = 3;
            if (oVar.a(yu0Var2, g0VarA, hc1Var) != coroutineSingletons) {
                g0Var = g0VarA;
                yu0Var = yu0Var2;
            }
        }
        if (jc1Var2 == 0) {
            ResultKt.b(objC);
            hc1Var.f4325a = this;
            hc1Var.f4329e = 1;
            th3 th3VarA = ji3.a();
            mi3 mi3Var = this.f5315c;
            Intrinsics.g(mi3Var, "<set-?>");
            th3VarA.f9923a = mi3Var;
            fh1 fh1Var = mi3Var.f7225b;
            fh1Var.f3351a = this.f5313a;
            fh1Var.f3353c = this.f5314b;
            Object objB = this.f5316d.b(hc1Var);
            if ((objB == coroutineSingletons ? (Unit) objB : Unit.f71706a) != coroutineSingletons) {
                jc1Var = this;
            }
            return coroutineSingletons;
        }
        if (jc1Var2 != 1) {
            if (jc1Var2 != 2) {
                if (jc1Var2 == 3) {
                    yu0Var = (yu0) hc1Var.f4326b;
                    g0Var = (ni.g0) hc1Var.f4325a;
                    ResultKt.b(objC);
                    return new n8.q(new Pair(yu0Var, g0Var), 3);
                }
                if (jc1Var2 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                g0Var2 = (ni.g0) hc1Var.f4326b;
                a1Var2 = (b.a1) hc1Var.f4325a;
                ResultKt.b(objC);
                return new n8.q(new Pair(a1Var2, g0Var2), 3);
            }
            jc1 jc1Var3 = (jc1) hc1Var.f4325a;
            ResultKt.b(objC);
            jc1Var2 = jc1Var3;
            a1Var = (b.a1) objC;
            if (!(a1Var instanceof xu0)) {
                return new q2(i11, (w70.m) ((xu0) a1Var).f11834b, jc1Var2);
            }
            if (!(a1Var instanceof pu0)) {
                throw new NoWhenBranchMatchedException();
            }
            ni.g0 g0VarA2 = jc1Var2.f5214e.a();
            hc1Var.f4325a = a1Var;
            hc1Var.f4326b = g0VarA2;
            hc1Var.f4329e = 4;
            if (jc1Var2.f5219j.a((pu0) a1Var, g0VarA2, hc1Var) != coroutineSingletons) {
                a1Var2 = a1Var;
                g0Var2 = g0VarA2;
                return new n8.q(new Pair(a1Var2, g0Var2), 3);
            }
            return coroutineSingletons;
        }
        jc1 jc1Var4 = (jc1) hc1Var.f4325a;
        ResultKt.b(objC);
        jc1Var = jc1Var4;
        jr0 jr0Var = jc1Var.f5218i;
        jr0Var.getClass();
        Duration.Companion companion = Duration.f72038b;
        long j11 = ((Duration) jr0Var.a("gads:load_timeout:milliseconds", new Duration(DurationKt.g(5, DurationUnit.f72047f)), u.a$1)).f72041a;
        b00.e eVar = new b00.e(jc1Var, (Continuation) null, 8);
        hc1Var.f4325a = jc1Var;
        hc1Var.f4329e = 2;
        objC = p2.c(j11, eVar, hc1Var);
        jc1Var2 = jc1Var;
        if (objC != coroutineSingletons) {
            a1Var = (b.a1) objC;
            if (!(a1Var instanceof xu0)) {
            }
        }
        return coroutineSingletons;
    }
}
