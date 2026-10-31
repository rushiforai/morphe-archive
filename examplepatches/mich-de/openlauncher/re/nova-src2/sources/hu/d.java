package hu;

import b.c0;
import com.stripe.android.financialconnections.ElementsSessionContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d extends e {

    /* renamed from: a, reason: collision with root package name */
    public final String f60067a;

    /* renamed from: b, reason: collision with root package name */
    public final String f60068b;

    /* renamed from: c, reason: collision with root package name */
    public final String f60069c;

    /* renamed from: d, reason: collision with root package name */
    public final ElementsSessionContext f60070d;

    public d(String publishableKey, String financialConnectionsSessionSecret, String str, ElementsSessionContext elementsSessionContext) {
        Intrinsics.g(publishableKey, "publishableKey");
        Intrinsics.g(financialConnectionsSessionSecret, "financialConnectionsSessionSecret");
        this.f60067a = publishableKey;
        this.f60068b = financialConnectionsSessionSecret;
        this.f60069c = str;
        this.f60070d = elementsSessionContext;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Intrinsics.b(this.f60067a, dVar.f60067a) && Intrinsics.b(this.f60068b, dVar.f60068b) && Intrinsics.b(this.f60069c, dVar.f60069c) && Intrinsics.b(this.f60070d, dVar.f60070d);
    }

    public final int hashCode() {
        int iE = c0.e(this.f60067a.hashCode() * 31, 31, this.f60068b);
        String str = this.f60069c;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        ElementsSessionContext elementsSessionContext = this.f60070d;
        return iHashCode + (elementsSessionContext != null ? elementsSessionContext.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("OpenConnectionsFlow(publishableKey=", this.f60067a, ", financialConnectionsSessionSecret=", this.f60068b, ", stripeAccountId=");
        sbW.append(this.f60069c);
        sbW.append(", elementsSessionContext=");
        sbW.append(this.f60070d);
        sbW.append(")");
        return sbW.toString();
    }
}
