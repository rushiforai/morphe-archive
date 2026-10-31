package com.facebook.ads.redexgen.X;

import android.os.Build;

/* renamed from: com.facebook.ads.redexgen.X.3u, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C06243u extends C7O {
    public C06243u(C0958Hi c0958Hi) {
        super(c0958Hi);
        setCarouselLayoutManager(c0958Hi);
    }

    public AbstractC0822Cb getFullscreenCarouselRecyclerViewAdapter() {
        getAdapter();
        if (0 != 0) {
            getAdapter();
            return null;
        }
        return null;
    }

    @Override // com.facebook.ads.redexgen.X.C7O
    public J7 getLayoutManager() {
        return (J7) super.getLayoutManager();
    }

    public AbstractC1965j1 getOnScrollListener() {
        return new C0916Fs(this);
    }

    private void setCarouselLayoutManager(C0958Hi c0958Hi) {
        J7 j72 = new J7(c0958Hi, 0, false);
        if (Build.VERSION.SDK_INT >= 24) {
            j72.A2q(true);
        }
        super.setLayoutManager(j72);
    }

    @Override // com.facebook.ads.redexgen.X.C7O
    public void setLayoutManager(AbstractC1960iw abstractC1960iw) {
    }
}
