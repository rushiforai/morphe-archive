package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.proto.obv.post.ColorType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qv1 {
    public static ColorType a(int i) {
        switch (i) {
            case 1:
                return ColorType.DEFAULT;
            case 2:
                return ColorType.BROOK;
            case 3:
                return ColorType.CRUSH;
            case 4:
                return ColorType.FRESH;
            case 5:
                return ColorType.GRAY;
            case 6:
                return ColorType.GRIMACE;
            case 7:
                return ColorType.LIME;
            case 8:
                return ColorType.LIPSTICK;
            case 9:
                return ColorType.MAGIC;
            case 10:
                return ColorType.MIDDAY;
            case 11:
                return ColorType.MIDNIGHT;
            case 12:
                return ColorType.SEAWEED;
            case 13:
                return ColorType.WARM;
            default:
                switch (i) {
                    case 102:
                        return ColorType.BROOK_LIGHT;
                    case 103:
                        return ColorType.CRUSH_LIGHT;
                    case 104:
                        return ColorType.FRESH_LIGHT;
                    case PanasonicMakernoteDirectory.TAG_COUNTRY /* 105 */:
                        return ColorType.GRAY_LIGHT;
                    case 106:
                        return ColorType.GRIMACE_LIGHT;
                    case 107:
                        return ColorType.LIME_LIGHT;
                    case 108:
                        return ColorType.LIPSTICK_LIGHT;
                    case 109:
                        return ColorType.MAGIC_LIGHT;
                    case 110:
                        return ColorType.MIDDAY_LIGHT;
                    case PanasonicMakernoteDirectory.TAG_LANDMARK /* 111 */:
                        return ColorType.MIDNIGHT_LIGHT;
                    case PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION /* 112 */:
                        return ColorType.SEAWEED_LIGHT;
                    case 113:
                        return ColorType.WARM_LIGHT;
                    default:
                        return null;
                }
        }
    }
}
