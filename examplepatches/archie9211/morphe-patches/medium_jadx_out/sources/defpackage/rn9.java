package defpackage;

import gen.model.PostResponseType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rn9 {
    public static PostResponseType a(int i) {
        if (i == 1) {
            return PostResponseType.LEGACY_RESPONSE;
        }
        if (i == 2) {
            return PostResponseType.STORY_RESPONSE;
        }
        if (i != 3) {
            return null;
        }
        return PostResponseType.SIMPLE_RESPONSE;
    }
}
