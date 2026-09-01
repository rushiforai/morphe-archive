package defpackage;

import gen.model.LinkAlternateType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a07 {
    public static LinkAlternateType a(int i) {
        if (i == 1) {
            return LinkAlternateType.AMP;
        }
        if (i == 2) {
            return LinkAlternateType.IOS_APPLINK;
        }
        if (i != 3) {
            return null;
        }
        return LinkAlternateType.ANDROID_APPLINK;
    }
}
