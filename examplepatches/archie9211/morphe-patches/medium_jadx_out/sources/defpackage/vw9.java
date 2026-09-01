package defpackage;

import com.medium.proto.event.PostViewedContext;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vw9 {
    public static PostViewedContext a(int i) {
        if (i == 1) {
            return PostViewedContext.STANDALONE;
        }
        if (i == 2) {
            return PostViewedContext.INLINE;
        }
        if (i != 3) {
            return null;
        }
        return PostViewedContext.STACK;
    }
}
