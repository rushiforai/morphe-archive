package defpackage;

import gen.model.SourceParameter;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ohe implements whe {
    public final List a;
    public final boolean b;
    public final uhe c;
    public final SourceParameter d;

    public ohe(List list, boolean z, uhe uheVar, SourceParameter sourceParameter) {
        uheVar.getClass();
        sourceParameter.getClass();
        this.a = list;
        this.b = z;
        this.c = uheVar;
        this.d = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ohe)) {
            return false;
        }
        ohe oheVar = (ohe) obj;
        return this.a.equals(oheVar.a) && this.b == oheVar.b && g76.L(this.c, oheVar.c) && g76.L(this.d, oheVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbX = ka1.x("Content(items=", this.a, ", isLoadingMore=", this.b, ", featuredBookState=");
        sbX.append(this.c);
        sbX.append(", sourceParameter=");
        sbX.append(this.d);
        sbX.append(")");
        return sbX.toString();
    }
}
