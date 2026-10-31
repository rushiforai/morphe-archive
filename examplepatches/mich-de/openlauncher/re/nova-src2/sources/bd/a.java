package bd;

import android.view.View;
import android.view.ViewGroup;
import android.widget.PopupWindow;
import com.fyber.inneractive.sdk.player.ui.u;
import com.google.android.material.carousel.CarouselLayoutManager;
import g.p;
import uf.m;
import uf.n;
import uf.s;

/* loaded from: classes3.dex */
public final /* synthetic */ class a implements View.OnLayoutChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17823a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f17824b;

    public /* synthetic */ a(Object obj, int i5) {
        this.f17823a = i5;
        this.f17824b = obj;
    }

    @Override // android.view.View.OnLayoutChangeListener
    public final void onLayoutChange(View view, int i5, int i11, int i12, int i13, int i14, int i15, int i16, int i17) {
        int height;
        int height2;
        switch (this.f17823a) {
            case 0:
                ((u) this.f17824b).a(view, i5, i11, i12, i13, i14, i15, i16, i17);
                break;
            case 1:
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.u.a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.u) this.f17824b, view, i5, i11, i12, i13, i14, i15, i16, i17);
                break;
            case 2:
                CarouselLayoutManager carouselLayoutManager = (CarouselLayoutManager) this.f17824b;
                if (i5 != i14 || i11 != i15 || i12 != i16 || i13 != i17) {
                    view.post(new p(carouselLayoutManager, 9));
                    break;
                }
            case 3:
                m mVar = (m) this.f17824b;
                int i18 = mVar.f91170l;
                PopupWindow popupWindow = mVar.f91168k;
                int i19 = i13 - i11;
                int i21 = i17 - i15;
                if ((i12 - i5 != i16 - i14 || i19 != i21) && popupWindow.isShowing()) {
                    mVar.o();
                    popupWindow.update(view, (mVar.getWidth() - popupWindow.getWidth()) - i18, (-popupWindow.getHeight()) - i18, -1, -1);
                    break;
                }
                break;
            default:
                s sVar = (s) this.f17824b;
                m mVar2 = sVar.f91196a;
                int width = (mVar2.getWidth() - mVar2.getPaddingLeft()) - mVar2.getPaddingRight();
                int height3 = (mVar2.getHeight() - mVar2.getPaddingBottom()) - mVar2.getPaddingTop();
                ViewGroup viewGroup = sVar.f91198c;
                int iB = s.b(viewGroup) - (viewGroup != null ? viewGroup.getPaddingRight() + viewGroup.getPaddingLeft() : 0);
                if (viewGroup == null) {
                    height = 0;
                } else {
                    height = viewGroup.getHeight();
                    ViewGroup.LayoutParams layoutParams = viewGroup.getLayoutParams();
                    if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
                        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
                        height += marginLayoutParams.topMargin + marginLayoutParams.bottomMargin;
                    }
                }
                int paddingBottom = height - (viewGroup != null ? viewGroup.getPaddingBottom() + viewGroup.getPaddingTop() : 0);
                int iMax = Math.max(iB, s.b(sVar.f91206k) + s.b(sVar.f91204i));
                ViewGroup viewGroup2 = sVar.f91199d;
                if (viewGroup2 == null) {
                    height2 = 0;
                } else {
                    height2 = viewGroup2.getHeight();
                    ViewGroup.LayoutParams layoutParams2 = viewGroup2.getLayoutParams();
                    if (layoutParams2 instanceof ViewGroup.MarginLayoutParams) {
                        ViewGroup.MarginLayoutParams marginLayoutParams2 = (ViewGroup.MarginLayoutParams) layoutParams2;
                        height2 += marginLayoutParams2.topMargin + marginLayoutParams2.bottomMargin;
                    }
                }
                boolean z11 = width <= iMax || height3 <= (height2 * 2) + paddingBottom;
                if (sVar.A != z11) {
                    sVar.A = z11;
                    view.post(new n(sVar, 1));
                }
                boolean z12 = i12 - i5 != i16 - i14;
                if (!sVar.A && z12) {
                    view.post(new n(sVar, 2));
                    break;
                }
                break;
        }
    }
}
