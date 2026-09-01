package defpackage;

import com.medium.android.core.models.HighlightType;
import com.medium.android.graphql.fragment.HighlightDataWithGroup;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sr9 implements es9 {
    public final HighlightDataWithGroup a;
    public final HighlightType b;

    public sr9(HighlightDataWithGroup highlightDataWithGroup, HighlightType highlightType) {
        highlightDataWithGroup.getClass();
        highlightType.getClass();
        this.a = highlightDataWithGroup;
        this.b = highlightType;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sr9)) {
            return false;
        }
        sr9 sr9Var = (sr9) obj;
        return g76.L(this.a, sr9Var.a) && this.b == sr9Var.b;
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "AddHighlight(highlightDataWithGroup=" + this.a + ", highlightType=" + this.b + ")";
    }
}
