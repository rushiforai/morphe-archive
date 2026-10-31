package com.stripe.android.paymentsheet.ui;

import ab.e0;
import ai.k0;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.GradientDrawable;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.ImageView;
import androidx.compose.ui.platform.ComposeView;
import b70.g;
import c3.k3;
import com.google.android.material.progressindicator.CircularProgressIndicator;
import com.stripe.android.core.strings.ResolvableString;
import hv.p2;
import hv.q2;
import hv.r2;
import hv.t2;
import hw.k;
import hw.q;
import hw.r;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import x1.e;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/paymentsheet/ui/PrimaryButton;", "Landroid/widget/FrameLayout;", "hv/r2", "hv/s2", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class PrimaryButton extends FrameLayout {

    /* renamed from: m, reason: collision with root package name */
    public static final /* synthetic */ int f44986m = 0;

    /* renamed from: a, reason: collision with root package name */
    public ColorStateList f44987a;

    /* renamed from: b, reason: collision with root package name */
    public r2 f44988b;

    /* renamed from: c, reason: collision with root package name */
    public final k0 f44989c;

    /* renamed from: d, reason: collision with root package name */
    public ResolvableString f44990d;

    /* renamed from: e, reason: collision with root package name */
    public final pr.c f44991e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f44992f;

    /* renamed from: g, reason: collision with root package name */
    public final ImageView f44993g;

    /* renamed from: h, reason: collision with root package name */
    public float f44994h;

    /* renamed from: i, reason: collision with root package name */
    public float f44995i;

    /* renamed from: j, reason: collision with root package name */
    public int f44996j;

    /* renamed from: k, reason: collision with root package name */
    public int f44997k;

    /* renamed from: l, reason: collision with root package name */
    public int f44998l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public PrimaryButton(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        Intrinsics.g(context, "context");
        this.f44989c = new k0(context);
        LayoutInflater.from(context).inflate(2131624424, this);
        int i5 = 2131427729;
        ImageView imageView = (ImageView) e0.x(2131427729, this);
        if (imageView != null) {
            i5 = 2131427730;
            CircularProgressIndicator circularProgressIndicator = (CircularProgressIndicator) e0.x(2131427730, this);
            if (circularProgressIndicator != null) {
                i5 = 2131428248;
                ComposeView composeView = (ComposeView) e0.x(2131428248, this);
                if (composeView != null) {
                    i5 = 2131428289;
                    ImageView imageView2 = (ImageView) e0.x(2131428289, this);
                    if (imageView2 != null) {
                        this.f44991e = new pr.c(this, imageView, circularProgressIndicator, composeView, imageView2);
                        this.f44992f = true;
                        this.f44993g = imageView;
                        k kVar = q.f60780e;
                        this.f44994h = r.b(context, kVar.f60746c.f60741a);
                        this.f44995i = r.b(context, kVar.f60746c.f60742b);
                        this.f44996j = r.e(kVar, context);
                        this.f44997k = r.n(kVar, context);
                        this.f44998l = r.i(kVar, context);
                        composeView.setViewCompositionStrategy(k3.f19374a);
                        Context context2 = getContext();
                        Intrinsics.f(context2, "getContext(...)");
                        TypedArray typedArrayObtainStyledAttributes = context2.obtainStyledAttributes(attributeSet, g.H1(ul.b.P(16843087)), 0, 0);
                        CharSequence text = typedArrayObtainStyledAttributes.getText(0);
                        typedArrayObtainStyledAttributes.recycle();
                        if (text != null) {
                            a(zg.a.H(text.toString()));
                        }
                        setClickable(true);
                        setEnabled(false);
                        return;
                    }
                }
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(getResources().getResourceName(i5)));
    }

    public final void a(ResolvableString resolvableString) {
        if (resolvableString != null) {
            if (!(this.f44988b instanceof q2)) {
                this.f44990d = resolvableString;
            }
            ((ComposeView) this.f44991e.f82826d).setContent(new e(new t2(resolvableString, this), true, -47128405));
        }
    }

    public final void b() {
        pr.c cVar = this.f44991e;
        for (View view : ul.b.Q((ComposeView) cVar.f82826d, (ImageView) cVar.f82827e)) {
            r2 r2Var = this.f44988b;
            view.setAlpha(((r2Var == null || (r2Var instanceof p2)) && !isEnabled()) ? 0.5f : 1.0f);
        }
    }

    public final void c(boolean z11) {
        ((ImageView) this.f44991e.f82827e).setVisibility((this.f44992f && z11) ? 0 : 8);
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        if (accessibilityNodeInfo != null) {
            accessibilityNodeInfo.setClassName("android.widget.Button");
        }
        if (accessibilityNodeInfo != null) {
            accessibilityNodeInfo.setEnabled(isEnabled());
        }
    }

    @Override // android.view.View
    public final void setBackgroundTintList(ColorStateList colorStateList) throws Resources.NotFoundException {
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(0);
        gradientDrawable.setCornerRadius(this.f44994h);
        gradientDrawable.setColor(colorStateList);
        gradientDrawable.setStroke((int) this.f44995i, this.f44996j);
        setBackground(gradientDrawable);
        int dimensionPixelSize = getResources().getDimensionPixelSize(2131166490);
        setPadding(dimensionPixelSize, dimensionPixelSize, dimensionPixelSize, dimensionPixelSize);
    }

    @Override // android.view.View
    public final void setEnabled(boolean z11) {
        super.setEnabled(z11);
        b();
    }
}
