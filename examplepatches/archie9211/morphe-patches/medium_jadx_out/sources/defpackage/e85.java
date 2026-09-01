package defpackage;

import gen.model.GeoBlockType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class e85 {
    public static GeoBlockType a(int i) {
        if (i == 0) {
            return GeoBlockType.GEO_BLOCK_TYPE_UNKOWN;
        }
        if (i == 1) {
            return GeoBlockType.GEO_BLOCK_TYPE_USER;
        }
        if (i == 2) {
            return GeoBlockType.GEO_BLOCK_TYPE_COLLECTION;
        }
        if (i != 3) {
            return null;
        }
        return GeoBlockType.GEO_BLOCK_TYPE_POST;
    }
}
