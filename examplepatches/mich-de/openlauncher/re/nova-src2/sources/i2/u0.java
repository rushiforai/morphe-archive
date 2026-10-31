package i2;

import b.c9;
import com.google.android.gms.internal.measurement.k2;
import kotlin.ULong;

/* loaded from: classes.dex */
public final class u0 {

    /* renamed from: d, reason: collision with root package name */
    public static final u0 f61170d = new u0();

    /* renamed from: a, reason: collision with root package name */
    public final long f61171a;

    /* renamed from: b, reason: collision with root package name */
    public final long f61172b;

    /* renamed from: c, reason: collision with root package name */
    public final float f61173c;

    public u0(float f11, long j11, long j12) {
        this.f61171a = j11;
        this.f61172b = j12;
        this.f61173c = f11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u0)) {
            return false;
        }
        u0 u0Var = (u0) obj;
        long j11 = u0Var.f61171a;
        int i5 = s.n;
        return ULong.a(this.f61171a, j11) && h2.b.b(this.f61172b, u0Var.f61172b) && this.f61173c == u0Var.f61173c;
    }

    public final int hashCode() {
        int i5 = s.n;
        ULong.Companion companion = ULong.f71699b;
        return Float.hashCode(this.f61173c) + b.c0.d(Long.hashCode(this.f61171a) * 31, 31, this.f61172b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Shadow(color=");
        k2.v(this.f61171a, ", offset=", sb2);
        sb2.append((Object) h2.b.i(this.f61172b));
        sb2.append(", blurRadius=");
        return c9.k(sb2, this.f61173c, ')');
    }

    public /* synthetic */ u0() {
        this(0.0f, r0.c(4278190080L), 0L);
    }
}
