package com.bytedance.adsdk.ycx.zb.lud.ycx;

import b.c9;

/* loaded from: classes2.dex */
public class sya {
    private static Object ycx(int i5, Number number) {
        if ((number instanceof Integer) || (number instanceof Short) || (number instanceof Byte)) {
            return Boolean.valueOf(i5 > number.intValue());
        }
        if (number instanceof Long) {
            return Boolean.valueOf(((long) i5) > number.longValue());
        }
        if (number instanceof Float) {
            return Boolean.valueOf(((float) i5) > number.floatValue());
        }
        if (number instanceof Double) {
            return Boolean.valueOf(((double) i5) > number.doubleValue());
        }
        throw new UnsupportedOperationException(c9.j(number, "This type of addition operation is not supported"));
    }

    private static Object ycx(long j11, Number number) {
        if ((number instanceof Integer) || (number instanceof Short) || (number instanceof Byte)) {
            return Boolean.valueOf(j11 > ((long) number.intValue()));
        }
        if (number instanceof Long) {
            return Boolean.valueOf(j11 > number.longValue());
        }
        if (number instanceof Float) {
            return Boolean.valueOf(((float) j11) > number.floatValue());
        }
        if (number instanceof Double) {
            return Boolean.valueOf(((double) j11) > number.doubleValue());
        }
        throw new UnsupportedOperationException(c9.j(number, "This type of addition operation is not supported"));
    }

    private static Object ycx(float f11, Number number) {
        if ((number instanceof Integer) || (number instanceof Short) || (number instanceof Byte)) {
            return Boolean.valueOf(f11 > ((float) number.intValue()));
        }
        if (number instanceof Long) {
            return Boolean.valueOf(f11 > ((float) number.longValue()));
        }
        if (number instanceof Float) {
            return Boolean.valueOf(f11 > number.floatValue());
        }
        if (number instanceof Double) {
            return Boolean.valueOf(((double) f11) > number.doubleValue());
        }
        throw new UnsupportedOperationException(c9.j(number, "This type of addition operation is not supported"));
    }

    private static Object ycx(double d5, Number number) {
        if ((number instanceof Integer) || (number instanceof Short) || (number instanceof Byte)) {
            return Boolean.valueOf(d5 > ((double) number.intValue()));
        }
        if (number instanceof Long) {
            return Boolean.valueOf(d5 > ((double) number.longValue()));
        }
        if (number instanceof Float) {
            return Boolean.valueOf(d5 > ((double) number.floatValue()));
        }
        if (number instanceof Double) {
            return Boolean.valueOf(d5 > number.doubleValue());
        }
        throw new UnsupportedOperationException(c9.j(number, "This type of addition operation is not supported"));
    }

    public static Object ycx(Object obj, Number number) {
        if (!(obj instanceof Integer) && !(obj instanceof Short) && !(obj instanceof Byte)) {
            if (obj instanceof Long) {
                return ycx(((Long) obj).longValue(), number);
            }
            if (obj instanceof Float) {
                return ycx(((Float) obj).floatValue(), number);
            }
            if (obj instanceof Double) {
                return ycx(((Double) obj).doubleValue(), number);
            }
            if (obj instanceof String) {
                try {
                    return ycx(Float.parseFloat((String) obj), number);
                } catch (NumberFormatException unused) {
                    throw new UnsupportedOperationException(obj.getClass().getName().concat("This type of addition operation is not supported"));
                }
            }
            throw new UnsupportedOperationException(obj.getClass().getName().concat("This type of addition operation is not supported"));
        }
        return ycx(((Number) obj).intValue(), number);
    }
}
