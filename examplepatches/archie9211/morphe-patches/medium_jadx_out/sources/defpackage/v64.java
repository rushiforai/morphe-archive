package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class v64 implements x64 {
    public final b24 a;
    public final SourceParameter b;

    public v64(b24 b24Var, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        this.a = b24Var;
        this.b = sourceParameter;
    }

    @Override // defpackage.x64
    public final SourceParameter a() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v64)) {
            return false;
        }
        v64 v64Var = (v64) obj;
        return this.a.equals(v64Var.a) && g76.L(this.b, v64Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Error(errorState=" + this.a + ", sourceParameter=" + this.b + ")";
    }
}
