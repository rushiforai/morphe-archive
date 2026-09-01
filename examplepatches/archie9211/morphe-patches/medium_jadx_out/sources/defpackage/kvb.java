package defpackage;

import com.medium.proto.obv.post.SectionTextLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kvb {
    public static SectionTextLayout a(int i) {
        switch (i) {
            case 1:
                return SectionTextLayout.FLOW;
            case 2:
                return SectionTextLayout.BOTTOM_CENTER;
            case 3:
                return SectionTextLayout.MIDDLE_CENTER;
            case 4:
                return SectionTextLayout.TOP_CENTER;
            case 5:
                return SectionTextLayout.CAPTION_ONLY;
            case 6:
                return SectionTextLayout.SERIES_COVER;
            case 7:
                return SectionTextLayout.SERIES_COVER_TITLELESS;
            default:
                return null;
        }
    }
}
