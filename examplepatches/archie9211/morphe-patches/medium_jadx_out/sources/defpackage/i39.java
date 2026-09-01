package defpackage;

import com.medium.android.graphql.fragment.ParagraphData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class i39 implements l39 {
    public final ParagraphData a;
    public final qxb b;

    public i39(ParagraphData paragraphData, qxb qxbVar) {
        paragraphData.getClass();
        this.a = paragraphData;
        this.b = qxbVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i39)) {
            return false;
        }
        i39 i39Var = (i39) obj;
        return g76.L(this.a, i39Var.a) && this.b.equals(i39Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Highlight(paragraph=" + this.a + ", selectionText=" + this.b + ")";
    }
}
