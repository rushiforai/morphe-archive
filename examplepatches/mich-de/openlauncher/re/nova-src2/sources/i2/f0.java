package i2;

import android.graphics.LightingColorFilter;
import com.google.android.gms.internal.measurement.k2;
import kotlin.ULong;

/* loaded from: classes2.dex */
public final class f0 extends t {

    /* renamed from: b, reason: collision with root package name */
    public final long f61110b;

    /* renamed from: c, reason: collision with root package name */
    public final long f61111c;

    public f0(long j11, long j12) {
        super(new LightingColorFilter(r0.r(j11), r0.r(j12)));
        this.f61110b = j11;
        this.f61111c = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f0)) {
            return false;
        }
        f0 f0Var = (f0) obj;
        long j11 = f0Var.f61110b;
        int i5 = s.n;
        return ULong.a(this.f61110b, j11) && ULong.a(this.f61111c, f0Var.f61111c);
    }

    public final int hashCode() {
        int i5 = s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f61111c) + (Long.hashCode(this.f61110b) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("LightingColorFilter(multiply=");
        k2.v(this.f61110b, ", add=", sb2);
        sb2.append((Object) s.h(this.f61111c));
        sb2.append(')');
        return sb2.toString();
    }
}
