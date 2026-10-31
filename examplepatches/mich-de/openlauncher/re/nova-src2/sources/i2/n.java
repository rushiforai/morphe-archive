package i2;

import android.graphics.ColorFilter;
import android.graphics.PorterDuffColorFilter;
import android.os.Build;
import com.google.android.gms.internal.measurement.k2;
import kotlin.ULong;

/* loaded from: classes.dex */
public final class n extends t {

    /* renamed from: b, reason: collision with root package name */
    public final long f61129b;

    /* renamed from: c, reason: collision with root package name */
    public final int f61130c;

    /* JADX WARN: Illegal instructions before constructor call */
    public n(long j11, int i5) {
        ColorFilter porterDuffColorFilter;
        if (Build.VERSION.SDK_INT >= 29) {
            a.h();
            porterDuffColorFilter = a.d(r0.r(j11), r0.q(i5));
        } else {
            porterDuffColorFilter = new PorterDuffColorFilter(r0.r(j11), r0.s(i5));
        }
        super(porterDuffColorFilter);
        this.f61129b = j11;
        this.f61130c = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n)) {
            return false;
        }
        n nVar = (n) obj;
        long j11 = nVar.f61129b;
        int i5 = s.n;
        return ULong.a(this.f61129b, j11) && this.f61130c == nVar.f61130c;
    }

    public final int hashCode() {
        int i5 = s.n;
        ULong.Companion companion = ULong.f71699b;
        return Integer.hashCode(this.f61130c) + (Long.hashCode(this.f61129b) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BlendModeColorFilter(color=");
        k2.v(this.f61129b, ", blendMode=", sb2);
        sb2.append((Object) m.a(this.f61130c));
        sb2.append(')');
        return sb2.toString();
    }
}
