package ads_mobile_sdk;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class a03 extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ b03 f793a;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f794j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a03(b03 b03Var, int i5) {
        super(1);
        this.f794j = i5;
        this.f793a = b03Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f794j) {
            case 0:
                eg.u mediationAd = (eg.u) obj;
                Intrinsics.g(mediationAd, "mediationAd");
                b03 b03Var = this.f793a;
                b03Var.getClass();
                b03Var.f1219f = mediationAd;
                break;
            default:
                eg.z unifiedNativeAdMapper = (eg.z) obj;
                Intrinsics.g(unifiedNativeAdMapper, "unifiedNativeAdMapper");
                ju1 ju1Var = new ju1(unifiedNativeAdMapper);
                b03 b03Var2 = this.f793a;
                b03Var2.getClass();
                b03Var2.f1217d = ju1Var;
                break;
        }
        return Unit.f71706a;
    }
}
