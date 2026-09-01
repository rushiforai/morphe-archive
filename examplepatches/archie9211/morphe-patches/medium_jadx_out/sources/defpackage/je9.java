package defpackage;

import gen.model.PostCardType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class je9 {
    public static PostCardType a(int i) {
        if (i == 0) {
            return PostCardType.NO_CARD_TYPE;
        }
        if (i == 1) {
            return PostCardType.SHORT_STORY_CARD;
        }
        if (i != 2) {
            return null;
        }
        return PostCardType.STANDARD_CARD;
    }
}
