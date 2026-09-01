package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rea extends sea {
    public final List a;
    public final List b;
    public final List c;

    public rea(List list, List list2, List list3) {
        list.getClass();
        this.a = list;
        this.b = list2;
        this.c = list3;
    }

    public static rea a(rea reaVar, List list, ArrayList arrayList, int i) {
        if ((i & 1) != 0) {
            list = reaVar.a;
        }
        List list2 = reaVar.b;
        List list3 = arrayList;
        if ((i & 4) != 0) {
            list3 = reaVar.c;
        }
        reaVar.getClass();
        list.getClass();
        return new rea(list, list2, list3);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rea)) {
            return false;
        }
        rea reaVar = (rea) obj;
        return g76.L(this.a, reaVar.a) && this.b.equals(reaVar.b) && g76.L(this.c, reaVar.c);
    }

    public final int hashCode() {
        int iP = wgd.p(this.a.hashCode() * 31, 31, this.b);
        List list = this.c;
        return iP + (list == null ? 0 : list.hashCode());
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Loaded(selectedTopics=");
        sb.append(this.a);
        sb.append(", followedTopics=");
        sb.append(this.b);
        sb.append(", matchingTopic=");
        return b09.B(sb, this.c, ")");
    }
}
