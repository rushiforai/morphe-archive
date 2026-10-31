package ads_mobile_sdk;

import android.view.View;
import eg.i;
import eg.x;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class uz2 extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ b03 f10528a;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f10529j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uz2(b03 b03Var, int i5) {
        super(1);
        this.f10529j = i5;
        this.f10528a = b03Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f10529j) {
            case 0:
                i mediationAd = (i) obj;
                Intrinsics.g(mediationAd, "mediationAd");
                b03 b03Var = this.f10528a;
                b03Var.getClass();
                b03Var.f1220g = mediationAd;
                break;
            case 1:
                View adView = (View) obj;
                Intrinsics.g(adView, "adView");
                b03 b03Var2 = this.f10528a;
                b03Var2.getClass();
                b03Var2.f1216c = adView;
                break;
            case 2:
                eg.p mediationAd2 = (eg.p) obj;
                Intrinsics.g(mediationAd2, "mediationAd");
                b03 b03Var3 = this.f10528a;
                b03Var3.getClass();
                b03Var3.f1218e = mediationAd2;
                break;
            case 3:
                x nativeAdMapper = (x) obj;
                Intrinsics.g(nativeAdMapper, "nativeAdMapper");
                ju1 ju1Var = new ju1(nativeAdMapper);
                b03 b03Var4 = this.f10528a;
                b03Var4.getClass();
                b03Var4.f1217d = ju1Var;
                break;
            default:
                eg.u mediationAd3 = (eg.u) obj;
                Intrinsics.g(mediationAd3, "mediationAd");
                b03 b03Var5 = this.f10528a;
                b03Var5.getClass();
                b03Var5.f1219f = mediationAd3;
                break;
        }
        return Unit.f71706a;
    }
}
