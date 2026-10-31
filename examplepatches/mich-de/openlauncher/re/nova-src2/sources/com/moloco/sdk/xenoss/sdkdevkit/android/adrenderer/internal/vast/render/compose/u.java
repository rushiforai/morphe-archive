package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.moloco.sdk.R;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.j;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@SuppressLint({"ViewConstructor"})
/* loaded from: classes4.dex */
public final class u extends FrameLayout {

    /* renamed from: e, reason: collision with root package name */
    public static final int f41452e = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.j f41453a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Function0<Unit> f41454b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Function0<Unit> f41455c;

    /* renamed from: d, reason: collision with root package name */
    public final int f41456d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(@NotNull Context context, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.j resource, @NotNull Function0<Unit> onDisplayed, @NotNull Function0<Unit> onClick) throws Resources.NotFoundException {
        super(context);
        Intrinsics.g(context, "context");
        Intrinsics.g(resource, "resource");
        Intrinsics.g(onDisplayed, "onDisplayed");
        Intrinsics.g(onClick, "onClick");
        this.f41453a = resource;
        this.f41454b = onDisplayed;
        this.f41455c = onClick;
        int dimensionPixelSize = context.getResources().getDimensionPixelSize(R.dimen.moloco_vast_icon_max_size);
        this.f41456d = dimensionPixelSize;
        if (resource instanceof j.a) {
            View viewA = z.a(context, (j.a) resource);
            if (viewA != null) {
                addView(viewA, new FrameLayout.LayoutParams(-1, -1));
                return;
            }
            return;
        }
        if (!(resource instanceof j.b)) {
            throw new NoWhenBranchMatchedException();
        }
        ImageView imageViewA = A.a(context, (j.b) resource);
        imageViewA.setLayoutParams(new ViewGroup.LayoutParams(Math.min(imageViewA.getLayoutParams().width, dimensionPixelSize), Math.min(imageViewA.getLayoutParams().height, dimensionPixelSize)));
        imageViewA.setOnClickListener(new ay.k(this, 10));
        addView(imageViewA);
    }

    public static final void a(u uVar, View view) {
        uVar.f41455c.invoke();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.f41454b.invoke();
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(a(i5, this.f41456d), a(i11, this.f41456d));
    }

    public final int a(int i5, int i11) {
        return View.MeasureSpec.makeMeasureSpec(Math.min(View.MeasureSpec.getSize(i5), i11), View.MeasureSpec.getMode(i5) == 1073741824 ? Integer.MIN_VALUE : View.MeasureSpec.getMode(i5));
    }
}
