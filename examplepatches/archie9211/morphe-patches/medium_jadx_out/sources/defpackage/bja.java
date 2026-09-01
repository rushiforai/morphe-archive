package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bja implements cja {
    public final String a;
    public final List b;
    public final boolean c;

    public bja(String str, List list, boolean z) {
        str.getClass();
        this.a = str;
        this.b = list;
        this.c = z;
    }

    public static bja a(bja bjaVar, ArrayList arrayList, int i) {
        String str = bjaVar.a;
        List list = arrayList;
        if ((i & 2) != 0) {
            list = bjaVar.b;
        }
        boolean z = (i & 4) != 0 ? bjaVar.c : true;
        bjaVar.getClass();
        str.getClass();
        return new bja(str, list, z);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bja)) {
            return false;
        }
        bja bjaVar = (bja) obj;
        return g76.L(this.a, bjaVar.a) && this.b.equals(bjaVar.b) && this.c == bjaVar.c;
    }

    public final int hashCode() {
        return wgd.p(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        return lv8.t(b09.E("Success(name=", this.a, ", sections=", ", isRefreshing=", this.b), this.c, ")");
    }
}
