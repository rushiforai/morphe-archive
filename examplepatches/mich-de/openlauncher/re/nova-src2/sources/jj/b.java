package jj;

import com.google.android.material.carousel.CarouselLayoutManager;

/* loaded from: classes3.dex */
public final class b extends ie.a {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f69565c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ CarouselLayoutManager f69566d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(CarouselLayoutManager carouselLayoutManager, int i5) {
        super(1, 1);
        this.f69565c = i5;
        switch (i5) {
            case 1:
                this.f69566d = carouselLayoutManager;
                super(0, 1);
                break;
            default:
                this.f69566d = carouselLayoutManager;
                break;
        }
    }

    @Override // ie.a
    public final int i() {
        switch (this.f69565c) {
            case 0:
                return this.f69566d.getHeight();
            default:
                CarouselLayoutManager carouselLayoutManager = this.f69566d;
                return carouselLayoutManager.getHeight() - carouselLayoutManager.getPaddingBottom();
        }
    }

    @Override // ie.a
    public final int j() {
        switch (this.f69565c) {
            case 0:
                return this.f69566d.getPaddingLeft();
            default:
                return 0;
        }
    }

    @Override // ie.a
    public final int k() {
        switch (this.f69565c) {
            case 0:
                CarouselLayoutManager carouselLayoutManager = this.f69566d;
                return carouselLayoutManager.getWidth() - carouselLayoutManager.getPaddingRight();
            default:
                return this.f69566d.getWidth();
        }
    }

    @Override // ie.a
    public final int l() {
        switch (this.f69565c) {
            case 0:
                return 0;
            default:
                CarouselLayoutManager carouselLayoutManager = this.f69566d;
                if (carouselLayoutManager.p()) {
                    return carouselLayoutManager.getWidth();
                }
                return 0;
        }
    }

    @Override // ie.a
    public final int m() {
        switch (this.f69565c) {
            case 0:
                return 0;
            default:
                return this.f69566d.getPaddingTop();
        }
    }
}
