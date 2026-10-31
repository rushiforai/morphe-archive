package ads_mobile_sdk;

import b.p5;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes.dex */
public final class tn0 implements b.r {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object f10016a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f10017b;

    public /* synthetic */ tn0(Object obj, int i5) {
        this.f10017b = i5;
        this.f10016a = obj;
    }

    @Override // b.r
    public final Object a(Object obj, pk1 pk1Var) {
        switch (this.f10017b) {
            case 0:
                Object objA = ((p5) obj).a(new mx.e((b.c7) this.f10016a, null, 8), pk1Var);
                if (objA != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
            default:
                Object objA2 = ((p5) obj).a(new mx.e((hv) this.f10016a, null, 12), pk1Var);
                if (objA2 != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
        }
        return Unit.f71706a;
    }
}
