package mh;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class p0 extends s0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f76369a;

    public p0(long j11) {
        this.f76369a = j11;
    }

    @Override // java.lang.Comparable
    public final /* bridge */ /* synthetic */ int compareTo(Object obj) {
        s0 s0Var = (s0) obj;
        if (zza() != s0Var.zza()) {
            return zza() - s0Var.zza();
        }
        long jAbs = Math.abs(this.f76369a);
        long jAbs2 = Math.abs(((p0) s0Var).f76369a);
        if (jAbs < jAbs2) {
            return -1;
        }
        return jAbs > jAbs2 ? 1 : 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return obj != null && p0.class == obj.getClass() && this.f76369a == ((p0) obj).f76369a;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(zza()), Long.valueOf(this.f76369a)});
    }

    public final String toString() {
        return Long.toString(this.f76369a);
    }

    @Override // mh.s0
    public final int zza() {
        return s0.c(this.f76369a >= 0 ? (byte) 0 : (byte) 32);
    }
}
