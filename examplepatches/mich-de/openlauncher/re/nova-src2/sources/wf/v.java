package wf;

import android.app.UiModeManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import androidx.recyclerview.widget.n0;
import b.c0;
import com.amplitude.core.events.Identify;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.AdError;
import com.google.android.gms.dynamite.descriptors.com.google.android.gms.measurement.dynamite.ModuleDescriptor;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;
import vk.b0;

/* loaded from: classes3.dex */
public abstract class v {

    /* renamed from: a, reason: collision with root package name */
    public static final int f94376a;

    /* renamed from: b, reason: collision with root package name */
    public static final String f94377b;

    /* renamed from: c, reason: collision with root package name */
    public static final String f94378c;

    /* renamed from: d, reason: collision with root package name */
    public static final String f94379d;

    /* renamed from: e, reason: collision with root package name */
    public static final String f94380e;

    /* renamed from: f, reason: collision with root package name */
    public static final byte[] f94381f;

    /* renamed from: g, reason: collision with root package name */
    public static final Pattern f94382g;

    /* renamed from: h, reason: collision with root package name */
    public static HashMap f94383h;

    /* renamed from: i, reason: collision with root package name */
    public static final String[] f94384i;

    /* renamed from: j, reason: collision with root package name */
    public static final String[] f94385j;

    /* renamed from: k, reason: collision with root package name */
    public static final int[] f94386k;

    /* renamed from: l, reason: collision with root package name */
    public static final int[] f94387l;

    static {
        int i5 = Build.VERSION.SDK_INT;
        f94376a = i5;
        String str = Build.DEVICE;
        f94377b = str;
        String str2 = Build.MANUFACTURER;
        f94378c = str2;
        String str3 = Build.MODEL;
        f94379d = str3;
        StringBuilder sb2 = new StringBuilder();
        sb2.append(str);
        sb2.append(", ");
        sb2.append(str3);
        sb2.append(", ");
        sb2.append(str2);
        f94380e = c0.p(sb2, ", ", i5);
        f94381f = new byte[0];
        Pattern.compile("(\\d\\d\\d\\d)\\-(\\d\\d)\\-(\\d\\d)[Tt](\\d\\d):(\\d\\d):(\\d\\d)([\\.,](\\d+))?([Zz]|((\\+|\\-)(\\d?\\d):?(\\d\\d)))?");
        Pattern.compile("^(-)?P(([0-9]*)Y)?(([0-9]*)M)?(([0-9]*)D)?(T(([0-9]*)H)?(([0-9]*)M)?(([0-9.]*)S)?)?$");
        Pattern.compile("%([A-Fa-f0-9]{2})");
        f94382g = Pattern.compile("(?:.*\\.)?isml?(?:/(manifest(.*))?)?", 2);
        f94384i = new String[]{"alb", "sq", "arm", "hy", "baq", "eu", "bur", "my", "tib", "bo", "chi", "zh", "cze", "cs", "dut", "nl", "ger", "de", "gre", "el", "fre", "fr", "geo", "ka", "ice", "is", "mac", "mk", "mao", "mi", "may", "ms", "per", "fa", "rum", "ro", "scc", "hbs-srp", "slo", "sk", "wel", "cy", "id", "ms-ind", "iw", "he", "heb", "he", "ji", "yi", "arb", "ar-arb", "in", "ms-ind", "ind", "ms-ind", "nb", "no-nob", "nob", "no-nob", "nn", "no-nno", "nno", "no-nno", "tw", "ak-twi", "twi", "ak-twi", "bs", "hbs-bos", "bos", "hbs-bos", "hr", "hbs-hrv", "hrv", "hbs-hrv", "sr", "hbs-srp", "srp", "hbs-srp", "cmn", "zh-cmn", "hak", "zh-hak", "nan", "zh-nan", "hsn", "zh-hsn"};
        f94385j = new String[]{"i-lux", "lb", "i-hak", "zh-hak", "i-navajo", "nv", "no-bok", "no-nob", "no-nyn", "no-nno", "zh-guoyu", "zh-cmn", "zh-hakka", "zh-hak", "zh-min-nan", "zh-nan", "zh-xiang", "zh-hsn"};
        f94386k = new int[]{0, 79764919, 159529838, 222504665, 319059676, 398814059, 445009330, 507990021, 638119352, 583659535, 797628118, 726387553, 890018660, 835552979, 1015980042, 944750013, 1276238704, 1221641927, 1167319070, 1095957929, 1595256236, 1540665371, 1452775106, 1381403509, 1780037320, 1859660671, 1671105958, 1733955601, 2031960084, 2111593891, 1889500026, 1952343757, -1742489888, -1662866601, -1851683442, -1788833735, -1960329156, -1880695413, -2103051438, -2040207643, -1104454824, -1159051537, -1213636554, -1284997759, -1389417084, -1444007885, -1532160278, -1603531939, -734892656, -789352409, -575645954, -646886583, -952755380, -1007220997, -827056094, -898286187, -231047128, -151282273, -71779514, -8804623, -515967244, -436212925, -390279782, -327299027, 881225847, 809987520, 1023691545, 969234094, 662832811, 591600412, 771767749, 717299826, 311336399, 374308984, 453813921, 533576470, 25881363, 88864420, 134795389, 214552010, 2023205639, 2086057648, 1897238633, 1976864222, 1804852699, 1867694188, 1645340341, 1724971778, 1587496639, 1516133128, 1461550545, 1406951526, 1302016099, 1230646740, 1142491917, 1087903418, -1398421865, -1469785312, -1524105735, -1578704818, -1079922613, -1151291908, -1239184603, -1293773166, -1968362705, -1905510760, -2094067647, -2014441994, -1716953613, -1654112188, -1876203875, -1796572374, -525066777, -462094256, -382327159, -302564546, -206542021, -143559028, -97365931, -17609246, -960696225, -1031934488, -817968335, -872425850, -709327229, -780559564, -600130067, -654598054, 1762451694, 1842216281, 1619975040, 1682949687, 2047383090, 2127137669, 1938468188, 2001449195, 1325665622, 1271206113, 1183200824, 1111960463, 1543535498, 1489069629, 1434599652, 1363369299, 622672798, 568075817, 748617968, 677256519, 907627842, 853037301, 1067152940, 995781531, 51762726, 131386257, 177728840, 240578815, 269590778, 349224269, 429104020, 491947555, -248556018, -168932423, -122852000, -60002089, -500490030, -420856475, -341238852, -278395381, -685261898, -739858943, -559578920, -630940305, -1004286614, -1058877219, -845023740, -916395085, -1119974018, -1174433591, -1262701040, -1333941337, -1371866206, -1426332139, -1481064244, -1552294533, -1690935098, -1611170447, -1833673816, -1770699233, -2009983462, -1930228819, -2119160460, -2056179517, 1569362073, 1498123566, 1409854455, 1355396672, 1317987909, 1246755826, 1192025387, 1137557660, 2072149281, 2135122070, 1912620623, 1992383480, 1753615357, 1816598090, 1627664531, 1707420964, 295390185, 358241886, 404320391, 483945776, 43990325, 106832002, 186451547, 266083308, 932423249, 861060070, 1041341759, 986742920, 613929101, 542559546, 756411363, 701822548, -978770311, -1050133554, -869589737, -924188512, -693284699, -764654318, -550540341, -605129092, -475935807, -413084042, -366743377, -287118056, -257573603, -194731862, -114850189, -35218492, -1984365303, -1921392450, -2143631769, -2063868976, -1698919467, -1635936670, -1824608069, -1744851700, -1347415887, -1418654458, -1506661409, -1561119128, -1129027987, -1200260134, -1254728445, -1309196108};
        f94387l = new int[]{0, 7, 14, 9, 28, 27, 18, 21, 56, 63, 54, 49, 36, 35, 42, 45, 112, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 108, 107, 98, 101, 72, 79, 70, 65, 84, 83, 90, 93, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, 231, 238, 233, 252, 251, 242, 245, Sdk.SDKError.Reason.AD_RESPONSE_INVALID_TEMPLATE_TYPE_VALUE, Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, Sdk.SDKError.Reason.INVALID_GZIP_BID_PAYLOAD_VALUE, Sdk.SDKError.Reason.INVALID_JSON_BID_PAYLOAD_VALUE, 196, 195, Sdk.SDKError.Reason.AD_CONSUMED_VALUE, Sdk.SDKError.Reason.AD_IS_PLAYING_VALUE, 144, 151, 158, 153, 140, 139, Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE, 168, 175, 166, 161, 180, 179, 186, 189, 199, 192, 201, Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE, Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, Sdk.SDKError.Reason.AD_RESPONSE_RETRY_AFTER_VALUE, Sdk.SDKError.Reason.INVALID_ADUNIT_BID_PAYLOAD_VALUE, Sdk.SDKError.Reason.AD_NOT_LOADED_VALUE, 255, 248, 241, 246, Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, 228, 237, 234, 183, 176, ModuleDescriptor.MODULE_VERSION, 190, 171, 172, 165, 162, 143, Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE, 147, 148, 157, 154, 39, 32, 41, 46, 59, 60, 53, 50, 31, 24, 17, 22, 3, 4, 13, 10, 87, 80, 89, 94, 75, 76, 69, 66, 111, 104, 97, 102, 115, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE, Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, 142, Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 128, 149, 146, 155, 156, 177, 182, 191, 184, TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 170, 163, 164, 249, 254, 247, 240, 229, Sdk.SDKError.Reason.PRIVACY_ICON_FALLBACK_ERROR_VALUE, 235, 236, 193, 198, Sdk.SDKError.Reason.PLACEMENT_AD_TYPE_MISMATCH_VALUE, 200, Sdk.SDKError.Reason.AD_LOAD_FAIL_RETRY_AFTER_VALUE, Sdk.SDKError.Reason.MRAID_JS_DOES_NOT_EXIST_VALUE, 211, Sdk.SDKError.Reason.PLACEMENT_SLEEP_VALUE, 105, 110, 103, 96, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, 114, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, 81, 86, 95, 88, 77, 74, 67, 68, 25, 30, 23, 16, 5, 2, 11, 12, 33, 38, 47, 40, 61, 58, 51, 52, 78, 73, 64, 71, 82, 85, 92, 91, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, 113, 120, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 106, 109, 100, 99, 62, 57, 48, 55, 34, 37, 44, 43, 6, 1, 8, 15, 26, 29, 20, 19, 174, 169, 160, 167, 178, 181, 188, 187, PerAppFeatureCatalog.MAX_TOOLS, 145, 152, 159, Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 141, Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE, Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE, Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE, Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE, Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE, Sdk.SDKError.Reason.AD_RESPONSE_EMPTY_VALUE, 194, 197, Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, Sdk.SDKError.Reason.AD_IS_LOADING_VALUE, 230, Sdk.SDKError.Reason.AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE, 232, 239, n0.DEFAULT_SWIPE_ANIMATION_DURATION, 253, 244, 243};
    }

    public static Object[] A(int i5, Object[] objArr) {
        a.e(i5 <= objArr.length);
        return Arrays.copyOf(objArr, i5);
    }

    public static void B(Handler handler, Runnable runnable) {
        if (handler.getLooper().getThread().isAlive()) {
            if (handler.getLooper() == Looper.myLooper()) {
                runnable.run();
            } else {
                handler.post(runnable);
            }
        }
    }

    public static Intent C(Context context, BroadcastReceiver broadcastReceiver, IntentFilter intentFilter) {
        return f94376a < 33 ? context.registerReceiver(broadcastReceiver, intentFilter) : context.registerReceiver(broadcastReceiver, intentFilter, 4);
    }

    public static long D(long j11, long j12, long j13) {
        if (j13 >= j12 && j13 % j12 == 0) {
            return j11 / (j13 / j12);
        }
        if (j13 < j12 && j12 % j13 == 0) {
            return (j12 / j13) * j11;
        }
        return (long) (j11 * (j12 / j13));
    }

    public static void E(long[] jArr, long j11) {
        int i5 = 0;
        if (j11 >= 1000000 && j11 % 1000000 == 0) {
            long j12 = j11 / 1000000;
            while (i5 < jArr.length) {
                jArr[i5] = jArr[i5] / j12;
                i5++;
            }
            return;
        }
        if (j11 >= 1000000 || 1000000 % j11 != 0) {
            double d5 = 1000000 / j11;
            while (i5 < jArr.length) {
                jArr[i5] = (long) (jArr[i5] * d5);
                i5++;
            }
            return;
        }
        long j13 = 1000000 / j11;
        while (i5 < jArr.length) {
            jArr[i5] = jArr[i5] * j13;
            i5++;
        }
    }

    public static long F(long j11) {
        return (j11 == -9223372036854775807L || j11 == Long.MIN_VALUE) ? j11 : j11 / 1000;
    }

    public static boolean a(Object obj, Object obj2) {
        return obj == null ? obj2 == null : obj.equals(obj2);
    }

    public static int b(long[] jArr, long j11, boolean z11) {
        int i5;
        int iBinarySearch = Arrays.binarySearch(jArr, j11);
        if (iBinarySearch < 0) {
            return ~iBinarySearch;
        }
        while (true) {
            i5 = iBinarySearch + 1;
            if (i5 >= jArr.length || jArr[i5] != j11) {
                break;
            }
            iBinarySearch = i5;
        }
        return z11 ? iBinarySearch : i5;
    }

    public static int c(ArrayList arrayList, Long l9, boolean z11) {
        int i5;
        int iBinarySearch = Collections.binarySearch(arrayList, l9);
        if (iBinarySearch < 0) {
            i5 = -(iBinarySearch + 2);
        } else {
            while (true) {
                int i11 = iBinarySearch - 1;
                if (i11 < 0 || ((Comparable) arrayList.get(i11)).compareTo(l9) != 0) {
                    break;
                }
                iBinarySearch = i11;
            }
            i5 = iBinarySearch;
        }
        return z11 ? Math.max(0, i5) : i5;
    }

    public static int d(int[] iArr, int i5, boolean z11, boolean z12) {
        int i11;
        int i12;
        int iBinarySearch = Arrays.binarySearch(iArr, i5);
        if (iBinarySearch < 0) {
            i12 = -(iBinarySearch + 2);
        } else {
            while (true) {
                i11 = iBinarySearch - 1;
                if (i11 < 0 || iArr[i11] != i5) {
                    break;
                }
                iBinarySearch = i11;
            }
            i12 = z11 ? iBinarySearch : i11;
        }
        return z12 ? Math.max(0, i12) : i12;
    }

    public static int e(long[] jArr, long j11, boolean z11) {
        int i5;
        int iBinarySearch = Arrays.binarySearch(jArr, j11);
        if (iBinarySearch < 0) {
            i5 = -(iBinarySearch + 2);
        } else {
            while (true) {
                int i11 = iBinarySearch - 1;
                if (i11 < 0 || jArr[i11] != j11) {
                    break;
                }
                iBinarySearch = i11;
            }
            i5 = iBinarySearch;
        }
        return z11 ? Math.max(0, i5) : i5;
    }

    public static int f(int i5, int i11) {
        return ((i5 + i11) - 1) / i11;
    }

    public static float g(float f11, float f12, float f13) {
        return Math.max(f12, Math.min(f11, f13));
    }

    public static int h(int i5, int i11, int i12) {
        return Math.max(i11, Math.min(i5, i12));
    }

    public static long i(long j11, long j12, long j13) {
        return Math.max(j12, Math.min(j11, j13));
    }

    public static Handler j(ea.a aVar) {
        Looper looperMyLooper = Looper.myLooper();
        a.j(looperMyLooper);
        return new Handler(looperMyLooper, aVar);
    }

    public static int k(int i5) {
        if (i5 == 12) {
            return 743676;
        }
        switch (i5) {
            case 1:
                return 4;
            case 2:
                return 12;
            case 3:
                return 28;
            case 4:
                return Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE;
            case 5:
                return Sdk.SDKError.Reason.AD_RESPONSE_RETRY_AFTER_VALUE;
            case 6:
                return 252;
            case 7:
                return 1276;
            case 8:
                return 6396;
            default:
                return 0;
        }
    }

    public static int l(int i5) {
        if (i5 == 2 || i5 == 4) {
            return 6005;
        }
        if (i5 == 10) {
            return 6004;
        }
        if (i5 == 7) {
            return 6005;
        }
        if (i5 == 8) {
            return AdError.AD_ASSETS_UNSUPPORTED_TYPE_ERROR_CODE;
        }
        switch (i5) {
            case 15:
                return AdError.AD_ASSETS_UNSUPPORTED_TYPE_ERROR_CODE;
            case 16:
            case 18:
                return 6005;
            case 17:
            case 19:
            case 20:
            case 21:
            case 22:
                return 6004;
            default:
                switch (i5) {
                    case 24:
                    case 25:
                    case 26:
                    case 27:
                    case 28:
                        return AdError.ICONVIEW_MISSING_ERROR_CODE;
                    default:
                        return 6006;
                }
        }
    }

    public static int m(String str) throws NumberFormatException {
        String[] strArrSplit;
        int length;
        int i5 = 0;
        if (str == null || (length = (strArrSplit = str.split("_", -1)).length) < 2) {
            return 0;
        }
        String str2 = strArrSplit[length - 1];
        boolean z11 = length >= 3 && "neg".equals(strArrSplit[length - 2]);
        try {
            str2.getClass();
            i5 = Integer.parseInt(str2);
            if (z11) {
                return -i5;
            }
        } catch (NumberFormatException unused) {
        }
        return i5;
    }

    public static long n(float f11, long j11) {
        return f11 == 1.0f ? j11 : Math.round(j11 * f11);
    }

    public static int o(int i5) {
        if (i5 == 8) {
            return 3;
        }
        if (i5 != 16) {
            return i5 != 24 ? i5 != 32 ? 0 : 805306368 : SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING;
        }
        return 2;
    }

    public static int p(int i5, int i11) {
        if (i5 != 2) {
            if (i5 == 3) {
                return i11;
            }
            if (i5 != 4) {
                if (i5 != 268435456) {
                    if (i5 == 536870912) {
                        return i11 * 3;
                    }
                    if (i5 != 805306368) {
                        throw new IllegalArgumentException();
                    }
                }
            }
            return i11 * 4;
        }
        return i11 * 2;
    }

    public static int q(int i5) {
        if (i5 == 13) {
            return 1;
        }
        switch (i5) {
            case 2:
                return 0;
            case 3:
                return 8;
            case 4:
                return 4;
            case 5:
            case 7:
            case 8:
            case 9:
            case 10:
                return 5;
            case 6:
                return 2;
            default:
                return 3;
        }
    }

    public static String r(StringBuilder sb2, Formatter formatter, long j11) {
        if (j11 == -9223372036854775807L) {
            j11 = 0;
        }
        String str = j11 < 0 ? Identify.UNSET_VALUE : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        long jAbs = (Math.abs(j11) + 500) / 1000;
        long j12 = jAbs % 60;
        long j13 = (jAbs / 60) % 60;
        long j14 = jAbs / com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40328b;
        sb2.setLength(0);
        return j14 > 0 ? formatter.format("%s%d:%02d:%02d", str, Long.valueOf(j14), Long.valueOf(j13), Long.valueOf(j12)).toString() : formatter.format("%s%02d:%02d", str, Long.valueOf(j13), Long.valueOf(j12)).toString();
    }

    public static String s(String str) throws ClassNotFoundException {
        try {
            Class<?> cls = Class.forName("android.os.SystemProperties");
            return (String) cls.getMethod("get", String.class).invoke(cls, str);
        } catch (Exception e3) {
            a.p("Util", "Failed to read system property ".concat(str), e3);
            return null;
        }
    }

    public static String t(int i5) {
        switch (i5) {
            case -2:
                return "none";
            case -1:
                return "unknown";
            case 0:
                return CarrierConfigurator.APN_TYPE;
            case 1:
                return "audio";
            case 2:
                return "video";
            case 3:
                return "text";
            case 4:
                return "image";
            case 5:
                return "metadata";
            case 6:
                return "camera motion";
            default:
                return i5 >= 10000 ? c0.i(i5, "custom (", ")") : "?";
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:28:0x005d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int u(Uri uri) {
        int i5;
        char c11;
        String scheme = uri.getScheme();
        char c12 = 3;
        if (scheme != null) {
            if ("rtsp" != scheme) {
                if (4 == scheme.length()) {
                    for (int i11 = 0; i11 < 4; i11++) {
                        if ("rtsp".charAt(i11) == scheme.charAt(i11) || ((c11 = (char) ((r6 | ' ') - 97)) < 26 && c11 == ((char) ((r7 | ' ') - 97)))) {
                        }
                    }
                }
            }
            return 3;
        }
        String lastPathSegment = uri.getLastPathSegment();
        if (lastPathSegment != null) {
            int iLastIndexOf = lastPathSegment.lastIndexOf(46);
            if (iLastIndexOf >= 0) {
                String strS = b0.s(lastPathSegment.substring(iLastIndexOf + 1));
                strS.getClass();
                switch (strS.hashCode()) {
                    case 104579:
                        if (strS.equals("ism")) {
                            c12 = 0;
                            break;
                        } else {
                            c12 = 65535;
                            break;
                        }
                    case 108321:
                        if (strS.equals("mpd")) {
                            c12 = 1;
                            break;
                        }
                        break;
                    case 3242057:
                        if (strS.equals("isml")) {
                            c12 = 2;
                            break;
                        }
                        break;
                    case 3299913:
                        if (!strS.equals("m3u8")) {
                        }
                        break;
                }
                switch (c12) {
                    case 0:
                    case 2:
                        i5 = 1;
                        break;
                    case 1:
                        i5 = 0;
                        break;
                    case 3:
                        i5 = 2;
                        break;
                    default:
                        i5 = 4;
                        break;
                }
                if (i5 != 4) {
                    return i5;
                }
            }
            String path = uri.getPath();
            path.getClass();
            Matcher matcher = f94382g.matcher(path);
            if (matcher.matches()) {
                String strGroup = matcher.group(2);
                if (strGroup != null) {
                    if (strGroup.contains("format=mpd-time-csf")) {
                        return 0;
                    }
                    if (strGroup.contains("format=m3u8-aapl")) {
                        return 2;
                    }
                }
                return 1;
            }
        }
        return 4;
    }

    public static boolean v(com.google.android.gms.internal.consent_sdk.a aVar, com.google.android.gms.internal.consent_sdk.a aVar2, Inflater inflater) {
        if (aVar.g() <= 0) {
            return false;
        }
        if (((byte[]) aVar2.f31986d).length < aVar.g()) {
            aVar2.p(aVar.g() * 2);
        }
        if (inflater == null) {
            inflater = new Inflater();
        }
        inflater.setInput((byte[]) aVar.f31986d, aVar.f31984b, aVar.g());
        int iInflate = 0;
        while (true) {
            try {
                byte[] bArr = (byte[]) aVar2.f31986d;
                iInflate += inflater.inflate(bArr, iInflate, bArr.length - iInflate);
                if (!inflater.finished()) {
                    if (inflater.needsDictionary() || inflater.needsInput()) {
                        break;
                    }
                    byte[] bArr2 = (byte[]) aVar2.f31986d;
                    if (iInflate == bArr2.length) {
                        aVar2.p(bArr2.length * 2);
                    }
                } else {
                    aVar2.X(iInflate);
                    inflater.reset();
                    return true;
                }
            } catch (DataFormatException unused) {
                return false;
            } finally {
                inflater.reset();
            }
        }
        return false;
    }

    public static boolean w(int i5) {
        return i5 == 3 || i5 == 2 || i5 == 268435456 || i5 == 536870912 || i5 == 805306368 || i5 == 4;
    }

    public static boolean x(Context context) {
        UiModeManager uiModeManager = (UiModeManager) context.getApplicationContext().getSystemService("uimode");
        return uiModeManager != null && uiModeManager.getCurrentModeType() == 4;
    }

    public static long y(long j11) {
        return (j11 == -9223372036854775807L || j11 == Long.MIN_VALUE) ? j11 : j11 * 1000;
    }

    public static String z(String str) throws MissingResourceException {
        if (str == null) {
            return null;
        }
        String strReplace = str.replace('_', '-');
        if (!strReplace.isEmpty() && !strReplace.equals("und")) {
            str = strReplace;
        }
        String strS = b0.s(str);
        int i5 = 0;
        String str2 = strS.split(Identify.UNSET_VALUE, 2)[0];
        if (f94383h == null) {
            String[] iSOLanguages = Locale.getISOLanguages();
            int length = iSOLanguages.length;
            String[] strArr = f94384i;
            HashMap map = new HashMap(length + strArr.length);
            for (String str3 : iSOLanguages) {
                try {
                    String iSO3Language = new Locale(str3).getISO3Language();
                    if (!TextUtils.isEmpty(iSO3Language)) {
                        map.put(iSO3Language, str3);
                    }
                } catch (MissingResourceException unused) {
                }
            }
            for (int i11 = 0; i11 < strArr.length; i11 += 2) {
                map.put(strArr[i11], strArr[i11 + 1]);
            }
            f94383h = map;
        }
        String str4 = (String) f94383h.get(str2);
        if (str4 != null) {
            StringBuilder sbQ = a2.c.q(str4);
            sbQ.append(strS.substring(str2.length()));
            strS = sbQ.toString();
            str2 = str4;
        }
        if (!"no".equals(str2) && !"i".equals(str2) && !"zh".equals(str2)) {
            return strS;
        }
        while (true) {
            String[] strArr2 = f94385j;
            if (i5 >= strArr2.length) {
                return strS;
            }
            if (strS.startsWith(strArr2[i5])) {
                return strArr2[i5 + 1] + strS.substring(strArr2[i5].length());
            }
            i5 += 2;
        }
    }
}
