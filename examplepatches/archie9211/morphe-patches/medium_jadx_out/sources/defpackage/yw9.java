package defpackage;

import gen.model.PostVisibility;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yw9 {
    public static PostVisibility a(int i) {
        if (i == 0) {
            return PostVisibility.PUBLIC;
        }
        if (i == 1) {
            return PostVisibility.UNLISTED;
        }
        if (i != 2) {
            return null;
        }
        return PostVisibility.LOCKED;
    }
}
