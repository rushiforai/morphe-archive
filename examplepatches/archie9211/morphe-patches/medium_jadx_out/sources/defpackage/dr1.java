package defpackage;

import gen.model.CollectionColorType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class dr1 {
    public static CollectionColorType a(int i) {
        switch (i) {
            case 0:
                return CollectionColorType.COLOR_TYPE_NONE;
            case 1:
                return CollectionColorType.COLOR_TYPE_PRIMARY_ACCENT_TEXT;
            case 2:
                return CollectionColorType.COLOR_TYPE_SECONDARY_ACCENT_TEXT;
            case 3:
                return CollectionColorType.COLOR_TYPE_TERTIARY_ACCENT_TEXT;
            case 4:
                return CollectionColorType.COLOR_TYPE_PRIMARY_BACKGROUND;
            case 5:
                return CollectionColorType.COLOR_TYPE_SECONDARY_BACKGROUND;
            case 6:
                return CollectionColorType.COLOR_TYPE_TERTIARY_BACKGROUND;
            case 7:
                return CollectionColorType.COLOR_TYPE_QUATERNARY_BACKGROUND;
            case 8:
                return CollectionColorType.COLOR_TYPE_QUOTE_BACKGROUND;
            case 9:
                return CollectionColorType.COLOR_TYPE_PRIMARY_MAIN_TEXT;
            case 10:
                return CollectionColorType.COLOR_TYPE_SECONDARY_MAIN_TEXT;
            case 11:
                return CollectionColorType.COLOR_TYPE_TERTIARY_MAIN_TEXT;
            case 12:
                return CollectionColorType.COLOR_TYPE_QUOTE_MAIN_TEXT;
            case 13:
                return CollectionColorType.COLOR_TYPE_SUBTLE_TEXT;
            case 14:
                return CollectionColorType.COLOR_TYPE_VERY_SUBTLE_TEXT;
            default:
                return null;
        }
    }
}
