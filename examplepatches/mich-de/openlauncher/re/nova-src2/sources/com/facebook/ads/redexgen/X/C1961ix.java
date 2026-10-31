package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.ViewGroup;

/* renamed from: com.facebook.ads.redexgen.X.ix, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1961ix extends ViewGroup.MarginLayoutParams {
    public AbstractC1978jE A00;
    public boolean A01;
    public boolean A02;
    public final Rect A03;

    public C1961ix(int i5, int i11) {
        super(i5, i11);
        this.A03 = new Rect();
        this.A01 = true;
        this.A02 = false;
    }

    public C1961ix(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.A03 = new Rect();
        this.A01 = true;
        this.A02 = false;
    }

    public C1961ix(ViewGroup.LayoutParams layoutParams) {
        super(layoutParams);
        this.A03 = new Rect();
        this.A01 = true;
        this.A02 = false;
    }

    public C1961ix(ViewGroup.MarginLayoutParams marginLayoutParams) {
        super(marginLayoutParams);
        this.A03 = new Rect();
        this.A01 = true;
        this.A02 = false;
    }

    public C1961ix(C1961ix c1961ix) {
        super((ViewGroup.LayoutParams) c1961ix);
        this.A03 = new Rect();
        this.A01 = true;
        this.A02 = false;
    }

    public final int A00() {
        return this.A00.A0T();
    }

    public final boolean A01() {
        return this.A00.A0q();
    }

    public final boolean A02() {
        return this.A00.A0n();
    }

    public final boolean A03() {
        return this.A00.A0m();
    }
}
