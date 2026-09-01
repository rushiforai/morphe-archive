package defpackage;

import gen.model.SourceParameter;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vma implements ena {
    public final SourceParameter a;
    public final b24 b;

    public vma(b24 b24Var, SourceParameter sourceParameter) {
        this.a = sourceParameter;
        this.b = b24Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vma)) {
            return false;
        }
        vma vmaVar = (vma) obj;
        return this.a.equals(vmaVar.a) && this.b.equals(vmaVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "MuteCurrentPublicationFailure(sourceParameter=" + this.a + gYpYQDQkhfs.uQYDlmPC + this.b + ")";
    }
}
