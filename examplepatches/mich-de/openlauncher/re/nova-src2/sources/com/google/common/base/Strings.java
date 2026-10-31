package com.google.common.base;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.CheckForNull;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@ElementTypesAreNonnullByDefault
/* loaded from: assets/audience_network/classes.dex */
public final class Strings {
    public static byte[] A00;

    static {
        A03();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 17);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{49, 108, -103, -19, -31, -21, -34, -16, -103, 79, -99, 65, 104, 123, -125, 126, 124, -115, 116, 118, 66, -121, -114, -123, -123, 74, 62, -119, -59, 95, -110, 125, AbstractJsonLexerKt.TC_INVALID, -118, -114, -125, -119, -120, 58, 126, -113, -116, -125, -120, -127, 58, -122, AbstractJsonLexerKt.TC_INVALID, -120, -125, AbstractJsonLexerKt.TC_INVALID, -120, -114, 96, -119, -116, -121, 123, -114, 58, -128, -119, -116, 58, -37, -25, -27, -90, -33, -25, -25, -33, -28, -35, -90, -37, -25, -27, -27, -25, -26, -90, -38, -39, -21, -35, -90, -53, -20, -22, -31, -26, -33, -21, -79, -72, -81, -81};
    }

    public static String A01(@CheckForNull Object o) {
        if (o == null) {
            return A00(94, 4, 50);
        }
        try {
            return o.toString();
        } catch (Exception e3) {
            String str = o.getClass().getName() + '@' + Integer.toHexString(System.identityHashCode(o));
            Logger.getLogger(A00(64, 30, 103)).log(Level.WARNING, A00(29, 35, 9) + str, (Throwable) e3);
            return A00(27, 1, 60) + str + A00(2, 7, 104) + e3.getClass().getName() + A00(28, 1, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:19:0x007b */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String A02(@CheckForNull String template, @CheckForNull Object... args) {
        int i5;
        String strValueOf = String.valueOf(template);
        if (args == null) {
            args = new Object[]{A00(11, 14, 8)};
        } else {
            for (int templateStart = 0; templateStart < i; templateStart++) {
                args[templateStart] = A01(args[templateStart]);
            }
        }
        StringBuilder sb2 = new StringBuilder(strValueOf.length() + (args.length * 16));
        int i11 = 0;
        int i12 = 0;
        while (i12 < args.length && (i5 = strValueOf.indexOf(A00(9, 2, 25), i11)) != -1) {
            sb2.append((CharSequence) strValueOf, i11, i5);
            int templateStart2 = i12 + 1;
            sb2.append(args[i12]);
            i11 = i5 + 2;
            i12 = templateStart2;
        }
        sb2.append((CharSequence) strValueOf, i11, strValueOf.length());
        if (i12 < args.length) {
            sb2.append(A00(0, 2, 0));
            int i13 = i12 + 1;
            sb2.append(args[i12]);
            while (i13 < args.length) {
                sb2.append(A00(25, 2, 13));
                int templateStart3 = i13 + 1;
                sb2.append(args[i13]);
                i13 = templateStart3;
            }
            sb2.append(AbstractJsonLexerKt.END_LIST);
        }
        return sb2.toString();
    }
}
