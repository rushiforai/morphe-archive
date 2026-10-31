package com.facebook.ads.redexgen.X;

import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.nC, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2220nC {
    public double A00;
    public EnumC2226nI A01;
    public EnumC2227nJ A02;
    public String A03;
    public String A04;
    public Map<String, String> A05;
    public boolean A06;

    public final C2220nC A00(double d5) {
        this.A00 = d5;
        return this;
    }

    public final C2220nC A01(EnumC2226nI enumC2226nI) {
        this.A01 = enumC2226nI;
        return this;
    }

    public final C2220nC A02(EnumC2227nJ enumC2227nJ) {
        this.A02 = enumC2227nJ;
        return this;
    }

    public final C2220nC A03(String str) {
        this.A03 = str;
        return this;
    }

    public final C2220nC A04(String str) {
        this.A04 = str;
        return this;
    }

    public final C2220nC A05(Map<String, String> mData) {
        this.A05 = mData;
        return this;
    }

    public final C2220nC A06(boolean z11) {
        this.A06 = z11;
        return this;
    }

    public final C2221nD A07(C2095lA c2095lA) {
        return new C2221nD(c2095lA, this.A04, this.A00, this.A03, this.A05, this.A01, this.A02, this.A06);
    }
}
