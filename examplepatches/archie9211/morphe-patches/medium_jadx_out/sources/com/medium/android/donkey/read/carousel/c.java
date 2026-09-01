package com.medium.android.donkey.read.carousel;

import android.widget.ImageView;
import com.medium.android.donkey.read.carousel.ImageCarouselActivity;
import defpackage.bu1;
import defpackage.dq8;
import defpackage.g76;
import defpackage.mw5;
import defpackage.sw5;
import defpackage.uz5;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c extends dq8 {
    public final /* synthetic */ ImageCarouselActivity d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(ImageCarouselActivity imageCarouselActivity) {
        super(true);
        this.d = imageCarouselActivity;
    }

    @Override // defpackage.dq8
    public final void b() {
        ImageCarouselActivity imageCarouselActivity = this.d;
        mw5 mw5Var = imageCarouselActivity.r;
        if (mw5Var == null) {
            g76.g0("adapter");
            throw null;
        }
        uz5 uz5Var = imageCarouselActivity.q;
        if (uz5Var == null) {
            g76.g0("binding");
            throw null;
        }
        sw5 sw5Var = (sw5) bu1.A0(((ImageCarouselViewPager) uz5Var.d).getCurrentItem(), bu1.m1(mw5Var.e));
        ImageCarouselActivity.SelectedImageContext selectedImageContext = imageCarouselActivity.t;
        if (selectedImageContext != null && sw5Var != null && !g76.L(selectedImageContext.getId(), sw5Var.getId())) {
            uz5 uz5Var2 = imageCarouselActivity.q;
            if (uz5Var2 == null) {
                g76.g0("binding");
                throw null;
            }
            ((ImageView) uz5Var2.f).setTransitionName(null);
        }
        e();
        imageCarouselActivity.getOnBackPressedDispatcher().d();
    }
}
