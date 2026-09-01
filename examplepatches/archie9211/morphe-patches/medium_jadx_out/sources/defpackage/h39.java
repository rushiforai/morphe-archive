package defpackage;

import com.medium.proto.obv.post.ParagraphType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class h39 {
    public static ParagraphType a(int i) {
        switch (i) {
            case 1:
                return ParagraphType.P;
            case 2:
                return ParagraphType.H2;
            case 3:
                return ParagraphType.H3;
            case 4:
                return ParagraphType.IMG;
            case 5:
                return ParagraphType.HR;
            case 6:
                return ParagraphType.BQ;
            case 7:
                return ParagraphType.PQ;
            case 8:
                return ParagraphType.PRE;
            case 9:
                return ParagraphType.ULI;
            case 10:
                return ParagraphType.OLI;
            case 11:
                return ParagraphType.IFRAME;
            case 12:
                return ParagraphType.H1;
            case 13:
                return ParagraphType.H4;
            case 14:
                return ParagraphType.MIXTAPE_EMBED;
            case 15:
                return ParagraphType.SECTION_CAPTION;
            case 16:
                return ParagraphType.COVER_TITLE;
            default:
                return null;
        }
    }
}
