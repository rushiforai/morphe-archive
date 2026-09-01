package defpackage;

import gen.model.PostListLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class oh9 {
    public static PostListLayout a(int i) {
        switch (i) {
            case 1:
                return PostListLayout.GRID_TEXT_OVER_IMAGE_FULL_BLEED;
            case 2:
                return PostListLayout.GRID_TEXT_OVER_IMAGE_WITH_MARGIN;
            case 3:
                return PostListLayout.GRID_TEXT_UNDER_IMAGE_FULL_BLEED;
            case 4:
                return PostListLayout.GRID_TEXT_UNDER_IMAGE_WITH_MARGIN;
            case 5:
                return PostListLayout.LIST;
            case 6:
                return PostListLayout.STREAM;
            case 7:
                return PostListLayout.TEXT_OVER_IMAGE_SIDE_RAIL;
            case 8:
                return PostListLayout.AUTO_GRID;
            case 9:
                return PostListLayout.TWO_COLUMN_DENSE;
            case 10:
                return PostListLayout.THREE_COLUMN_DENSE;
            case 11:
                return PostListLayout.THREE_COLUMN;
            case 12:
                return PostListLayout.OUTSET_HERO_GRID;
            default:
                return null;
        }
    }
}
