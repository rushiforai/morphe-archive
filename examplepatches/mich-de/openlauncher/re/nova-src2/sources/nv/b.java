package nv;

import com.stripe.android.shoppay.ShopPayActivity;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p1.a0;
import p1.o;

/* loaded from: classes4.dex */
public final /* synthetic */ class b implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78588a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ShopPayActivity f78589b;

    public /* synthetic */ b(ShopPayActivity shopPayActivity, int i5, int i11) {
        this.f78588a = i11;
        this.f78589b = shopPayActivity;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f78588a;
        ShopPayActivity shopPayActivity = this.f78589b;
        o oVar = (o) obj;
        ((Integer) obj2).getClass();
        int i11 = ShopPayActivity.f45009s;
        switch (i5) {
            case 0:
                shopPayActivity.W(oVar, a0.l(1));
                break;
            default:
                shopPayActivity.Y(oVar, a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
