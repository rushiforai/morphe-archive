package defpackage;

import android.view.View;
import com.google.android.material.carousel.CarouselLayoutManager;
import com.medium.android.donkey.post.PostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class jg9 implements View.OnLayoutChangeListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ jg9(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // android.view.View.OnLayoutChangeListener
    public final void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
        int i9 = this.a;
        Object obj = this.b;
        switch (i9) {
            case 0:
                ((PostFragment) obj).r1();
                break;
            case 1:
                ((PostFragment) obj).q1();
                break;
            default:
                CarouselLayoutManager carouselLayoutManager = (CarouselLayoutManager) obj;
                if (i3 - i != i7 - i5 || i4 - i2 != i8 - i6) {
                    view.post(new v0(9, carouselLayoutManager));
                }
                break;
        }
    }
}
