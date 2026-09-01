package defpackage;

import com.medium.android.core.models.HighlightType;
import com.medium.android.graphql.fragment.HighlightDataWithGroup;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ff9 implements mf9 {
    public final String a;
    public final HighlightDataWithGroup b;
    public final HighlightType c;

    public ff9(String str, HighlightDataWithGroup highlightDataWithGroup, HighlightType highlightType) {
        str.getClass();
        highlightDataWithGroup.getClass();
        highlightType.getClass();
        this.a = str;
        this.b = highlightDataWithGroup;
        this.c = highlightType;
    }

    @Override // defpackage.mf9
    public final String b() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ff9)) {
            return false;
        }
        ff9 ff9Var = (ff9) obj;
        return g76.L(this.a, ff9Var.a) && g76.L(this.b, ff9Var.b) && this.c == ff9Var.c;
    }

    public final int hashCode() {
        return this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "HighlightAdded(postId=" + this.a + ", highlightDataWithGroup=" + this.b + ", highlightType=" + this.c + ")";
    }
}
