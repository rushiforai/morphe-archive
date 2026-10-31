package com.fyber.inneractive.sdk.renderers;

import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.flow.h0;

/* loaded from: classes3.dex */
public abstract class e extends com.fyber.inneractive.sdk.flow.b0 {

    /* renamed from: k, reason: collision with root package name */
    public com.fyber.inneractive.sdk.ui.controller.b f30983k;

    public final ImageView c(ViewGroup viewGroup) {
        com.fyber.inneractive.sdk.rtb.watermark.b bVar;
        if (viewGroup == null) {
            return null;
        }
        InneractiveAdSpot inneractiveAdSpot = this.f28030a;
        ImageView imageView = ((inneractiveAdSpot instanceof h0) && (bVar = ((h0) inneractiveAdSpot).f28162m) != null) ? bVar.f31092a : null;
        if (imageView == null) {
            return null;
        }
        com.fyber.inneractive.sdk.util.v.a(imageView);
        imageView.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        viewGroup.addView(imageView);
        return imageView;
    }
}
