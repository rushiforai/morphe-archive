package ct;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.Address;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.StripeIntent;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public abstract class i {

    /* renamed from: a, reason: collision with root package name */
    public static final g f47854a;

    /* renamed from: b, reason: collision with root package name */
    public static final d f47855b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f47856c;

    /* renamed from: d, reason: collision with root package name */
    public static final h f47857d;

    /* renamed from: e, reason: collision with root package name */
    public static final b f47858e;

    /* renamed from: f, reason: collision with root package name */
    public static final c f47859f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ i[] f47860g;

    static {
        i iVar = new i() { // from class: ct.f
            @Override // ct.i
            public final boolean a(PaymentMethodMetadata paymentMethodMetadata, String code) {
                Intrinsics.g(code, "code");
                return false;
            }
        };
        g gVar = new g();
        f47854a = gVar;
        i iVar2 = new i() { // from class: ct.e
            @Override // ct.i
            public final boolean a(PaymentMethodMetadata paymentMethodMetadata, String code) {
                Intrinsics.g(code, "code");
                if (paymentMethodMetadata.f43095d) {
                    return true;
                }
                StripeIntent stripeIntent = paymentMethodMetadata.f43092a;
                PaymentIntent paymentIntent = stripeIntent instanceof PaymentIntent ? (PaymentIntent) stripeIntent : null;
                PaymentIntent.Shipping shipping = paymentIntent != null ? paymentIntent.f43550t : null;
                if ((shipping != null ? shipping.f43566c : null) == null) {
                    return false;
                }
                Address address = shipping.f43564a;
                return (address.f43129c == null || address.f43128b == null || address.f43131e == null) ? false : true;
            }
        };
        d dVar = new d();
        f47855b = dVar;
        a aVar = new a();
        f47856c = aVar;
        h hVar = new h();
        f47857d = hVar;
        b bVar = new b();
        f47858e = bVar;
        c cVar = new c();
        f47859f = cVar;
        i[] iVarArr = {iVar, gVar, iVar2, dVar, aVar, hVar, bVar, cVar};
        f47860g = iVarArr;
        EnumEntriesKt.a(iVarArr);
    }

    public static i valueOf(String str) {
        return (i) Enum.valueOf(i.class, str);
    }

    public static i[] values() {
        return (i[]) f47860g.clone();
    }

    public abstract boolean a(PaymentMethodMetadata paymentMethodMetadata, String str);
}
