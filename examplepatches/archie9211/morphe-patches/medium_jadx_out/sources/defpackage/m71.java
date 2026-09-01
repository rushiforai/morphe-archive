package defpackage;

import com.google.android.material.carousel.CarouselLayoutManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m71 {
    public final int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ CarouselLayoutManager c;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public m71(CarouselLayoutManager carouselLayoutManager, int i) {
        this(1);
        this.b = i;
        switch (i) {
            case 1:
                this.c = carouselLayoutManager;
                this(0);
                break;
            default:
                this.c = carouselLayoutManager;
                break;
        }
    }

    public final int a() {
        switch (this.b) {
            case 0:
                return 0;
            default:
                CarouselLayoutManager carouselLayoutManager = this.c;
                if (carouselLayoutManager.G0()) {
                    return carouselLayoutManager.n;
                }
                return 0;
        }
    }

    public m71(int i) {
        this.a = i;
    }
}
