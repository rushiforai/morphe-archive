package defpackage;

import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class z7d extends x7d {
    public final String g;
    public final SourceParameter h;

    public z7d(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.g = str;
        this.h = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z7d)) {
            return false;
        }
        z7d z7dVar = (z7d) obj;
        return g76.L(this.g, z7dVar.g) && g76.L(this.h, z7dVar.h);
    }

    public final int hashCode() {
        return this.h.hashCode() + (this.g.hashCode() * 31);
    }

    public final String toString() {
        return mgKMENwrbHf.VWkfOYCbzgTxz + this.g + ", sourceParameter=" + this.h + ")";
    }
}
