package com.facebook.ads.redexgen.X;

import android.graphics.Rect;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.2S, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C2S {
    public static byte[] A07;
    public static String[] A08 = {"spDZHuLEVYfj1bXFEB", "zg1zZO2nY11ljXi9raPvyfYvTkdgGdT3", "jCBLOGVaOErk9Gk7TrFIgu882Ez1pDUA", "gP3meJZOYSpwwkWLfBuEFjBL", "BIq2h3m1", "0WbJgtEBZ5T2mmAIwCNjMANJluehxGv2", "too", "7MQ0LfMQLdJAXCHYcxGRSNZIPQ3PRcR"};
    public static final C2T A09;
    public long A00;
    public Long A02;
    public final List<Rect> A05 = new ArrayList();
    public final Rect A03 = new Rect();
    public final C2W A04 = new C2W();
    public final Map<String, C2W> A06 = new HashMap();
    public EnumC05872a A01 = EnumC05872a.A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] - i12;
            if (A08[0].length() != 18) {
                throw new RuntimeException();
            }
            A08[7] = "3Nx7Oj138nR7xlgx";
            bArrCopyOfRange[i13] = (byte) (i14 - 122);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A07 = new byte[]{-12, 43, 29, 44, -27, -9, -10, 26, 41, 32, 32, 10, 29, 25, 43, 7, 40, 21, 40, 25};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 7 out of bounds for length 7
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final C2V A05() {
        C2W c2wA02 = this.A04.A02();
        Map<String, C2W> map = this.A06;
        LinkedHashMap linkedHashMap = new LinkedHashMap(AbstractC05650q.A05(map.size()));
        for (Object obj : map.entrySet()) {
            linkedHashMap.put(((Map.Entry) obj).getKey(), ((C2W) ((Map.Entry) obj).getValue()).A02());
        }
        return new C2V(c2wA02, linkedHashMap, this.A02);
    }

    static {
        A01();
        A09 = new C2T(null);
    }

    public final Rect A02() {
        return this.A03;
    }

    public final EnumC05872a A03() {
        return this.A01;
    }

    public final C2W A04() {
        return this.A04;
    }

    public final Long A06() {
        return this.A02;
    }

    public final List<Rect> A07() {
        return this.A05;
    }

    public final Map<String, C2W> A08() {
        return this.A06;
    }

    public final void A09() {
        this.A04.A03();
        this.A06.clear();
        this.A02 = null;
    }

    public final void A0A(long j11) {
        this.A00 = j11;
    }

    public final void A0B(EnumC05872a enumC05872a) {
        C1h.A09(enumC05872a, A00(0, 7, 62));
        this.A01 = enumC05872a;
    }

    public final void A0C(C2V c2v) {
        C1h.A09(c2v, A00(7, 13, 58));
        this.A04.A05(c2v.A02());
        this.A06.clear();
        for (Map.Entry<String, C2W> entry : c2v.A04().entrySet()) {
            String childInternalKey = entry.getKey();
            this.A06.put(childInternalKey, entry.getValue().A02());
        }
        Long lA03 = c2v.A03();
        if (A08[1].charAt(29) != 'd') {
            throw new RuntimeException();
        }
        A08[7] = "F";
        this.A02 = lA03;
    }

    public final void A0D(Long l9) {
        this.A02 = l9;
    }
}
