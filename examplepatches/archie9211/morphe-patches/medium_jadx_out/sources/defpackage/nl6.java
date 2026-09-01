package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nl6 extends ql6 {
    public final float a;

    public nl6(float f) {
        this.a = f;
    }

    @Override // defpackage.ql6
    public final Object a() {
        return Float.valueOf(this.a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof nl6) && Float.compare(this.a, ((nl6) obj).a) == 0;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.a);
    }
}
