package dt;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.PaymentMethod;
import java.util.Set;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h implements ct.j {

    /* renamed from: a, reason: collision with root package name */
    public static final h f49448a = new h();

    /* renamed from: b, reason: collision with root package name */
    public static final PaymentMethod.Type f49449b = PaymentMethod.Type.G;

    @Override // ct.j
    public final Set a(boolean z11) {
        return EmptySet.f71734a;
    }

    @Override // ct.j
    public final ct.u b() {
        return i.f49452a;
    }

    @Override // ct.j
    public final boolean c(PaymentMethodMetadata metadata) {
        Intrinsics.g(metadata, "metadata");
        PaymentMethod.Type type = f49449b;
        return metadata.m(type.f43655a) && metadata.C(type);
    }

    @Override // ct.j
    public final boolean d() {
        return false;
    }

    @Override // ct.j
    public final PaymentMethod.Type getType() {
        return f49449b;
    }
}
