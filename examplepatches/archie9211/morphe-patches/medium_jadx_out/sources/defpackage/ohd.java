package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ohd {
    public static final ohd b = new ohd(0);
    public static final ohd c = new ohd(1);
    public static final ohd d = new ohd(2);
    public final int a;

    public ohd(int i) {
        this.a = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ohd) {
            return this.a == ((ohd) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        int i = this.a;
        if (i == 0) {
            return "TextDecoration.None";
        }
        ArrayList arrayList = new ArrayList();
        if ((i & 1) != 0) {
            arrayList.add("Underline");
        }
        if ((i & 2) != 0) {
            arrayList.add("LineThrough");
        }
        if (arrayList.size() != 1) {
            return ev6.z(new StringBuilder("TextDecoration["), z27.b(arrayList, ", ", null, 62), ']');
        }
        return "TextDecoration." + ((String) arrayList.get(0));
    }
}
