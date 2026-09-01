package defpackage;

import com.medium.proto.obv.post.SectionType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lvb {
    public static SectionType a(int i) {
        if (i == 0) {
            return SectionType.BODY;
        }
        if (i == 1) {
            return SectionType.COVER;
        }
        if (i != 2) {
            return null;
        }
        return SectionType.CARD;
    }
}
