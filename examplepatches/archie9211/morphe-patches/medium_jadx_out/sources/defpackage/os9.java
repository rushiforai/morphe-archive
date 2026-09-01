package defpackage;

import com.medium.android.explore.ui.vAWg.OphtYB;
import com.medium.android.graphql.type.CatalogItemType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class os9 implements ou9 {
    public final CatalogItemType a;
    public final String b;
    public final String c;

    public os9(CatalogItemType catalogItemType, String str, String str2) {
        catalogItemType.getClass();
        this.a = catalogItemType;
        this.b = str;
        this.c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof os9)) {
            return false;
        }
        os9 os9Var = (os9) obj;
        return this.a == os9Var.a && this.b.equals(os9Var.b) && this.c.equals(os9Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("NavigateToCatalogSelector(catalogItemType=");
        sb.append(this.a);
        sb.append(OphtYB.KbHIvZgNrmdakkL);
        sb.append(this.b);
        sb.append(", source=");
        return ka1.v(sb, this.c, ")");
    }
}
