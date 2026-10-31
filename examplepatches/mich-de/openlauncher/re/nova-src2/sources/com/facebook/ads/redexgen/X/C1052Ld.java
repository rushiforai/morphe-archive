package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.text.Layout;
import org.checkerframework.dataflow.qual.Pure;

/* renamed from: com.facebook.ads.redexgen.X.Ld, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1052Ld {
    public float A00;
    public float A01;
    public float A02;
    public float A03;
    public float A04;
    public float A05;
    public int A06;
    public int A07;
    public int A08;
    public int A09;
    public int A0A;
    public int A0B;
    public Bitmap A0C;
    public Layout.Alignment A0D;
    public Layout.Alignment A0E;
    public CharSequence A0F;
    public boolean A0G;

    public C1052Ld() {
        this.A0F = null;
        this.A0C = null;
        this.A0E = null;
        this.A0D = null;
        this.A01 = -3.4028235E38f;
        this.A07 = Integer.MIN_VALUE;
        this.A06 = Integer.MIN_VALUE;
        this.A02 = -3.4028235E38f;
        this.A08 = Integer.MIN_VALUE;
        this.A09 = Integer.MIN_VALUE;
        this.A05 = -3.4028235E38f;
        this.A04 = -3.4028235E38f;
        this.A00 = -3.4028235E38f;
        this.A0G = false;
        this.A0B = -16777216;
        this.A0A = Integer.MIN_VALUE;
    }

    public C1052Ld(C1251Th c1251Th) {
        this.A0F = c1251Th.A0F;
        this.A0C = c1251Th.A0C;
        this.A0E = c1251Th.A0E;
        this.A0D = c1251Th.A0D;
        this.A01 = c1251Th.A01;
        this.A07 = c1251Th.A07;
        this.A06 = c1251Th.A06;
        this.A02 = c1251Th.A02;
        this.A08 = c1251Th.A08;
        this.A09 = c1251Th.A09;
        this.A05 = c1251Th.A05;
        this.A04 = c1251Th.A04;
        this.A00 = c1251Th.A00;
        this.A0G = c1251Th.A0G;
        this.A0B = c1251Th.A0B;
        this.A0A = c1251Th.A0A;
        this.A03 = c1251Th.A03;
    }

    @Pure
    public final int A00() {
        return this.A06;
    }

    @Pure
    public final int A01() {
        return this.A08;
    }

    public final C1052Ld A02() {
        this.A0G = false;
        return this;
    }

    public final C1052Ld A03(float f11) {
        this.A00 = f11;
        return this;
    }

    public final C1052Ld A04(float f11) {
        this.A02 = f11;
        return this;
    }

    public final C1052Ld A05(float f11) {
        this.A03 = f11;
        return this;
    }

    public final C1052Ld A06(float f11) {
        this.A04 = f11;
        return this;
    }

    public final C1052Ld A07(float f11, int i5) {
        this.A01 = f11;
        this.A07 = i5;
        return this;
    }

    public final C1052Ld A08(float f11, int i5) {
        this.A05 = f11;
        this.A09 = i5;
        return this;
    }

    public final C1052Ld A09(int i5) {
        this.A06 = i5;
        return this;
    }

    public final C1052Ld A0A(int i5) {
        this.A08 = i5;
        return this;
    }

    public final C1052Ld A0B(int i5) {
        this.A0A = i5;
        return this;
    }

    public final C1052Ld A0C(int i5) {
        this.A0B = i5;
        this.A0G = true;
        return this;
    }

    public final C1052Ld A0D(Bitmap bitmap) {
        this.A0C = bitmap;
        return this;
    }

    public final C1052Ld A0E(Layout.Alignment alignment) {
        this.A0D = alignment;
        return this;
    }

    public final C1052Ld A0F(Layout.Alignment alignment) {
        this.A0E = alignment;
        return this;
    }

    public final C1052Ld A0G(CharSequence charSequence) {
        this.A0F = charSequence;
        return this;
    }

    public final C1251Th A0H() {
        return new C1251Th(this.A0F, this.A0E, this.A0D, this.A0C, this.A01, this.A07, this.A06, this.A02, this.A08, this.A09, this.A05, this.A04, this.A00, this.A0G, this.A0B, this.A0A, this.A03);
    }

    @Pure
    public final CharSequence A0I() {
        return this.A0F;
    }
}
