package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.66, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class AnonymousClass66 extends BK {
    public final /* synthetic */ AnonymousClass65 A00;

    public AnonymousClass66(AnonymousClass65 anonymousClass65) {
        this.A00 = anonymousClass65;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final void A03(BL bl2) {
        new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.facebook.ads.redexgen.X.0D
            public static byte[] A01;
            public static String[] A02 = {"uduF7y1C8f4BfvOCO4Bbq6znZfD289wY", "LfQQ99tGpIYoqROwWovpCF40OXz0xcCP", "pe2RdaJtvVEZmLt4Dkt9DCEmAABN", "zCkDdi8MMPMgBKhzCwwd8Y", "gpXsz89N0H7wm", "U57X7XmLFZehOxidvs2iHeLBOkC7", "VomEcvnoa3iVV8u", "uRkqt"};

            public static String A00(int i5, int i11, int i12) {
                byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
                for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                    bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 44);
                }
                return new String(bArrCopyOfRange);
            }

            public static void A01() {
                byte[] bArr = {-28, -9, -14, -13, -3, -34, -6, -17, 7, -16, -17, -15, -7, -45, 0, 0, -3, 0};
                String[] strArr = A02;
                if (strArr[2].length() != strArr[5].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A02;
                strArr2[2] = "IRUmVXxJ3xpLtoKGmKUObZK1jjqw";
                strArr2[5] = "FvpPsD11YfGqSvfesnropeXaLbJS";
                A01 = bArr;
            }

            static {
                A01();
            }

            @Override // java.lang.Runnable
            public final void run() throws Throwable {
                if (AbstractC2311oi.A02(this)) {
                    return;
                }
                try {
                    this.A00.A00.A0f.AHa(A00(0, 18, 98));
                } catch (Throwable th2) {
                    AbstractC2311oi.A00(th2, this);
                }
            }
        });
    }
}
