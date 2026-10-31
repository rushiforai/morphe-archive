package nv;

import com.stripe.android.shoppay.ShopPayActivity;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p1.o;
import p1.t;

/* loaded from: classes4.dex */
public final class c implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78590a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ShopPayActivity f78591b;

    public /* synthetic */ c(ShopPayActivity shopPayActivity, int i5) {
        this.f78590a = i5;
        this.f78591b = shopPayActivity;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0023  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0045  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f78590a;
        ShopPayActivity shopPayActivity = this.f78591b;
        switch (i5) {
            case 0:
                o oVar = (o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar = (t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        int i11 = ShopPayActivity.f45009s;
                        shopPayActivity.Y(oVar, 0);
                    }
                }
                break;
            default:
                o oVar2 = (o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar2 = (t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        int i12 = ShopPayActivity.f45009s;
                        shopPayActivity.W(oVar2, 0);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
