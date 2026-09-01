package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mc8 {
    public final List a;
    public final int b;

    public mc8(List list, int i) {
        this.a = list;
        this.b = i;
        if (list.isEmpty() && i == -1) {
            return;
        }
        if (!list.isEmpty()) {
            int size = list.size();
            if (i >= 0 && i < size) {
                return;
            }
        }
        rd6.l(ev6.C("Invalid 'NavigationEventHistory' state:  'currentIndex' must be within the bounds of 'mergedHistory' (or -1 if empty). Received: currentIndex = '", i, "', bounds = '"), d46.J(list), "'.");
        throw null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || mc8.class != obj.getClass()) {
            return false;
        }
        mc8 mc8Var = (mc8) obj;
        return this.b == mc8Var.b && g76.L(this.a, mc8Var.a);
    }

    public final int hashCode() {
        return this.a.hashCode() + (this.b * 31);
    }

    public final String toString() {
        return "NavigationEventHistory(currentIndex=" + this.b + ", mergedHistory=" + this.a + ')';
    }

    public mc8() {
        this(ey3.a, -1);
    }
}
