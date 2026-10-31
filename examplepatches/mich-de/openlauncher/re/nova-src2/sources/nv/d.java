package nv;

import com.stripe.android.shoppay.ShopPayActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class d extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f78592j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ ShopPayActivity f78593k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(ShopPayActivity shopPayActivity, int i5) {
        super(0);
        this.f78592j = i5;
        this.f78593k = shopPayActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f78592j) {
            case 0:
                return this.f78593k.getViewModelStore();
            default:
                return this.f78593k.getDefaultViewModelCreationExtras();
        }
    }
}
