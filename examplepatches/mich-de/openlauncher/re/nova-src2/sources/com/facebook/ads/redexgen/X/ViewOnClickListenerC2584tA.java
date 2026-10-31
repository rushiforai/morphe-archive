package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.text.TextUtils;
import android.view.View;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.tA, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class ViewOnClickListenerC2584tA implements View.OnClickListener {
    public static byte[] A01;
    public static String[] A02 = {"k8MtpBt3Qfu9t4OFuOzPTA9", "EaWgwdwBdhlXfh75tf5xlZizItKY", "I3a1V9Q81nlEgCzUcKWQuRqODQ3DjWxH", "oEHnpcoPHOQ1w0r9N2bX746yyo9AzRt3", "zzYKfSLKQXqk5r1VBilP0eW3P6Zh", "kPf", "y93zqkftmbiIIhqeBUj1eeRDrTChoR0B", "82057t9sswwT0Wwk3ahaSLaHG8ap"};
    public final /* synthetic */ F8 A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A02[2].charAt(19) != 'Q') {
                throw new RuntimeException();
            }
            String[] strArr = A02;
            strArr[6] = "R4jhTLFzeCLA05fehusZUE0v0ZqM0RbB";
            strArr[3] = "iLH4dxaHi48TTWSeZbAis2052LkD1Rwp";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 32);
            i13++;
        }
    }

    public static void A01() {
        byte[] bArr = {80, 83, 94, 68, 69, 11, 83, 93, 80, 95, 90, 119, 120, 73, 119, 117, 98, AbstractJsonLexerKt.TC_INVALID, 96, AbstractJsonLexerKt.TC_INVALID, 98, 111, 119, 120, 114, 100, 121, AbstractJsonLexerKt.TC_INVALID, 114, 56, AbstractJsonLexerKt.TC_INVALID, 120, 98, 115, 120, 98, 56, 119, 117, 98, AbstractJsonLexerKt.TC_INVALID, 121, 120, 56, 64, 95, 83, 65};
        if (A02[5].length() != 3) {
            throw new RuntimeException();
        }
        String[] strArr = A02;
        strArr[1] = "4zVifcW4nf1GYQGXTX8TrM1073wM";
        strArr[0] = "GSdjqXXoR7tmBXEcQx0Yi2E";
        A01 = bArr;
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
            if (!TextUtils.isEmpty(this.A00.A06) && !A00(0, 11, 17).equals(this.A00.A06)) {
                Intent intent = new Intent(A00(22, 26, 54), AbstractC2351pP.A00(this.A00.A06));
                intent.addFlags(268435456);
                this.A00.A08.A0F().AAc();
                try {
                    C2337p8.A0F(this.A00.A08, intent);
                    if (this.A00.A05 != null) {
                        this.A00.A05.AG4();
                    }
                } catch (C2335p6 e3) {
                    Throwable cause = e3.getCause();
                    Throwable cause2 = e3;
                    if (cause != null) {
                        cause2 = e3.getCause();
                    }
                    this.A00.A08.A08().ABz(A00(11, 11, 54), AbstractC2126lf.A00, new C2127lg(cause2));
                }
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }

    static {
        A01();
    }

    public ViewOnClickListenerC2584tA(F8 f82) {
        this.A00 = f82;
    }
}
