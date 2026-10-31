package com.bytedance.sdk.openadsdk.oty;

import android.text.TextUtils;
import android.util.Log;
import androidx.compose.ui.node.LayoutNode;
import com.bytedance.sdk.component.utils.dy;
import com.bytedance.sdk.openadsdk.BuildConfig;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj {

    /* renamed from: dj, reason: collision with root package name */
    private static volatile Pattern f26939dj;

    /* renamed from: lt, reason: collision with root package name */
    private static volatile Pattern f26940lt;
    private static volatile Pattern lud;
    private static volatile Pattern sya;
    private static volatile String[] ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static volatile Pattern f26942zb;

    /* renamed from: ul, reason: collision with root package name */
    private static final String[] f26941ul = {"com.bytedance.sdk.component", "com.bytedance.sdk.mediation", BuildConfig.LIBRARY_PACKAGE_NAME, "com.bytedance.overseas.sdk", "com.bykv.vk", "com.pgl.ssdk", "com.iab.omid.library.bytedance2", "com.bytedance.adsdk"};
    private static final String[] fby = {"java.", "javax.", "android.", "androidx.", "com.android.", "dalvik.", "kotlin.", "kotlinx.", "sun.", "libcore.", "org."};

    private static String dj(String str) {
        return lud(sya(str));
    }

    private static boolean lt(String str) {
        return zb(str, fby);
    }

    private static String lud(String str) {
        if (TextUtils.isEmpty(str)) {
            return b.f42142b;
        }
        try {
            int iIndexOf = str.indexOf(40);
            if (iIndexOf > 0) {
                str = str.substring(0, iIndexOf);
            }
            int iLastIndexOf = str.lastIndexOf(46);
            return iLastIndexOf <= 0 ? b.f42142b : str.substring(0, iLastIndexOf);
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }

    private static String sya(String str) {
        if (TextUtils.isEmpty(str)) {
            return b.f42142b;
        }
        try {
            String strTrim = str.trim();
            if (!strTrim.startsWith("at ")) {
                return b.f42142b;
            }
            String strSubstring = strTrim.substring(3);
            int iIndexOf = strSubstring.indexOf(40);
            int iLastIndexOf = strSubstring.lastIndexOf(41);
            if (iIndexOf > 0 && iLastIndexOf > iIndexOf) {
                String strSubstring2 = strSubstring.substring(0, iIndexOf);
                String strSubstring3 = strSubstring.substring(iIndexOf + 1, iLastIndexOf);
                int iIndexOf2 = strSubstring3.indexOf(58);
                if (iIndexOf2 >= 0) {
                    strSubstring3 = strSubstring3.substring(0, iIndexOf2);
                }
                return strSubstring2 + "(" + strSubstring3 + ")";
            }
            return strSubstring;
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }

    public static String ycx(String str, int i5) {
        try {
            if (TextUtils.isEmpty(str)) {
                return "fullStack is empty";
            }
            String[] strArrSplit = str.split("\\r?\\n");
            if (i5 <= 0) {
                i5 = 20;
            }
            if (strArrSplit.length <= i5) {
                return str.trim();
            }
            String strYcx = ycx(strArrSplit, i5);
            return !TextUtils.isEmpty(strYcx) ? strYcx : zb(strArrSplit, i5);
        } catch (Throwable unused) {
            return "extractStackTrace error";
        }
    }

    public static String zb(String str, int i5) {
        try {
            return TextUtils.isEmpty(str) ? "full stack empty" : ycx(str, i5);
        } catch (Throwable unused) {
            return "getStackTrace error";
        }
    }

    private static Pattern dj() {
        try {
            Pattern pattern = f26939dj;
            if (pattern != null) {
                return pattern;
            }
            Pattern patternCompile = Pattern.compile("\\b(?=[A-Za-z0-9_-]{8,}\\b)(?=[A-Za-z0-9_-]*\\d)(?=[A-Za-z0-9_-]*[A-Za-z])[A-Za-z0-9_-]+\\b");
            f26939dj = patternCompile;
            return patternCompile;
        } catch (Throwable unused) {
            return null;
        }
    }

    private static Pattern lt() {
        try {
            Pattern pattern = f26940lt;
            if (pattern != null) {
                return pattern;
            }
            Pattern patternCompile = Pattern.compile("@[0-9a-fA-F]+");
            f26940lt = patternCompile;
            return patternCompile;
        } catch (Throwable unused) {
            return null;
        }
    }

    private static void zb(boolean[] zArr, int i5, int i11) {
        if (zArr != null) {
            try {
                if (zArr.length != 0 && i5 < i11) {
                    while (i5 < i11) {
                        int iYcx = ycx(zArr);
                        if (iYcx < 0) {
                            return;
                        }
                        zArr[iYcx] = true;
                        i5++;
                    }
                }
            } catch (Throwable unused) {
            }
        }
    }

    private static Pattern lud() {
        try {
            Pattern pattern = lud;
            if (pattern != null) {
                return pattern;
            }
            Pattern patternCompile = Pattern.compile("\\b\\d+\\b");
            lud = patternCompile;
            return patternCompile;
        } catch (Throwable unused) {
            return null;
        }
    }

    private static String zb(String[] strArr, int i5) {
        try {
            StringBuilder sb2 = new StringBuilder();
            int iMin = Math.min(i5, strArr.length);
            for (int i11 = 0; i11 < iMin; i11++) {
                if (sb2.length() > 0) {
                    sb2.append('\n');
                }
                sb2.append(strArr[i11]);
            }
            return sb2.toString();
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }

    public static String ycx(Throwable th2) {
        if (th2 == null) {
            return b.f42142b;
        }
        try {
            String stackTraceString = Log.getStackTraceString(th2);
            return !TextUtils.isEmpty(stackTraceString) ? stackTraceString : th2.toString();
        } catch (Throwable unused) {
            return "get full stack error";
        }
    }

    private static Pattern sya() {
        try {
            Pattern pattern = sya;
            if (pattern != null) {
                return pattern;
            }
            Pattern patternCompile = Pattern.compile("\\b[0-9a-fA-F]{8,}\\b");
            sya = patternCompile;
            return patternCompile;
        } catch (Throwable unused) {
            return null;
        }
    }

    public static String ycx(Throwable th2, String str) {
        if (th2 != null) {
            try {
                if (!TextUtils.isEmpty(str)) {
                    String strYcx = dy.ycx(th2.getClass().getSimpleName() + '\n' + zb(th2.getMessage()) + '\n' + ycx(str.split("\\r?\\n")));
                    return strYcx == null ? b.f42142b : strYcx;
                }
            } catch (Throwable unused) {
            }
        }
        return b.f42142b;
    }

    private static String zb(String str) {
        if (TextUtils.isEmpty(str)) {
            return b.f42142b;
        }
        try {
            String strTrim = str.trim();
            Pattern patternZb = zb();
            if (patternZb != null) {
                strTrim = patternZb.matcher(strTrim).replaceAll("{id}");
            }
            Pattern patternSya = sya();
            if (patternSya != null) {
                strTrim = patternSya.matcher(strTrim).replaceAll("{id}");
            }
            Pattern patternDj = dj();
            if (patternDj != null) {
                strTrim = patternDj.matcher(strTrim).replaceAll("{id}");
            }
            Pattern patternLt = lt();
            if (patternLt != null) {
                strTrim = patternLt.matcher(strTrim).replaceAll("@{id}");
            }
            Pattern patternLud = lud();
            return patternLud != null ? patternLud.matcher(strTrim).replaceAll("{num}") : strTrim;
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }

    private static String ycx(String[] strArr, int i5) {
        if (strArr != null) {
            try {
                if (strArr.length != 0 && i5 > 0) {
                    String[] strArrYcx = ycx();
                    boolean[] zArr = new boolean[strArr.length];
                    ArrayList arrayList = new ArrayList();
                    boolean z11 = false;
                    arrayList.add(0);
                    for (int i11 = 1; i11 < strArr.length; i11++) {
                        String str = strArr[i11];
                        if (ycx(str)) {
                            arrayList.add(Integer.valueOf(i11));
                            int i12 = i11 + 1;
                            ycx(zArr, i12, i12);
                        }
                        if (ycx(str, strArrYcx)) {
                            arrayList.add(Integer.valueOf(i11));
                            ycx(zArr, i11 - 1, i11 + 2);
                            z11 = true;
                        }
                    }
                    if (!z11) {
                        return b.f42142b;
                    }
                    boolean[] zArr2 = new boolean[strArr.length];
                    int iYcx = ycx(arrayList, zArr2, i5);
                    if (iYcx >= i5) {
                        return ycx(strArr, zArr2);
                    }
                    for (int i13 = 1; i13 < strArr.length && iYcx < i5; i13++) {
                        if (zArr[i13] && !zArr2[i13]) {
                            zArr2[i13] = true;
                            iYcx++;
                        }
                    }
                    zb(zArr2, iYcx, i5);
                    return ycx(strArr, zArr2);
                }
            } catch (Throwable unused) {
                return null;
            }
        }
        return b.f42142b;
    }

    private static boolean zb(String str, String[] strArr) {
        if (!TextUtils.isEmpty(str) && strArr != null && strArr.length != 0) {
            try {
                for (String str2 : strArr) {
                    if (!TextUtils.isEmpty(str2) && str.startsWith(str2)) {
                        return true;
                    }
                }
            } catch (Throwable unused) {
            }
        }
        return false;
    }

    private static Pattern zb() {
        try {
            Pattern pattern = f26942zb;
            if (pattern != null) {
                return pattern;
            }
            Pattern patternCompile = Pattern.compile("\\b[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}\\b");
            f26942zb = patternCompile;
            return patternCompile;
        } catch (Throwable unused) {
            return null;
        }
    }

    private static int ycx(List<Integer> list, boolean[] zArr, int i5) {
        int i11;
        if (list != null) {
            try {
                if (!list.isEmpty() && zArr != null && i5 > 0) {
                    boolean[] zArr2 = new boolean[zArr.length];
                    ArrayList arrayList = new ArrayList();
                    for (Integer num : list) {
                        int iIntValue = num.intValue();
                        if (iIntValue >= 0 && iIntValue < zArr.length && !zArr2[iIntValue]) {
                            zArr2[iIntValue] = true;
                            arrayList.add(num);
                        }
                    }
                    if (arrayList.isEmpty()) {
                        return 0;
                    }
                    if (zArr[0]) {
                        i11 = 0;
                    } else {
                        zArr[0] = true;
                        i11 = 1;
                    }
                    if (arrayList.size() <= i5) {
                        Iterator it = arrayList.iterator();
                        while (it.hasNext()) {
                            int iIntValue2 = ((Integer) it.next()).intValue();
                            if (!zArr[iIntValue2]) {
                                zArr[iIntValue2] = true;
                                i11++;
                            }
                        }
                        return i11;
                    }
                    for (int iMax = Math.max(1, arrayList.size() - (i5 - 1)); iMax < arrayList.size(); iMax++) {
                        int iIntValue3 = ((Integer) arrayList.get(iMax)).intValue();
                        if (!zArr[iIntValue3]) {
                            zArr[iIntValue3] = true;
                            i11++;
                        }
                    }
                    return i11;
                }
            } catch (Throwable unused) {
            }
        }
        return 0;
    }

    private static void ycx(boolean[] zArr, int i5, int i11) {
        if (zArr != null) {
            try {
                if (zArr.length == 0) {
                    return;
                }
                int iMin = Math.min(zArr.length - 1, i11);
                for (int iMax = Math.max(1, i5); iMax <= iMin; iMax++) {
                    zArr[iMax] = true;
                }
            } catch (Throwable unused) {
            }
        }
    }

    private static int ycx(boolean[] zArr) {
        int iYcx;
        int i5 = LayoutNode.NotPlacedPlaceOrder;
        int i11 = -1;
        for (int i12 = 0; i12 < zArr.length; i12++) {
            try {
                if (!zArr[i12] && ((iYcx = ycx(zArr, i12)) < i5 || (iYcx == i5 && i12 > i11))) {
                    i11 = i12;
                    i5 = iYcx;
                }
            } catch (Throwable unused) {
                return -1;
            }
        }
        return i11;
    }

    private static int ycx(boolean[] zArr, int i5) {
        int iMin = Integer.MAX_VALUE;
        for (int i11 = 0; i11 < zArr.length; i11++) {
            try {
                if (zArr[i11]) {
                    iMin = Math.min(iMin, Math.abs(i11 - i5));
                }
            } catch (Throwable unused) {
                return LayoutNode.NotPlacedPlaceOrder;
            }
        }
        return iMin;
    }

    private static boolean ycx(String str) {
        return !TextUtils.isEmpty(str) && str.startsWith("Caused by:");
    }

    private static boolean ycx(String str, String[] strArr) {
        try {
            if (!TextUtils.isEmpty(str) && strArr != null && strArr.length != 0) {
                return zb(dj(str), strArr);
            }
        } catch (Throwable unused) {
        }
        return false;
    }

    private static String[] ycx() {
        String[] strArr;
        try {
            strArr = ycx;
        } catch (Throwable unused) {
        }
        if (strArr != null) {
            return strArr;
        }
        JSONObject jSONObjectYcx = sya.ycx();
        if (jSONObjectYcx == null) {
            return f26941ul;
        }
        JSONArray jSONArrayOptJSONArray = jSONObjectYcx.optJSONArray("pkg_prefix_list");
        if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() > 0) {
            ArrayList arrayList = new ArrayList();
            for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                String strOptString = jSONArrayOptJSONArray.optString(i5, b.f42142b);
                if (!TextUtils.isEmpty(strOptString)) {
                    arrayList.add(strOptString);
                }
            }
            if (!arrayList.isEmpty()) {
                String[] strArr2 = (String[]) arrayList.toArray(new String[0]);
                ycx = strArr2;
                return strArr2;
            }
        }
        return f26941ul;
    }

    private static String ycx(String[] strArr, boolean[] zArr) {
        try {
            StringBuilder sb2 = new StringBuilder();
            for (int i5 = 0; i5 < strArr.length; i5++) {
                if (zArr[i5]) {
                    if (sb2.length() > 0) {
                        sb2.append('\n');
                    }
                    sb2.append(strArr[i5]);
                }
            }
            return sb2.toString();
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }

    private static String ycx(String[] strArr) {
        if (strArr != null) {
            try {
                if (strArr.length > 1) {
                    StringBuilder sb2 = new StringBuilder();
                    String[] strArrYcx = ycx();
                    boolean z11 = false;
                    for (int i5 = 1; i5 < strArr.length; i5++) {
                        String strSya = sya(strArr[i5]);
                        if (!TextUtils.isEmpty(strSya)) {
                            String strLud = lud(strSya);
                            if (!TextUtils.isEmpty(strLud)) {
                                if (!z11) {
                                    if (zb(strLud, strArrYcx)) {
                                        z11 = true;
                                    } else {
                                        continue;
                                    }
                                }
                                if (lt(strLud)) {
                                    break;
                                }
                                if (sb2.length() > 0) {
                                    sb2.append('\n');
                                }
                                sb2.append(strSya);
                            } else {
                                continue;
                            }
                        }
                    }
                    return sb2.toString();
                }
            } catch (Throwable unused) {
            }
        }
        return b.f42142b;
    }
}
