package com.facebook.ads.redexgen.X;

import android.view.View;
import java.util.Arrays;
import kotlin.Metadata;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.o4, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class ViewOnClickListenerC2272o4 implements View.OnClickListener {
    public static byte[] A01;
    public final /* synthetic */ C2250ng A00;

    static {
        A01();
    }

    public ViewOnClickListenerC2272o4(C2250ng c2250ng) {
        this.A00 = c2250ng;
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 95);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{101, 105, 107, 40, 96, 103, 101, 99, 100, 105, 105, 109, 40, 103, 98, 117, 40, 111, 104, 114, 99, 116, 117, 114, 111, 114, 111, 103, 106, 40, 96, 111, 104, 111, 117, 110, 89, 103, 101, 114, 111, 112, 111, 114, AbstractJsonLexerKt.TC_INVALID};
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0A.A0F().ABl();
            this.A00.A0E.A5C(A00(0, 45, 89));
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
