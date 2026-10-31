package com.bytedance.adsdk.ycx.zb.lud.ycx;

import b.c9;

/* loaded from: classes2.dex */
public class ycx {
    private static Object ycx(int i5, Number number) {
        if ((number instanceof Integer) || (number instanceof Short) || (number instanceof Byte)) {
            return Integer.valueOf(i5 / number.intValue());
        }
        if (number instanceof Long) {
            return Long.valueOf(i5 / number.longValue());
        }
        if (number instanceof Float) {
            return Float.valueOf(i5 / number.floatValue());
        }
        if (number instanceof Double) {
            return Double.valueOf(i5 / number.doubleValue());
        }
        throw new UnsupportedOperationException(c9.j(number, "This type of addition operation is not supported"));
    }

    private static Object ycx(long j11, Number number) {
        if (!(number instanceof Integer) && !(number instanceof Short) && !(number instanceof Byte)) {
            if (number instanceof Long) {
                return Long.valueOf(j11 / number.longValue());
            }
            if (number instanceof Float) {
                return Float.valueOf(j11 / number.floatValue());
            }
            if (number instanceof Double) {
                return Double.valueOf(j11 / number.doubleValue());
            }
            throw new UnsupportedOperationException(c9.j(number, "This type of addition operation is not supported"));
        }
        return Long.valueOf(j11 / number.intValue());
    }

    private static Object ycx(float f11, Number number) {
        if (!(number instanceof Integer) && !(number instanceof Short) && !(number instanceof Byte)) {
            if (number instanceof Long) {
                return Float.valueOf(f11 / number.longValue());
            }
            if (number instanceof Float) {
                return Float.valueOf(f11 / number.floatValue());
            }
            if (number instanceof Double) {
                return Double.valueOf(f11 / number.doubleValue());
            }
            throw new UnsupportedOperationException(c9.j(number, "This type of addition operation is not supported"));
        }
        return Float.valueOf(f11 / number.intValue());
    }

    private static Object ycx(double d5, Number number) {
        if (!(number instanceof Integer) && !(number instanceof Short) && !(number instanceof Byte)) {
            if (number instanceof Long) {
                return Double.valueOf(d5 / number.longValue());
            }
            if (number instanceof Float) {
                return Double.valueOf(d5 / number.floatValue());
            }
            if (number instanceof Double) {
                return Double.valueOf(d5 / number.doubleValue());
            }
            throw new UnsupportedOperationException(c9.j(number, "This type of addition operation is not supported"));
        }
        return Double.valueOf(d5 / number.intValue());
    }

    public static Object ycx(Number number, Number number2) {
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
