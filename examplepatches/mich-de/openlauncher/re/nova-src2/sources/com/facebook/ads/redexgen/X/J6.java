package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class J6 {
    public static byte[] A02;
    public final Intent A00;
    public final Bundle A01;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 55);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{103, 104, 98, 116, 105, 111, 98, 126, 40, 100, 116, 105, 113, 117, 99, 116, 40, 101, 115, 117, 114, 105, 107, 114, 103, 100, 117, 40, 99, 126, 114, 116, 103, 40, 66, 79, 85, 71, 68, 74, 67, 89, 68, 71, 69, 77, 65, 84, 73, 83, 72, 66, 89, 79, 72, 82, 67, 84, 71, 69, 82, 79, 73, 72};
    }

    public J6(Intent intent, Bundle bundle) {
        this.A00 = intent;
        this.A01 = bundle;
    }

    public static boolean A02(Intent intent) {
        return !intent.getBooleanExtra(A00(0, 64, 49), false);
    }

    public final void A03(Activity activity, Uri uri) {
        this.A00.setData(uri);
        activity.startActivityForResult(this.A00, 94532, this.A01);
    }
}
