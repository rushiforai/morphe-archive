package b;

import ads_mobile_sdk.ai1;
import ads_mobile_sdk.b03;
import ads_mobile_sdk.ey2;
import ads_mobile_sdk.fh;
import ads_mobile_sdk.i61;
import ads_mobile_sdk.iz2;
import ads_mobile_sdk.ko1;
import ads_mobile_sdk.ui1;
import ads_mobile_sdk.xh;
import android.content.Context;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class p implements xb {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15971a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i61 f15972b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ s0 f15973c;

    public /* synthetic */ p(i61 i61Var, s0 s0Var, int i5) {
        this.f15971a = i5;
        this.f15972b = i61Var;
        this.f15973c = s0Var;
    }

    @Override // b.xb
    public final void a() {
        switch (this.f15971a) {
            case 0:
                ko1 adapter = (ko1) this.f15972b;
                ai1 this$0 = (ai1) this.f15973c;
                Intrinsics.g(adapter, "$adapter");
                Intrinsics.g(this$0, "this$0");
                Context context = this$0.f994d.b();
                if (context == null) {
                    context = this$0.f993c;
                }
                Intrinsics.g(context, "context");
                eg.p pVar = adapter.f5899d;
                if (pVar != null) {
                    pVar.showAd(context);
                    return;
                } else {
                    Intrinsics.m("interstitialAd");
                    throw null;
                }
            case 1:
                ko1 adapter2 = (ko1) this.f15972b;
                ey2 this$02 = (ey2) this.f15973c;
                Intrinsics.g(adapter2, "$adapter");
                Intrinsics.g(this$02, "this$0");
                Context context2 = this$02.f3110e.b();
                if (context2 == null) {
                    context2 = this$02.f3109d;
                }
                Intrinsics.g(context2, "context");
                eg.u uVar = adapter2.f5900e;
                if (uVar != null) {
                    uVar.showAd(context2);
                    return;
                } else {
                    Intrinsics.m("rewardedAd");
                    throw null;
                }
            case 2:
                ko1 adapter3 = (ko1) this.f15972b;
                fh this$03 = (fh) this.f15973c;
                Intrinsics.g(adapter3, "$adapter");
                Intrinsics.g(this$03, "this$0");
                Context context3 = this$03.f3348d.b();
                if (context3 == null) {
                    context3 = this$03.f3347c;
                }
                Intrinsics.g(context3, "context");
                eg.i iVar = adapter3.f5901f;
                if (iVar != null) {
                    iVar.showAd(context3);
                    return;
                } else {
                    Intrinsics.m("appOpenAd");
                    throw null;
                }
            case 3:
                b03 adapter4 = (b03) this.f15972b;
                iz2 this$04 = (iz2) this.f15973c;
                Intrinsics.g(adapter4, "$adapter");
                Intrinsics.g(this$04, "this$0");
                Context context4 = this$04.f5065e.b();
                if (context4 == null) {
                    context4 = this$04.f5064d;
                }
                Intrinsics.g(context4, "context");
                synchronized (adapter4) {
                    eg.u uVar2 = adapter4.f1219f;
                    if (uVar2 == null) {
                        Intrinsics.m("rewardedAd");
                        throw null;
                    }
                    uVar2.showAd(context4);
                    Unit unit = Unit.f71706a;
                }
                return;
            case 4:
                b03 adapter5 = (b03) this.f15972b;
                ui1 this$05 = (ui1) this.f15973c;
                Intrinsics.g(adapter5, "$adapter");
                Intrinsics.g(this$05, "this$0");
                Context context5 = this$05.f10343d.b();
                if (context5 == null) {
                    context5 = this$05.f10342c;
                }
                Intrinsics.g(context5, "context");
                synchronized (adapter5) {
                    eg.p pVar2 = adapter5.f1218e;
                    if (pVar2 == null) {
                        Intrinsics.m("interstitialAd");
                        throw null;
                    }
                    pVar2.showAd(context5);
                    Unit unit2 = Unit.f71706a;
                }
                return;
            default:
                b03 adapter6 = (b03) this.f15972b;
                xh this$06 = (xh) this.f15973c;
                Intrinsics.g(adapter6, "$adapter");
                Intrinsics.g(this$06, "this$0");
                Context context6 = this$06.f11723d.b();
                if (context6 == null) {
                    context6 = this$06.f11722c;
                }
                Intrinsics.g(context6, "context");
                synchronized (adapter6) {
                    eg.i iVar2 = adapter6.f1220g;
                    if (iVar2 == null) {
                        Intrinsics.m("appOpenAd");
                        throw null;
                    }
                    iVar2.showAd(context6);
                    Unit unit3 = Unit.f71706a;
                }
                return;
        }
    }
}
