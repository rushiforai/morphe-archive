package ads_mobile_sdk;

import b.c0;
import b.c9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class q82 {

    /* renamed from: a, reason: collision with root package name */
    public final p82 f8517a;

    /* renamed from: b, reason: collision with root package name */
    public final ha2 f8518b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f8519c;

    /* renamed from: d, reason: collision with root package name */
    public final String f8520d;

    /* renamed from: e, reason: collision with root package name */
    public final String f8521e;

    public q82(p82 p82Var, ha2 ha2Var, boolean z11, String str, String str2) {
        this.f8517a = p82Var;
        this.f8518b = ha2Var;
        this.f8519c = z11;
        this.f8520d = str;
        this.f8521e = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q82)) {
            return false;
        }
        q82 q82Var = (q82) obj;
        return this.f8517a == q82Var.f8517a && this.f8518b == q82Var.f8518b && this.f8519c == q82Var.f8519c && Intrinsics.b(this.f8520d, q82Var.f8520d) && Intrinsics.b(this.f8521e, q82Var.f8521e);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = (this.f8518b.hashCode() + (this.f8517a.hashCode() * 31)) * 31;
        boolean z11 = this.f8519c;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return this.f8521e.hashCode() + c0.e((iHashCode + i5) * 31, 31, this.f8520d);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("OmidSettings(mediaType=");
        sb2.append(this.f8517a);
        sb2.append(", videoEventsOwner=");
        sb2.append(this.f8518b);
        sb2.append(", javascriptSessionServiceEnabled=");
        c9.s(", omidPartnerName=", this.f8520d, ", omidHtml=", sb2, this.f8519c);
        return c0.q(sb2, this.f8521e, ")");
    }
}
