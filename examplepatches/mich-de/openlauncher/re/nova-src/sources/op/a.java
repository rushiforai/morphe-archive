package op;

import h6.c1;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public int f80548a;

    /* renamed from: b, reason: collision with root package name */
    public int f80549b;

    public /* synthetic */ a() {
        this(1, 0);
    }

    public final int a() {
        return this.f80549b;
    }

    public final int b() {
        return this.f80548a;
    }

    public final void c(int i5) {
        this.f80549b = i5;
    }

    public final void d(int i5) {
        this.f80548a = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f80548a == aVar.f80548a && this.f80549b == aVar.f80549b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f80549b) + (Integer.hashCode(this.f80548a) * 31);
    }

    public final String toString() {
        return c1.n(this.f80548a, "ClickCounter(overallClicks=", ", clicksWhenFirst=", this.f80549b, ")");
    }

    public a(int i5, int i11) {
        this.f80548a = i5;
        this.f80549b = i11;
    }
}
