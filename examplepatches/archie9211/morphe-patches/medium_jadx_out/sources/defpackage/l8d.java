package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l8d extends m8d {
    public final String a;
    public final ArrayList b;

    public l8d(String str, ArrayList arrayList) {
        this.a = str;
        this.b = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l8d)) {
            return false;
        }
        l8d l8dVar = (l8d) obj;
        return this.a.equals(l8dVar.a) && this.b.equals(l8dVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Tags(tagName=" + this.a + ", tags=" + this.b + ")";
    }
}
