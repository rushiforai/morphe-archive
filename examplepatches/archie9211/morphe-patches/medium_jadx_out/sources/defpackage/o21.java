package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o21 extends m21 {
    public float e;

    public o21(float f) {
        super(null);
        this.e = f;
    }

    @Override // defpackage.m21
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof o21) {
            float fQ = q();
            float fQ2 = ((o21) obj).q();
            if ((Float.isNaN(fQ) && Float.isNaN(fQ2)) || fQ == fQ2) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.m21
    public final int hashCode() {
        int iHashCode = super.hashCode() * 31;
        float f = this.e;
        return iHashCode + (f != 0.0f ? Float.floatToIntBits(f) : 0);
    }

    @Override // defpackage.m21
    public final float q() {
        char[] cArr;
        if (Float.isNaN(this.e) && (cArr = this.a) != null && cArr.length >= 1) {
            this.e = Float.parseFloat(e());
        }
        return this.e;
    }

    @Override // defpackage.m21
    public final int r() {
        char[] cArr;
        if (Float.isNaN(this.e) && (cArr = this.a) != null && cArr.length >= 1) {
            this.e = Integer.parseInt(e());
        }
        return (int) this.e;
    }
}
