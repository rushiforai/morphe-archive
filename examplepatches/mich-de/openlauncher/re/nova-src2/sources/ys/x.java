package ys;

import com.stripe.android.model.ConsumerPaymentDetails;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class x implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f97604a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f97605b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f97606c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ float f97607d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function0 f97608e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f97609f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f97610g;

    public /* synthetic */ x(ConsumerPaymentDetails.PaymentDetails paymentDetails, boolean z11, String str, float f11, Function0 function0, int i5) {
        this.f97610g = paymentDetails;
        this.f97605b = z11;
        this.f97606c = str;
        this.f97607d = f11;
        this.f97608e = function0;
        this.f97609f = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f97604a) {
            case 0:
                ((Integer) obj2).intValue();
                s0.f(this.f97606c, (String) this.f97610g, this.f97607d, this.f97605b, this.f97608e, (p1.o) obj, p1.a0.l(this.f97609f | 1));
                break;
            default:
                ((Integer) obj2).intValue();
                s0.e((ConsumerPaymentDetails.PaymentDetails) this.f97610g, this.f97605b, this.f97606c, this.f97607d, this.f97608e, (p1.o) obj, p1.a0.l(this.f97609f | 1));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ x(String str, String str2, float f11, boolean z11, Function0 function0, int i5) {
        this.f97606c = str;
        this.f97610g = str2;
        this.f97607d = f11;
        this.f97605b = z11;
        this.f97608e = function0;
        this.f97609f = i5;
    }
}
