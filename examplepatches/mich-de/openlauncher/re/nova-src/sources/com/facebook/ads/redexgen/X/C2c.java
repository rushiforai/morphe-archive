package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.2c, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C2c {
    public static byte[] A00;
    public static String[] A01 = {"DduZffXA7K0ZQeQPuUImCqPPqjB5V8d3", "4HiSCw8wzKtTRjoKHfUVRxFJIEHqnII", "So5fKdRfupm4BsWVXPpB3", "F6GzKtrFQLkcuHFnjPs3fAjAO8UCjJE2", "7VghWjwBwSzDorhocWXjUz2fu2z51rHW", "uNLB6n7UJauVDXofWx", "pY2lX", "MuTYX4lHvN4rapxLqaXbvwI"};

    public /* synthetic */ C2c(AbstractC05811i abstractC05811i) {
        this();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 66);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        byte[] bArr = {-7, -9, 6, -44, -13, 5, -9, -43, 1, 0, 6, -9, 10, 6, -70, -64, -64, -64, -69};
        if (A01[5].length() != 18) {
            throw new RuntimeException();
        }
        A01[6] = "fVQMz";
        A00 = bArr;
    }

    static {
        A03();
    }

    public C2c() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Activity A00(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) {
                Activity activity = (Activity) context;
                if (A01[5].length() != 18) {
                    throw new RuntimeException();
                }
                A01[6] = "MjPXH";
                return activity;
            }
            context = ((ContextWrapper) context).getBaseContext();
            C1h.A08(context, A02(0, 19, 80));
        }
        if (A01[0].charAt(22) == 'Y') {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[1] = "PfZvvewQNm1JY2YuwiJRzNzfQskT4Nk";
        strArr[7] = "TU26JCwkylDDlfCJVfxggYn";
        return null;
    }
}
