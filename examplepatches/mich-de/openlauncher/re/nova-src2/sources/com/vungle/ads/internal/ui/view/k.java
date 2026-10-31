package com.vungle.ads.internal.ui.view;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.vungle.ads.internal.o1;
import com.vungle.ads.internal.util.a0;
import fk.t;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k extends LinearLayout {

    /* renamed from: a, reason: collision with root package name */
    public final int f47628a;

    /* renamed from: b, reason: collision with root package name */
    public final int f47629b;

    /* renamed from: c, reason: collision with root package name */
    public final ImageView f47630c;

    /* renamed from: d, reason: collision with root package name */
    public ImageView f47631d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f47632e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(Context context) {
        super(context);
        Intrinsics.g(context, "context");
        int iA = a0.a(context, 20);
        this.f47628a = iA;
        this.f47629b = a0.a(context, 4);
        ImageView imageView = new ImageView(context);
        imageView.setLayoutParams(new LinearLayout.LayoutParams(iA, iA));
        this.f47630c = imageView;
        setOrientation(0);
        setGravity(16);
    }

    public final void a(FrameLayout rootView, int i5, o1 nativeAdInternal) {
        Intrinsics.g(rootView, "rootView");
        Intrinsics.g(nativeAdInternal, "nativeAdInternal");
        if (getParent() != null) {
            ViewParent parent = getParent();
            Intrinsics.e(parent, "null cannot be cast to non-null type android.view.ViewGroup");
            ((ViewGroup) parent).removeView(this);
        }
        rootView.addView(this);
        removeAllViews();
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, this.f47628a);
        if (i5 == 0) {
            layoutParams.gravity = 8388659;
        } else if (i5 == 1) {
            layoutParams.gravity = 8388661;
        } else if (i5 == 2) {
            layoutParams.gravity = 8388691;
        } else if (i5 != 3) {
            layoutParams.gravity = 8388661;
        } else {
            layoutParams.gravity = 8388693;
        }
        setLayoutParams(layoutParams);
        addView(this.f47630c);
        this.f47630c.setOnClickListener(new t(nativeAdInternal, 20));
        nativeAdInternal.d(this.f47630c);
        if (nativeAdInternal.w()) {
            ImageView imageView = this.f47631d;
            if (imageView == null) {
                imageView = new ImageView(getContext());
                imageView.setAdjustViewBounds(true);
                this.f47631d = imageView;
            }
            LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-2, this.f47628a);
            if (i5 == 0 || i5 == 2) {
                layoutParams2.setMarginStart(this.f47629b);
                addView(imageView, layoutParams2);
            } else {
                layoutParams2.setMarginEnd(this.f47629b);
                addView(imageView, 0, layoutParams2);
            }
            nativeAdInternal.a(imageView);
        }
        rootView.requestLayout();
    }

    public static final void a(o1 nativeAdInternal, View view) {
        Intrinsics.g(nativeAdInternal, "$nativeAdInternal");
        nativeAdInternal.x();
    }

    public final void a() {
        if (this.f47632e) {
            return;
        }
        this.f47632e = true;
        removeAllViews();
        this.f47630c.setImageDrawable(null);
        ImageView imageView = this.f47631d;
        if (imageView != null) {
            imageView.setImageDrawable(null);
        }
        this.f47631d = null;
        if (getParent() != null) {
            ViewParent parent = getParent();
            Intrinsics.e(parent, "null cannot be cast to non-null type android.view.ViewGroup");
            ((ViewGroup) parent).removeView(this);
        }
    }
}
