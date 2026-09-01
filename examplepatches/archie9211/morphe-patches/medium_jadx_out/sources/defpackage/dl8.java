package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dl8 implements fl8 {
    public final ArrayList a;
    public final boolean b;

    public dl8(ArrayList arrayList, boolean z) {
        this.a = arrayList;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof dl8)) {
            return false;
        }
        dl8 dl8Var = (dl8) obj;
        return this.a.equals(dl8Var.a) && this.b == dl8Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "Items(items=" + this.a + ", isRefreshing=" + this.b + ")";
    }
}
