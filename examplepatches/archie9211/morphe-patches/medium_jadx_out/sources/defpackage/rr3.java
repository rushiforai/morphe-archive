package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rr3 {
    public final boolean a;
    public final ms3 b;

    public rr3(boolean z, ms3 ms3Var) {
        ms3Var.getClass();
        this.a = z;
        this.b = ms3Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rr3)) {
            return false;
        }
        rr3 rr3Var = (rr3) obj;
        return this.a == rr3Var.a && g76.L(this.b, rr3Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + ((this.a ? 1231 : 1237) * 31);
    }

    public final String toString() {
        return "EditPostTopAppBarUiModel(showMeter=" + this.a + ", nextStepMode=" + this.b + ")";
    }
}
