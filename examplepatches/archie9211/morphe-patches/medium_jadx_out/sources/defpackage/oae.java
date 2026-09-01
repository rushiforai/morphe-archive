package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class oae implements qae {
    public final ArrayList a;
    public final String b;

    public oae(String str, ArrayList arrayList) {
        this.a = arrayList;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof oae)) {
            return false;
        }
        oae oaeVar = (oae) obj;
        return this.a.equals(oaeVar.a) && this.b.equals(oaeVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Loaded(items=" + this.a + ", userId=" + this.b + ")";
    }
}
