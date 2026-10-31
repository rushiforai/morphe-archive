package e1;

import com.google.android.gms.internal.measurement.k2;
import kotlin.ULong;

/* loaded from: classes.dex */
public final class g1 {

    /* renamed from: a, reason: collision with root package name */
    public final long f51304a;

    /* renamed from: b, reason: collision with root package name */
    public final long f51305b;

    public g1(long j11, long j12) {
        this.f51304a = j11;
        this.f51305b = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g1)) {
            return false;
        }
        g1 g1Var = (g1) obj;
        long j11 = g1Var.f51304a;
        int i5 = i2.s.n;
        return ULong.a(this.f51304a, j11) && ULong.a(this.f51305b, g1Var.f51305b);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f51305b) + (Long.hashCode(this.f51304a) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SelectionColors(selectionHandleColor=");
        k2.v(this.f51304a, ", selectionBackgroundColor=", sb2);
        sb2.append((Object) i2.s.h(this.f51305b));
        sb2.append(')');
        return sb2.toString();
    }
}
