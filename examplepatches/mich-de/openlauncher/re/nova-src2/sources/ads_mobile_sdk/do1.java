package ads_mobile_sdk;

import android.view.View;
import eg.i;
import eg.x;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class do1 extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ko1 f2574a;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f2575j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ do1(ko1 ko1Var, int i5) {
        super(1);
        this.f2575j = i5;
        this.f2574a = ko1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Unit unit;
        Unit unit2;
        Unit unit3;
        Unit unit4;
        switch (this.f2575j) {
            case 0:
                i mediationAd = (i) obj;
                Intrinsics.g(mediationAd, "mediationAd");
                ko1 ko1Var = this.f2574a;
                synchronized (ko1Var) {
                    ko1Var.f5901f = mediationAd;
                    unit = Unit.f71706a;
                }
                return unit;
            case 1:
                View adView = (View) obj;
                Intrinsics.g(adView, "adView");
                ko1 ko1Var2 = this.f2574a;
                ko1Var2.getClass();
                ko1Var2.f5897b = adView;
                return Unit.f71706a;
            case 2:
                eg.p mediationAd2 = (eg.p) obj;
                Intrinsics.g(mediationAd2, "mediationAd");
                ko1 ko1Var3 = this.f2574a;
                synchronized (ko1Var3) {
                    ko1Var3.f5899d = mediationAd2;
                    unit2 = Unit.f71706a;
                }
                return unit2;
            case 3:
                x nativeAdMapper = (x) obj;
                Intrinsics.g(nativeAdMapper, "nativeAdMapper");
                ko1 ko1Var4 = this.f2574a;
                ju1 ju1Var = new ju1(nativeAdMapper);
                ko1Var4.getClass();
                ko1Var4.f5898c = ju1Var;
                return Unit.f71706a;
            case 4:
                eg.z unifiedNativeAdMapper = (eg.z) obj;
                Intrinsics.g(unifiedNativeAdMapper, "unifiedNativeAdMapper");
                ko1 ko1Var5 = this.f2574a;
                ju1 ju1Var2 = new ju1(unifiedNativeAdMapper);
                ko1Var5.getClass();
                ko1Var5.f5898c = ju1Var2;
                return Unit.f71706a;
            case 5:
                eg.u mediationAd3 = (eg.u) obj;
                Intrinsics.g(mediationAd3, "mediationAd");
                ko1 ko1Var6 = this.f2574a;
                synchronized (ko1Var6) {
                    ko1Var6.f5900e = mediationAd3;
                    unit3 = Unit.f71706a;
                }
                return unit3;
            default:
                eg.u mediationAd4 = (eg.u) obj;
                Intrinsics.g(mediationAd4, "mediationAd");
                ko1 ko1Var7 = this.f2574a;
                synchronized (ko1Var7) {
                    ko1Var7.f5900e = mediationAd4;
                    unit4 = Unit.f71706a;
                }
                return unit4;
        }
    }
}
