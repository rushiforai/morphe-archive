package com.facebook.ads.redexgen.X;

import android.view.View;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.uu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2692uu implements View.OnClickListener {
    public static byte[] A01;
    public static String[] A02 = {"c2PEJ6DOqpui9EPvmckbHNLd48C", "0LubsyKGJKKePfKATMceGef14XY86Ri5", "M6oVByKNfKe8LZIrCewzhyGONHgeYcNo", "g1oo9eCM7RcmOvTxZ1VejNMrbdbCR0G4", "3al8rHdAj04D", "Lmo63BJo3ocNRJpk0", "u0Zxd4kfnWeayuGPbNnNq6ZbpiAglx3D", "JRUzdnx3lrNIQCskW6e2Avl8V"};
    public final /* synthetic */ C06876f A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = bArrCopyOfRange[i13];
            if (A02[6].charAt(25) != 'i') {
                throw new RuntimeException();
            }
            A02[3] = "5a6mLeJ2IjXboF1UfYYlwLhwsx6RVGTR";
            bArrCopyOfRange[i13] = (byte) ((b11 - i12) - 89);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{18, 5, 0, 1, 11};
    }

    static {
        A01();
    }

    public ViewOnClickListenerC2692uu(C06876f c06876f) {
        this.A00 = c06876f;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.getCtaButton().A0E(A00(0, 5, 67));
        } catch (Throwable th2) {
            if (A02[3].charAt(5) != 'e') {
                throw new RuntimeException();
            }
            String[] strArr = A02;
            strArr[2] = "oQ6hKoRa6K50vxrlE5lU8mLQHveYoJVv";
            strArr[1] = "5HqmMGmqvKeUZ55y8iy1lLJbe1y4dd8I";
            AbstractC2311oi.A00(th2, this);
        }
    }
}
