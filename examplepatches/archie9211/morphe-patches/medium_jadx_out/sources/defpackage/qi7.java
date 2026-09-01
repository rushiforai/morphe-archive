package defpackage;

import com.medium.proto.obv.post.MarkupType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qi7 {
    public static MarkupType a(int i) {
        switch (i) {
            case 1:
                return MarkupType.STRONG;
            case 2:
                return MarkupType.EM;
            case 3:
                return MarkupType.A;
            case 4:
                return MarkupType.HIGHLIGHT;
            case 5:
                return MarkupType.WARNING;
            case 6:
                return MarkupType.COMMENT;
            case 7:
                return MarkupType.QUOTE;
            case 8:
                return MarkupType.SENTENCE_DEPRECATED;
            case 9:
                return MarkupType.QUERY;
            case 10:
                return MarkupType.CODE;
            case 11:
                return MarkupType.UNUSED_DETAIL;
            default:
                return null;
        }
    }
}
