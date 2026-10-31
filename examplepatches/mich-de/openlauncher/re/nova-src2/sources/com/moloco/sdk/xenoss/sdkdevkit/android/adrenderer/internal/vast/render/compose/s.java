package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose;

import android.animation.LayoutTransition;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Outline;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewOutlineProvider;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Space;
import android.widget.TextView;
import com.moloco.sdk.R;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class s extends FrameLayout {

    /* renamed from: l, reason: collision with root package name */
    public static final int f41394l = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Function0<Unit> f41395a;

    /* renamed from: b, reason: collision with root package name */
    public final int f41396b;

    /* renamed from: c, reason: collision with root package name */
    public final int f41397c;

    /* renamed from: d, reason: collision with root package name */
    public final int f41398d;

    /* renamed from: e, reason: collision with root package name */
    public final float f41399e;

    /* renamed from: f, reason: collision with root package name */
    public final int f41400f;

    /* renamed from: g, reason: collision with root package name */
    public final int f41401g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final LinearLayout f41402h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final ImageView f41403i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final Space f41404j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final TextView f41405k;

    public static final class a extends ViewOutlineProvider {
        public a() {
        }

        @Override // android.view.ViewOutlineProvider
        public void getOutline(View view, Outline outline) {
            Intrinsics.g(view, "view");
            Intrinsics.g(outline, "outline");
            outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), s.this.f41399e);
        }
    }

    public /* synthetic */ s(Context context, String str, String str2, int i5, int i11, Function0 function0, int i12, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, str, (i12 & 4) != 0 ? null : str2, (i12 & 8) != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.theme.b.a(context) : i5, (i12 & 16) != 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.theme.b.a(context) : i11, function0);
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        if (View.MeasureSpec.getMode(i5) != 1073741824) {
            i5 = View.MeasureSpec.makeMeasureSpec(Math.min(View.MeasureSpec.getSize(i5), this.f41401g), Integer.MIN_VALUE);
        }
        super.onMeasure(i5, i11);
    }

    public final void setImageUri(@Nullable String str) {
        if (str == null || str.length() == 0) {
            this.f41403i.setVisibility(8);
            this.f41404j.setVisibility(8);
        } else {
            this.f41403i.setVisibility(0);
            this.f41404j.setVisibility(0);
            com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.k.a(this.f41403i, str);
        }
    }

    public static final void a(s sVar, View view) {
        sVar.f41395a.invoke();
    }

    public final void a() {
        TypedArray typedArrayObtainStyledAttributes = getContext().obtainStyledAttributes(new int[]{16843534});
        Intrinsics.f(typedArrayObtainStyledAttributes, "obtainStyledAttributes(...)");
        try {
            setForeground(typedArrayObtainStyledAttributes.getDrawable(0));
        } finally {
            typedArrayObtainStyledAttributes.recycle();
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s(@NotNull Context context, @NotNull String text, @Nullable String str, int i5, int i11, @NotNull Function0<Unit> onCTAClick) throws Resources.NotFoundException {
        Drawable drawableMutate;
        super(context);
        Intrinsics.g(context, "context");
        Intrinsics.g(text, "text");
        Intrinsics.g(onCTAClick, "onCTAClick");
        this.f41395a = onCTAClick;
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.moloco_vast_cta_inner_padding);
        this.f41396b = dimensionPixelSize;
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.moloco_vast_cta_image_size);
        this.f41397c = dimensionPixelSize2;
        int dimensionPixelSize3 = getResources().getDimensionPixelSize(R.dimen.moloco_vast_cta_stroke_width);
        this.f41398d = dimensionPixelSize3;
        this.f41399e = getResources().getDimension(R.dimen.moloco_vast_cta_corner_radius);
        int dimensionPixelSize4 = getResources().getDimensionPixelSize(R.dimen.moloco_vast_cta_min_width);
        this.f41400f = dimensionPixelSize4;
        this.f41401g = getResources().getDimensionPixelSize(R.dimen.moloco_vast_cta_max_width);
        setLayoutParams(new FrameLayout.LayoutParams(-2, getResources().getDimensionPixelSize(R.dimen.moloco_vast_cta_height)));
        setMinimumWidth(dimensionPixelSize4);
        Drawable drawable = context.getDrawable(R.drawable.moloco_vast_cta_background);
        Drawable drawable2 = null;
        drawable2 = null;
        if (drawable != null && (drawableMutate = drawable.mutate()) != null) {
            GradientDrawable gradientDrawable = drawableMutate instanceof GradientDrawable ? (GradientDrawable) drawableMutate : null;
            if (gradientDrawable != null) {
                gradientDrawable.setStroke(dimensionPixelSize3, i5);
            }
            drawable2 = drawableMutate;
        }
        setBackground(drawable2);
        a();
        setClickable(true);
        setFocusable(true);
        setOnClickListener(new ay.k(this, 9));
        LinearLayout linearLayout = new LinearLayout(context);
        linearLayout.setOrientation(0);
        linearLayout.setGravity(16);
        linearLayout.setPadding(dimensionPixelSize, 0, dimensionPixelSize, 0);
        LayoutTransition layoutTransition = new LayoutTransition();
        layoutTransition.enableTransitionType(4);
        linearLayout.setLayoutTransition(layoutTransition);
        this.f41402h = linearLayout;
        ImageView imageView = new ImageView(context);
        imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        imageView.setLayoutParams(new LinearLayout.LayoutParams(dimensionPixelSize2, dimensionPixelSize2));
        imageView.setVisibility(8);
        imageView.setClipToOutline(true);
        imageView.setOutlineProvider(new a());
        this.f41403i = imageView;
        Space space = new Space(context);
        space.setLayoutParams(new LinearLayout.LayoutParams(dimensionPixelSize, -1));
        space.setVisibility(8);
        this.f41404j = space;
        TextView textView = new TextView(context);
        textView.setMaxLines(1);
        textView.setText(text);
        textView.setTextColor(i11);
        this.f41405k = textView;
        linearLayout.addView(imageView);
        linearLayout.addView(space);
        linearLayout.addView(textView);
        addView(linearLayout, new FrameLayout.LayoutParams(-2, -1, 17));
        setImageUri(str);
    }
}
