package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jl6 extends ql6 {
    public final byte a;

    public jl6(byte b) {
        this.a = b;
    }

    @Override // defpackage.ql6
    public final Object a() {
        return Byte.valueOf(this.a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof jl6) && this.a == ((jl6) obj).a;
    }

    public final int hashCode() {
        return this.a;
    }
}
