package uf;

import android.animation.ValueAnimator;
import android.content.res.Resources;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final /* synthetic */ class n implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f91185a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ s f91186b;

    public /* synthetic */ n(s sVar, int i5) {
        this.f91185a = i5;
        this.f91186b = sVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00b1  */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() throws Resources.NotFoundException {
        switch (this.f91185a) {
            case 0:
                this.f91186b.j();
                break;
            case 1:
                s sVar = this.f91186b;
                View view = sVar.f91205j;
                ViewGroup viewGroup = sVar.f91200e;
                if (viewGroup != null) {
                    viewGroup.setVisibility(sVar.A ? 0 : 4);
                }
                if (view != null) {
                    int dimensionPixelSize = sVar.f91196a.getResources().getDimensionPixelSize(2131165489);
                    ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
                    if (marginLayoutParams != null) {
                        if (sVar.A) {
                            dimensionPixelSize = 0;
                        }
                        marginLayoutParams.bottomMargin = dimensionPixelSize;
                        view.setLayoutParams(marginLayoutParams);
                    }
                    if (view instanceof d) {
                        d dVar = (d) view;
                        Rect rect = dVar.f91100a;
                        ValueAnimator valueAnimator = dVar.E;
                        if (sVar.A) {
                            if (valueAnimator.isStarted()) {
                                valueAnimator.cancel();
                            }
                            dVar.G = true;
                            dVar.F = 0.0f;
                            dVar.invalidate(rect);
                        } else {
                            int i5 = sVar.f91219z;
                            if (i5 == 1) {
                                if (valueAnimator.isStarted()) {
                                    valueAnimator.cancel();
                                }
                                dVar.G = false;
                                dVar.F = 0.0f;
                                dVar.invalidate(rect);
                            } else if (i5 != 3) {
                                if (valueAnimator.isStarted()) {
                                    valueAnimator.cancel();
                                }
                                dVar.G = false;
                                dVar.F = 1.0f;
                                dVar.invalidate(rect);
                            }
                        }
                    }
                }
                Iterator it = sVar.f91218y.iterator();
                while (it.hasNext()) {
                    View view2 = (View) it.next();
                    view2.setVisibility((sVar.A && s.i(view2)) ? 4 : 0);
                }
                break;
            case 2:
                s sVar2 = this.f91186b;
                ValueAnimator valueAnimator2 = sVar2.f91211r;
                View view3 = sVar2.f91206k;
                m mVar = sVar2.f91196a;
                ViewGroup viewGroup2 = sVar2.f91202g;
                ViewGroup viewGroup3 = sVar2.f91201f;
                if (viewGroup3 != null && viewGroup2 != null) {
                    int width = (mVar.getWidth() - mVar.getPaddingLeft()) - mVar.getPaddingRight();
                    while (true) {
                        if (viewGroup2.getChildCount() <= 1) {
                            if (view3 != null) {
                                view3.setVisibility(8);
                            }
                            int iB = s.b(sVar2.f91204i);
                            int childCount = viewGroup3.getChildCount() - 1;
                            for (int i11 = 0; i11 < childCount; i11++) {
                                iB += s.b(viewGroup3.getChildAt(i11));
                            }
                            if (iB <= width) {
                                ViewGroup viewGroup4 = sVar2.f91203h;
                                if (viewGroup4 != null && viewGroup4.getVisibility() == 0 && !valueAnimator2.isStarted()) {
                                    sVar2.f91210q.cancel();
                                    valueAnimator2.start();
                                    break;
                                }
                            } else {
                                if (view3 != null) {
                                    view3.setVisibility(0);
                                    iB += s.b(view3);
                                }
                                ArrayList arrayList = new ArrayList();
                                for (int i12 = 0; i12 < childCount; i12++) {
                                    View childAt = viewGroup3.getChildAt(i12);
                                    iB -= s.b(childAt);
                                    arrayList.add(childAt);
                                    if (iB <= width) {
                                        if (arrayList.isEmpty()) {
                                            viewGroup3.removeViews(0, arrayList.size());
                                            for (int i13 = 0; i13 < arrayList.size(); i13++) {
                                                viewGroup2.addView((View) arrayList.get(i13), viewGroup2.getChildCount() - 1);
                                            }
                                            break;
                                        }
                                    }
                                }
                                if (arrayList.isEmpty()) {
                                }
                            }
                        } else {
                            int childCount2 = viewGroup2.getChildCount() - 2;
                            View childAt2 = viewGroup2.getChildAt(childCount2);
                            viewGroup2.removeViewAt(childCount2);
                            viewGroup3.addView(childAt2, 0);
                        }
                    }
                }
                break;
            case 3:
                this.f91186b.n.start();
                break;
            case 4:
                this.f91186b.f91208m.start();
                break;
            case 5:
                s sVar3 = this.f91186b;
                sVar3.f91207l.start();
                sVar3.d(sVar3.f91214u, 2000L);
                break;
            default:
                this.f91186b.h(2);
                break;
        }
    }
}
