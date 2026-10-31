package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.7d, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07117d extends KI {
    public static byte[] A00;
    public static String[] A01 = {"d7tLiGkqyLa7cKOkED7RtvmpIXZH8d0b", "LmA4T64r6T9e", "1EBtOKlPck0twYp3ElEJQmg3d", "uhXcdOUibAChEZNBNQuPqKRIQ2", "Z", "LV0o53GlcsqgEYK9Pr4EwymnJShooL9b", "NLZosIPt4DzrQXhRsvqwWEHVFOTX5bDJ", "MQasnwh7q"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 52);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{77, 72, 12, 69, 95, 12, 66, 67, 88, 12, 94, 73, 77, 72, 85, 12, 67, 94, 12, 77, 64, 94, 73, 77, 72, 85, 12, 72, 69, 95, 92, 64, 77, 85, 73, 72, 56, 57, 48, 61, 37};
    }

    static {
        A03();
    }

    public C07117d(C0958Hi c0958Hi, C1781fy c1781fy) {
        super(c0958Hi, c1781fy);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Map<String, String> A01(long j11) {
        HashMap map = new HashMap();
        map.put(A00(36, 5, 104), String.valueOf(System.currentTimeMillis() - j11));
        return map;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A05(List<String> list, Map<String, String> map) {
        if (list == null || list.isEmpty()) {
            return;
        }
        Iterator<String> it = list.iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            String[] strArr = A01;
            if (strArr[2].length() == strArr[7].length()) {
                throw new RuntimeException();
            }
            A01[0] = "jDIZMq7wlAdnEmkEGDRuOyHBIh8qxobs";
            if (zHasNext) {
                new C1442aT(this.A0B, map).A0C(it.next());
            } else {
                return;
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.KI
    public final void A0O() {
        C1056Lh c1056Lh = (C1056Lh) this.A01;
        if (c1056Lh.A0R()) {
            if (this.A07 != null) {
                this.A07.A0B(c1056Lh);
                return;
            }
            return;
        }
        throw new IllegalStateException(A00(0, 36, 24));
    }

    @Override // com.facebook.ads.redexgen.X.KI
    public final void A0Q(InterfaceC1708en interfaceC1708en, C2145ly c2145ly, C2143lw c2143lw, C1782fz c1782fz) {
        C1056Lh c1056Lh = (C1056Lh) interfaceC1708en;
        long jCurrentTimeMillis = System.currentTimeMillis();
        KF kf2 = new KF(this, c1782fz, c1056Lh, jCurrentTimeMillis, c2143lw);
        A0G().postDelayed(kf2, c2145ly.A05().A05());
        c1056Lh.A0L(this.A0B, new KE(this, kf2, jCurrentTimeMillis, c2143lw), this.A09, c1782fz, GT.A0K());
    }
}
