package defpackage;

import gen.model.PredefinedCatalogKind;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ay9 {
    public static PredefinedCatalogKind a(int i) {
        if (i == 0) {
            return PredefinedCatalogKind.__NULL_PREDEFINED_KIND;
        }
        if (i == 1) {
            return PredefinedCatalogKind.READING_LIST;
        }
        if (i == 2) {
            return PredefinedCatalogKind.CURRENTLY_READING;
        }
        if (i != 3) {
            return null;
        }
        return PredefinedCatalogKind.PURCHASED;
    }
}
