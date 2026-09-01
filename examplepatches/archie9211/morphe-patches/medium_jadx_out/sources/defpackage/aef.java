package defpackage;

import gen.model.SourceParameter;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aef {
    public final boolean a;
    public final List b;
    public final zdf c;
    public final ndf d;
    public final SourceParameter e;

    public aef(boolean z, List list, zdf zdfVar, ndf ndfVar, SourceParameter sourceParameter) {
        list.getClass();
        zdfVar.getClass();
        sourceParameter.getClass();
        this.a = z;
        this.b = list;
        this.c = zdfVar;
        this.d = ndfVar;
        this.e = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof aef)) {
            return false;
        }
        aef aefVar = (aef) obj;
        return this.a == aefVar.a && g76.L(this.b, aefVar.b) && g76.L(this.c, aefVar.c) && this.d.equals(aefVar.d) && g76.L(this.e, aefVar.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + ((this.d.hashCode() + ((this.c.hashCode() + wgd.p((this.a ? 1231 : 1237) * 31, 31, this.b)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ViewState(isRefreshing=");
        sb.append(this.a);
        sb.append(", followedTypePills=");
        sb.append(this.b);
        sb.append(", followedItemsState=");
        sb.append(this.c);
        sb.append(", feedState=");
        sb.append(this.d);
        sb.append(", sourceParameter=");
        return y30.r(sb, this.e, ")");
    }
}
