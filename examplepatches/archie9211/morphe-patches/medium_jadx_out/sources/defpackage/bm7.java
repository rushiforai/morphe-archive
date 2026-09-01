package defpackage;

import gen.model.MediaResourceDisplay;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class bm7 {
    public static MediaResourceDisplay a(int i) {
        if (i == 1) {
            return MediaResourceDisplay.DEFAULT;
        }
        if (i == 2) {
            return MediaResourceDisplay.THUMBNAIL;
        }
        if (i != 3) {
            return null;
        }
        return MediaResourceDisplay.CUSTOM;
    }
}
