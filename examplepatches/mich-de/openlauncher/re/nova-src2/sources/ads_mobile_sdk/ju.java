package ads_mobile_sdk;

import b.c0;
import b.k9;

/* loaded from: classes.dex */
public final class ju {

    /* renamed from: a, reason: collision with root package name */
    public final int f5394a;

    /* renamed from: b, reason: collision with root package name */
    public final int f5395b;

    /* renamed from: c, reason: collision with root package name */
    public final int f5396c;

    public ju(int i5, int i11, int i12) {
        this.f5394a = i5;
        this.f5395b = i11;
        this.f5396c = i12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ju)) {
            return false;
        }
        ju juVar = (ju) obj;
        return this.f5394a == juVar.f5394a && this.f5395b == juVar.f5395b && this.f5396c == juVar.f5396c;
    }

    public final int hashCode() {
        return Integer.hashCode(50) + k9.b(this.f5396c, k9.b(0, k9.b(this.f5395b, Integer.hashCode(this.f5394a) * 31)));
    }

    public final String toString() {
        return c0.o(c0.t(this.f5394a, "CloseButtonConfig(paddingLeft=", ", paddingRight=", this.f5395b, ", paddingTop=0, paddingBottom="), this.f5396c, ", size=50)");
    }
}
