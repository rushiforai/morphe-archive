package com.facebook.ads.redexgen.X;

import android.os.AsyncTask;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Locale;
import java.util.concurrent.Executor;

/* loaded from: assets/audience_network/classes.dex */
public final class AX extends AsyncTask<AbstractC1480b5, Void, InterfaceC1533bw> implements InterfaceC1500bP {
    public static byte[] A04;
    public InterfaceC1527bq A00;
    public AT A01;
    public Exception A02;
    public Executor A03;

    static {
        A02();
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private final InterfaceC1533bw A00(AbstractC1480b5... abstractC1480b5Arr) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return null;
        }
        try {
            if (abstractC1480b5Arr != null) {
                try {
                    if (abstractC1480b5Arr.length > 0) {
                        InterfaceC1533bw interfaceC1533bwA0J = this.A01.A0J(abstractC1480b5Arr[0]);
                        if (this.A01.A0K().A04() && interfaceC1533bwA0J != null) {
                            String.format(Locale.US, A01(108, 21, 6), Integer.valueOf(interfaceC1533bwA0J.A9p()), interfaceC1533bwA0J.getUrl(), interfaceC1533bwA0J.A7d());
                        }
                        if (interfaceC1533bwA0J != null) {
                            return interfaceC1533bwA0J;
                        }
                        throw new IllegalStateException(A01(87, 21, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
                    }
                } catch (Exception e3) {
                    this.A02 = e3;
                    if (this.A01.A0K().A04()) {
                        String.format(Locale.US, A01(64, 23, 98), e3.getMessage());
                    }
                    cancel(true);
                    return null;
                }
            }
            throw new IllegalArgumentException(A01(0, 64, 69));
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
            return null;
        }
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 101);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A04 = new byte[]{-18, 25, -14, 30, 30, 26, -4, 15, 27, 31, 15, 29, 30, -2, 11, 29, 21, -54, 30, 11, 21, 15, 29, -54, 15, 34, 11, 13, 30, 22, 35, -54, 25, 24, 15, -54, 11, 28, 17, 31, 23, 15, 24, 30, -54, 25, 16, -54, 30, 35, 26, 15, -54, -14, 30, 30, 26, -4, 15, 27, 31, 15, 29, 30, 15, 27, 27, 23, -25, 57, 44, 56, 60, 44, 58, 59, -25, 45, 40, 48, 51, 44, 43, 1, -25, -20, 58, 36, 80, 80, 76, -4, 78, 65, 79, 76, 75, 74, 79, 65, -4, 69, 79, -4, 74, 81, 72, 72, -67, -48, -34, -37, -38, -39, -34, -48, -91, -117, -112, -49, -117, -109, -112, -34, -108, -91, 117, -112, -34};
    }

    public AX(AT at2, InterfaceC1527bq interfaceC1527bq, Executor executor) {
        this.A01 = at2;
        this.A00 = interfaceC1527bq;
        this.A03 = executor;
    }

    private final void A03(InterfaceC1533bw result) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.AES(result);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }

    public final void A04(AbstractC1480b5 abstractC1480b5) {
        super.executeOnExecutor(this.A03, abstractC1480b5);
    }

    @Override // android.os.AsyncTask
    public final /* bridge */ /* synthetic */ InterfaceC1533bw doInBackground(AbstractC1480b5[] abstractC1480b5Arr) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return null;
        }
        try {
            return A00(abstractC1480b5Arr);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
            return null;
        }
    }

    @Override // android.os.AsyncTask
    public final void onCancelled() {
        this.A00.AEs(this.A02);
    }

    @Override // android.os.AsyncTask
    public final /* bridge */ /* synthetic */ void onPostExecute(InterfaceC1533bw interfaceC1533bw) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            A03(interfaceC1533bw);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
