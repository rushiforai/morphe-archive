package com.facebook.ads.redexgen.X;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.ge, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1823ge implements Serializable {
    public static final long serialVersionUID = -3209129042070173126L;
    public C1823ge A00;
    public final int A01;
    public final String A02;
    public final String A03;
    public final List<C1823ge> A04;

    public C1823ge(int i5, String str, String str2) {
        this.A04 = new ArrayList();
        this.A01 = i5;
        this.A03 = str;
        this.A02 = str2;
    }

    public C1823ge(String str) {
        this(0, null, str);
    }

    private void A00(C1823ge c1823ge) {
        this.A00 = c1823ge;
    }

    public final int A01() {
        return this.A01;
    }

    public final C1823ge A02() {
        return this.A00;
    }

    public final String A03() {
        return this.A02;
    }

    public final String A04() {
        return this.A03;
    }

    public final List<C1823ge> A05() {
        return this.A04;
    }

    public final void A06(C1823ge c1823ge) {
        c1823ge.A00(this);
        this.A04.add(c1823ge);
    }
}
