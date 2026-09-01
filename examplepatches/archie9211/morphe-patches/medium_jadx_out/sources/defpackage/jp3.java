package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jp3 implements lp3 {
    public final boolean a;
    public final b85 b;

    public jp3(boolean z, b85 b85Var) {
        this.a = z;
        this.b = b85Var;
    }

    @Override // defpackage.lp3
    public final boolean a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jp3)) {
            return false;
        }
        jp3 jp3Var = (jp3) obj;
        return this.a == jp3Var.a && this.b.equals(jp3Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + ((this.a ? 1231 : 1237) * 31);
    }

    public final String toString() {
        return "Data(isFocused=" + this.a + ", uiModel=" + this.b + ")";
    }
}
