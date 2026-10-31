package hv;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final List f60101a;

    /* renamed from: b, reason: collision with root package name */
    public final float f60102b;

    /* renamed from: c, reason: collision with root package name */
    public final float f60103c;

    public a(List paymentMethodCodes, float f11, float f12) {
        float f13 = v1.f60630a;
        Intrinsics.g(paymentMethodCodes, "paymentMethodCodes");
        this.f60101a = paymentMethodCodes;
        this.f60102b = f11;
        this.f60103c = f12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        if (!Intrinsics.b(this.f60101a, aVar.f60101a) || !y3.f.a(this.f60102b, aVar.f60102b) || !y3.f.a(this.f60103c, aVar.f60103c)) {
            return false;
        }
        float f11 = v1.f60630a;
        return y3.f.a(f11, f11);
    }

    public final int hashCode() {
        return Float.hashCode(v1.f60630a) + a80.m.d(this.f60103c, a80.m.d(this.f60102b, this.f60101a.hashCode() * 31, 31), 31);
    }

    public final String toString() {
        String strB = y3.f.b(this.f60102b);
        String strB2 = y3.f.b(this.f60103c);
        String strB3 = y3.f.b(v1.f60630a);
        StringBuilder sb2 = new StringBuilder("AddPaymentMethodInitialVisibilityTrackerData(paymentMethodCodes=");
        sb2.append(this.f60101a);
        sb2.append(", tabWidth=");
        sb2.append(strB);
        sb2.append(", screenWidth=");
        return b.c0.s(sb2, strB2, ", innerPadding=", strB3, ")");
    }
}
