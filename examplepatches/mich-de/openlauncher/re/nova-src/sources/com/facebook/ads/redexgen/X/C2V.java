package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.Map;
import kotlin.Metadata;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.2V, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C2V {
    public static byte[] A03;
    public static String[] A04 = {"DNt4kWaTJgBtEZhcRaG6gWsx0aE29", "V5rxkr4Dm1WNpPUrhcfVUSsv", "fiK5hWNfgss21J5SkxOoY9gexdh1prSq", "7xWl8g0mpuUkV", "stKCDhEXmwOo39l8SVv6hNYAbR2", "gzEdphkWLPsNsTZ", "DpAQvr3on7HrxNbWsdt5eTfO", "AlV"};
    public final C2W A00;
    public final Long A01;
    public final Map<String, C2W> A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] - i12) - 51);
            if (A04[7].length() == 30) {
                throw new RuntimeException();
            }
            A04[7] = "FZLXdY905ya3ncLppmzo";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{-21, -16, -15, -12, -20, -50, -3, -12, -12, -34, -15, -19, -1, -51, -20, -17, -19, -37, -4, -23, -4, -19, -5, -54, 1, -47, -10, -4, -19, -6, -10, -23, -12, -45, -19, 1, -96, -81, -90, -90, -112, -93, -97, -79, AbstractJsonLexerKt.TC_INVALID, -98, -95, -97, -115, -82, -101, -82, -97};
    }

    static {
        A01();
    }

    public C2V(C2W c2w, Map<String, C2W> map, Long l9) {
        C1h.A09(c2w, A00(36, 17, 7));
        C1h.A09(map, A00(0, 36, 85));
        this.A00 = c2w;
        this.A02 = map;
        this.A01 = l9;
    }

    public final C2W A02() {
        return this.A00;
    }

    public final Long A03() {
        return this.A01;
    }

    public final Map<String, C2W> A04() {
        return this.A02;
    }
}
