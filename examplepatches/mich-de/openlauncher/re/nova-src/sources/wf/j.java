package wf;

import ads_mobile_sdk.pd;
import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.google.android.gms.internal.measurement.ke;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import vk.b0;

/* loaded from: classes3.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final ArrayList f94334a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public static final Pattern f94335b = Pattern.compile("^mp4a\\.([a-zA-Z0-9]{2})(?:\\.([0-9]{1,2}))?$");

    public static int a(String str, String str2) {
        ke keVarD;
        str.getClass();
        switch (str) {
            case "audio/eac3-joc":
                return 18;
            case "audio/vnd.dts":
                return 7;
            case "audio/mp4a-latm":
                if (str2 == null || (keVarD = d(str2)) == null) {
                    return 0;
                }
                return keVarD.c();
            case "audio/ac3":
                return 5;
            case "audio/ac4":
                return 17;
            case "audio/eac3":
                return 6;
            case "audio/mpeg":
                return 9;
            case "audio/vnd.dts.hd":
                return 8;
            case "audio/true-hd":
                return 14;
            default:
                return 0;
        }
    }

    public static String b(String str) {
        ke keVarD;
        String strC = null;
        if (str != null) {
            String strS = b0.s(str.trim());
            if (strS.startsWith("avc1") || strS.startsWith("avc3")) {
                return "video/avc";
            }
            if (strS.startsWith("hev1") || strS.startsWith("hvc1")) {
                return "video/hevc";
            }
            if (strS.startsWith("dvav") || strS.startsWith("dva1") || strS.startsWith("dvhe") || strS.startsWith("dvh1")) {
                return "video/dolby-vision";
            }
            if (strS.startsWith("av01")) {
                return "video/av01";
            }
            if (strS.startsWith("vp9") || strS.startsWith("vp09")) {
                return "video/x-vnd.on2.vp9";
            }
            if (strS.startsWith("vp8") || strS.startsWith("vp08")) {
                return "video/x-vnd.on2.vp8";
            }
            if (strS.startsWith("mp4a")) {
                if (strS.startsWith("mp4a.") && (keVarD = d(strS)) != null) {
                    strC = c(keVarD.f32738b);
                }
                return strC == null ? "audio/mp4a-latm" : strC;
            }
            if (strS.startsWith("mha1")) {
                return "audio/mha1";
            }
            if (strS.startsWith("mhm1")) {
                return "audio/mhm1";
            }
            if (strS.startsWith("ac-3") || strS.startsWith("dac3")) {
                return "audio/ac3";
            }
            if (strS.startsWith("ec-3") || strS.startsWith("dec3")) {
                return "audio/eac3";
            }
            if (strS.startsWith("ec+3")) {
                return "audio/eac3-joc";
            }
            if (strS.startsWith("ac-4") || strS.startsWith("dac4")) {
                return "audio/ac4";
            }
            if (strS.startsWith("dtsc")) {
                return "audio/vnd.dts";
            }
            if (strS.startsWith("dtse")) {
                return "audio/vnd.dts.hd;profile=lbr";
            }
            if (strS.startsWith("dtsh") || strS.startsWith("dtsl")) {
                return "audio/vnd.dts.hd";
            }
            if (strS.startsWith("dtsx")) {
                return "audio/vnd.dts.uhd;profile=p2";
            }
            if (strS.startsWith("opus")) {
                return "audio/opus";
            }
            if (strS.startsWith("vorbis")) {
                return "audio/vorbis";
            }
            if (strS.startsWith("flac")) {
                return "audio/flac";
            }
            if (strS.startsWith("stpp")) {
                return "application/ttml+xml";
            }
            if (strS.startsWith("wvtt")) {
                return "text/vtt";
            }
            if (strS.contains("cea708")) {
                return "application/cea-708";
            }
            if (strS.contains("eia608") || strS.contains("cea608")) {
                return "application/cea-608";
            }
            ArrayList arrayList = f94334a;
            if (arrayList.size() > 0) {
                arrayList.get(0).getClass();
                throw new ClassCastException();
            }
        }
        return null;
    }

    public static String c(int i5) {
        if (i5 == 32) {
            return "video/mp4v-es";
        }
        if (i5 == 33) {
            return "video/avc";
        }
        if (i5 == 35) {
            return "video/hevc";
        }
        if (i5 == 64) {
            return "audio/mp4a-latm";
        }
        if (i5 == 163) {
            return "video/wvc1";
        }
        if (i5 == 177) {
            return "video/x-vnd.on2.vp9";
        }
        if (i5 == 165) {
            return "audio/ac3";
        }
        if (i5 == 166) {
            return "audio/eac3";
        }
        switch (i5) {
            case pd.A0 /* 96 */:
            case pd.H0 /* 97 */:
            case pd.Q0 /* 98 */:
            case pd.R0 /* 99 */:
            case 100:
            case 101:
                return "video/mpeg2";
            case 102:
            case 103:
            case 104:
                return "audio/mp4a-latm";
            case 105:
            case 107:
                return "audio/mpeg";
            case 106:
                return "video/mpeg";
            default:
                switch (i5) {
                    case 169:
                    case 172:
                        return "audio/vnd.dts";
                    case 170:
                    case 171:
                        return "audio/vnd.dts.hd";
                    case TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173 /* 173 */:
                        return "audio/opus";
                    case 174:
                        return "audio/ac4";
                    default:
                        return null;
                }
        }
    }

    public static ke d(String str) {
        Matcher matcher = f94335b.matcher(str);
        if (!matcher.matches()) {
            return null;
        }
        String strGroup = matcher.group(1);
        strGroup.getClass();
        String strGroup2 = matcher.group(2);
        try {
            return new ke(Integer.parseInt(strGroup, 16), strGroup2 != null ? Integer.parseInt(strGroup2) : 0, 9);
        } catch (NumberFormatException unused) {
            return null;
        }
    }

    public static String e(String str) {
        int iIndexOf;
        if (str == null || (iIndexOf = str.indexOf(47)) == -1) {
            return null;
        }
        return str.substring(0, iIndexOf);
    }

    public static int f(String str) {
        if (TextUtils.isEmpty(str)) {
            return -1;
        }
        if (g(str)) {
            return 1;
        }
        if (i(str)) {
            return 2;
        }
        if (h(str)) {
            return 3;
        }
        if ("image".equals(e(str))) {
            return 4;
        }
        if ("application/id3".equals(str) || "application/x-emsg".equals(str) || "application/x-scte35".equals(str)) {
            return 5;
        }
        if ("application/x-camera-motion".equals(str)) {
            return 6;
        }
        ArrayList arrayList = f94334a;
        if (arrayList.size() <= 0) {
            return -1;
        }
        arrayList.get(0).getClass();
        throw new ClassCastException();
    }

    public static boolean g(String str) {
        return "audio".equals(e(str));
    }

    public static boolean h(String str) {
        return "text".equals(e(str)) || "application/cea-608".equals(str) || "application/cea-708".equals(str) || "application/x-mp4-cea-608".equals(str) || "application/x-subrip".equals(str) || "application/ttml+xml".equals(str) || "application/x-quicktime-tx3g".equals(str) || "application/x-mp4-vtt".equals(str) || "application/x-rawcc".equals(str) || "application/vobsub".equals(str) || "application/pgs".equals(str) || "application/dvbsubs".equals(str);
    }

    public static boolean i(String str) {
        return "video".equals(e(str));
    }
}
