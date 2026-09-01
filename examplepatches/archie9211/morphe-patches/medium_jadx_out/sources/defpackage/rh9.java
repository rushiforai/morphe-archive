package defpackage;

import gen.model.PostListSource;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rh9 {
    public static PostListSource a(int i) {
        if (i == 1) {
            return PostListSource.LATEST;
        }
        if (i == 2) {
            return PostListSource.RECOMMENDED;
        }
        if (i == 3) {
            return PostListSource.FEATURED;
        }
        if (i != 4) {
            return null;
        }
        return PostListSource.TAGGED;
    }
}
