package ps;

import com.stripe.android.link.ui.wallet.DefaultPaymentUI;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class o implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f82944a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ DefaultPaymentUI f82945b;

    public /* synthetic */ o(DefaultPaymentUI defaultPaymentUI, int i5, int i11) {
        this.f82944a = i11;
        switch (i11) {
            case 1:
                break;
            default:
                ou.o0 o0Var = ou.o0.f80946a;
                break;
        }
        this.f82945b = defaultPaymentUI;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f82944a;
        DefaultPaymentUI defaultPaymentUI = this.f82945b;
        switch (i5) {
            case 0:
                ou.o0 o0Var = ou.o0.f80946a;
                ((Integer) obj2).getClass();
                r.e(defaultPaymentUI, (p1.o) obj, p1.a0.l(1));
                break;
            default:
                ((Integer) obj2).getClass();
                r.f(defaultPaymentUI, (p1.o) obj, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
