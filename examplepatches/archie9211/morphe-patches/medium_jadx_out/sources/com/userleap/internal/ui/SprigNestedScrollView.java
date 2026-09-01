package com.userleap.internal.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import androidx.core.widget.NestedScrollView;
import com.userleap.internal.ui.SprigNestedScrollView;
import defpackage.gy2;
import defpackage.m45;
import defpackage.rya;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0000\u0018\u0000 *2\u00020\u0001:\u0001\u0018B'\b\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u001f\u0010\r\u001a\u00020\f2\u0006\u0010\n\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\u0006H\u0014¢\u0006\u0004\b\r\u0010\u000eJ1\u0010\u0014\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u00062\b\b\u0002\u0010\u0011\u001a\u00020\u00102\u0010\b\u0002\u0010\u0013\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u0012¢\u0006\u0004\b\u0014\u0010\u0015J\r\u0010\u0016\u001a\u00020\f¢\u0006\u0004\b\u0016\u0010\u0017R\"\u0010\u001e\u001a\u00020\u00068\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u0018\u0010\u0019\u001a\u0004\b\u001a\u0010\u001b\"\u0004\b\u001c\u0010\u001dR$\u0010%\u001a\u0004\u0018\u00010\u00068\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u001f\u0010 \u001a\u0004\b!\u0010\"\"\u0004\b#\u0010$R\u0018\u0010)\u001a\u0004\u0018\u00010&8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b'\u0010(¨\u0006+"}, d2 = {"Lcom/userleap/internal/ui/SprigNestedScrollView;", "Landroidx/core/widget/NestedScrollView;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "", "defStyleAttr", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;I)V", "widthMeasureSpec", "heightMeasureSpec", "Lc1e;", "onMeasure", "(II)V", "targetHeight", "", "duration", "Lkotlin/Function0;", "onComplete", "animateToHeight", "(IJLm45;)V", "cancelHeightAnimation", "()V", "a", "I", "getMaxHeight", "()I", "setMaxHeight", "(I)V", "maxHeight", "b", "Ljava/lang/Integer;", "getFixedHeight", "()Ljava/lang/Integer;", "setFixedHeight", "(Ljava/lang/Integer;)V", "fixedHeight", "Landroid/animation/ValueAnimator;", "c", "Landroid/animation/ValueAnimator;", "heightAnimator", "Companion", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class SprigNestedScrollView extends NestedScrollView {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public int maxHeight;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public Integer fixedHeight;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public ValueAnimator heightAnimator;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004*\u0001\u0000\b\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0005\u0010\u0006J\u0017\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0007\u0010\u0006¨\u0006\b"}, d2 = {"com/userleap/internal/ui/SprigNestedScrollView$b", "Landroid/animation/AnimatorListenerAdapter;", "Landroid/animation/Animator;", "animation", "Lc1e;", "onAnimationCancel", "(Landroid/animation/Animator;)V", "onAnimationEnd", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class b extends AnimatorListenerAdapter {
        final /* synthetic */ rya $completionCallback;
        final /* synthetic */ int $targetHeight;
        final /* synthetic */ SprigNestedScrollView this$0;

        public b(rya ryaVar, SprigNestedScrollView sprigNestedScrollView, int i) {
            this.$completionCallback = ryaVar;
            this.this$0 = sprigNestedScrollView;
            this.$targetHeight = i;
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public void onAnimationCancel(Animator animation) {
            animation.getClass();
            this.$completionCallback.a = null;
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animation) {
            animation.getClass();
            this.this$0.setFixedHeight(Integer.valueOf(this.$targetHeight));
            this.this$0.setMaxHeight(this.$targetHeight);
            this.this$0.requestLayout();
            this.this$0.heightAnimator = null;
            m45 m45Var = (m45) this.$completionCallback.a;
            if (m45Var != null) {
                m45Var.invoke();
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004*\u0001\u0000\b\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0005\u0010\u0006J\u0017\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0007\u0010\u0006¨\u0006\b"}, d2 = {"com/userleap/internal/ui/SprigNestedScrollView$c", "Landroid/animation/AnimatorListenerAdapter;", "Landroid/animation/Animator;", "animation", "Lc1e;", "onAnimationCancel", "(Landroid/animation/Animator;)V", "onAnimationEnd", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class c extends AnimatorListenerAdapter {
        final /* synthetic */ rya $completionCallback;
        final /* synthetic */ int $targetHeight;
        final /* synthetic */ SprigNestedScrollView this$0;

        public c(rya ryaVar, SprigNestedScrollView sprigNestedScrollView, int i) {
            this.$completionCallback = ryaVar;
            this.this$0 = sprigNestedScrollView;
            this.$targetHeight = i;
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public void onAnimationCancel(Animator animation) {
            animation.getClass();
            this.$completionCallback.a = null;
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animation) {
            animation.getClass();
            this.this$0.setFixedHeight(Integer.valueOf(this.$targetHeight));
            this.this$0.setMaxHeight(this.$targetHeight);
            this.this$0.requestLayout();
            this.this$0.heightAnimator = null;
            m45 m45Var = (m45) this.$completionCallback.a;
            if (m45Var != null) {
                m45Var.invoke();
            }
        }
    }

    public /* synthetic */ SprigNestedScrollView(Context context, AttributeSet attributeSet, int i, int i2, gy2 gy2Var) {
        this(context, (i2 & 2) != 0 ? null : attributeSet, (i2 & 4) != 0 ? 0 : i);
    }

    public static final void a(SprigNestedScrollView sprigNestedScrollView, ValueAnimator valueAnimator) {
        sprigNestedScrollView.getClass();
        valueAnimator.getClass();
        Object animatedValue = valueAnimator.getAnimatedValue();
        animatedValue.getClass();
        sprigNestedScrollView.fixedHeight = (Integer) animatedValue;
        sprigNestedScrollView.requestLayout();
    }

    public static /* synthetic */ void animateToHeight$default(SprigNestedScrollView sprigNestedScrollView, int i, long j, m45 m45Var, int i2, Object obj) {
        if ((i2 & 2) != 0) {
            j = 300;
        }
        if ((i2 & 4) != 0) {
            m45Var = null;
        }
        sprigNestedScrollView.animateToHeight(i, j, m45Var);
    }

    public static final void b(SprigNestedScrollView sprigNestedScrollView, ValueAnimator valueAnimator) {
        sprigNestedScrollView.getClass();
        valueAnimator.getClass();
        Object animatedValue = valueAnimator.getAnimatedValue();
        animatedValue.getClass();
        sprigNestedScrollView.fixedHeight = (Integer) animatedValue;
        sprigNestedScrollView.requestLayout();
    }

    public final void animateToHeight(int targetHeight, long duration, m45 onComplete) {
        ValueAnimator valueAnimator = this.heightAnimator;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
        int height = getHeight();
        Integer numValueOf = Integer.valueOf(height);
        if (height <= 0) {
            numValueOf = null;
        }
        int iIntValue = numValueOf != null ? numValueOf.intValue() : targetHeight;
        if (Math.abs(iIntValue - targetHeight) < 8) {
            this.fixedHeight = Integer.valueOf(targetHeight);
            this.maxHeight = targetHeight;
            requestLayout();
            if (onComplete != null) {
                onComplete.invoke();
                return;
            }
            return;
        }
        if (targetHeight < iIntValue) {
            rya ryaVar = new rya();
            ryaVar.a = onComplete;
            ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(iIntValue, targetHeight);
            valueAnimatorOfInt.setDuration(200L);
            valueAnimatorOfInt.setInterpolator(new DecelerateInterpolator(1.5f));
            final int i = 0;
            valueAnimatorOfInt.addUpdateListener(new ValueAnimator.AnimatorUpdateListener(this) { // from class: rlc
                public final /* synthetic */ SprigNestedScrollView b;

                {
                    this.b = this;
                }

                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator2) {
                    int i2 = i;
                    SprigNestedScrollView sprigNestedScrollView = this.b;
                    switch (i2) {
                        case 0:
                            SprigNestedScrollView.a(sprigNestedScrollView, valueAnimator2);
                            break;
                        default:
                            SprigNestedScrollView.b(sprigNestedScrollView, valueAnimator2);
                            break;
                    }
                }
            });
            valueAnimatorOfInt.addListener(new b(ryaVar, this, targetHeight));
            valueAnimatorOfInt.start();
            this.heightAnimator = valueAnimatorOfInt;
            return;
        }
        if (iIntValue == targetHeight) {
            this.fixedHeight = null;
            this.maxHeight = targetHeight;
            requestLayout();
            if (onComplete != null) {
                onComplete.invoke();
                return;
            }
            return;
        }
        rya ryaVar2 = new rya();
        ryaVar2.a = onComplete;
        ValueAnimator valueAnimatorOfInt2 = ValueAnimator.ofInt(iIntValue, targetHeight);
        valueAnimatorOfInt2.setDuration(duration);
        valueAnimatorOfInt2.setInterpolator(new DecelerateInterpolator(1.5f));
        final int i2 = 1;
        valueAnimatorOfInt2.addUpdateListener(new ValueAnimator.AnimatorUpdateListener(this) { // from class: rlc
            public final /* synthetic */ SprigNestedScrollView b;

            {
                this.b = this;
            }

            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator2) {
                int i22 = i2;
                SprigNestedScrollView sprigNestedScrollView = this.b;
                switch (i22) {
                    case 0:
                        SprigNestedScrollView.a(sprigNestedScrollView, valueAnimator2);
                        break;
                    default:
                        SprigNestedScrollView.b(sprigNestedScrollView, valueAnimator2);
                        break;
                }
            }
        });
        valueAnimatorOfInt2.addListener(new c(ryaVar2, this, targetHeight));
        valueAnimatorOfInt2.start();
        this.heightAnimator = valueAnimatorOfInt2;
    }

    public final void cancelHeightAnimation() {
        ValueAnimator valueAnimator = this.heightAnimator;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
        this.heightAnimator = null;
    }

    public final Integer getFixedHeight() {
        return this.fixedHeight;
    }

    public final int getMaxHeight() {
        return this.maxHeight;
    }

    @Override // androidx.core.widget.NestedScrollView, android.widget.FrameLayout, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        Integer num = this.fixedHeight;
        super.onMeasure(widthMeasureSpec, num != null ? View.MeasureSpec.makeMeasureSpec(num.intValue(), 1073741824) : View.MeasureSpec.makeMeasureSpec(this.maxHeight, Integer.MIN_VALUE));
    }

    public final void setFixedHeight(Integer num) {
        this.fixedHeight = num;
    }

    public final void setMaxHeight(int i) {
        this.maxHeight = i;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public SprigNestedScrollView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0, 4, null);
        context.getClass();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public SprigNestedScrollView(Context context) {
        this(context, null, 0, 6, null);
        context.getClass();
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SprigNestedScrollView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        context.getClass();
        this.maxHeight = Integer.MAX_VALUE;
    }
}
