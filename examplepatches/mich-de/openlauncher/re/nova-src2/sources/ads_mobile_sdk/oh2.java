package ads_mobile_sdk;

import b.p5;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class oh2 implements b.r {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ z03 f7930a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f7931b;

    public /* synthetic */ oh2(z03 z03Var, int i5) {
        this.f7931b = i5;
        this.f7930a = z03Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(p5 p5Var, ContinuationImpl continuationImpl) {
        nh2 nh2Var;
        q00 q00Var;
        switch (this.f7931b) {
            case 0:
                if (continuationImpl instanceof nh2) {
                    nh2Var = (nh2) continuationImpl;
                    int i5 = nh2Var.f7563c;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        nh2Var.f7563c = i5 - Integer.MIN_VALUE;
                    } else {
                        nh2Var = new nh2(this, continuationImpl);
                    }
                }
                Object obj = nh2Var.f7561a;
                Object obj2 = CoroutineSingletons.f71806a;
                int i11 = nh2Var.f7563c;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    Function2 mh2Var = new mh2(this.f7930a, null, 0);
                    nh2Var.f7563c = 1;
                    if (p5Var.a(mh2Var, nh2Var) == obj2) {
                        return obj2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                if (continuationImpl instanceof q00) {
                    q00Var = (q00) continuationImpl;
                    int i12 = q00Var.f8438c;
                    if ((i12 & Integer.MIN_VALUE) != 0) {
                        q00Var.f8438c = i12 - Integer.MIN_VALUE;
                    } else {
                        q00Var = new q00(this, continuationImpl);
                    }
                }
                Object obj3 = q00Var.f8436a;
                Object obj4 = CoroutineSingletons.f71806a;
                int i13 = q00Var.f8438c;
                if (i13 == 0) {
                    ResultKt.b(obj3);
                    Function2 mh2Var2 = new mh2(this.f7930a, null, 1);
                    q00Var.f8438c = 1;
                    if (p5Var.a(mh2Var2, q00Var) == obj4) {
                        return obj4;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj3);
                }
                return Unit.f71706a;
        }
    }

    @Override // b.r
    public final /* bridge */ /* synthetic */ Object a(Object obj, pk1 pk1Var) {
        switch (this.f7931b) {
        }
        return a((p5) obj, (ContinuationImpl) pk1Var);
    }
}
