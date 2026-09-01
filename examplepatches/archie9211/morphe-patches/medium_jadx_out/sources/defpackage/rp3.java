package defpackage;

import com.medium.proto.obv.post.ParagraphType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rp3 {
    public final ParagraphType a;

    public rp3(ParagraphType paragraphType) {
        this.a = paragraphType;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof rp3) && this.a == ((rp3) obj).a;
    }

    public final int hashCode() {
        ParagraphType paragraphType = this.a;
        if (paragraphType == null) {
            return 0;
        }
        return paragraphType.hashCode();
    }

    public final String toString() {
        return "EditPostBottomBarUiModel(currentParagraphType=" + this.a + ")";
    }
}
