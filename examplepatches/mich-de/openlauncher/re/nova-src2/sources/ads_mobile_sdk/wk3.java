package ads_mobile_sdk;

import b.p5;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class wk3 implements b.r {

    /* renamed from: a, reason: collision with root package name */
    public static final wk3 f11316a = new wk3(0);
    public static final wk3 a$1 = new wk3(1);

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f11317b;

    public /* synthetic */ wk3(int i5) {
        this.f11317b = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(p5 p5Var, ContinuationImpl continuationImpl) {
        vk3 vk3Var;
        yk3 yk3Var;
        switch (this.f11317b) {
            case 0:
                if (continuationImpl instanceof vk3) {
                    vk3Var = (vk3) continuationImpl;
                    int i5 = vk3Var.f10813c;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        vk3Var.f10813c = i5 - Integer.MIN_VALUE;
                    } else {
                        vk3Var = new vk3(this, continuationImpl);
                    }
                }
                Object obj = vk3Var.f10811a;
                Object obj2 = CoroutineSingletons.f71806a;
                int i11 = vk3Var.f10813c;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    Function2 z4Var = new e00.z4(2, null, 2);
                    vk3Var.f10813c = 1;
                    if (p5Var.a(z4Var, vk3Var) == obj2) {
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
                if (continuationImpl instanceof yk3) {
                    yk3Var = (yk3) continuationImpl;
                    int i12 = yk3Var.f12186c;
                    if ((i12 & Integer.MIN_VALUE) != 0) {
                        yk3Var.f12186c = i12 - Integer.MIN_VALUE;
                    } else {
                        yk3Var = new yk3(this, continuationImpl);
                    }
                }
                Object obj3 = yk3Var.f12184a;
                Object obj4 = CoroutineSingletons.f71806a;
                int i13 = yk3Var.f12186c;
                if (i13 == 0) {
                    ResultKt.b(obj3);
                    Function2 z4Var2 = new e00.z4(2, null, 3);
                    yk3Var.f12186c = 1;
                    if (p5Var.a(z4Var2, yk3Var) == obj4) {
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
    public final Object a(Object obj, pk1 pk1Var) {
        switch (this.f11317b) {
            case 0:
                break;
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            default:
                break;
        }
        return Unit.f71706a;
    }
}
