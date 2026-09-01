package defpackage;

import android.content.Context;
import android.graphics.PointF;
import android.view.View;
import com.google.android.material.carousel.CarouselLayoutManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k71 extends vz6 {
    public final /* synthetic */ int q = 1;

    public /* synthetic */ k71(Context context) {
        super(context);
    }

    @Override // defpackage.vz6
    public int b(View view, int i) {
        switch (this.q) {
            case 0:
                return 0;
            default:
                return super.b(view, i);
        }
    }

    @Override // defpackage.vz6
    public int c(View view, int i) {
        switch (this.q) {
            case 0:
                return 0;
            default:
                return super.c(view, i);
        }
    }

    @Override // defpackage.vz6
    public PointF e(int i) {
        switch (this.q) {
            case 0:
                return null;
            default:
                return super.e(i);
        }
    }

    @Override // defpackage.vz6
    public int f() {
        switch (this.q) {
            case 1:
                return -1;
            default:
                return super.f();
        }
    }

    public k71(CarouselLayoutManager carouselLayoutManager, Context context) {
        super(context);
    }
}
