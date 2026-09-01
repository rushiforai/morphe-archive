package defpackage;

import com.medium.proto.obv.post.BlockLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hs0 {
    public static BlockLayout a(int i) {
        switch (i) {
            case 1:
                return BlockLayout.INSET_CENTER;
            case 2:
                return BlockLayout.INSET_LEFT;
            case 3:
                return BlockLayout.OUTSET_CENTER;
            case 4:
                return BlockLayout.OUTSET_LEFT;
            case 5:
                return BlockLayout.FULL_WIDTH;
            case 6:
                return BlockLayout.OUTSET_ROW;
            case 7:
                return BlockLayout.OUTSET_ROW_CONTINUE;
            case 8:
                return BlockLayout.FULL_WIDTH_CROPPED_COVER;
            case 9:
                return BlockLayout.CONSTRAINED_HEIGHT_PREVIEW;
            case 10:
                return BlockLayout.CROPPED_HEIGHT_PREVIEW;
            case 11:
                return BlockLayout.INSET_CENTER_SMALL;
            case 12:
                return BlockLayout.INSET_RIGHT;
            default:
                return null;
        }
    }
}
