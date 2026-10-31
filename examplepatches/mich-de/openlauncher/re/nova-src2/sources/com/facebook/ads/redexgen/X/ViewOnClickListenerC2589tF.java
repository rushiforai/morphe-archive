package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.text.TextUtils;
import android.view.View;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.tF, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2589tF implements View.OnClickListener {
    public static byte[] A01;
    public final /* synthetic */ F6 A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 66);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-58, -57, -44, -38, -39, -97, -57, -47, -58, -45, -48, 20, 33, 18, 20, 22, 39, 28, 41, 28, 39, 44, -60, -47, -57, -43, -46, -52, -57, -111, -52, -47, -41, -56, -47, -41, -111, -60, -58, -41, -52, -46, -47, -111, -71, -84, -88, -70};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (!TextUtils.isEmpty(this.A00.A07) && !A00(0, 11, 35).equals(this.A00.A07)) {
                Intent intent = new Intent(A00(22, 26, 33), AbstractC2351pP.A00(this.A00.A07));
                intent.addFlags(268435456);
                this.A00.A09.A0F().AAc();
                try {
                    C2337p8.A0F(this.A00.A09, intent);
                    if (this.A00.A06 != null) {
                        this.A00.A06.AG4();
                    }
                } catch (C2335p6 e3) {
                    Throwable cause = e3.getCause();
                    Throwable cause2 = e3;
                    if (cause != null) {
                        cause2 = e3.getCause();
                    }
                    this.A00.A09.A08().ABz(A00(11, 11, 113), AbstractC2126lf.A00, new C2127lg(cause2));
                }
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }

    public ViewOnClickListenerC2589tF(F6 f62) {
        this.A00 = f62;
    }
}
