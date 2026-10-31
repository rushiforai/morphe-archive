package com.afollestad.materialdialogs.internal;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.TextView;
import b.c0;
import com.google.android.gms.internal.measurement.k2;

/* loaded from: classes2.dex */
public class MDButton extends TextView {

    /* renamed from: a, reason: collision with root package name */
    public boolean f20154a;

    /* renamed from: b, reason: collision with root package name */
    public int f20155b;

    /* renamed from: c, reason: collision with root package name */
    public final int f20156c;

    /* renamed from: d, reason: collision with root package name */
    public Drawable f20157d;

    /* renamed from: e, reason: collision with root package name */
    public Drawable f20158e;

    public MDButton(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f20154a = false;
        this.f20156c = context.getResources().getDimensionPixelSize(2131166035);
        this.f20155b = 3;
    }

    public final void a(boolean z11, boolean z12) {
        int iF;
        if (this.f20154a != z11 || z12) {
            setGravity(z11 ? k2.b(this.f20155b) | 16 : 17);
            int i5 = 4;
            if (z11 && (iF = c0.F(this.f20155b)) != 1) {
                i5 = iF != 2 ? 5 : 6;
            }
            setTextAlignment(i5);
            setBackground(z11 ? this.f20157d : this.f20158e);
            if (z11) {
                setPadding(this.f20156c, getPaddingTop(), this.f20156c, getPaddingBottom());
            }
            this.f20154a = z11;
        }
    }
}
