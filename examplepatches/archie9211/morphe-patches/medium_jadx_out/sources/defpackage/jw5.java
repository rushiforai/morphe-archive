package defpackage;

import android.transition.Transition;
import android.widget.ImageView;
import com.medium.android.donkey.read.carousel.ImageCarouselActivity;
import com.medium.android.donkey.read.carousel.ImageCarouselViewPager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jw5 implements Transition.TransitionListener {
    public final /* synthetic */ ImageCarouselActivity a;

    public jw5(ImageCarouselActivity imageCarouselActivity) {
        this.a = imageCarouselActivity;
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionEnd(Transition transition) {
        ImageCarouselActivity imageCarouselActivity = this.a;
        uz5 uz5Var = imageCarouselActivity.q;
        if (uz5Var == null) {
            g76.g0("binding");
            throw null;
        }
        ((ImageView) uz5Var.f).setVisibility(8);
        if (imageCarouselActivity.u) {
            return;
        }
        imageCarouselActivity.u = true;
        uz5 uz5Var2 = imageCarouselActivity.q;
        if (uz5Var2 != null) {
            ((ImageCarouselViewPager) uz5Var2.d).setVisibility(0);
        } else {
            g76.g0("binding");
            throw null;
        }
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionStart(Transition transition) {
        ImageCarouselActivity imageCarouselActivity = this.a;
        uz5 uz5Var = imageCarouselActivity.q;
        if (uz5Var == null) {
            g76.g0("binding");
            throw null;
        }
        ((ImageView) uz5Var.f).setVisibility(0);
        uz5 uz5Var2 = imageCarouselActivity.q;
        if (uz5Var2 != null) {
            ((ImageCarouselViewPager) uz5Var2.d).setVisibility(8);
        } else {
            g76.g0("binding");
            throw null;
        }
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionCancel(Transition transition) {
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionPause(Transition transition) {
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionResume(Transition transition) {
    }
}
