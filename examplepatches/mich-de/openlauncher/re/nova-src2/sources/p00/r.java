package p00;

import android.content.Context;
import com.instabridge.mobilesdk.ClaimedProvider;
import com.stripe.android.model.ConsumerPaymentDetails;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import p1.a0;
import p1.e1;
import p10.c0;

/* loaded from: classes4.dex */
public final /* synthetic */ class r implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81372a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f81373b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f81374c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f81375d;

    public /* synthetic */ r(Object obj, Object obj2, int i5, int i11) {
        this.f81372a = i11;
        this.f81374c = obj;
        this.f81375d = obj2;
        this.f81373b = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f81372a) {
            case 0:
                ((Integer) obj2).intValue();
                c0.h((String) this.f81374c, (q00.l) this.f81375d, (p1.o) obj, a0.l(this.f81373b | 1));
                break;
            case 1:
                ((Integer) obj2).intValue();
                t0.e.a((m3.g) this.f81374c, (List) this.f81375d, (p1.o) obj, a0.l(this.f81373b | 1));
                break;
            case 2:
                ((Integer) obj2).intValue();
                ph.a.h((Context) this.f81374c, (Function0) this.f81375d, (p1.o) obj, a0.l(this.f81373b | 1));
                break;
            case 3:
                ((Integer) obj2).intValue();
                p6.f.b((e1) this.f81374c, (Function0) this.f81375d, (p1.o) obj, a0.l(this.f81373b | 1));
                break;
            case 4:
                ((Integer) obj2).intValue();
                p3.i.a((ClaimedProvider) this.f81374c, (Function0) this.f81375d, (p1.o) obj, a0.l(this.f81373b | 1));
                break;
            case 5:
                ((Integer) obj2).getClass();
                ys.p.e((b2.t) this.f81374c, (ConsumerPaymentDetails.PaymentDetails) this.f81375d, (p1.o) obj, a0.l(this.f81373b | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                ys.p.a((b2.t) this.f81374c, (ConsumerPaymentDetails.BankAccount) this.f81375d, (p1.o) obj, a0.l(this.f81373b | 1));
                break;
        }
        return Unit.f71706a;
    }
}
