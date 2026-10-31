package f0;

import b.c0;
import com.google.android.gms.internal.measurement.k2;
import i2.s;
import kotlin.ULong;

/* loaded from: classes2.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final long f53198a;

    /* renamed from: b, reason: collision with root package name */
    public final long f53199b;

    /* renamed from: c, reason: collision with root package name */
    public final long f53200c;

    /* renamed from: d, reason: collision with root package name */
    public final long f53201d;

    /* renamed from: e, reason: collision with root package name */
    public final long f53202e;

    public c(long j11, long j12, long j13, long j14, long j15) {
        this.f53198a = j11;
        this.f53199b = j12;
        this.f53200c = j13;
        this.f53201d = j14;
        this.f53202e = j15;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        long j11 = cVar.f53198a;
        int i5 = s.n;
        return ULong.a(this.f53198a, j11) && ULong.a(this.f53199b, cVar.f53199b) && ULong.a(this.f53200c, cVar.f53200c) && ULong.a(this.f53201d, cVar.f53201d) && ULong.a(this.f53202e, cVar.f53202e);
    }

    public final int hashCode() {
        int i5 = s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f53202e) + c0.d(c0.d(c0.d(Long.hashCode(this.f53198a) * 31, 31, this.f53199b), 31, this.f53200c), 31, this.f53201d);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ContextMenuColors(backgroundColor=");
        k2.v(this.f53198a, ", textColor=", sb2);
        k2.v(this.f53199b, ", iconColor=", sb2);
        k2.v(this.f53200c, ", disabledTextColor=", sb2);
        k2.v(this.f53201d, ", disabledIconColor=", sb2);
        sb2.append((Object) s.h(this.f53202e));
        sb2.append(')');
        return sb2.toString();
    }
}
