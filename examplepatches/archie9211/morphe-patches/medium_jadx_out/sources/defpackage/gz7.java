package defpackage;

import com.squareup.wire.internal.FieldOrOneOfBinding;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gz7 {
    public final jud a;
    public final FieldOrOneOfBinding b;

    public gz7(jud judVar, FieldOrOneOfBinding fieldOrOneOfBinding) {
        judVar.getClass();
        fieldOrOneOfBinding.getClass();
        this.a = judVar;
        this.b = fieldOrOneOfBinding;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gz7)) {
            return false;
        }
        gz7 gz7Var = (gz7) obj;
        return g76.L(this.a, gz7Var.a) && g76.L(this.b, gz7Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "JsonField(adapter=" + this.a + ", fieldBinding=" + this.b + ")";
    }
}
