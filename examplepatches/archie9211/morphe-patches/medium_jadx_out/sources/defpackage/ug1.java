package defpackage;

import gen.model.CatalogVisibility;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ug1 {
    public static CatalogVisibility a(int i) {
        if (i == 0) {
            return CatalogVisibility.CATALOG_VISIBILITY_PUBLIC;
        }
        if (i == 1) {
            return CatalogVisibility.CATALOG_VISIBILITY_PRIVATE;
        }
        if (i != 2) {
            return null;
        }
        return CatalogVisibility.CATALOG_VISIBILITY_LOCKED;
    }
}
