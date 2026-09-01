package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j4a {
    public final List a;
    public final String b;

    public j4a(List list, String str) {
        list.getClass();
        str.getClass();
        this.a = list;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j4a)) {
            return false;
        }
        j4a j4aVar = (j4a) obj;
        return g76.L(this.a, j4aVar.a) && g76.L(this.b, j4aVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "PronounsPickerUiModel(pronouns=" + this.a + ", text=" + this.b + ")";
    }
}
