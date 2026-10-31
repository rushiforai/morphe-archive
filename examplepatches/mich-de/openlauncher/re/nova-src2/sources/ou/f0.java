package ou;

import com.stripe.android.model.PaymentMethod;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f0 extends h0 {

    /* renamed from: a, reason: collision with root package name */
    public final j f80861a;

    /* renamed from: c, reason: collision with root package name */
    public final PaymentMethod f80863c;

    /* renamed from: b, reason: collision with root package name */
    public final g0 f80862b = g0.f80873a;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f80864d = true;

    public f0(j jVar) {
        this.f80861a = jVar;
        this.f80863c = jVar.f80905b;
    }

    @Override // ou.h0
    public final g0 a() {
        return this.f80862b;
    }

    @Override // ou.h0
    public final boolean b() {
        return this.f80864d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof f0) && Intrinsics.b(this.f80861a, ((f0) obj).f80861a);
    }

    public final int hashCode() {
        return this.f80861a.hashCode();
    }

    public final String toString() {
        return "SavedPaymentMethod(displayableSavedPaymentMethod=" + this.f80861a + ")";
    }
}
