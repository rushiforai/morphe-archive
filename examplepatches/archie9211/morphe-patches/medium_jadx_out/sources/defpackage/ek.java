package defpackage;

import com.medium.proto.obv.post.AnchorType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ek {
    public static AnchorType a(int i) {
        if (i == 0) {
            return AnchorType.LINK;
        }
        if (i == 1) {
            return AnchorType.AUDIO;
        }
        if (i != 2) {
            return null;
        }
        return AnchorType.USER;
    }
}
