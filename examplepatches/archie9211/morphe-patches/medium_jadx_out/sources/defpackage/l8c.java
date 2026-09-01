package defpackage;

import gen.model.ShortformType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class l8c {
    public static ShortformType a(int i) {
        if (i == 0) {
            return ShortformType.SHORTFORM_TYPE_LINK;
        }
        if (i == 1) {
            return ShortformType.SHORTFORM_TYPE_NOTE;
        }
        if (i == 2) {
            return ShortformType.SHORTFORM_TYPE_MEDIA;
        }
        if (i != 3) {
            return null;
        }
        return ShortformType.SHORTFORM_TYPE_QUOTE;
    }
}
