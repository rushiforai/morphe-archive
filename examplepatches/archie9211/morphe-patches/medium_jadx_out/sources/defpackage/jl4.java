package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jl4 implements w82 {
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof jl4) && Float.compare(1.0f, 1.0f) == 0;
    }

    @Override // defpackage.w82
    public final long g(long j, long j2) {
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(1.0f)) << 32) | (((long) Float.floatToRawIntBits(1.0f)) & 4294967295L);
        int i = fqb.a;
        return jFloatToRawIntBits;
    }

    public final int hashCode() {
        return Float.floatToIntBits(1.0f);
    }

    public final String toString() {
        return "FixedScale(value=1.0)";
    }
}
