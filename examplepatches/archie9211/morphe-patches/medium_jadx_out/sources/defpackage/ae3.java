package defpackage;

import com.medium.android.data.settings.Frequency;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ae3 implements be3 {
    public final Frequency a;
    public final az5 b;
    public final SourceParameter c;

    public ae3(Frequency frequency, az5 az5Var, SourceParameter sourceParameter) {
        frequency.getClass();
        az5Var.getClass();
        sourceParameter.getClass();
        this.a = frequency;
        this.b = az5Var;
        this.c = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ae3)) {
            return false;
        }
        ae3 ae3Var = (ae3) obj;
        return this.a == ae3Var.a && g76.L(this.b, ae3Var.b) && g76.L(this.c, ae3Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ka1.b(this.b, this.a.hashCode() * 31, 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Success(frequency=");
        sb.append(this.a);
        sb.append(", frequencies=");
        sb.append(this.b);
        sb.append(", sourceParameter=");
        return y30.r(sb, this.c, ")");
    }
}
