package a5;

import android.animation.ValueAnimator;
import android.graphics.drawable.Drawable;
import android.view.View;
import b.u4;
import com.google.android.material.appbar.AppBarLayout;
import com.instabridge.ai.chat.ui.v2.AiMessageViewHolderV2;
import com.instabridge.ai.chat.ui.v2.StreamingCaretSpan;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final /* synthetic */ class g1 implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f287a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f288b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f289c;

    public /* synthetic */ g1(int i5, Object obj, Object obj2) {
        this.f287a = i5;
        this.f288b = obj;
        this.f289c = obj2;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        int i5 = this.f287a;
        Object obj = this.f289c;
        Object obj2 = this.f288b;
        switch (i5) {
            case 0:
                ((View) ((m.s0) ((je.f) obj2).f69487b).f75352e.getParent()).invalidate();
                return;
            case 1:
                Object animatedValue = ((ValueAnimator) obj).getAnimatedValue();
                Intrinsics.e(animatedValue, "null cannot be cast to non-null type kotlin.Float");
                ((b00.h1) obj2).setAlpha(((Float) animatedValue).floatValue());
                return;
            case 2:
                AiMessageViewHolderV2.startCaretAnimation$lambda$16$lambda$15((StreamingCaretSpan) obj2, (AiMessageViewHolderV2) obj, valueAnimator);
                return;
            case 3:
                AppBarLayout appBarLayout = (AppBarLayout) obj2;
                int i11 = AppBarLayout.f34003y;
                float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                ((bk.g) obj).k(fFloatValue);
                Drawable drawable = appBarLayout.f34022u;
                if (drawable instanceof bk.g) {
                    ((bk.g) drawable).k(fFloatValue);
                }
                Iterator it = appBarLayout.f34018q.iterator();
                if (it.hasNext()) {
                    throw u4.e(it);
                }
                return;
            default:
                s9.q qVar = (s9.q) obj2;
                qVar.getClass();
                qVar.c(((Float) valueAnimator.getAnimatedValue()).floatValue());
                ((View) obj).invalidateOutline();
                return;
        }
    }
}
