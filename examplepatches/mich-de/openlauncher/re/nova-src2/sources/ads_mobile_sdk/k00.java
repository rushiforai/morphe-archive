package ads_mobile_sdk;

import ar.d;
import b.p5;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class k00 implements b.r {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object f5459a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f5460b;

    public /* synthetic */ k00(Object obj, int i5) {
        this.f5460b = i5;
        this.f5459a = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(p5 p5Var, ContinuationImpl continuationImpl) {
        j00 j00Var;
        n00 n00Var;
        u00 u00Var;
        switch (this.f5460b) {
            case 0:
                if (continuationImpl instanceof j00) {
                    j00Var = (j00) continuationImpl;
                    int i5 = j00Var.f5073c;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        j00Var.f5073c = i5 - Integer.MIN_VALUE;
                    } else {
                        j00Var = new j00(this, continuationImpl);
                    }
                }
                Object obj = j00Var.f5071a;
                Object obj2 = CoroutineSingletons.f71806a;
                int i11 = j00Var.f5073c;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    Function2 u2Var = new u2((y2) this.f5459a, null, 1);
                    j00Var.f5073c = 1;
                    if (p5Var.a(u2Var, j00Var) == obj2) {
                        return obj2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 1:
                if (continuationImpl instanceof n00) {
                    n00Var = (n00) continuationImpl;
                    int i12 = n00Var.f7388c;
                    if ((i12 & Integer.MIN_VALUE) != 0) {
                        n00Var.f7388c = i12 - Integer.MIN_VALUE;
                    } else {
                        n00Var = new n00(this, continuationImpl);
                    }
                }
                Object obj3 = n00Var.f7386a;
                Object obj4 = CoroutineSingletons.f71806a;
                int i13 = n00Var.f7388c;
                if (i13 == 0) {
                    ResultKt.b(obj3);
                    Function2 dVar = new d((hr1) this.f5459a, (Continuation) null, 6);
                    n00Var.f7388c = 1;
                    if (p5Var.a(dVar, n00Var) == obj4) {
                        return obj4;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj3);
                }
                return Unit.f71706a;
            default:
                if (continuationImpl instanceof u00) {
                    u00Var = (u00) continuationImpl;
                    int i14 = u00Var.f10161c;
                    if ((i14 & Integer.MIN_VALUE) != 0) {
                        u00Var.f10161c = i14 - Integer.MIN_VALUE;
                    } else {
                        u00Var = new u00(this, continuationImpl);
                    }
                }
                Object obj5 = u00Var.f10159a;
                Object obj6 = CoroutineSingletons.f71806a;
                int i15 = u00Var.f10161c;
                if (i15 == 0) {
                    ResultKt.b(obj5);
                    Function2 dVar2 = new d((zs3) this.f5459a, (Continuation) null, 10);
                    u00Var.f10161c = 1;
                    if (p5Var.a(dVar2, u00Var) == obj6) {
                        return obj6;
                    }
                } else {
                    if (i15 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj5);
                }
                return Unit.f71706a;
        }
    }

    @Override // b.r
    public final /* bridge */ /* synthetic */ Object a(Object obj, pk1 pk1Var) {
        switch (this.f5460b) {
        }
        return a((p5) obj, (ContinuationImpl) pk1Var);
    }
}
