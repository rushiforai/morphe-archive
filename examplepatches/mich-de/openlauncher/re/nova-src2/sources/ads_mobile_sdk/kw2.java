package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class kw2 implements b.va {

    /* renamed from: a, reason: collision with root package name */
    public final iw2 f6004a;

    /* renamed from: b, reason: collision with root package name */
    public final ni.q f6005b;

    /* renamed from: c, reason: collision with root package name */
    public final qw2 f6006c;

    public kw2(iw2 requestThrottlerV2, ni.q baseRequest, qw2 requestType) {
        Intrinsics.g(requestThrottlerV2, "requestThrottlerV2");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(requestType, "requestType");
        this.f6004a = requestThrottlerV2;
        this.f6005b = baseRequest;
        this.f6006c = requestType;
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0072, code lost:
    
        if (ads_mobile_sdk.iw2.c(r7, r4, r2, r0) == r1) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.va
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object q(Continuation continuation) {
        jw2 jw2Var;
        kw2 kw2Var;
        if (continuation instanceof jw2) {
            jw2Var = (jw2) continuation;
            int i5 = jw2Var.f5429d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jw2Var.f5429d = i5 - Integer.MIN_VALUE;
            } else {
                jw2Var = new jw2(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = jw2Var.f5427b;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = jw2Var.f5429d;
        if (i11 == 0) {
            ResultKt.b(objA);
            String strL = this.f6005b.l();
            jw2Var.f5426a = this;
            jw2Var.f5429d = 1;
            iw2 iw2Var = this.f6004a;
            iw2Var.getClass();
            objA = iw2.a(iw2Var, strL, this.f6006c, jw2Var);
            if (objA != obj) {
                kw2Var = this;
            }
            return obj;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            return Unit.f71706a;
        }
        kw2Var = jw2Var.f5426a;
        ResultKt.b(objA);
        if (((im0) objA) != im0.f4869f) {
            return Unit.f71706a;
        }
        iw2 iw2Var2 = kw2Var.f6004a;
        String strL2 = kw2Var.f6005b.l();
        qw2 qw2Var = kw2Var.f6006c;
        jw2Var.f5426a = null;
        jw2Var.f5429d = 2;
        iw2Var2.getClass();
    }
}
