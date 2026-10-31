package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.6D, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class C6D extends BK {
    public final /* synthetic */ C6C A00;

    public C6D(C6C c6c) {
        this.A00 = c6c;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final void A03(BL bl2) {
        new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.facebook.ads.redexgen.X.0z
            public static byte[] A01;

            static {
                A01();
            }

            public static String A00(int i5, int i11, int i12) {
                byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
                for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                    bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 86);
                }
                return new String(bArrCopyOfRange);
            }

            public static void A01() {
                A01 = new byte[]{116, 75, 70, 71, 77, 114, 78, 67, 91, 64, 67, 65, 73, 103, 80, 80, 77, 80};
            }

            @Override // java.lang.Runnable
            public final void run() throws Throwable {
                if (AbstractC2311oi.A02(this)) {
                    return;
                }
                try {
                    this.A00.A00.A0W(A00(0, 18, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE));
                } catch (Throwable th2) {
                    AbstractC2311oi.A00(th2, this);
                }
            }
        });
    }
}
