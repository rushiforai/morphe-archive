package defpackage;

import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hu9 implements ou9 {
    public final int a;
    public final b24 b;

    public hu9(int i, b24 b24Var) {
        this.a = i;
        this.b = b24Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hu9)) {
            return false;
        }
        hu9 hu9Var = (hu9) obj;
        return this.a == hu9Var.a && this.b.equals(hu9Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a * 31);
    }

    public final String toString() {
        return JWcjNoweKCnTr.KcDkhq + this.a + ", errorState=" + this.b + ")";
    }
}
