package com.google.android.gms.internal.measurement;

import java.util.Arrays;
import java.util.Locale;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public abstract class gi {

    /* renamed from: a, reason: collision with root package name */
    public static final Locale f32581a = Locale.ROOT;

    public static String a(Object obj) {
        String simpleName;
        if (obj == null) {
            return AbstractJsonLexerKt.NULL;
        }
        try {
            if (obj.getClass().isArray()) {
                return obj instanceof int[] ? Arrays.toString((int[]) obj) : obj instanceof long[] ? Arrays.toString((long[]) obj) : obj instanceof byte[] ? Arrays.toString((byte[]) obj) : obj instanceof char[] ? Arrays.toString((char[]) obj) : obj instanceof short[] ? Arrays.toString((short[]) obj) : obj instanceof float[] ? Arrays.toString((float[]) obj) : obj instanceof double[] ? Arrays.toString((double[]) obj) : obj instanceof boolean[] ? Arrays.toString((boolean[]) obj) : Arrays.toString((Object[]) obj);
            }
            String string = obj.toString();
            return string != null ? string : c(obj, "toString() returned null");
        } catch (RuntimeException e3) {
            try {
                simpleName = e3.toString();
            } catch (RuntimeException e11) {
                simpleName = e11.getClass().getSimpleName();
            }
            return c(obj, simpleName);
        }
    }

    public static void b(StringBuilder sb2, long j11, boolean z11) {
        if (j11 == 0) {
            sb2.append("0");
            return;
        }
        String str = true != z11 ? "0123456789abcdef" : "0123456789ABCDEF";
        for (int iNumberOfLeadingZeros = (63 - Long.numberOfLeadingZeros(j11)) & (-4); iNumberOfLeadingZeros >= 0; iNumberOfLeadingZeros -= 4) {
            sb2.append(str.charAt((int) ((j11 >>> iNumberOfLeadingZeros) & 15)));
        }
    }

    public static String c(Object obj, String str) {
        String name = obj.getClass().getName();
        int iIdentityHashCode = System.identityHashCode(obj);
        int length = name.length();
        StringBuilder sb2 = new StringBuilder(length + 2 + String.valueOf(iIdentityHashCode).length() + 2 + String.valueOf(str).length() + 1);
        sb2.append("{");
        sb2.append(name);
        sb2.append("@");
        sb2.append(iIdentityHashCode);
        return b.c0.r(sb2, ": ", str, "}");
    }
}
