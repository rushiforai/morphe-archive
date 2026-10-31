package aa;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.app.FragmentManager;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.LinearLayout;
import androidx.appcompat.widget.ActionBarOverlayLayout;
import b00.h1;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.pageindicators.PageIndicatorDots;
import com.android.launcher3.secondarydisplay.SecondaryDisplayLauncher;
import com.android.launcher3.widget.picker.WidgetsFullSheet;
import com.google.android.material.behavior.HideBottomViewOnScrollBehavior;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.sidesheet.SideSheetBehavior;
import com.google.android.material.transformation.ExpandableTransformationBehavior;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.launcher3.NovaAppDrawerSearchBar;
import com.teslacoilsw.launcher.minusone.NovaFeedContentView;
import e10.s2;
import e10.y2;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import mx.p1;

/* loaded from: classes2.dex */
public final class i0 extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f596a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f597b;

    public /* synthetic */ i0(Object obj, int i5) {
        this.f596a = i5;
        this.f597b = obj;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationCancel(Animator animator) {
        switch (this.f596a) {
            case 16:
                ActionBarOverlayLayout actionBarOverlayLayout = (ActionBarOverlayLayout) this.f597b;
                actionBarOverlayLayout.f13737v = null;
                actionBarOverlayLayout.f13726i = false;
                break;
            case 17:
                ((s9.i) this.f597b).f86784f = true;
                break;
            case 18:
            default:
                super.onAnimationCancel(animator);
                break;
            case 19:
                p1.b(animator);
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationEnd(Animator animation) {
        int i5 = this.f596a;
        int i11 = 0;
        Object obj = this.f597b;
        switch (i5) {
            case 0:
                ((Drawable) obj).setColorFilter(null);
                break;
            case 1:
                h1 h1Var = (h1) obj;
                h1Var.f16363c.c();
                y2.f51877a.getClass();
                s2 s2Var = y2.X1;
                KProperty kProperty = y2.f51881b[150];
                s2Var.getClass();
                if (((Boolean) s2Var.l()).booleanValue() && ((gy.c) y2.f0().l()).f58248a) {
                    NovaFeedContentView novaFeedContentView = h1Var.f16363c;
                    novaFeedContentView.getClass();
                    try {
                        int i12 = Result.f71687b;
                        g2.s.c(novaFeedContentView.f45900v);
                        break;
                    } catch (Throwable th2) {
                        int i13 = Result.f71687b;
                        ResultKt.a(th2);
                        return;
                    }
                }
                break;
            case 2:
                SideSheetBehavior sideSheetBehavior = (SideSheetBehavior) obj;
                sideSheetBehavior.x(5);
                WeakReference weakReference = sideSheetBehavior.f34344p;
                if (weakReference != null && weakReference.get() != null) {
                    ((View) sideSheetBehavior.f34344p.get()).requestLayout();
                    break;
                }
                break;
            case 3:
                int i14 = WidgetsFullSheet.Q;
                ((WidgetsFullSheet) obj).f70511d.removeListener(this);
                break;
            case 4:
                ((HideBottomViewOnScrollBehavior) obj).f34074h = null;
                break;
            case 5:
                fk.i iVar = (fk.i) obj;
                iVar.p();
                iVar.f55196r.start();
                break;
            case 6:
                BottomSheetBehavior bottomSheetBehavior = (BottomSheetBehavior) obj;
                bottomSheetBehavior.K(5);
                WeakReference weakReference2 = bottomSheetBehavior.U;
                if (weakReference2 != null && weakReference2.get() != null) {
                    ((View) bottomSheetBehavior.U.get()).requestLayout();
                    break;
                }
                break;
            case 7:
                v9.s sVar = (v9.s) obj;
                sVar.n.setScaleY(1.0f);
                sVar.n.setTranslationY(0.0f);
                sVar.f92534m.setTranslationY(0.0f);
                sVar.f92533l.setVisibility(8);
                sVar.f92534m.setBackground(null);
                int childCount = sVar.n.getChildCount();
                while (i11 < childCount) {
                    sVar.n.getChildAt(i11).setAlpha(1.0f);
                    i11++;
                }
                break;
            case 8:
                PageIndicatorDots pageIndicatorDots = (PageIndicatorDots) obj;
                pageIndicatorDots.f21209i = null;
                pageIndicatorDots.invalidateOutline();
                pageIndicatorDots.invalidate();
                break;
            case 9:
                ((ExpandableTransformationBehavior) obj).f34533b = null;
                break;
            case 10:
                j7.e eVar = (j7.e) obj;
                ArrayList arrayList = new ArrayList(eVar.f69085e);
                int size = arrayList.size();
                while (i11 < size) {
                    ((wj.b) arrayList.get(i11)).a(eVar);
                    i11++;
                }
                break;
            case 11:
                ((NovaLauncher) obj).P.setCircleActivityAnimationProgress(0.0f);
                break;
            case 12:
                ((BubbleTextView) obj).f20880s = null;
                break;
            case 13:
            case 21:
            case 22:
            default:
                super.onAnimationEnd(animation);
                break;
            case 14:
                ((o9.s2) ((mk.w) obj).f76493c).getClass();
                break;
            case 15:
                SecondaryDisplayLauncher secondaryDisplayLauncher = (SecondaryDisplayLauncher) obj;
                secondaryDisplayLauncher.K.setVisibility(4);
                secondaryDisplayLauncher.L.setVisibility(0);
                ((NovaAppDrawerSearchBar) secondaryDisplayLauncher.K.f21030l).k();
                break;
            case 16:
                ActionBarOverlayLayout actionBarOverlayLayout = (ActionBarOverlayLayout) obj;
                actionBarOverlayLayout.f13737v = null;
                actionBarOverlayLayout.f13726i = false;
                break;
            case 17:
                ((s9.i) obj).f86784f = false;
                break;
            case 18:
                mh.c cVar = (mh.c) obj;
                if (((ValueAnimator) cVar.f76324c) == animation) {
                    cVar.f76324c = null;
                    break;
                }
                break;
            case 19:
                p1.b(animation);
                ((FragmentManager) obj).popBackStackImmediate();
                break;
            case 20:
                vj.f fVar = (vj.f) obj;
                fVar.f92787b.setTranslationY(0.0f);
                fVar.b(0.0f);
                break;
            case 23:
                y9.a0 a0Var = (y9.a0) obj;
                a0Var.f96876i.clear();
                a0Var.f96879l = false;
                break;
            case 24:
                Intrinsics.g(animation, "animation");
                ((LinearLayout) obj).setVisibility(8);
                break;
            case 25:
                ((z9.d) obj).D = true;
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationRepeat(Animator animator) {
        switch (this.f596a) {
            case 13:
                o9.w wVar = (o9.w) this.f597b;
                wVar.f80202g = 1.0f;
                wVar.f80199d = 0.0f;
                wVar.f80200e = 0.0f;
                wVar.f80204i = true;
                break;
            case 21:
                super.onAnimationRepeat(animator);
                wj.p pVar = (wj.p) this.f597b;
                pVar.f94474j = (pVar.f94474j + 1) % pVar.f94473i.f94415c.length;
                pVar.f94475k = true;
                break;
            default:
                super.onAnimationRepeat(animator);
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationStart(Animator animator) {
        switch (this.f596a) {
            case 10:
                j7.e eVar = (j7.e) this.f597b;
                ArrayList arrayList = new ArrayList(eVar.f69085e);
                int size = arrayList.size();
                for (int i5 = 0; i5 < size; i5++) {
                    ((wj.b) arrayList.get(i5)).b(eVar);
                }
                break;
            case 17:
                ((s9.i) this.f597b).f86784f = false;
                break;
            case 19:
                p1.a(animator);
                break;
            case 22:
                ((x9.n) this.f597b).getClass();
                break;
            default:
                super.onAnimationStart(animator);
                break;
        }
    }
}
