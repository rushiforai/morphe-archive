package com.bytedance.adsdk.ugeno.fby;

import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.util.Log;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: com.bytedance.adsdk.ugeno.fby.ycx$ycx, reason: collision with other inner class name */
    public static class C0015ycx {
        public float[] sya;
        public GradientDrawable.Orientation ycx;

        /* renamed from: zb, reason: collision with root package name */
        public int[] f22286zb;
    }

    public static GradientDrawable.Orientation dj(String str) {
        try {
            int i5 = str.contains("deg") ? Integer.parseInt(str.substring(0, str.length() - 3).trim()) : Integer.parseInt(str);
            return i5 == 90 ? GradientDrawable.Orientation.LEFT_RIGHT : i5 == 180 ? GradientDrawable.Orientation.TOP_BOTTOM : i5 == 270 ? GradientDrawable.Orientation.RIGHT_LEFT : i5 == 135 ? GradientDrawable.Orientation.TL_BR : i5 == 45 ? GradientDrawable.Orientation.BL_TR : GradientDrawable.Orientation.BOTTOM_TOP;
        } catch (Exception unused) {
            return GradientDrawable.Orientation.LEFT_RIGHT;
        }
    }

    public static boolean sya(String str) {
        return !TextUtils.isEmpty(str) && str.startsWith("linear-gradient");
    }

    public static int ycx(String str) {
        return ycx(str, -16777216);
    }

    public static C0015ycx zb(String str) {
        try {
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            String strSubstring = str.substring(str.indexOf("(") + 1, str.lastIndexOf(")"));
            if (TextUtils.isEmpty(strSubstring)) {
                return null;
            }
            int iYcx = ycx(strSubstring, '%');
            int iIndexOf = strSubstring.indexOf(",");
            String strSubstring2 = strSubstring.substring(0, iIndexOf);
            C0015ycx c0015ycx = new C0015ycx();
            c0015ycx.ycx = dj(strSubstring2);
            String strSubstring3 = strSubstring.substring(iIndexOf + 1);
            int[] iArr = new int[iYcx];
            float[] fArr = new float[iYcx];
            for (int i5 = 0; i5 < iYcx; i5++) {
                int iIndexOf2 = strSubstring3.indexOf("%");
                String strTrim = strSubstring3.substring(0, iIndexOf2 + 1).trim();
                int iIndexOf3 = (strTrim.contains("rgba") ? strTrim.indexOf(")") : strTrim.indexOf(" ")) + 1;
                iArr[i5] = ycx(strTrim.substring(0, iIndexOf3).trim());
                fArr[i5] = sya.ycx(strTrim.substring(iIndexOf3, strTrim.indexOf("%")).trim(), 0.0f) / 100.0f;
                int i11 = iIndexOf2 + 2;
                if (strSubstring3.length() <= i11) {
                    break;
                }
                strSubstring3 = strSubstring3.substring(i11);
            }
            if (iYcx < 2) {
                return null;
            }
            c0015ycx.f22286zb = iArr;
            c0015ycx.sya = fArr;
            return c0015ycx;
        } catch (Throwable unused) {
            return null;
        }
    }

    public static int ycx(String str, int i5) throws NumberFormatException {
        if (!TextUtils.isEmpty(str)) {
            if (str.equals("transparent")) {
                return 0;
            }
            if (str.charAt(0) == '#' && str.length() == 4) {
                StringBuilder sb2 = new StringBuilder("#");
                char[] charArray = str.toCharArray();
                for (int i11 = 1; i11 < charArray.length; i11++) {
                    sb2.append(charArray[i11]);
                    sb2.append(charArray[i11]);
                }
                return Color.parseColor(sb2.toString());
            }
            if (str.charAt(0) == '#' && str.length() == 7) {
                return Color.parseColor(str);
            }
            if (str.charAt(0) == '#' && str.length() == 9) {
                return Color.parseColor(str);
            }
            if (!str.startsWith("rgba")) {
                return -16777216;
            }
            String[] strArrSplit = str.substring(str.indexOf("(") + 1, str.indexOf(")")).split(",");
            if (strArrSplit != null && strArrSplit.length == 4) {
                return (((int) ((Float.parseFloat(strArrSplit[3]) * 255.0f) + 0.5f)) << 24) | (((int) Float.parseFloat(strArrSplit[0])) << 16) | (((int) Float.parseFloat(strArrSplit[1])) << 8) | ((int) Float.parseFloat(strArrSplit[2]));
            }
        }
        return i5;
    }

    public static int ycx(String str, char c11) {
        if (TextUtils.isEmpty(str)) {
            return 0;
        }
        int i5 = 0;
        for (int i11 = 0; i11 < str.length(); i11++) {
            if (str.charAt(i11) == c11) {
                i5++;
            }
        }
        return i5;
    }

    public static int ycx(int i5, int i11) {
        if (i11 < 0 || i11 > 255) {
            Log.e("ColorUtils", "alpha must be between 0 and 255. ");
            i11 = 255;
        }
        return (i5 & 16777215) | (i11 << 24);
    }
}
