package com.facebook.ads.redexgen.X;

import android.graphics.PointF;
import android.util.Log;
import android.view.View;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.j9, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1973j9 {
    public static byte[] A07;
    public static String[] A08 = {"ffTcX10Z9", "veDPHJ", "R", "iWatF5LLo", "0slLts", "p92m", "9", "eFvKPH9TFpfstHyCObyNN72zUjBGeH"};
    public View A01;
    public AbstractC1960iw A02;
    public C7O A03;
    public boolean A04;
    public boolean A05;
    public int A00 = -1;
    public final C1971j7 A06 = new C1971j7(0, 0);

    public static String A08(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 28);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        byte[] bArr = {78, 105, 113, 102, 107, 110, 99, 39, 115, 102, 117, 96, 98, 115, 39, 119, 104, 116, 110, 115, 110, 104, 105, 22, 39, 53, 53, 35, 34, 102, 41, 48, 35, 52, 102, 50, 39, 52, 33, 35, 50, 102, 54, 41, 53, 47, 50, 47, 41, 40, 102, 49, 46, 47, 42, 35, 102, 53, 43, 41, 41, 50, 46, 102, 53, 37, 52, 41, 42, 42, 47, 40, 33, 104, 78, 121, AbstractJsonLexerKt.TC_INVALID, 101, AbstractJsonLexerKt.TC_INVALID, 112, 121, 110, 74, 117, 121, 107};
        String[] strArr = A08;
        if (strArr[4].length() != strArr[1].length()) {
            throw new RuntimeException();
        }
        A08[7] = "8BqCBekg5p6xdwXQXpIxknueaPhzjw";
        A07 = bArr;
    }

    public abstract void A0G();

    public abstract void A0I(int i5, int i11, C1975jB c1975jB, C1971j7 c1971j7);

    public abstract void A0L(View view, C1975jB c1975jB, C1971j7 c1971j7);

    static {
        A09();
    }

    private final int A06(View view) {
        return this.A03.A1D(view);
    }

    private final View A07(int i5) {
        return this.A03.A06.A1z(i5);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0A(int i5, int i11) {
        C7O c7o = this.A03;
        if (!this.A05 || this.A00 == -1 || c7o == null) {
            A0F();
        }
        this.A04 = false;
        if (this.A01 != null) {
            int iA06 = A06(this.A01);
            String[] strArr = A08;
            if (strArr[4].length() != strArr[1].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A08;
            strArr2[3] = "1zDtC4ICw";
            strArr2[0] = "WYaFIbeKL";
            if (iA06 == this.A00) {
                A0L(this.A01, c7o.A0s, this.A06);
                C1971j7 c1971j7 = this.A06;
                if (A08[5].length() != 9) {
                    String[] strArr3 = A08;
                    strArr3[6] = "M";
                    strArr3[2] = "Q";
                    c1971j7.A05(c7o);
                    A0F();
                } else {
                    A08[5] = "sldJFA0K947j";
                    c1971j7.A05(c7o);
                    A0F();
                }
            } else {
                Log.e(A08(74, 12, 0), A08(23, 51, 90));
                this.A01 = null;
            }
        }
        if (this.A05) {
            A0I(i5, i11, c7o.A0s, this.A06);
            boolean hadJumpTarget = this.A06.A06();
            this.A06.A05(c7o);
            if (hadJumpTarget) {
                if (this.A05) {
                    this.A04 = true;
                    c7o.A08.A07();
                } else {
                    A0F();
                }
            }
        }
    }

    public final int A0C() {
        return this.A03.A06.A1T();
    }

    public final int A0D() {
        return this.A00;
    }

    public final AbstractC1960iw A0E() {
        return this.A02;
    }

    public final void A0F() {
        if (!this.A05) {
            return;
        }
        A0G();
        this.A03.A0s.A0F = -1;
        this.A01 = null;
        this.A00 = -1;
        this.A04 = false;
        this.A05 = false;
        this.A02.A1J(this);
        this.A02 = null;
        this.A03 = null;
    }

    public final void A0H(int i5) {
        this.A00 = i5;
    }

    public final void A0J(PointF pointF) {
        float fSqrt = (float) Math.sqrt((pointF.x * pointF.x) + (pointF.y * pointF.y));
        float magnitude = pointF.x;
        pointF.x = magnitude / fSqrt;
        float magnitude2 = pointF.y;
        pointF.y = magnitude2 / fSqrt;
    }

    public final void A0K(View view) {
        if (A06(view) == A0D()) {
            this.A01 = view;
        }
    }

    public final void A0M(C7O c7o, AbstractC1960iw abstractC1960iw) {
        this.A03 = c7o;
        this.A02 = abstractC1960iw;
        if (this.A00 != -1) {
            this.A03.A0s.A0F = this.A00;
            this.A05 = true;
            this.A04 = true;
            this.A01 = A07(A0D());
            this.A03.A08.A07();
            return;
        }
        throw new IllegalArgumentException(A08(0, 23, 27));
    }

    public final boolean A0N() {
        return this.A04;
    }

    public final boolean A0O() {
        return this.A05;
    }
}
