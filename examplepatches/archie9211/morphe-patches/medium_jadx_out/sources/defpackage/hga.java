package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hga implements vga {
    public final int a;
    public final b24 b;

    public hga(int i, b24 b24Var, int i2) {
        i = (i2 & 1) != 0 ? R.string.common_oops : i;
        b24Var = (i2 & 2) != 0 ? new w14(null, true) : b24Var;
        this.a = i;
        this.b = b24Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hga)) {
            return false;
        }
        hga hgaVar = (hga) obj;
        return this.a == hgaVar.a && this.b.equals(hgaVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a * 31);
    }

    public final String toString() {
        return "Error(errorMessageResId=" + this.a + ", errorState=" + this.b + ")";
    }
}
