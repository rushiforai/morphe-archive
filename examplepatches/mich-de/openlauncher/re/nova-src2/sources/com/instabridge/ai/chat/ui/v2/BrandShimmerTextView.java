package com.instabridge.ai.chat.ui.v2;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Shader;
import android.util.AttributeSet;
import android.view.animation.LinearInterpolator;
import androidx.appcompat.widget.AppCompatTextView;
import androidx.recyclerview.widget.n0;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0015\n\u0000\n\u0002\u0010\u0014\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0002\n\u0002\b\t\b\u0001\u0018\u00002\u00020\u0001B'\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\b\u0010\u0014\u001a\u00020\u0015H\u0002J\u0006\u0010\u0016\u001a\u00020\u0017J\u0006\u0010\u0018\u001a\u00020\u0017J(\u0010\u0019\u001a\u00020\u00172\u0006\u0010\u001a\u001a\u00020\u00072\u0006\u0010\u001b\u001a\u00020\u00072\u0006\u0010\u001c\u001a\u00020\u00072\u0006\u0010\u001d\u001a\u00020\u0007H\u0014J\b\u0010\u001e\u001a\u00020\u0017H\u0002J\b\u0010\u001f\u001a\u00020\u0017H\u0014R\u0010\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006 "}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/BrandShimmerTextView;", "Landroidx/appcompat/widget/AppCompatTextView;", "context", "Landroid/content/Context;", "attrs", "Landroid/util/AttributeSet;", "defStyleAttr", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;I)V", "shimmerAnimator", "Landroid/animation/ValueAnimator;", "shaderMatrix", "Landroid/graphics/Matrix;", "shader", "Landroid/graphics/LinearGradient;", "colors", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "positions", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "gradientWidth", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "startShimmer", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "stopShimmer", "onSizeChanged", "w", "h", "oldw", "oldh", "ensureShader", "onDetachedFromWindow", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class BrandShimmerTextView extends AppCompatTextView {
    public static final int $stable = 8;

    @NotNull
    private final int[] colors;

    @NotNull
    private final float[] positions;

    @Nullable
    private LinearGradient shader;

    @NotNull
    private final Matrix shaderMatrix;

    @Nullable
    private ValueAnimator shimmerAnimator;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public BrandShimmerTextView(@NotNull Context context) {
        this(context, null, 0, 6, null);
        Intrinsics.g(context, "context");
    }

    private final void ensureShader() {
        this.shader = new LinearGradient(0.0f, 0.0f, gradientWidth(), 0.0f, this.colors, this.positions, Shader.TileMode.CLAMP);
        getPaint().setShader(this.shader);
        Shader shader = getPaint().getShader();
        if (shader != null) {
            shader.setLocalMatrix(this.shaderMatrix);
        }
    }

    private final float gradientWidth() {
        float width = getWidth() * 2.6f;
        if (width < 1.0f) {
            return 1.0f;
        }
        return width;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void startShimmer$lambda$1$lambda$0(BrandShimmerTextView brandShimmerTextView, ValueAnimator anim) {
        Intrinsics.g(anim, "anim");
        Object animatedValue = anim.getAnimatedValue();
        Intrinsics.e(animatedValue, "null cannot be cast to non-null type kotlin.Float");
        brandShimmerTextView.shaderMatrix.setTranslate(((Float) animatedValue).floatValue() * brandShimmerTextView.getWidth(), 0.0f);
        LinearGradient linearGradient = brandShimmerTextView.shader;
        if (linearGradient != null) {
            linearGradient.setLocalMatrix(brandShimmerTextView.shaderMatrix);
        }
        brandShimmerTextView.invalidate();
    }

    @Override // androidx.appcompat.widget.AppCompatTextView, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        ValueAnimator valueAnimator = this.shimmerAnimator;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
        this.shimmerAnimator = null;
    }

    @Override // android.view.View
    public void onSizeChanged(int w10, int h5, int oldw, int oldh) {
        super.onSizeChanged(w10, h5, oldw, oldh);
        if (w10 <= 0 || this.shimmerAnimator == null) {
            return;
        }
        ensureShader();
    }

    public final void startShimmer() {
        ValueAnimator valueAnimator = this.shimmerAnimator;
        if (valueAnimator == null || !valueAnimator.isRunning()) {
            ensureShader();
            ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.7f, -2.3f);
            valueAnimatorOfFloat.setDuration(2400L);
            valueAnimatorOfFloat.setRepeatCount(-1);
            valueAnimatorOfFloat.setInterpolator(new LinearInterpolator());
            valueAnimatorOfFloat.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.instabridge.ai.chat.ui.v2.i
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator2) {
                    BrandShimmerTextView.startShimmer$lambda$1$lambda$0(this.f35460a, valueAnimator2);
                }
            });
            valueAnimatorOfFloat.start();
            this.shimmerAnimator = valueAnimatorOfFloat;
        }
    }

    public final void stopShimmer() {
        ValueAnimator valueAnimator = this.shimmerAnimator;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
        this.shimmerAnimator = null;
        getPaint().setShader(null);
        invalidate();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public BrandShimmerTextView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 0, 4, null);
        Intrinsics.g(context, "context");
    }

    public /* synthetic */ BrandShimmerTextView(Context context, AttributeSet attributeSet, int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, (i11 & 2) != 0 ? null : attributeSet, (i11 & 4) != 0 ? 16842884 : i5);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public BrandShimmerTextView(@NotNull Context context, @Nullable AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        Intrinsics.g(context, "context");
        this.shaderMatrix = new Matrix();
        this.colors = new int[]{Color.argb(72, n0.DEFAULT_SWIPE_ANIMATION_DURATION, n0.DEFAULT_SWIPE_ANIMATION_DURATION, n0.DEFAULT_SWIPE_ANIMATION_DURATION), Color.argb(72, n0.DEFAULT_SWIPE_ANIMATION_DURATION, n0.DEFAULT_SWIPE_ANIMATION_DURATION, n0.DEFAULT_SWIPE_ANIMATION_DURATION), -1, Color.parseColor("#FAB39D"), Color.parseColor("#FB7C36"), -1, Color.argb(72, n0.DEFAULT_SWIPE_ANIMATION_DURATION, n0.DEFAULT_SWIPE_ANIMATION_DURATION, n0.DEFAULT_SWIPE_ANIMATION_DURATION), Color.argb(72, n0.DEFAULT_SWIPE_ANIMATION_DURATION, n0.DEFAULT_SWIPE_ANIMATION_DURATION, n0.DEFAULT_SWIPE_ANIMATION_DURATION)};
        this.positions = new float[]{0.0f, 0.32f, 0.44f, 0.5f, 0.53f, 0.6f, 0.72f, 1.0f};
    }
}
