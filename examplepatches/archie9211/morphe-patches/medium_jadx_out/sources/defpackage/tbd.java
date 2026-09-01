package defpackage;

import gen.model.TagSource;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tbd {
    public static TagSource a(int i) {
        if (i == 1) {
            return TagSource.TAG_FOLLOWED;
        }
        if (i == 2) {
            return TagSource.TAG_FEATURED;
        }
        if (i != 3) {
            return null;
        }
        return TagSource.TAG_CURATED;
    }
}
