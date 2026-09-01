package defpackage;

import com.medium.proto.model.PostQualityLabel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hl9 {
    public static PostQualityLabel a(int i) {
        switch (i) {
            case 0:
                return PostQualityLabel.POST_QUALITY_UNKNOWN;
            case 1:
                return PostQualityLabel.POST_QUALITY_MARQUEE;
            case 2:
                return PostQualityLabel.POST_QUALITY_FEATURED;
            case 3:
                return PostQualityLabel.POST_QUALITY_DISTRIBUTABLE;
            case 4:
                return PostQualityLabel.POST_QUALITY_HOST_ONLY;
            case 5:
                return PostQualityLabel.POST_QUALITY_SUSPENDED;
            case 6:
                return PostQualityLabel.POST_QUALITY_AVERAGE;
            default:
                return null;
        }
    }
}
