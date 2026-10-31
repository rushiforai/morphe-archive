package ads_mobile_sdk;

import b.b9;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class nq3 implements b.va {

    /* renamed from: a, reason: collision with root package name */
    public final tx0 f7635a;

    /* renamed from: b, reason: collision with root package name */
    public final b9 f7636b;

    public nq3(tx0 gmaWebView, b9 omidMonitor) {
        Intrinsics.g(gmaWebView, "gmaWebView");
        Intrinsics.g(omidMonitor, "omidMonitor");
        this.f7635a = gmaWebView;
        this.f7636b = omidMonitor;
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0065, code lost:
    
        if (r7.a(r0) == r1) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0075, code lost:
    
        if (r7.a(r0) == r1) goto L31;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.va
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Continuation continuation) {
        mq3 mq3Var;
        nq3 nq3Var;
        if (continuation instanceof mq3) {
            mq3Var = (mq3) continuation;
            int i5 = mq3Var.f7318d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mq3Var.f7318d = i5 - Integer.MIN_VALUE;
            } else {
                mq3Var = new mq3(this, (ContinuationImpl) continuation);
            }
        }
        Object objL = mq3Var.f7316b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mq3Var.f7318d;
        if (i11 == 0) {
            ResultKt.b(objL);
            mq3Var.f7315a = this;
            mq3Var.f7318d = 1;
            objL = this.f7636b.l(mq3Var);
            if (objL != coroutineSingletons) {
                nq3Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 == 2) {
                ResultKt.b(objL);
                return Unit.f71706a;
            }
            if (i11 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objL);
            return Unit.f71706a;
        }
        nq3Var = mq3Var.f7315a;
        ResultKt.b(objL);
        if (((Boolean) objL).booleanValue()) {
            b9 b9Var = nq3Var.f7636b;
            mq3Var.f7315a = null;
            mq3Var.f7318d = 2;
        } else {
            tx0 tx0Var = nq3Var.f7635a;
            mq3Var.f7315a = null;
            mq3Var.f7318d = 3;
        }
        return coroutineSingletons;
    }
}
