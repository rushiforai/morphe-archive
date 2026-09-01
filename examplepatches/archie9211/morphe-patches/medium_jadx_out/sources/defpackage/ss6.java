package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ss6 {
    public final mn6 a;
    public final List b;
    public final ArrayList c;
    public final List d;

    public ss6(mn6 mn6Var, List list, ArrayList arrayList, List list2) {
        this.a = mn6Var;
        this.b = list;
        this.c = arrayList;
        this.d = list2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ss6)) {
            return false;
        }
        ss6 ss6Var = (ss6) obj;
        return this.a.equals(ss6Var.a) && this.b.equals(ss6Var.b) && this.c.equals(ss6Var.c) && this.d.equals(ss6Var.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((((this.c.hashCode() + wgd.p(this.a.hashCode() * 961, 31, this.b)) * 31) + 1237) * 31);
    }

    public final String toString() {
        return "MethodSignatureData(returnType=" + this.a + ", receiverType=null, valueParameters=" + this.b + ", typeParameters=" + this.c + ", hasStableParameterNames=false, errors=" + this.d + ')';
    }
}
