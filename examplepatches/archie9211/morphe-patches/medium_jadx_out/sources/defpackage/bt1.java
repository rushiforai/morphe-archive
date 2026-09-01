package defpackage;

import gen.model.CollectionSectionType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class bt1 {
    public static CollectionSectionType a(int i) {
        if (i == 1) {
            return CollectionSectionType.POST_LIST;
        }
        if (i == 2) {
            return CollectionSectionType.COLLECTION_HEADER;
        }
        if (i != 3) {
            return null;
        }
        return CollectionSectionType.COLLECTION_PROMO;
    }
}
