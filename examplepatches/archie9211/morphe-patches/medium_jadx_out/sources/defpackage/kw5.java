package defpackage;

import com.medium.android.donkey.read.carousel.ImageCarouselActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kw5 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ImageCarouselActivity b;

    public /* synthetic */ kw5(ImageCarouselActivity imageCarouselActivity, int i) {
        this.a = i;
        this.b = imageCarouselActivity;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        ImageCarouselActivity imageCarouselActivity = this.b;
        switch (i) {
            case 0:
                return imageCarouselActivity.getViewModelStore();
            default:
                return imageCarouselActivity.getDefaultViewModelCreationExtras();
        }
    }
}
