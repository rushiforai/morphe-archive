package defpackage;

import com.medium.proto.obv.post.SelectionPointType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class oxb {
    public static SelectionPointType a(int i) {
        if (i == 1) {
            return SelectionPointType.TEXT;
        }
        if (i == 2) {
            return SelectionPointType.MEDIA;
        }
        if (i != 3) {
            return null;
        }
        return SelectionPointType.SECTION;
    }
}
