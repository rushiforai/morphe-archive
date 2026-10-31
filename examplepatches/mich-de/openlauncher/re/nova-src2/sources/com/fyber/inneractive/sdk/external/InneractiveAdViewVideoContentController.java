package com.fyber.inneractive.sdk.external;

import com.fyber.inneractive.sdk.flow.t0;
import com.fyber.inneractive.sdk.flow.u0;
import com.fyber.inneractive.sdk.renderers.x;
import java.lang.ref.WeakReference;

/* loaded from: classes3.dex */
public class InneractiveAdViewVideoContentController extends u0 {
    @Override // com.fyber.inneractive.sdk.flow.j0
    public boolean canControl(InneractiveAdSpot inneractiveAdSpot) {
        return inneractiveAdSpot.getAdContent() instanceof t0;
    }

    public void pauseVideo() {
    }

    public void playVideo() {
    }

    public void setControlledRenderer(x xVar) {
        new WeakReference(xVar);
    }
}
