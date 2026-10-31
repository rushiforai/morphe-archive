package ads_mobile_sdk;

import b.p5;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import xk.w2;

/* loaded from: classes2.dex */
public final class hh2 implements b.r {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ w2 f4386a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f4387b;

    public /* synthetic */ hh2(w2 w2Var, int i5) {
        this.f4387b = i5;
        this.f4386a = w2Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(p5 p5Var, ContinuationImpl continuationImpl) {
        kh2 kh2Var;
        if (continuationImpl instanceof kh2) {
            kh2Var = (kh2) continuationImpl;
            int i5 = kh2Var.f5741c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kh2Var.f5741c = i5 - Integer.MIN_VALUE;
            } else {
                kh2Var = new kh2(this, continuationImpl);
            }
        }
        Object obj = kh2Var.f5739a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kh2Var.f5741c;
        if (i11 == 0) {
            ResultKt.b(obj);
            dz1 dz1Var = new dz1(this.f4386a);
            kh2Var.f5741c = 1;
            if (dz1Var.a((b.u7) p5Var, (ContinuationImpl) kh2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(b.u7 u7Var, ContinuationImpl continuationImpl) {
        gh2 gh2Var;
        if (continuationImpl instanceof gh2) {
            gh2Var = (gh2) continuationImpl;
            int i5 = gh2Var.f3852c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gh2Var.f3852c = i5 - Integer.MIN_VALUE;
            } else {
                gh2Var = new gh2(this, continuationImpl);
            }
        }
        Object obj = gh2Var.f3850a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gh2Var.f3852c;
        if (i11 == 0) {
            ResultKt.b(obj);
            dz1 dz1Var = new dz1(this.f4386a);
            gh2Var.f3852c = 1;
            if (dz1Var.a(u7Var, gh2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }

    @Override // b.r
    public final /* bridge */ /* synthetic */ Object a(Object obj, pk1 pk1Var) {
        switch (this.f4387b) {
            case 0:
                return a((b.u7) obj, (ContinuationImpl) pk1Var);
            default:
                return a((p5) obj, (ContinuationImpl) pk1Var);
        }
    }
}
