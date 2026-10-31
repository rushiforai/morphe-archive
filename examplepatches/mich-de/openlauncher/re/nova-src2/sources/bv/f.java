package bv;

import com.stripe.android.paymentsheet.model.PaymentSelection;
import cv.r;
import cv.s;
import f1.w1;
import jr.q;
import jr.v;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18627a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f18628b;

    public /* synthetic */ f(Function1 function1) {
        this.f18627a = 8;
        w1 w1Var = w1.f54065a;
        this.f18628b = function1;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f18627a) {
            case 0:
                this.f18628b.invoke(j.f18633a);
                break;
            case 1:
                this.f18628b.invoke(k.f18634a);
                break;
            case 2:
                this.f18628b.invoke(r.f48036a);
                break;
            case 3:
                this.f18628b.invoke(s.f48037a);
                break;
            case 4:
                this.f18628b.invoke(Boolean.TRUE);
                break;
            case 5:
                this.f18628b.invoke(Boolean.FALSE);
                break;
            case 6:
                this.f18628b.invoke(Boolean.FALSE);
                break;
            case 7:
                this.f18628b.invoke(Boolean.TRUE);
                break;
            case 8:
                break;
            case 9:
                this.f18628b.invoke(Boolean.TRUE);
                break;
            case 10:
                this.f18628b.invoke(Boolean.FALSE);
                break;
            case 11:
                this.f18628b.invoke(new PaymentSelection.Link(null, null, null, 7));
                break;
            case 12:
                this.f18628b.invoke(PaymentSelection.GooglePay.f44810a);
                break;
            case 13:
                this.f18628b.invoke(Boolean.FALSE);
                break;
            case 14:
                this.f18628b.invoke(Boolean.TRUE);
                break;
            case 15:
                this.f18628b.invoke(v.f69744a);
                break;
            case 16:
                this.f18628b.invoke(jr.p.f69723a);
                break;
            case 17:
                this.f18628b.invoke(jr.l.f69685a);
                break;
            case 18:
                this.f18628b.invoke(v.f69744a);
                break;
            case 19:
                this.f18628b.invoke(jr.g.f69663a);
                break;
            case 20:
                this.f18628b.invoke(q.f69726a);
                break;
            case 21:
                this.f18628b.invoke(jr.j.f69676a);
                break;
            case 22:
                this.f18628b.invoke(Boolean.TRUE);
                break;
            default:
                this.f18628b.invoke(Boolean.FALSE);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ f(Function1 function1, int i5) {
        this.f18627a = i5;
        this.f18628b = function1;
    }
}
