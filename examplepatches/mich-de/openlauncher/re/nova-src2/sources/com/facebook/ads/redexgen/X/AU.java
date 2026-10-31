package com.facebook.ads.redexgen.X;

import android.util.Log;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public final class AU implements InterfaceC1533bw {
    public static byte[] A04;
    public int A00;
    public String A01;
    public Map<String, List<String>> A02;
    public byte[] A03;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 65);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A04 = new byte[]{-79, -56, -41, -38, -46, -43, -50, -125, -56, -43, -43, -46, -43};
    }

    public AU(HttpURLConnection httpURLConnection, byte[] bArr) {
        try {
            this.A00 = httpURLConnection.getResponseCode();
            this.A01 = httpURLConnection.getURL().toString();
        } catch (IOException e3) {
            Log.e(getClass().getSimpleName(), A00(0, 13, 34), e3);
        }
        this.A02 = httpURLConnection.getHeaderFields();
        this.A03 = bArr;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1533bw
    public final byte[] A7c() {
        return this.A03;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1533bw
    public final String A7d() {
        if (this.A03 != null) {
            return new String(this.A03);
        }
        return null;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1533bw
    public final Map<String, List<String>> A8q() {
        return this.A02;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1533bw
    public final int A9p() {
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1533bw
    public final String getUrl() {
        return this.A01;
    }
}
