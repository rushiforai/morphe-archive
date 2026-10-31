package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.text.ParseException;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class zzbkg {
    private static final long zza = TimeUnit.SECONDS.toNanos(1);

    public static Boolean zza(Map map, String str) {
        if (!map.containsKey(str)) {
            return null;
        }
        Object obj = map.get(str);
        if (obj instanceof Boolean) {
            return (Boolean) obj;
        }
        throw new ClassCastException(String.format("value '%s' for key '%s' in '%s' is not Boolean", obj, str, map));
    }

    public static Double zzb(Map map, String str) {
        if (!map.containsKey(str)) {
            return null;
        }
        Object obj = map.get(str);
        if (obj instanceof Double) {
            return (Double) obj;
        }
        if (!(obj instanceof String)) {
            throw new IllegalArgumentException(String.format("value '%s' for key '%s' in '%s' is not a number", obj, str, map));
        }
        try {
            return Double.valueOf(Double.parseDouble((String) obj));
        } catch (NumberFormatException unused) {
            throw new IllegalArgumentException(String.format("value '%s' for key '%s' is not a double", obj, str));
        }
    }

    public static Integer zzc(Map map, String str) {
        if (!map.containsKey(str)) {
            return null;
        }
        Object obj = map.get(str);
        if (!(obj instanceof Double)) {
            if (!(obj instanceof String)) {
                throw new IllegalArgumentException(String.format("value '%s' for key '%s' is not an integer", obj, str));
            }
            try {
                return Integer.valueOf(Integer.parseInt((String) obj));
            } catch (NumberFormatException unused) {
                throw new IllegalArgumentException(String.format("value '%s' for key '%s' is not an integer", obj, str));
            }
        }
        Double d5 = (Double) obj;
        int iIntValue = d5.intValue();
        if (iIntValue == d5.doubleValue()) {
            return Integer.valueOf(iIntValue);
        }
        throw new ClassCastException("Number expected to be integer: ".concat(String.valueOf(d5)));
    }

    public static Long zzd(Map map, String str) throws NumberFormatException, ParseException {
        boolean z11;
        int iCharAt;
        String strZze = zze(map, str);
        if (strZze == null) {
            return null;
        }
        try {
            if (strZze.isEmpty() || strZze.charAt(strZze.length() - 1) != 's') {
                throw new ParseException("Invalid duration string: ".concat(strZze), 0);
            }
            if (strZze.charAt(0) == '-') {
                strZze = strZze.substring(1);
                z11 = true;
            } else {
                z11 = false;
            }
            String strSubstring = strZze.substring(0, strZze.length() - 1);
            String strSubstring2 = b.f42142b;
            int iIndexOf = strSubstring.indexOf(46);
            if (iIndexOf != -1) {
                strSubstring2 = strSubstring.substring(iIndexOf + 1);
                strSubstring = strSubstring.substring(0, iIndexOf);
            }
            long j11 = Long.parseLong(strSubstring);
            if (strSubstring2.isEmpty()) {
                iCharAt = 0;
            } else {
                iCharAt = 0;
                for (int i5 = 0; i5 < 9; i5++) {
                    iCharAt *= 10;
                    if (i5 < strSubstring2.length()) {
                        if (strSubstring2.charAt(i5) < '0' || strSubstring2.charAt(i5) > '9') {
                            throw new ParseException("Invalid nanoseconds.", 0);
                        }
                        iCharAt = (strSubstring2.charAt(i5) - '0') + iCharAt;
                    }
                }
            }
            if (j11 < 0) {
                throw new ParseException("Invalid duration string: ".concat(strZze), 0);
            }
            if (z11) {
                j11 = -j11;
                iCharAt = -iCharAt;
            }
            long j12 = iCharAt;
            try {
                long j13 = zza;
                if (j12 <= (-j13) || j12 >= j13) {
                    long j14 = j12 / j13;
                    long j15 = j11 + j14;
                    if (!((j11 ^ j14) < 0) && !(((j11 ^ j15) > 0 ? 1 : ((j11 ^ j15) == 0 ? 0 : -1)) >= 0)) {
                        throw new ArithmeticException("overflow: checkedAdd(" + j11 + ", " + j14 + ")");
                    }
                    iCharAt = (int) (j12 % j13);
                    j11 = j15;
                }
                if (j11 > 0 && iCharAt < 0) {
                    j11--;
                    iCharAt = (int) (iCharAt + j13);
                }
                if (j11 < 0 && iCharAt > 0) {
                    j11++;
                    iCharAt = (int) (iCharAt - j13);
                }
                if (j11 >= -315576000000L && j11 <= 315576000000L) {
                    long j16 = iCharAt;
                    if (j16 >= -999999999 && j16 < j13 && ((j11 >= 0 && iCharAt >= 0) || (j11 <= 0 && iCharAt <= 0))) {
                        long nanos = TimeUnit.SECONDS.toNanos(j11);
                        long j17 = nanos + j16;
                        if (!(((nanos ^ j17) >= 0) | ((nanos ^ j16) < 0))) {
                            j17 = ((j17 >>> 63) ^ 1) + Long.MAX_VALUE;
                        }
                        return Long.valueOf(j17);
                    }
                }
                throw new IllegalArgumentException("Duration is not valid. See proto definition for valid values. Seconds (" + j11 + ") must be in range [-315,576,000,000, +315,576,000,000]. Nanos (" + iCharAt + ") must be in range [-999,999,999, +999,999,999]. Nanos must have the same sign as seconds");
            } catch (IllegalArgumentException unused) {
                throw new ParseException("Duration value is out of range.", 0);
            }
        } catch (ParseException e3) {
            throw new RuntimeException(e3);
        }
    }

    public static String zze(Map map, String str) {
        if (!map.containsKey(str)) {
            return null;
        }
        Object obj = map.get(str);
        if (obj instanceof String) {
            return (String) obj;
        }
        throw new ClassCastException(String.format("value '%s' for key '%s' in '%s' is not String", obj, str, map));
    }

    public static List zzf(List list) {
        for (int i5 = 0; i5 < list.size(); i5++) {
            if (!(list.get(i5) instanceof Map)) {
                throw new ClassCastException(String.format(Locale.US, "value %s for idx %d in %s is not object", list.get(i5), Integer.valueOf(i5), list));
            }
        }
        return list;
    }

    public static List zzg(Map map, String str) {
        if (!map.containsKey(str)) {
            return null;
        }
        Object obj = map.get(str);
        if (obj instanceof List) {
            return (List) obj;
        }
        throw new ClassCastException(String.format("value '%s' for key '%s' in '%s' is not List", obj, str, map));
    }

    public static List zzh(Map map, String str) {
        List listZzg = zzg(map, str);
        if (listZzg == null) {
            return null;
        }
        zzf(listZzg);
        return listZzg;
    }

    public static List zzi(Map map, String str) {
        List listZzg = zzg(map, str);
        if (listZzg == null) {
            return null;
        }
        for (int i5 = 0; i5 < listZzg.size(); i5++) {
            if (!(listZzg.get(i5) instanceof String)) {
                throw new ClassCastException(String.format(Locale.US, "value '%s' for idx %d in '%s' is not string", listZzg.get(i5), Integer.valueOf(i5), listZzg));
            }
        }
        return listZzg;
    }

    public static Map zzj(Map map, String str) {
        if (!map.containsKey(str)) {
            return null;
        }
        Object obj = map.get(str);
        if (obj instanceof Map) {
            return (Map) obj;
        }
        throw new ClassCastException(String.format("value '%s' for key '%s' in '%s' is not object", obj, str, map));
    }
}
