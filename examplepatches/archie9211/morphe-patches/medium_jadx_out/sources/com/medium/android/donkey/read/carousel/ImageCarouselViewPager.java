package com.medium.android.donkey.read.carousel;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import defpackage.fve;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ImageCarouselViewPager extends fve {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ImageCarouselViewPager(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        context.getClass();
    }

    @Override // defpackage.fve
    public final boolean c(int i, int i2, int i3, View view, boolean z) {
        return view instanceof ImageViewTouch ? ((ImageViewTouch) view).l() : super.c(i, i2, i3, view, z);
    }
}
