package defpackage;

import com.medium.proto.obv.post.SectionImageLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hvb {
    public static SectionImageLayout a(int i) {
        switch (i) {
            case 1:
                return SectionImageLayout.NONE;
            case 2:
                return SectionImageLayout.FULL_BLEED;
            case 3:
                return SectionImageLayout.UNUSED_LEFT;
            case 4:
                return SectionImageLayout.UNUSED_RIGHT;
            case 5:
                return SectionImageLayout.CONTENT;
            case 6:
                return SectionImageLayout.FULL_SCREEN;
            case 7:
                return SectionImageLayout.ASPECT_RATIO;
            case 8:
                return SectionImageLayout.COVER_FADE;
            case 9:
                return SectionImageLayout.ASPECT_RATIO_VIEWPORT;
            case 10:
                return SectionImageLayout.SECTION_FILL_CROP;
            case 11:
                return SectionImageLayout.SECTION_FILL_OVERFLOW_X;
            default:
                return null;
        }
    }
}
