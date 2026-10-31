package com.facebook.ads.redexgen.X;

import android.graphics.Point;
import android.graphics.Rect;
import android.view.View;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.2N, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C2N {
    public static byte[] A00;
    public static String[] A01 = {"TtNs1UbtruECXot", "tpaue", "s90Sw2xfipZOkULUf4YVkqTv1ri2JEFZ", "UW9U9pyLqubavRm8Co8t1ARkgbl4JN3Q", "Ubll", "jCd34Nuc8OSCD22", "PumDfveAcRoz4mAMU1oiRh2I021HXL7u", "7XnL499JY0auPeNFsvc8kwtFVWOKtFwM"};
    public static final C2N A02;
    public static final Point A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 42);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{101, AbstractJsonLexerKt.TC_INVALID, 126, 77, 102, 101, 104, 107, 102, 88, 111, 105, 126, 79, 85, 84, 103, 76, 79, 66, 65, 76, 118, 73, 83, 73, 66, 76, 69, 114, 69, 67, 84, 4, 27, 23, 5, 6, 25, 21, 7, 0, 31, 2, 4, 34, 21, 19, 4};
    }

    static {
        A01();
        A02 = new C2N();
        A03 = new Point();
    }

    @JvmStatic
    public static final boolean A02(View view, Rect rect, Rect rect2, Rect rect3) {
        C1h.A09(view, A00(33, 4, 88));
        C1h.A09(rect, A00(13, 20, 10));
        C1h.A09(rect2, A00(0, 13, 32));
        C1h.A09(rect3, A00(37, 12, 90));
        if (!view.isShown()) {
            rect.setEmpty();
            rect2.setEmpty();
            return false;
        }
        if (!view.getGlobalVisibleRect(rect, A03)) {
            rect2.setEmpty();
            rect.setEmpty();
            return false;
        }
        if (!rect.intersect(rect3)) {
            rect2.setEmpty();
            rect.setEmpty();
            if (A01[6].charAt(7) != 'A') {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[2] = "uPGJEhgdW6Zw1Sj0lSecSmwhOYLW8VRR";
            strArr[7] = "8DkF2pCK7gEKj1aPHzeGQpXB8g2QomLh";
            return false;
        }
        rect2.set(A03.x, A03.y, A03.x + view.getWidth(), A03.y + view.getHeight());
        return true;
    }
}
