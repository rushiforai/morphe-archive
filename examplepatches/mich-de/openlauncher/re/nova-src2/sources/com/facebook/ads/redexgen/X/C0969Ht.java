package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.api.BuildConfigApi;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.Ht, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0969Ht implements InterfaceC2055kT {
    public static byte[] A03;
    public static String[] A04 = {"Yyt8Jrp", "FvQHlihhdkZe9tXm7YLHdG4gIBqm", "h7ITXytSbKbsxwMfZDKdUPEvMsTrizAq", "0TuNzKSIMRKA8K3EzRQL94hbriXTa7QT", "ySuQOOQJHVodSpCznPaDLfXVVxuxvbGA", "XYB8XYCfCTfWBGtKG07Wi1HuHmIQx2qC", "71D0xe3tljOi7f3b0iOVOXaXnoSWhNo4", "dwdYeokke3ChTNA3vTF4hdqHGwVronGN"};
    public final InterfaceC1421a7 A01;
    public Set<InterfaceC2058kW> A00 = new HashSet();
    public final List<InterfaceC2057kV> A02 = new ArrayList();

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 107);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A03 = new byte[]{-72, -72, -67, 11, -46, -72, -67, 11, 41, 59, 59, 45, 60, 59};
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 10 out of bounds for length 8
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:147)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public synchronized void A03() {
        if (!this.A01.ABM()) {
            BuildConfigApi.isDebug();
            return;
        }
        Set<InterfaceC2058kW> setA01 = A01(this.A01.A8J());
        if (!this.A00.equals(setA01) && setA01 != null) {
            this.A00 = setA01;
            Iterator<InterfaceC2057kV> it = this.A02.iterator();
            while (it.hasNext()) {
                it.next().A4k();
            }
        }
        if (BuildConfigApi.isDebug()) {
            for (InterfaceC2058kW interfaceC2058kW : this.A00) {
                String.format(Locale.US, A00(0, 8, 45), interfaceC2058kW.AA1(), interfaceC2058kW.getUrl());
            }
        }
    }

    static {
        A02();
    }

    public C0969Ht(AH ah2) {
        this.A01 = ah2.A63(EnumC1407Zt.A0B);
        this.A01.A4R(new C0970Hu(this));
        A03();
    }

    public static Set<InterfaceC2058kW> A01(JSONObject jSONObject) {
        C0968Hs c0968HsA00;
        HashSet hashSet = new HashSet();
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray(A00(8, 6, 93));
        if (jSONArrayOptJSONArray == null) {
            return null;
        }
        for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
            JSONObject jSONObjectOptJSONObject = jSONArrayOptJSONArray.optJSONObject(i5);
            if (jSONObjectOptJSONObject == null || (c0968HsA00 = C0968Hs.A00(jSONObjectOptJSONObject)) == null) {
                return null;
            }
            hashSet.add(c0968HsA00);
            if (A04[1].length() == 21) {
                throw new RuntimeException();
            }
            String[] strArr = A04;
            strArr[6] = "2zeGpFgTpOohtr7xv9EhLTO87hKhrQIZ";
            strArr[3] = "Z45Lb0RXWpRaUi2IX7mXCACeVe5qt7dU";
        }
        return hashSet;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2055kT
    public final void A4Q(InterfaceC2057kV interfaceC2057kV) {
        this.A02.add(interfaceC2057kV);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2055kT
    public final synchronized Set<InterfaceC2058kW> A7X() {
        return new HashSet(this.A00);
    }
}
