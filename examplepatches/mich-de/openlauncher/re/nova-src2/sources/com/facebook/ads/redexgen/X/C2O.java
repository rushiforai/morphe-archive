package com.facebook.ads.redexgen.X;

import android.view.View;
import java.util.Arrays;
import java.util.WeakHashMap;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.2O, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C2O {
    public static byte[] A00;
    public static String[] A01 = {"tM", "OPSTz", "nSVgoUnJhqchgKDvzZkuQEe6gXNDXiJa", "w6a8CUhjr9W4mo91m011A7MFgCBLOqFf", "py3rfD", "ih7XR3ofyKGNBaShrQXGXw0JFIFEgb8N", "DEOWgwil5msK", "goT19SPCP2Wcb2IATE"};

    public /* synthetic */ C2O(AbstractC05811i abstractC05811i) {
        this();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A01;
            if (strArr[1].length() == strArr[7].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[1] = "kKLBr";
            strArr2[7] = "W5yuMnVpFJPnLtYkAS";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 31);
            i13++;
        }
    }

    public static void A03() {
        byte[] bArr = {126, 97, 109, AbstractJsonLexerKt.TC_INVALID};
        if (A01[5].charAt(10) != 'G') {
            throw new RuntimeException();
        }
        A01[5] = "dvHL5pgrLAG1IBapnMOcCgSK2VIAPJci";
        A00 = bArr;
    }

    static {
        A03();
    }

    public C2O() {
    }

    private final AnonymousClass11 A00(View view) {
        Object tag = view.getTag(2130706433);
        AbstractC05811i abstractC05811i = null;
        AnonymousClass11 anonymousClass11 = tag instanceof AnonymousClass11 ? (AnonymousClass11) tag : null;
        if (anonymousClass11 != null) {
            return anonymousClass11;
        }
        AnonymousClass11 anonymousClass112 = new AnonymousClass11(view, abstractC05811i);
        view.setTag(2130706433, anonymousClass112);
        return anonymousClass112;
    }

    private final AnonymousClass11 A01(View view) {
        WeakHashMap weakHashMap = AnonymousClass11.A04;
        Object anonymousClass11 = weakHashMap.get(view);
        if (anonymousClass11 == null) {
            anonymousClass11 = new AnonymousClass11(view, null);
            weakHashMap.put(view, anonymousClass11);
        }
        return (AnonymousClass11) anonymousClass11;
    }

    @JvmStatic
    public final AnonymousClass11 A04(View view) {
        C1h.A09(view, A02(0, 4, 23));
        if (A05()) {
            return A00(view);
        }
        return A01(view);
    }

    public final boolean A05() {
        return AnonymousClass11.A05;
    }
}
