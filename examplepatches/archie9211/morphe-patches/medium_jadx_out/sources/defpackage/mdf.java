package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mdf implements ndf {
    public final ArrayList a;
    public final boolean b;
    public final boolean c;

    public mdf(ArrayList arrayList, boolean z, boolean z2) {
        this.a = arrayList;
        this.b = z;
        this.c = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mdf)) {
            return false;
        }
        mdf mdfVar = (mdf) obj;
        return this.a.equals(mdfVar.a) && this.b == mdfVar.b && this.c == mdfVar.c;
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("TagContent(items=");
        sb.append(this.a);
        sb.append(", isLoadingMore=");
        sb.append(this.b);
        sb.append(", hasMore=");
        return lv8.t(sb, this.c, ")");
    }
}
