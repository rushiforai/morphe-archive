package com.bytedance.adsdk.ycx.zb.lud.ycx;

import b.c9;

/* loaded from: classes2.dex */
public class zb {
    private static boolean ycx(int i5, Number number) {
        if ((number instanceof Integer) || (number instanceof Short) || (number instanceof Byte)) {
            return i5 == number.intValue();
        }
        if (number instanceof Long) {
            return ((long) i5) == number.longValue();
        }
        if (number instanceof Float) {
            return ((float) i5) == number.floatValue();
        }
        if (number instanceof Double) {
            return ((double) i5) == number.doubleValue();
        }
        throw new UnsupportedOperationException(c9.j(number, "This type of addition operation is not supported"));
    }

    private static boolean ycx(long j11, Number number) {
        if ((number instanceof Integer) || (number instanceof Short) || (number instanceof Byte)) {
            return j11 == ((long) number.intValue());
        }
        if (number instanceof Long) {
            return j11 == number.longValue();
        }
        if (number instanceof Float) {
            return ((float) j11) == number.floatValue();
        }
        if (number instanceof Double) {
            return ((double) j11) == number.doubleValue();
        }
        throw new UnsupportedOperationException(c9.j(number, "This type of addition operation is not supported"));
    }

    private static boolean ycx(float f11, Number number) {
        if ((number instanceof Integer) || (number instanceof Short) || (number instanceof Byte)) {
            return f11 == ((float) number.intValue());
        }
        if (number instanceof Long) {
            return f11 == ((float) number.longValue());
        }
        if (number instanceof Float) {
            return f11 == number.floatValue();
        }
        if (number instanceof Double) {
            return ((double) f11) == number.doubleValue();
        }
        throw new UnsupportedOperationException(c9.j(number, "This type of addition operation is not supported"));
    }

    private static boolean ycx(double d5, Number number) {
        if ((number instanceof Integer) || (number instanceof Short) || (number instanceof Byte)) {
            return d5 == ((double) number.intValue());
        }
        if (number instanceof Long) {
            return d5 == ((double) number.longValue());
        }
        if (number instanceof Float) {
            return d5 == ((double) number.floatValue());
        }
        if (number instanceof Double) {
            return d5 == number.doubleValue();
        }
        throw new UnsupportedOperationException(c9.j(number, "This type of addition operation is not supported"));
    }

    public static boolean ycx(Number number, Number number2) {
        if (!(number instanceof Integer) && !(number instanceof Short) && !(number instanceof Byte)) {
            if (number instanceof Long) {
                return ycx(number.longValue(), number2);
            }
            if (number instanceof Float) {
                return ycx(number.floatValue(), number2);
            }
            if (number instanceof Double) {
                return ycx(number.doubleValue(), number2);
            }
            throw new UnsupportedOperationException(c9.j(number, "This type of addition operation is not supported"));
        }
        return ycx(number.intValue(), number2);
    }
}
