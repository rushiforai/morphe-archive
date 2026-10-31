package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class a3 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73011j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ String f73012k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a3(String str, int i5) {
        super(1);
        this.f73011j = i5;
        this.f73012k = str;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f73011j) {
            case 0:
                j3.b0 b0Var = (j3.b0) obj;
                j3.y.e(this.f73012k, b0Var);
                j3.y.j(b0Var, 5);
                return Unit.f71706a;
            default:
                ads_mobile_sdk.g1 manifest = (ads_mobile_sdk.g1) obj;
                Intrinsics.g(manifest, "manifest");
                b.r2 r2Var = (b.r2) manifest.n();
                Intrinsics.f(r2Var.e(), "getPoolsMap(...)");
                r2Var.b();
                ((ads_mobile_sdk.g1) r2Var.f1095b).s().clear();
                String value = this.f73012k;
                Intrinsics.g(value, "value");
                r2Var.b();
                ((ads_mobile_sdk.g1) r2Var.f1095b).b(value);
                return (ads_mobile_sdk.g1) r2Var.a();
        }
    }
}
