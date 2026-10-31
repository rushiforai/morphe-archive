package com.facebook.ads.redexgen.X;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executor;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.eu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1715eu {
    public static C1715eu A08;
    public static byte[] A09;
    public static String[] A0A = {"TOlR5WIHpQxnCrBDCJGIvboS5c1GP2eb", "1A072KPTjzB", "BhIKZU0mEosMUOfZes2VT64q11XJ2Uhn", "3eQHzZddeWPmYl0bNsvnb2WjxREMTE8a", "x", "3ukMDhdDleVgfGP2GHVzNRiRwZbG92ZS", "tXOxwX9vQ8QECIpzr41AiGeD6LbiHgO3", "feL0RS1gsJrC9VyxtC"};
    public static final String A0B;
    public boolean A01;
    public final C2095lA A03;
    public final String A04;
    public final Executor A07;
    public final CountDownLatch A05 = new CountDownLatch(1);
    public final CountDownLatch A06 = new CountDownLatch(1);
    public final C1714et A02 = new C1714et();
    public String A00 = null;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 69);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        byte[] bArr = {114, 115, 97, 10, 31, 65, 68, 83, 99, 65, 80, 80, 73, 78, 71, 105, 78, 70, 79, 14, 84, 88, 84, 1, 3, 18, 18, 7, 6, 35, 6, 17, 76, 22, 26, 22, 37, 49, 38, 50, 54, 38, 45, 32, 58, 28, 32, 34, 51, 51, 42, 45, 36};
        if (A0A[0].charAt(25) == 's') {
            throw new RuntimeException();
        }
        A0A[6] = "ekiMbk44dvQ4iEpOly1MsU0Tkyq5eij5";
        A09 = bArr;
    }

    static {
        A09();
        A0B = C1715eu.class.getSimpleName();
    }

    public C1715eu(C2095lA c2095lA, boolean z11, Executor executor, String str) {
        this.A03 = c2095lA.A02();
        this.A04 = str;
        this.A07 = executor;
        if (z11) {
            A0A();
        }
    }

    public static synchronized C1715eu A01(C2095lA c2095lA) {
        if (A08 == null) {
            A08 = new C1715eu(c2095lA, true, ExecutorC2431qh.A06, A03(0, 0, 103));
        }
        return A08;
    }

    private String A04(String str) {
        String strA03 = A03(0, 0, 103);
        try {
            synchronized (this) {
                File file = new File(this.A03.getFilesDir(), str);
                if (file.exists() && file.length() > 0) {
                    FileInputStream fileInputStream = new FileInputStream(file);
                    byte[] data = new byte[(int) file.length()];
                    fileInputStream.read(data);
                    fileInputStream.close();
                    String fileContent = A03(0, 5, 98);
                    strA03 = new String(data, fileContent);
                }
            }
        } catch (FileNotFoundException e3) {
            this.A03.A08().ABz(A03(36, 17, 6), AbstractC2126lf.A17, new C2127lg(e3));
        } catch (IOException e11) {
            this.A03.A08().ABz(A03(36, 17, 6), AbstractC2126lf.A19, new C2127lg(e11));
        }
        return strA03;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A07() {
        String strA03 = A03(36, 17, 6);
        try {
            this.A02.A08(A04(this.A04 + A03(23, 13, 39)));
            this.A02.A0A(A04(A03(5, 18, 101)));
        } catch (C2127lg e3) {
            A0M();
            this.A03.A08().ABz(strA03, AbstractC2126lf.A18, e3);
        } catch (JSONException e11) {
            A0M();
            this.A03.A08().ABz(strA03, AbstractC2126lf.A1A, new C2127lg(e11));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A08() {
        String adsFrequencyCappingDataList;
        synchronized (this.A02) {
            adsFrequencyCappingDataList = this.A02.A05().toString();
        }
        A0G(A0K(), adsFrequencyCappingDataList);
    }

    private final void A0A() {
        this.A07.execute(new ME(this));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void A0E(C1749fS c1749fS, String str, boolean z11) {
        c1749fS.A07(z11);
        if (c1749fS.A08() || c1749fS.A09()) {
            this.A02.A07(str);
        } else {
            this.A02.A09(str);
        }
    }

    private void A0F(String str) {
        File file = new File(this.A03.getFilesDir(), str);
        if (file.exists()) {
            file.delete();
        }
    }

    private final synchronized void A0G(String str, String str2) {
        A0H(this.A04 + A03(23, 13, 39), str.getBytes());
        A0H(A03(5, 18, 101), str2.getBytes());
    }

    private void A0H(String str, byte[] bArr) {
        try {
            synchronized (this) {
                File file = new File(this.A03.getFilesDir(), str);
                FileOutputStream fout = new FileOutputStream(file);
                fout.write(bArr);
                fout.close();
            }
        } catch (FileNotFoundException e3) {
            this.A03.A08().ABz(A03(36, 17, 6), AbstractC2126lf.A17, new C2127lg(e3));
        } catch (IOException e11) {
            this.A03.A08().ABz(A03(36, 17, 6), AbstractC2126lf.A19, new C2127lg(e11));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0J(String str) {
        boolean z11 = false;
        try {
            synchronized (this.A02) {
                z11 = this.A02.A05().get(str) instanceof C1749fS;
            }
        } catch (JSONException e3) {
            this.A03.A08().ABz(A03(36, 17, 6), AbstractC2126lf.A1A, new C2127lg(e3));
        }
        return z11;
    }

    public final String A0K() {
        return this.A02.A04();
    }

    public final void A0L() {
        if (!this.A01 || this.A00 == null) {
            return;
        }
        this.A07.execute(new MB(this, this.A00));
    }

    public final synchronized void A0M() {
        A0F(this.A04 + A03(5, 18, 101));
        A0F(this.A04 + A03(23, 13, 39));
    }

    public final void A0N(String str) {
        if (!this.A01) {
            return;
        }
        this.A00 = str;
        this.A07.execute(new MC(this, str));
    }

    public final void A0O(JSONObject jSONObject) {
        this.A01 = C2203mv.A1D(this.A03);
        if (!this.A01) {
            return;
        }
        this.A07.execute(new MD(this, jSONObject));
    }
}
