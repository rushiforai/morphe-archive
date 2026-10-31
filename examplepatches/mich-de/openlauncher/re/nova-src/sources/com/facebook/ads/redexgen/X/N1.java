package com.facebook.ads.redexgen.X;

import android.app.UiModeManager;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.DatabaseUtils;
import android.graphics.Point;
import android.hardware.display.DisplayManager;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcel;
import android.text.TextUtils;
import android.view.Display;
import android.view.WindowManager;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.AdError;
import com.google.android.gms.dynamite.descriptors.com.google.android.gms.measurement.dynamite.ModuleDescriptor;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;
import org.checkerframework.checker.nullness.qual.EnsuresNonNull;

/* loaded from: assets/audience_network/classes.dex */
public abstract class N1 {
    public static byte[] A00;
    public static String[] A01 = {"ftnJo", "BynIpPAUAWNC9vNvoGThiUa", "hBNCZiQ8pPYwFmFGGwUpo3kbD1DIJkte", "CFFBIyqcTfOPsOJkY34yk7xBRpee2llJ", "WyKvmg", "0OoP7F8ypt8wKb3f2EMp4cxc0Uhq7YEe", "cQVi1nKw8fYdEukIjOECqxoouxAZ5vMw", "WbqCp6jhj9T332ydBe"};
    public static final int A02;
    public static final String A03;
    public static final String A04;
    public static final String A05;
    public static final String A06;
    public static final byte[] A07;
    public static final Pattern A08;
    public static final Pattern A09;
    public static final Pattern A0A;
    public static final Pattern A0B;
    public static final int[] A0C;
    public static final int[] A0D;

    public static String A0i(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 124);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0v() {
        A00 = new byte[]{-66, -58, -22, 7, 12, 19, 22, -39, -33, 12, 2, 16, 13, 7, 2, -66, -49, -46, 5, -21, -41, -16, 11, -41, 16, -38, -41, -29, 7, 37, -36, 39, -45, -59, -36, -41, -53, -57, -7, -53, -58, -36, 6, 16, 10, 9, -36, -59, -36, -41, -52, -59, 10, -2, 11, 6, 3, 2, 16, 17, -59, -53, -57, -58, -58, -36, -58, -36, 9, 61, 69, 61, 69, 61, 69, 61, 69, 10, 61, 14, 9, 61, 69, 61, 69, 10, 61, 14, 9, 61, 69, 61, 69, 10, 60, 53, 85, 62, 9, 61, 69, 61, 69, 10, 27, 9, 61, 69, 61, 69, 10, 27, 9, 61, 69, 61, 69, 10, 9, 60, 61, 15, 13, 62, 9, 61, 69, 12, 10, 10, 32, 9, 60, 59, 91, 62, 93, 9, 9, 61, 12, 93, 61, 14, 10, 9, 61, 69, 32, 61, 69, 10, 27, 32, 9, 61, 69, 61, 69, 10, 10, 10, 32, -52, -61, -65, -17, -29, -57, -67, 25, 41, 24, 45, 32, 24, 54, 105, 96, 65, 93, 82, 106, 86, 99, 61, 90, 83, 32, 35, 31, 41, 31, 34, 17, 44, 52, 55, 48, 47, -21, 63, 58, -21, 61, 48, 44, 47, -21, 62, 68, 62, 63, 48, 56, -21, 59, 61, 58, 59, 48, 61, 63, 68, -21, 31, 68, 76, 55, 66, 63, 58, -10, 58, 63, 73, 70, 66, 55, 79, -10, 73, 63, 80, 59, 16, -10, 67, 68, 2, 3, 19, -7, 12, -9, -7, -7, -8, 7, 19, -9, -11, 4, -11, -10, -3, 0, -3, 8, -3, -7, 7, -26, -25, -9, -19, -26, -21, -19, -24, -24, -25, -22, -20, -35, -36, -9, -36, -22, -27, -32, -31, -15, -25, -32, -27, -25, -30, -30, -31, -28, -26, -41, -42, -15, -26, -21, -30, -41, 46, 74, 73, 84, 59, 90, 79, 82, 53, 33, 47, 29, -25, -20, -24, -2, 15, -25, -25, 26, -17, -20, -8, 28, -23, -24, 24, -24, -2, -25, -25, 26, -17, -20, -8, 28, -23, -24, 12, -24, -2, -25, -25, 26, -17, -20, -8, 28, -23, -24, 3, -24, -2, -25, 19, -25, -25, 26, -17, -20, -8, 28, -23, -24, 7, -24, -2, -25, -25, 26, -17, -20, -8, 28, -23, -24, 12, -24, -2, -25, -25, 26, -17, -20, -8, -19, 28, -23, -24, 18, -24, -2, -24, -2, -29, 89, 102, 92, 106, 103, 97, 92, 38, 96, 89, 106, 92, 111, 89, 106, 93, 38, 108, 113, 104, 93, 38, 89, 109, 108, 103, 101, 103, 108, 97, 110, 93, 7, 20, 10, 24, 21, 15, 10, -44, 21, 25, -44, -7, 31, 25, 26, 11, 19, -10, 24, 21, 22, 11, 24, 26, 15, 11, 25, 84, 99, 99, 95, 92, 86, 84, 103, 92, 98, 97, 34, 87, 84, 102, 91, 30, 107, 96, 95, 65, 80, 80, 76, 73, 67, 65, 84, 73, 79, 78, 15, 86, 78, 68, 14, 77, 83, 13, 83, 83, 84, 82, 11, 88, 77, 76, 52, 67, 67, 63, 60, 54, 52, 71, 60, 66, 65, 2, 75, 0, 64, 67, 56, 58, 40, 37, 31, 31, 46, 46, 42, 39, 33, 31, 50, 39, 45, 44, -19, 54, -21, 48, 50, 49, 46, 44, 56, 54, -9, 60, 56, 55, 66, -9, 45, 61, 63, -9, 49, 42, 59, 45, 64, 42, 59, 46, -9, 57, 42, 55, 46, 53, -9, 58, 47, 49, 45, 77, 82, 92, 89, 85, 74, 98, -4, -1, 2, -5, 77, 86, 89, 84, 72, 91, 36, 84, 26, 92, 31, 20, 72, 72, 87, 83, -16, -7, -4, -9, -21, -2, -57, -9, -6, -18, -73, -2, -13, -9, -17, -73, -19, -3, -16, 64, 62, 77, 62, 72, 66, 66, 76, 70, 69, -3, -61, 5, -56, 37, 40, 28, -12, -10, -11, -14, -11, -13, -18, -21, -10, -25, -31, -17, -29, -11, -10, -25, -12, -12, -6, -12, -81, -27, -22, -12, -15, -19, -30, -6, -82, -12, -22, -5, -26, 109, 91, 101, 88, 103, 90, 102, 94, 25, 54, 25, 56, 66, 54, 58, 60, 49, 50, 9, -8, 1, -9, 2, 5, -63, -9, -4, 6, 3, -1, -12, 12, -64, 6, -4, 13, -8, 69, 55, 60, 50, 61, 69, 10};
    }

    static {
        A0v();
        A02 = Build.VERSION.SDK_INT;
        A03 = Build.DEVICE;
        A05 = Build.MANUFACTURER;
        A06 = Build.MODEL;
        StringBuilder sbAppend = new StringBuilder().append(A03);
        String strA0i = A0i(166, 2, 71);
        A04 = sbAppend.append(strA0i).append(A06).append(strA0i).append(A05).append(strA0i).append(A02).toString();
        A07 = new byte[0];
        A0A = Pattern.compile(A0i(68, 95, 101));
        A0B = Pattern.compile(A0i(Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 84, 67));
        A08 = Pattern.compile(A0i(16, 17, 46));
        A09 = Pattern.compile(A0i(33, 35, 33), 2);
        A0C = new int[]{0, 79764919, 159529838, 222504665, 319059676, 398814059, 445009330, 507990021, 638119352, 583659535, 797628118, 726387553, 890018660, 835552979, 1015980042, 944750013, 1276238704, 1221641927, 1167319070, 1095957929, 1595256236, 1540665371, 1452775106, 1381403509, 1780037320, 1859660671, 1671105958, 1733955601, 2031960084, 2111593891, 1889500026, 1952343757, -1742489888, -1662866601, -1851683442, -1788833735, -1960329156, -1880695413, -2103051438, -2040207643, -1104454824, -1159051537, -1213636554, -1284997759, -1389417084, -1444007885, -1532160278, -1603531939, -734892656, -789352409, -575645954, -646886583, -952755380, -1007220997, -827056094, -898286187, -231047128, -151282273, -71779514, -8804623, -515967244, -436212925, -390279782, -327299027, 881225847, 809987520, 1023691545, 969234094, 662832811, 591600412, 771767749, 717299826, 311336399, 374308984, 453813921, 533576470, 25881363, 88864420, 134795389, 214552010, 2023205639, 2086057648, 1897238633, 1976864222, 1804852699, 1867694188, 1645340341, 1724971778, 1587496639, 1516133128, 1461550545, 1406951526, 1302016099, 1230646740, 1142491917, 1087903418, -1398421865, -1469785312, -1524105735, -1578704818, -1079922613, -1151291908, -1239184603, -1293773166, -1968362705, -1905510760, -2094067647, -2014441994, -1716953613, -1654112188, -1876203875, -1796572374, -525066777, -462094256, -382327159, -302564546, -206542021, -143559028, -97365931, -17609246, -960696225, -1031934488, -817968335, -872425850, -709327229, -780559564, -600130067, -654598054, 1762451694, 1842216281, 1619975040, 1682949687, 2047383090, 2127137669, 1938468188, 2001449195, 1325665622, 1271206113, 1183200824, 1111960463, 1543535498, 1489069629, 1434599652, 1363369299, 622672798, 568075817, 748617968, 677256519, 907627842, 853037301, 1067152940, 995781531, 51762726, 131386257, 177728840, 240578815, 269590778, 349224269, 429104020, 491947555, -248556018, -168932423, -122852000, -60002089, -500490030, -420856475, -341238852, -278395381, -685261898, -739858943, -559578920, -630940305, -1004286614, -1058877219, -845023740, -916395085, -1119974018, -1174433591, -1262701040, -1333941337, -1371866206, -1426332139, -1481064244, -1552294533, -1690935098, -1611170447, -1833673816, -1770699233, -2009983462, -1930228819, -2119160460, -2056179517, 1569362073, 1498123566, 1409854455, 1355396672, 1317987909, 1246755826, 1192025387, 1137557660, 2072149281, 2135122070, 1912620623, 1992383480, 1753615357, 1816598090, 1627664531, 1707420964, 295390185, 358241886, 404320391, 483945776, 43990325, 106832002, 186451547, 266083308, 932423249, 861060070, 1041341759, 986742920, 613929101, 542559546, 756411363, 701822548, -978770311, -1050133554, -869589737, -924188512, -693284699, -764654318, -550540341, -605129092, -475935807, -413084042, -366743377, -287118056, -257573603, -194731862, -114850189, -35218492, -1984365303, -1921392450, -2143631769, -2063868976, -1698919467, -1635936670, -1824608069, -1744851700, -1347415887, -1418654458, -1506661409, -1561119128, -1129027987, -1200260134, -1254728445, -1309196108};
        A0D = new int[]{0, 7, 14, 9, 28, 27, 18, 21, 56, 63, 54, 49, 36, 35, 42, 45, 112, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE, Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 108, 107, 98, 101, 72, 79, 70, 65, 84, 83, 90, 93, Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE, 231, 238, 233, 252, 251, 242, 245, Sdk.SDKError.Reason.AD_RESPONSE_INVALID_TEMPLATE_TYPE_VALUE, Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, Sdk.SDKError.Reason.INVALID_GZIP_BID_PAYLOAD_VALUE, Sdk.SDKError.Reason.INVALID_JSON_BID_PAYLOAD_VALUE, 196, 195, Sdk.SDKError.Reason.AD_CONSUMED_VALUE, Sdk.SDKError.Reason.AD_IS_PLAYING_VALUE, 144, 151, 158, 153, 140, 139, Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE, 168, 175, 166, 161, 180, 179, 186, 189, 199, 192, 201, Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE, Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, Sdk.SDKError.Reason.AD_RESPONSE_RETRY_AFTER_VALUE, Sdk.SDKError.Reason.INVALID_ADUNIT_BID_PAYLOAD_VALUE, Sdk.SDKError.Reason.AD_NOT_LOADED_VALUE, 255, 248, 241, 246, Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE, 228, 237, 234, 183, 176, ModuleDescriptor.MODULE_VERSION, 190, 171, 172, 165, 162, 143, Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE, 147, 148, 157, 154, 39, 32, 41, 46, 59, 60, 53, 50, 31, 24, 17, 22, 3, 4, 13, 10, 87, 80, 89, 94, 75, 76, 69, 66, 111, 104, 97, 102, 115, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE, Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, 142, Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 128, 149, 146, 155, 156, 177, 182, 191, 184, TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 170, 163, 164, 249, 254, 247, 240, 229, Sdk.SDKError.Reason.PRIVACY_ICON_FALLBACK_ERROR_VALUE, 235, 236, 193, 198, Sdk.SDKError.Reason.PLACEMENT_AD_TYPE_MISMATCH_VALUE, 200, Sdk.SDKError.Reason.AD_LOAD_FAIL_RETRY_AFTER_VALUE, Sdk.SDKError.Reason.MRAID_JS_DOES_NOT_EXIST_VALUE, 211, Sdk.SDKError.Reason.PLACEMENT_SLEEP_VALUE, 105, 110, 103, 96, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, 114, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, 81, 86, 95, 88, 77, 74, 67, 68, 25, 30, 23, 16, 5, 2, 11, 12, 33, 38, 47, 40, 61, 58, 51, 52, 78, 73, 64, 71, 82, 85, 92, 91, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, 113, 120, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 106, 109, 100, 99, 62, 57, 48, 55, 34, 37, 44, 43, 6, 1, 8, 15, 26, 29, 20, 19, 174, 169, 160, 167, 178, 181, 188, 187, PerAppFeatureCatalog.MAX_TOOLS, 145, 152, 159, Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 141, Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE, Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE, Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE, Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE, Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE, Sdk.SDKError.Reason.AD_RESPONSE_EMPTY_VALUE, 194, 197, Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE, Sdk.SDKError.Reason.AD_IS_LOADING_VALUE, 230, Sdk.SDKError.Reason.AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE, 232, 239, androidx.recyclerview.widget.n0.DEFAULT_SWIPE_ANIMATION_DURATION, 253, 244, 243};
    }

    public static float A00(float f11, float f12, float f13) {
        return Math.max(f12, Math.min(f11, f13));
    }

    public static int A01(int i5) {
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
                return (A02 < 23 && A02 < 21) ? 0 : 6396;
            case 9:
            case 10:
            case 11:
            default:
                return 0;
            case 12:
                if (A02 < 32) {
                    return 0;
                }
                return 743676;
        }
    }

    public static int A02(int i5) {
        switch (i5) {
            case 2:
            case 4:
            case 7:
            case 16:
            case 18:
                return 6005;
            case 3:
            case 5:
            case 6:
            case 9:
            case 11:
            case 12:
            case 13:
            case 14:
            case 23:
            default:
                return 6006;
            case 8:
            case 15:
                return AdError.AD_ASSETS_UNSUPPORTED_TYPE_ERROR_CODE;
            case 10:
            case 17:
            case 19:
            case 20:
            case 21:
            case 22:
                if (A01[0].length() != 5) {
                    throw new RuntimeException();
                }
                String[] strArr = A01;
                strArr[6] = "AduuIcDI3CffM3budxLbGOKrOabw9jZM";
                strArr[2] = "yrMjrPGNcPCwwzmlUu1PQIlrttgbg4ML";
                return 6004;
            case 24:
            case 25:
            case 26:
            case 27:
            case 28:
                return AdError.ICONVIEW_MISSING_ERROR_CODE;
        }
    }

    public static int A03(int i5) {
        switch (i5) {
            case 8:
                return 3;
            case 16:
                return 2;
            case 24:
                return SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING;
            case 32:
                return 805306368;
            default:
                if (A01[1].length() != 23) {
                    throw new RuntimeException();
                }
                String[] strArr = A01;
                strArr[6] = "Mh3VTlDikinCdh86IfpmIik7a4I52LRL";
                strArr[2] = "8PSwQythrgPqMLvamE7YklspZb2tPoE0";
                return 0;
        }
    }

    public static int A04(int i5) {
        switch (i5) {
            case 1:
            case 12:
            case 14:
                return 3;
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
            case 11:
            default:
                return 3;
            case 13:
                String[] strArr = A01;
                if (strArr[5].charAt(22) != strArr[3].charAt(22)) {
                    throw new RuntimeException();
                }
                A01[1] = "Q1JFhLiK0gDjVnYZIaoXwHI";
                return 1;
        }
    }

    public static int A05(int i5, int i11) {
        return ((i5 + i11) - 1) / i11;
    }

    public static int A06(int i5, int i11) {
        switch (i5) {
            case 2:
            case 268435456:
                return i11 * 2;
            case 3:
                return i11;
            case 4:
            case 805306368:
                return i11 * 4;
            case SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING /* 536870912 */:
                return i11 * 3;
            default:
                throw new IllegalArgumentException();
        }
    }

    public static int A07(int i5, int i11, int i12) {
        return Math.max(i11, Math.min(i5, i12));
    }

    public static int A08(long j11, long j12) {
        if (j11 < j12) {
            return -1;
        }
        return j11 == j12 ? 0 : 1;
    }

    public static int A09(Context context, String str, boolean z11) {
        if (A02 < 29 || context.getApplicationContext().getApplicationInfo().targetSdkVersion < 29) {
            return 1;
        }
        return 5;
    }

    public static int A0A(Uri uri) {
        String scheme = uri.getScheme();
        if (scheme != null) {
            String scheme2 = A0i(644, 4, 6);
            if (XC.A03(scheme2, scheme)) {
                return 3;
            }
        }
        String lastPathSegment = uri.getLastPathSegment();
        if (lastPathSegment == null) {
            return 4;
        }
        int iLastIndexOf = lastPathSegment.lastIndexOf(46);
        if (iLastIndexOf >= 0) {
            String scheme3 = lastPathSegment.substring(iLastIndexOf + 1);
            int iA0E = A0E(scheme3);
            if (iA0E != 4) {
                return iA0E;
            }
        }
        Pattern pattern = A09;
        String scheme4 = uri.getPath();
        Matcher matcher = pattern.matcher((CharSequence) AbstractC1062Ln.A01(scheme4));
        if (!matcher.matches()) {
            return 4;
        }
        String strGroup = matcher.group(2);
        if (strGroup == null) {
            return 1;
        }
        String[] strArr = A01;
        if (strArr[6].charAt(24) == strArr[2].charAt(24)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[5] = "vt9nzqRqbYOZnTbDpNcNBsxU2qzn4ZXI";
        strArr2[3] = "kzzWq8blLLASsracN65mGfxWPTxDMvzO";
        String scheme5 = A0i(608, 19, 14);
        if (strGroup.contains(scheme5)) {
            return 0;
        }
        String scheme6 = A0i(592, 16, 107);
        if (strGroup.contains(scheme6)) {
            return 2;
        }
        return 1;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:11:0x002c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A0B(Uri uri, String str) {
        char c11;
        if (str == null) {
            return A0A(uri);
        }
        int iHashCode = str.hashCode();
        if (A01[1].length() != 23) {
            throw new RuntimeException();
        }
        A01[1] = "iQgCl2ZJ955S3US5WhZgCR8";
        switch (iHashCode) {
            case -979127466:
                if (!str.equals(A0i(510, 21, 87))) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 1;
                    break;
                }
            case -156749520:
                if (str.equals(A0i(483, 27, 100))) {
                    c11 = 2;
                    break;
                }
                break;
            case 64194685:
                if (str.equals(A0i(463, 20, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE))) {
                    c11 = 0;
                    break;
                }
                break;
            case 1154777587:
                if (str.equals(A0i(531, 18, 66))) {
                    c11 = 3;
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
                return 0;
            case 1:
                return 2;
            case 2:
                return 1;
            case 3:
                return 3;
            default:
                return 4;
        }
    }

    public static int A0C(MW mw2, long j11, boolean z11, boolean z12) {
        int i5 = 0;
        int lowIndex = mw2.A02();
        int i11 = lowIndex - 1;
        while (i5 <= i11) {
            int lowIndex2 = i5 + i11;
            int i12 = lowIndex2 >>> 1;
            if (mw2.A03(i12) < j11) {
                i5 = i12 + 1;
            } else {
                i11 = i12 - 1;
            }
        }
        if (z11) {
            int highIndex = i11 + 1;
            int lowIndex3 = mw2.A02();
            if (highIndex < lowIndex3) {
                int lowIndex4 = i11 + 1;
                if (mw2.A03(lowIndex4) == j11) {
                    return i11 + 1;
                }
            }
        }
        if (!z12 || i11 != -1) {
            return i11;
        }
        return 0;
    }

    public static int A0D(String str) {
        int length = str.length();
        AbstractC1062Ln.A07(length <= 4);
        String[] strArr = A01;
        String str2 = strArr[5];
        String str3 = strArr[3];
        int iCharAt = str2.charAt(22);
        int length2 = str3.charAt(22);
        if (iCharAt != length2) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[4] = "RF7FEp";
        strArr2[7] = "xMxJLhKfzCETVVVRn8";
        int i5 = 0;
        for (int length3 = 0; length3 < length; length3++) {
            int result = str.charAt(length3);
            i5 = (i5 << 8) | result;
        }
        return i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0078 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0079 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:24:0x007a A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:6:0x0012 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A0E(String str) {
        char c11;
        String strA01 = XC.A01(str);
        switch (strA01.hashCode()) {
            case 104579:
                if (strA01.equals(A0i(630, 3, 89))) {
                    c11 = 2;
                }
                switch (c11) {
                    case 0:
                        return 0;
                    case 1:
                        return 2;
                    case 2:
                    case 3:
                        return 1;
                    default:
                        return 4;
                }
            case 108321:
                if (strA01.equals(A0i(641, 3, 60))) {
                    c11 = 0;
                }
                switch (c11) {
                }
            case 3242057:
                if (strA01.equals(A0i(633, 4, 93))) {
                    c11 = 3;
                }
                switch (c11) {
                }
            case 3299913:
                String[] strArr = A01;
                if (strArr[6].charAt(24) != strArr[2].charAt(24)) {
                    String[] strArr2 = A01;
                    strArr2[4] = "hoNUFz";
                    strArr2[7] = "qYE4hZbDowsiAmeDMQ";
                    if (strA01.equals(A0i(637, 4, 20))) {
                        c11 = 1;
                    }
                    switch (c11) {
                    }
                } else {
                    throw new RuntimeException();
                }
        }
        c11 = 65535;
        switch (c11) {
        }
    }

    public static int A0F(ByteBuffer byteBuffer, int i5) {
        int i11 = byteBuffer.getInt(i5);
        return byteBuffer.order() == ByteOrder.BIG_ENDIAN ? i11 : Integer.reverseBytes(i11);
    }

    public static <T extends Comparable<? super T>> int A0G(List<? extends Comparable<? super T>> list, T value, boolean z11, boolean z12) {
        int index;
        int iBinarySearch = Collections.binarySearch(list, value);
        if (iBinarySearch < 0) {
            iBinarySearch = ~iBinarySearch;
        } else {
            int listSize = list.size();
            do {
                iBinarySearch++;
                if (iBinarySearch >= listSize) {
                    break;
                }
                index = list.get(iBinarySearch).compareTo(value);
            } while (index == 0);
            if (z11) {
                iBinarySearch--;
            }
        }
        if (!z12) {
            return iBinarySearch;
        }
        int index2 = list.size();
        return Math.min(index2 - 1, iBinarySearch);
    }

    public static <T extends Comparable<? super T>> int A0H(List<? extends Comparable<? super T>> list, T value, boolean z11, boolean z12) {
        int index;
        int iBinarySearch = Collections.binarySearch(list, value);
        if (iBinarySearch < 0) {
            int index2 = iBinarySearch + 2;
            iBinarySearch = -index2;
        } else {
            do {
                iBinarySearch--;
                if (iBinarySearch < 0) {
                    break;
                }
                index = list.get(iBinarySearch).compareTo(value);
            } while (index == 0);
            if (z11) {
                iBinarySearch++;
            }
        }
        return z12 ? Math.max(0, iBinarySearch) : iBinarySearch;
    }

    public static int A0I(byte[] bArr, int i5, int i11, int i12) {
        while (i5 < i11) {
            int[] iArr = A0C;
            int i13 = bArr[i5];
            i12 = (i12 << 8) ^ iArr[((i12 >>> 24) ^ (i13 & 255)) & 255];
            i5++;
        }
        return i12;
    }

    public static int A0J(byte[] bArr, int i5, int i11, int i12) {
        while (i5 < i11) {
            int[] iArr = A0D;
            int i13 = bArr[i5];
            i12 = iArr[(i13 & 255) ^ i12];
            i5++;
        }
        return i12;
    }

    public static int A0K(long[] jArr, long j11, boolean z11, boolean z12) {
        int iBinarySearch = Arrays.binarySearch(jArr, j11);
        if (iBinarySearch < 0) {
            iBinarySearch = ~iBinarySearch;
        } else {
            do {
                iBinarySearch++;
                int index = jArr.length;
                if (iBinarySearch >= index) {
                    break;
                }
            } while (jArr[iBinarySearch] == j11);
            if (z11) {
                iBinarySearch--;
            }
        }
        if (!z12) {
            return iBinarySearch;
        }
        int index2 = jArr.length;
        return Math.min(index2 - 1, iBinarySearch);
    }

    public static int A0L(long[] jArr, long j11, boolean z11, boolean z12) {
        int iBinarySearch = Arrays.binarySearch(jArr, j11);
        if (iBinarySearch < 0) {
            int index = iBinarySearch + 2;
            iBinarySearch = -index;
        } else {
            do {
                iBinarySearch--;
                if (iBinarySearch < 0) {
                    break;
                }
            } while (jArr[iBinarySearch] == j11);
            if (z11) {
                iBinarySearch++;
            }
        }
        return z12 ? Math.max(0, iBinarySearch) : iBinarySearch;
    }

    public static long A0M(int i5) {
        return i5 & 4294967295L;
    }

    public static long A0N(int i5, int i11) {
        return (A0M(i5) << 32) | A0M(i11);
    }

    public static long A0O(long j11) {
        return (j11 == -9223372036854775807L || j11 == Long.MIN_VALUE) ? j11 : j11 * 1000;
    }

    public static long A0P(long j11) {
        return (j11 == -9223372036854775807L || j11 == Long.MIN_VALUE) ? j11 : j11 / 1000;
    }

    public static long A0Q(long j11, float f11) {
        if (f11 == 1.0f) {
            return j11;
        }
        return Math.round(j11 * f11);
    }

    public static long A0R(long j11, float f11) {
        if (f11 == 1.0f) {
            return j11;
        }
        return Math.round(j11 / f11);
    }

    public static long A0S(long j11, long j12, long j13) {
        long j14 = j11 + j12;
        if (((j11 ^ j14) & (j12 ^ j14)) < 0) {
            return j13;
        }
        return j14;
    }

    public static long A0T(long j11, long j12, long j13) {
        return Math.max(j12, Math.min(j11, j13));
    }

    public static long A0U(long j11, long j12, long j13) {
        if (j13 >= j12 && j13 % j12 == 0) {
            long j14 = j11 / (j13 / j12);
            String[] strArr = A01;
            if (strArr[6].charAt(24) != strArr[2].charAt(24)) {
                String[] strArr2 = A01;
                strArr2[6] = "Wwcydx2ywO5Js0hVIgMPrydxQI2GT274";
                strArr2[2] = "9S7HLHaddpKKZPVX7I2pUDzoDLzUbMCJ";
                return j14;
            }
        } else {
            if (j13 < j12) {
                long j15 = j12 % j13;
                String[] strArr3 = A01;
                if (strArr3[5].charAt(22) == strArr3[3].charAt(22)) {
                    String[] strArr4 = A01;
                    strArr4[4] = "IPy2Ly";
                    strArr4[7] = "5vEgcpH0iVVJMjzbRN";
                    if (j15 == 0) {
                        return j11 * (j12 / j13);
                    }
                }
            }
            return (long) (j11 * (j12 / j13));
        }
        throw new RuntimeException();
    }

    public static long A0V(long j11, long j12, long j13) {
        long j14 = j11 - j12;
        if (((j11 ^ j12) & (j11 ^ j14)) < 0) {
            return j13;
        }
        return j14;
    }

    public static Point A0W(Context context) {
        DisplayManager displayManager;
        Display defaultDisplay = null;
        if (A02 >= 17 && (displayManager = (DisplayManager) context.getSystemService(A0i(581, 7, 109))) != null) {
            defaultDisplay = displayManager.getDisplay(0);
        }
        if (defaultDisplay == null) {
            defaultDisplay = ((WindowManager) AbstractC1062Ln.A01((WindowManager) context.getSystemService(A0i(714, 6, 82)))).getDefaultDisplay();
        }
        return A0X(context, defaultDisplay);
    }

    public static Point A0X(Context context, Display display) throws NoSuchMethodException, ClassNotFoundException, SecurityException, NumberFormatException {
        String strA0m;
        if (display.getDisplayId() == 0) {
            boolean zA18 = A18(context);
            if (A01[0].length() == 5) {
                String[] strArr = A01;
                strArr[4] = "px5jAz";
                strArr[7] = "O0CwjRdnjEnBdgYzvR";
                if (zA18) {
                    if (A02 < 28) {
                        strA0m = A0m(A0i(661, 16, 5));
                    } else {
                        String displaySize = A0i(695, 19, 23);
                        strA0m = A0m(displaySize);
                    }
                    if (!TextUtils.isEmpty(strA0m)) {
                        try {
                            String strTrim = strA0m.trim();
                            String displaySize2 = A0i(720, 1, 22);
                            String[] strArrA1O = A1O(strTrim, displaySize2);
                            if (strArrA1O.length == 2) {
                                String displaySize3 = strArrA1O[0];
                                int width = Integer.parseInt(displaySize3);
                                String displaySize4 = strArrA1O[1];
                                int i5 = Integer.parseInt(displaySize4);
                                if (width > 0 && i5 > 0) {
                                    return new Point(width, i5);
                                }
                            }
                        } catch (NumberFormatException unused) {
                        }
                        StringBuilder sb2 = new StringBuilder();
                        String displaySize5 = A0i(Sdk.SDKError.Reason.AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE, 22, 90);
                        String string = sb2.append(displaySize5).append(strA0m).toString();
                        String displaySize6 = A0i(Sdk.SDKError.Reason.EVALUATE_JAVASCRIPT_FAILED_VALUE, 4, 106);
                        MV.A05(displaySize6, string);
                    }
                    String[] displaySizeParts = A01;
                    String displaySize7 = displaySizeParts[1];
                    if (displaySize7.length() == 23) {
                        A01[1] = "bVxCxLMs2EjeECtIJYJlSgA";
                        String strA0i = A0i(Sdk.SDKError.Reason.ASSET_FAILED_TO_DELETE_VALUE, 4, 95);
                        String displaySize8 = A05;
                        if (strA0i.equals(displaySize8)) {
                            String str = A06;
                            String displaySize9 = A0i(170, 6, 91);
                            if (str.startsWith(displaySize9)) {
                                PackageManager packageManager = context.getPackageManager();
                                String displaySize10 = A0i(549, 32, 77);
                                if (packageManager.hasSystemFeature(displaySize10)) {
                                    return new Point(3840, 2160);
                                }
                            }
                        }
                    }
                }
            }
            throw new RuntimeException();
        }
        Point point = new Point();
        if (A02 >= 23) {
            A0z(display, point);
        } else if (A02 >= 17) {
            A0y(display, point);
        } else {
            A0x(display, point);
        }
        return point;
    }

    public static Handler A0Y() {
        return A0a(null);
    }

    public static Handler A0Z() {
        return A0b(null);
    }

    public static Handler A0a(Handler.Callback callback) {
        return A0c((Looper) AbstractC1062Ln.A02(Looper.myLooper()), callback);
    }

    public static Handler A0b(Handler.Callback callback) {
        return A0c(A0d(), callback);
    }

    public static Handler A0c(Looper looper, Handler.Callback callback) {
        return new Handler(looper, callback);
    }

    public static Looper A0d() {
        Looper myLooper = Looper.myLooper();
        return myLooper != null ? myLooper : Looper.getMainLooper();
    }

    public static CharSequence A0e(CharSequence charSequence, int i5) {
        return charSequence.length() <= i5 ? charSequence : charSequence.subSequence(0, i5);
    }

    @EnsuresNonNull
    public static <T> T A0f(T value) {
        return value;
    }

    public static String A0g(int i5) {
        switch (i5) {
            case 0:
                return A0i(247, 2, Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
            case 1:
                return A0i(290, 19, 22);
            case 2:
                return A0i(272, 18, 28);
            case 3:
                return A0i(249, 23, 56);
            case 4:
                String[] strArr = A01;
                if (strArr[5].charAt(22) != strArr[3].charAt(22)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A01;
                strArr2[6] = "ep5pajUplpIVLurMLF4BXTyv20cDg2lO";
                strArr2[2] = "ol0CAjh987qCy1dpImZAa3qdLNtdPp25";
                return A0i(Sdk.SDKError.Reason.AD_CLOSED_TEMPLATE_ERROR_VALUE, 3, 96);
            default:
                throw new IllegalStateException();
        }
    }

    public static String A0h(int i5) {
        return Integer.toString(i5, 36);
    }

    public static String A0j(Context context, String str) {
        String strA0i;
        try {
            strA0i = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException unused) {
            strA0i = A0i(169, 1, 2);
            String[] strArr = A01;
            if (strArr[4].length() == strArr[7].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[5] = "NUhyDZ9UNiZ13p46IvOLOrx9GJvtk3o6";
            strArr2[3] = "konvKpsKfFam0PpuQIwWbLxjYiOygmuk";
        }
        StringBuilder sbAppend = new StringBuilder().append(str);
        String versionName = A0i(168, 1, 28);
        StringBuilder sbAppend2 = sbAppend.append(versionName).append(strA0i);
        String versionName2 = A0i(0, 16, 34);
        StringBuilder sbAppend3 = sbAppend2.append(versionName2);
        String versionName3 = Build.VERSION.RELEASE;
        StringBuilder sbAppend4 = sbAppend3.append(versionName3);
        String versionName4 = A0i(163, 2, 39);
        StringBuilder sbAppend5 = sbAppend4.append(versionName4);
        String versionName5 = A0i(176, 18, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
        return sbAppend5.append(versionName5).toString();
    }

    public static String A0k(String str) {
        if (str == null) {
            return null;
        }
        try {
            return new Locale(str).getISO3Language();
        } catch (MissingResourceException unused) {
            return XC.A01(str);
        }
    }

    public static String A0l(String str) throws NumberFormatException {
        int length = str.length();
        int i5 = 0;
        for (int i11 = 0; i11 < length; i11++) {
            int percentCharacterCount = str.charAt(i11);
            if (percentCharacterCount == 37) {
                i5++;
            }
        }
        if (i5 == 0) {
            return str;
        }
        int length2 = i5 * 2;
        int startOfNotEscaped = length - length2;
        StringBuilder sb2 = new StringBuilder(startOfNotEscaped);
        Matcher matcher = A08.matcher(str);
        int expectedLength = 0;
        while (i5 > 0 && matcher.find()) {
            int length3 = Integer.parseInt((String) AbstractC1062Ln.A01(matcher.group(1)), 16);
            char c11 = (char) length3;
            int length4 = matcher.start();
            sb2.append((CharSequence) str, expectedLength, length4).append(c11);
            expectedLength = matcher.end();
            i5--;
        }
        if (expectedLength < length) {
            sb2.append((CharSequence) str, expectedLength, length);
        }
        int length5 = sb2.length();
        if (length5 != startOfNotEscaped) {
            return null;
        }
        return sb2.toString();
    }

    public static String A0m(String str) throws NoSuchMethodException, ClassNotFoundException, SecurityException {
        try {
            Class<?> cls = Class.forName(A0i(436, 27, 42));
            Method getMethod = cls.getMethod(A0i(627, 3, 93), String.class);
            return (String) getMethod.invoke(cls, str);
        } catch (Exception e3) {
            MV.A08(A0i(Sdk.SDKError.Reason.EVALUATE_JAVASCRIPT_FAILED_VALUE, 4, 106), A0i(194, 31, 79) + str, e3);
            return null;
        }
    }

    public static String A0n(String str, Object... objArr) {
        return String.format(Locale.US, str, objArr);
    }

    public static String A0o(Locale locale) {
        return A02 >= 21 ? A0p(locale) : locale.toString();
    }

    public static String A0p(Locale locale) {
        return locale.toLanguageTag();
    }

    public static String A0q(byte[] bArr) {
        return new String(bArr, XA.A05);
    }

    public static String A0r(byte[] bArr, int i5, int i11) {
        return new String(bArr, i5, i11, XA.A05);
    }

    public static String A0s(Object[] objArr) {
        StringBuilder sb2 = new StringBuilder();
        for (int i5 = 0; i5 < objArr.length; i5++) {
            Object obj = objArr[i5];
            String[] strArr = A01;
            String str = strArr[4];
            String str2 = strArr[7];
            int i11 = str.length();
            if (i11 != str2.length()) {
                A01[1] = "M86ztIepEmUlarNQjmuOeOo";
                sb2.append(obj.getClass().getSimpleName());
                if (i5 < objArr.length - 1) {
                    String[] strArr2 = A01;
                    String str3 = strArr2[6];
                    String str4 = strArr2[2];
                    int i12 = str3.charAt(24);
                    if (i12 != str4.charAt(24)) {
                        A01[0] = "UxfwE";
                        sb2.append(A0i(166, 2, 71));
                    }
                }
            }
            throw new RuntimeException();
        }
        return sb2.toString();
    }

    public static /* synthetic */ Thread A0t(String str, Runnable runnable) {
        return new Thread(runnable, str);
    }

    public static ExecutorService A0u(final String str) {
        return Executors.newSingleThreadExecutor(new ThreadFactory() { // from class: com.facebook.ads.redexgen.X.Mz
            @Override // java.util.concurrent.ThreadFactory
            public final Thread newThread(Runnable runnable) {
                return N1.A0t(str, runnable);
            }
        });
    }

    public static void A0w(Parcel parcel, boolean z11) {
        parcel.writeInt(z11 ? 1 : 0);
    }

    public static void A0x(Display display, Point point) {
        display.getSize(point);
    }

    public static void A0y(Display display, Point point) {
        display.getRealSize(point);
    }

    public static void A0z(Display display, Point point) {
        Display.Mode mode = display.getMode();
        point.x = mode.getPhysicalWidth();
        point.y = mode.getPhysicalHeight();
    }

    public static void A10(Closeable closeable) throws IOException {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException unused) {
            }
        }
    }

    public static void A11(Throwable th2) throws Throwable {
        A12(th2);
        throw null;
    }

    public static <T extends Throwable> void A12(Throwable th2) throws Throwable {
        throw th2;
    }

    public static void A13(long[] jArr, long j11, long j12) {
        if (j12 >= j11 && j12 % j11 == 0) {
            long j13 = j12 / j11;
            for (int i5 = 0; i5 < jArr.length; i5++) {
                long divisionFactor = jArr[i5];
                jArr[i5] = divisionFactor / j13;
            }
            return;
        }
        if (A01[1].length() != 23) {
            throw new RuntimeException();
        }
        A01[0] = "wws9L";
        if (j12 < j11 && j11 % j12 == 0) {
            long j14 = j11 / j12;
            for (int i11 = 0; i11 < jArr.length; i11++) {
                long multiplicationFactor = jArr[i11];
                jArr[i11] = multiplicationFactor * j14;
            }
            return;
        }
        double d5 = j11 / j12;
        for (int i12 = 0; i12 < jArr.length; i12++) {
            double multiplicationFactor2 = (long) (jArr[i12] * d5);
            jArr[i12] = multiplicationFactor2;
        }
    }

    public static boolean A14(int i5) {
        return i5 == 536870912 || i5 == 805306368 || i5 == 4;
    }

    public static boolean A15(int i5) {
        if (i5 != 3 && i5 != 2 && i5 != 268435456) {
            String[] strArr = A01;
            if (strArr[4].length() == strArr[7].length()) {
                throw new RuntimeException();
            }
            A01[0] = "Wp8bK";
            if (i5 != 536870912 && i5 != 805306368 && i5 != 4) {
                return false;
            }
        }
        return true;
    }

    public static boolean A16(int i5) {
        return i5 == 10 || i5 == 13;
    }

    public static boolean A17(Context context) {
        return A02 >= 23 && context.getPackageManager().hasSystemFeature(A0i(TTAdConstant.DEEPLINK_FALLBACK_CODE, 32, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
    }

    public static boolean A18(Context context) {
        UiModeManager uiModeManager = (UiModeManager) context.getApplicationContext().getSystemService(A0i(689, 6, 81));
        return uiModeManager != null && uiModeManager.getCurrentModeType() == 4;
    }

    public static boolean A19(android.database.sqlite.SQLiteDatabase sQLiteDatabase, String str) {
        return DatabaseUtils.queryNumEntries(sQLiteDatabase, A0i(648, 13, 6), A0i(677, 12, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE), new String[]{str}) > 0;
    }

    public static boolean A1A(Uri uri) {
        String scheme = uri.getScheme();
        if (!TextUtils.isEmpty(scheme)) {
            String scheme2 = A0i(588, 4, 26);
            if (!scheme2.equals(scheme)) {
                return false;
            }
        }
        return true;
    }

    public static boolean A1B(Handler handler, Runnable runnable) {
        Looper looper = handler.getLooper();
        if (!looper.getThread().isAlive()) {
            return false;
        }
        Looper looper2 = handler.getLooper();
        Looper looper3 = Looper.myLooper();
        if (looper2 == looper3) {
            runnable.run();
            return true;
        }
        return handler.post(runnable);
    }

    public static boolean A1C(Parcel parcel) {
        return parcel.readInt() != 0;
    }

    public static boolean A1D(C1084Mk c1084Mk, C1084Mk c1084Mk2, Inflater inflater) {
        if (c1084Mk.A07() <= 0) {
            return false;
        }
        if (c1084Mk2.A08() < c1084Mk.A07()) {
            c1084Mk2.A0c(c1084Mk.A07() * 2);
        }
        if (inflater == null) {
            inflater = new Inflater();
        }
        inflater.setInput(c1084Mk.A0l(), c1084Mk.A09(), c1084Mk.A07());
        int iInflate = 0;
        while (true) {
            try {
                iInflate += inflater.inflate(c1084Mk2.A0l(), iInflate, c1084Mk2.A08() - iInflate);
                if (inflater.finished()) {
                    c1084Mk2.A0e(iInflate);
                    inflater.reset();
                    return true;
                }
                if (inflater.needsDictionary() || inflater.needsInput()) {
                    break;
                }
                if (iInflate == c1084Mk2.A08()) {
                    c1084Mk2.A0c(c1084Mk2.A08() * 2);
                }
            } catch (DataFormatException unused) {
                return false;
            } finally {
                inflater.reset();
            }
        }
        return false;
    }

    public static boolean A1E(Object obj, Object obj2) {
        return obj == null ? obj2 == null : obj.equals(obj2);
    }

    public static byte[] A1F(InputStream inputStream) throws IOException {
        byte[] bArr = new byte[androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT];
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        while (true) {
            int i5 = inputStream.read(bArr);
            if (i5 != -1) {
                byteArrayOutputStream.write(bArr, 0, i5);
            } else {
                byte[] buffer = byteArrayOutputStream.toByteArray();
                return buffer;
            }
        }
    }

    public static byte[] A1G(String str) {
        return str.getBytes(XA.A05);
    }

    @EnsuresNonNull
    public static <T> T[] A1H(T[] value) {
        return value;
    }

    public static <T> T[] A1I(T[] tArr, int i5) {
        AbstractC1062Ln.A07(i5 <= tArr.length);
        return (T[]) Arrays.copyOf(tArr, i5);
    }

    public static <T> T[] A1J(T[] tArr, int i5, int i11) {
        boolean z11 = true;
        AbstractC1062Ln.A07(i5 >= 0);
        if (i11 > tArr.length) {
            z11 = false;
        }
        AbstractC1062Ln.A07(z11);
        T[] tArr2 = (T[]) Arrays.copyOfRange(tArr, i5, i11);
        String[] strArr = A01;
        if (strArr[5].charAt(22) != strArr[3].charAt(22)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[5] = "wiytlp6LfgQL3IKGabRQEcxL4wsnKGzQ";
        strArr2[3] = "HmwAuiujpnpnFZToUkO1QMxNuOmiVyxI";
        return tArr2;
    }

    public static <T> T[] A1K(T[] tArr, T[] tArr2) {
        T[] tArr3 = (T[]) Arrays.copyOf(tArr, tArr.length + tArr2.length);
        System.arraycopy(tArr2, 0, tArr3, tArr.length, tArr2.length);
        return tArr3;
    }

    public static String[] A1L() {
        String[] strArrA1M = A1M();
        for (int i5 = 0; i5 < strArrA1M.length; i5++) {
            strArrA1M[i5] = A0k(strArrA1M[i5]);
        }
        return strArrA1M;
    }

    public static String[] A1M() {
        Configuration configuration = Resources.getSystem().getConfiguration();
        if (A02 >= 24) {
            return A1N(configuration);
        }
        return new String[]{A0o(configuration.locale)};
    }

    public static String[] A1N(Configuration configuration) {
        return A1O(configuration.getLocales().toLanguageTags(), A0i(165, 1, 23));
    }

    public static String[] A1O(String str, String str2) {
        return str.split(str2, -1);
    }

    public static String[] A1P(String str, String str2) {
        return str.split(str2, 2);
    }
}
