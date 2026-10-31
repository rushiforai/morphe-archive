package com.facebook.ads.redexgen.X;

import android.util.Log;
import com.vungle.ads.internal.protos.Sdk;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;

/* renamed from: com.facebook.ads.redexgen.X.o5, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2273o5 {
    public static byte[] A00;
    public static final DateFormat A01;
    public static final AtomicBoolean A02;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 64);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{-128, -50, -121, 123, -128, -50, -78, 0, -71, -83, -24, -78, 0, -22, -83, -78, 0, -35, -32, -22, -13, -5, -32, -31, -34, -15, -29, -5, -24, -21, -29, -29, -31, -18, -2, -2, -16, 35, 35, -16, 41, 41, -28, 9, 9, 9};
    }

    static {
        A03();
        A01 = new SimpleDateFormat(A01(34, 12, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE), Locale.US);
        A02 = new AtomicBoolean();
    }

    public static String A00() {
        return A01.format(Calendar.getInstance().getTime());
    }

    public static void A02() {
        A02.set(true);
    }

    public static void A04(String str, String str2) {
        if (!A02.get()) {
            return;
        }
        Log.i(A01(17, 17, 92), String.format(Locale.US, A01(0, 6, 27), A00(), str2));
    }

    public static void A05(String str, String str2, String str3) {
        if (!A02.get()) {
            return;
        }
        Log.i(A01(17, 17, 92), String.format(Locale.US, A01(6, 11, 77), A00(), str3, str2));
    }
}
