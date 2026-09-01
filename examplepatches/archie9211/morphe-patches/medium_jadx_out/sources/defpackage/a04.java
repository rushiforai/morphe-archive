package defpackage;

import gen.model.EntityClientPresentedType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a04 {
    public static EntityClientPresentedType a(int i) {
        if (i == 1) {
            return EntityClientPresentedType.ENTITY_CLIENT_PRESENTED_TYPE_POPCHUNK;
        }
        if (i == 2) {
            return EntityClientPresentedType.ENTITY_CLIENT_PRESENTED_TYPE_COLLECTION_NUDGE;
        }
        if (i == 3) {
            return EntityClientPresentedType.ENTITY_CLIENT_PRESENTED_TYPE_AUTHOR_ENTITY;
        }
        if (i != 4) {
            return null;
        }
        return EntityClientPresentedType.ENTITY_CLIENT_PRESENTED_TYPE_COLLECTION_ENTITY;
    }
}
