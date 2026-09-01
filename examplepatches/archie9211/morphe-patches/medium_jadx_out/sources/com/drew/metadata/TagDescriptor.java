package com.drew.metadata;

import com.drew.lang.Rational;
import com.drew.lang.StringUtil;
import com.drew.metadata.Directory;
import defpackage.ev6;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.math.RoundingMode;
import java.nio.charset.Charset;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class TagDescriptor<T extends Directory> {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    protected final T _directory;

    public TagDescriptor(T t) {
        this._directory = t;
    }

    public static String convertBytesToVersionString(int[] iArr, int i) {
        if (iArr == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (int i2 = 0; i2 < 4 && i2 < iArr.length; i2++) {
            if (i2 == i) {
                sb.append('.');
            }
            char c = (char) iArr[i2];
            if (c < '0') {
                c = (char) (c + '0');
            }
            if (i2 != 0 || c != '0') {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    public static String getFStopDescription(double d) {
        DecimalFormat decimalFormat = new DecimalFormat("0.0");
        decimalFormat.setRoundingMode(RoundingMode.HALF_UP);
        return "f/" + decimalFormat.format(d);
    }

    public static String getFocalLengthDescription(double d) {
        DecimalFormat decimalFormat = new DecimalFormat("0.#");
        decimalFormat.setRoundingMode(RoundingMode.HALF_UP);
        return decimalFormat.format(d) + " mm";
    }

    public final String get7BitStringFromBytes(int i) {
        byte[] byteArray = this._directory.getByteArray(i);
        if (byteArray == null) {
            return null;
        }
        int length = byteArray.length;
        for (int i2 = 0; i2 < byteArray.length; i2++) {
            int i3 = byteArray[i2] & 255;
            if (i3 == 0 || i3 > 127) {
                length = i2;
                break;
            }
        }
        return new String(byteArray, 0, length);
    }

    public final String getBitFlagDescription(int i, Object... objArr) {
        Integer integer = this._directory.getInteger(i);
        if (integer == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (int i2 = 0; objArr.length > i2; i2++) {
            Object obj = objArr[i2];
            if (obj != null) {
                char c = (integer.intValue() & 1) == 1 ? (char) 1 : (char) 0;
                if (obj instanceof String[]) {
                    arrayList.add(((String[]) obj)[c]);
                } else if (c != 0 && (obj instanceof String)) {
                    arrayList.add((String) obj);
                }
            }
            integer = Integer.valueOf(integer.intValue() >> 1);
        }
        return StringUtil.join(arrayList, ", ");
    }

    public final String getByteLengthDescription(int i) {
        byte[] byteArray = this._directory.getByteArray(i);
        if (byteArray == null) {
            return null;
        }
        return String.format("(%d byte%s)", Integer.valueOf(byteArray.length), byteArray.length == 1 ? "" : "s");
    }

    public final String getDecimalRational(int i, int i2) {
        Rational rational = this._directory.getRational(i);
        if (rational == null) {
            return null;
        }
        return String.format(ev6.w("%.", i2, "f"), Double.valueOf(rational.doubleValue()));
    }

    public String getDescription(int i) {
        int length;
        Object object = this._directory.getObject(i);
        if (object == null) {
            return null;
        }
        return (!object.getClass().isArray() || (length = Array.getLength(object)) <= 16) ? object instanceof Date ? new SimpleDateFormat("EEE MMM dd HH:mm:ss Z yyyy").format((Date) object).replaceAll("([0-9]{2} [^ ]+)$", ":$1") : this._directory.getString(i) : String.format("[%d values]", Integer.valueOf(length));
    }

    public final String getEncodedTextDescription(int i) {
        byte[] byteArray = this._directory.getByteArray(i);
        if (byteArray == null) {
            return null;
        }
        if (byteArray.length == 0) {
            return "";
        }
        HashMap map = new HashMap();
        map.put("ASCII", System.getProperty("file.encoding"));
        map.put("UNICODE", "UTF-16LE");
        map.put("JIS", "Shift-JIS");
        try {
            if (byteArray.length >= 10) {
                String str = new String(byteArray, 0, 10);
                for (Map.Entry entry : map.entrySet()) {
                    String str2 = (String) entry.getKey();
                    String str3 = (String) entry.getValue();
                    if (str.startsWith(str2)) {
                        for (int length = str2.length(); length < 10; length++) {
                            byte b = byteArray[length];
                            if (b != 0 && b != 32) {
                                return new String(byteArray, length, byteArray.length - length, str3).trim();
                            }
                        }
                        return new String(byteArray, 10, byteArray.length - 10, str3).trim();
                    }
                }
            }
            return new String(byteArray, System.getProperty("file.encoding")).trim();
        } catch (UnsupportedEncodingException unused) {
            return null;
        }
    }

    public final String getEpochTimeDescription(int i) {
        Long longObject = this._directory.getLongObject(i);
        if (longObject == null) {
            return null;
        }
        return new Date(longObject.longValue()).toString();
    }

    public final String getFormattedFloat(int i, String str) {
        Float floatObject = this._directory.getFloatObject(i);
        if (floatObject == null) {
            return null;
        }
        return String.format(str, floatObject);
    }

    public final String getFormattedInt(int i, String str) {
        Integer integer = this._directory.getInteger(i);
        if (integer == null) {
            return null;
        }
        return String.format(str, integer);
    }

    public final String getFormattedString(int i, String str) {
        String string = this._directory.getString(i);
        if (string == null) {
            return null;
        }
        return String.format(str, string);
    }

    public final String getIndexedDescription(int i, int i2, String... strArr) {
        String str;
        Long longObject = this._directory.getLongObject(i);
        if (longObject == null) {
            return null;
        }
        long jLongValue = longObject.longValue() - ((long) i2);
        if (jLongValue >= 0 && jLongValue < strArr.length && (str = strArr[(int) jLongValue]) != null) {
            return str;
        }
        return "Unknown (" + longObject + ")";
    }

    public final String getLensSpecificationDescription(int i) {
        Rational[] rationalArray = this._directory.getRationalArray(i);
        if (rationalArray == null || rationalArray.length != 4) {
            return null;
        }
        if (rationalArray[0].isZero() && rationalArray[2].isZero()) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        if (rationalArray[0].equals(rationalArray[1])) {
            sb.append(rationalArray[0].toSimpleString(true));
            sb.append("mm");
        } else {
            sb.append(rationalArray[0].toSimpleString(true));
            sb.append('-');
            sb.append(rationalArray[1].toSimpleString(true));
            sb.append("mm");
        }
        if (!rationalArray[2].isZero()) {
            sb.append(' ');
            DecimalFormat decimalFormat = new DecimalFormat("0.0");
            decimalFormat.setRoundingMode(RoundingMode.HALF_UP);
            if (rationalArray[2].equals(rationalArray[3])) {
                sb.append(getFStopDescription(rationalArray[2].doubleValue()));
            } else {
                sb.append("f/");
                sb.append(decimalFormat.format(rationalArray[2].doubleValue()));
                sb.append('-');
                sb.append(decimalFormat.format(rationalArray[3].doubleValue()));
            }
        }
        return sb.toString();
    }

    public final String getOrientationDescription(int i) {
        return getIndexedDescription(i, 1, "Top, left side (Horizontal / normal)", "Top, right side (Mirror horizontal)", "Bottom, right side (Rotate 180)", "Bottom, left side (Mirror vertical)", "Left side, top (Mirror horizontal and rotate 270 CW)", "Right side, top (Rotate 90 CW)", "Right side, bottom (Mirror horizontal and rotate 90 CW)", "Left side, bottom (Rotate 270 CW)");
    }

    public final String getRationalOrDoubleString(int i) {
        Rational rational = this._directory.getRational(i);
        if (rational != null) {
            return rational.toSimpleString(true);
        }
        Double doubleObject = this._directory.getDoubleObject(i);
        if (doubleObject != null) {
            return new DecimalFormat("0.###").format(doubleObject);
        }
        return null;
    }

    public final String getShutterSpeedDescription(int i) {
        Float floatObject = this._directory.getFloatObject(i);
        if (floatObject == null) {
            return null;
        }
        if (floatObject.floatValue() > 1.0f) {
            return ev6.w("1/", (int) Math.round(Math.exp(Math.log(2.0d) * ((double) floatObject.floatValue()))), " sec");
        }
        float fRound = Math.round(((double) ((float) (1.0d / Math.exp(Math.log(2.0d) * ((double) floatObject.floatValue()))))) * 10.0d) / 10.0f;
        DecimalFormat decimalFormat = new DecimalFormat("0.##");
        decimalFormat.setRoundingMode(RoundingMode.HALF_UP);
        return decimalFormat.format(fRound) + " sec";
    }

    public final String getSimpleRational(int i) {
        Rational rational = this._directory.getRational(i);
        if (rational == null) {
            return null;
        }
        return rational.toSimpleString(true);
    }

    public final String getStringFromBytes(int i, Charset charset) {
        byte[] byteArray = this._directory.getByteArray(i);
        if (byteArray == null) {
            return null;
        }
        try {
            return new String(byteArray, charset.name()).trim();
        } catch (UnsupportedEncodingException unused) {
            return null;
        }
    }

    public final String getVersionBytesDescription(int i, int i2) {
        int[] intArray = this._directory.getIntArray(i);
        if (intArray == null) {
            return null;
        }
        return convertBytesToVersionString(intArray, i2);
    }

    public final String getIndexedDescription(int i, String... strArr) {
        return getIndexedDescription(i, 0, strArr);
    }
}
