package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ms0 {
    public final String a;
    public final SourceParameter b;

    public ms0(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ms0)) {
            return false;
        }
        ms0 ms0Var = (ms0) obj;
        return g76.L(this.a, ms0Var.a) && g76.L(this.b, ms0Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "BlockReposterConfirmationUiModel(reposterId=" + this.a + ", sourceParameter=" + this.b + ")";
    }
}
