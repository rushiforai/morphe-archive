package com.moloco.sdk.internal;

import android.animation.LayoutTransition;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Outline;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewOutlineProvider;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Space;
import android.widget.TextView;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import com.moloco.sdk.R;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class w extends LinearLayout {

    /* renamed from: h, reason: collision with root package name */
    public static final int f38250h = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Function0<Unit> f38251a;

    /* renamed from: b, reason: collision with root package name */
    public final int f38252b;

    /* renamed from: c, reason: collision with root package name */
    public final int f38253c;

    /* renamed from: d, reason: collision with root package name */
    public final float f38254d;

    /* renamed from: e, reason: collision with root package name */
    public final int f38255e;

    /* renamed from: f, reason: collision with root package name */
    public final int f38256f;

    /* renamed from: g, reason: collision with root package name */
    public final int f38257g;

    public static final class a extends ViewOutlineProvider {
        public a() {
        }

        @Override // android.view.ViewOutlineProvider
        public void getOutline(View view, Outline outline) {
            Intrinsics.g(view, "view");
            Intrinsics.g(outline, "outline");
            outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), w.this.f38254d);
        }
    }

    public static final class b extends ViewOutlineProvider {
        public b() {
        }

        @Override // android.view.ViewOutlineProvider
        public void getOutline(View view, Outline outline) {
            Intrinsics.g(view, "view");
            Intrinsics.g(outline, "outline");
            outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), w.this.f38254d);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(@NotNull Context context, @NotNull String text, int i5, int i11, @Nullable String str, @NotNull Function0<Unit> onClick) throws Resources.NotFoundException {
        Drawable drawableMutate;
        super(context);
        Intrinsics.g(context, "context");
        Intrinsics.g(text, "text");
        Intrinsics.g(onClick, "onClick");
        this.f38251a = onClick;
        this.f38252b = getResources().getDimensionPixelSize(R.dimen.moloco_moloco_vast_cta_max_width);
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.moloco_moloco_vast_cta_image_size);
        this.f38253c = dimensionPixelSize;
        this.f38254d = getResources().getDimension(R.dimen.moloco_moloco_vast_cta_corner_radius);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.moloco_moloco_vast_cta_image_text_gap);
        this.f38255e = dimensionPixelSize2;
        int dimensionPixelSize3 = getResources().getDimensionPixelSize(R.dimen.moloco_moloco_vast_cta_text_horizontal_padding);
        this.f38256f = dimensionPixelSize3;
        int dimensionPixelSize4 = getResources().getDimensionPixelSize(R.dimen.moloco_moloco_vast_cta_text_vertical_padding);
        this.f38257g = dimensionPixelSize4;
        setOrientation(0);
        setGravity(17);
        Drawable drawable = context.getDrawable(R.drawable.moloco_moloco_vast_cta_background);
        Drawable drawable2 = null;
        drawable2 = null;
        if (drawable != null && (drawableMutate = drawable.mutate()) != null) {
            GradientDrawable gradientDrawable = drawableMutate instanceof GradientDrawable ? (GradientDrawable) drawableMutate : null;
            if (gradientDrawable != null) {
                gradientDrawable.setColor(i11);
            }
            drawable2 = drawableMutate;
        }
        setBackground(drawable2);
        setClipToOutline(true);
        setOutlineProvider(new a());
        LayoutTransition layoutTransition = new LayoutTransition();
        layoutTransition.enableTransitionType(4);
        setLayoutTransition(layoutTransition);
        setClickable(true);
        setFocusable(true);
        setOnClickListener(new ay.k(this, 6));
        setContentDescription(NativeAdContent.ViewTag.CTA);
        if (str != null) {
            View space = new Space(context);
            space.setLayoutParams(new LinearLayout.LayoutParams(dimensionPixelSize2, 0));
            addView(space);
            ImageView imageView = new ImageView(context);
            imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
            imageView.setLayoutParams(new LinearLayout.LayoutParams(dimensionPixelSize, dimensionPixelSize));
            imageView.setClipToOutline(true);
            imageView.setOutlineProvider(new b());
            com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.k.a(imageView, str);
            addView(imageView);
        }
        TextView textView = new TextView(context);
        textView.setText(text);
        textView.setMaxLines(1);
        textView.setTextColor(i5);
        textView.setTypeface(Typeface.create(Typeface.DEFAULT, 1));
        textView.setPadding(dimensionPixelSize3, dimensionPixelSize4, dimensionPixelSize3, dimensionPixelSize4);
        addView(textView);
    }

    @Override // android.widget.LinearLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        if (View.MeasureSpec.getMode(i5) != 1073741824) {
            i5 = View.MeasureSpec.makeMeasureSpec(Math.min(View.MeasureSpec.getSize(i5), this.f38252b), Integer.MIN_VALUE);
        }
        super.onMeasure(i5, i11);
    }

    public static final void a(w wVar, View view) {
        wVar.f38251a.invoke();
    }
}
