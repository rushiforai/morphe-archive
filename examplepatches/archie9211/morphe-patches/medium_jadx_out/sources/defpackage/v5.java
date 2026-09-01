package defpackage;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import androidx.appcompat.widget.ActionBarOverlayLayout;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.focus.FocusRingDrawable;
import com.google.android.material.sidesheet.SideSheetBehavior;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v5 extends AnimatorListenerAdapter {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public v5(lve lveVar, View view) {
        this.a = 6;
        this.b = lveVar;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationCancel(Animator animator) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ActionBarOverlayLayout actionBarOverlayLayout = (ActionBarOverlayLayout) obj;
                actionBarOverlayLayout.w = null;
                actionBarOverlayLayout.j = false;
                break;
            case 3:
                super.onAnimationCancel(animator);
                FocusRingDrawable focusRingDrawable = (FocusRingDrawable) obj;
                focusRingDrawable.k = 1.0f;
                focusRingDrawable.invalidateSelf();
                break;
            case 6:
                ((lve) obj).a();
                break;
            default:
                super.onAnimationCancel(animator);
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationEnd(Animator animator) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ActionBarOverlayLayout actionBarOverlayLayout = (ActionBarOverlayLayout) obj;
                actionBarOverlayLayout.w = null;
                actionBarOverlayLayout.j = false;
                break;
            case 1:
                fw fwVar = (fw) obj;
                ArrayList arrayList = new ArrayList(fwVar.e);
                int size = arrayList.size();
                for (int i2 = 0; i2 < size; i2++) {
                    ((nu) arrayList.get(i2)).a(fwVar);
                }
                break;
            case 2:
                BottomSheetBehavior bottomSheetBehavior = (BottomSheetBehavior) obj;
                bottomSheetBehavior.M(5);
                WeakReference weakReference = bottomSheetBehavior.Y;
                if (weakReference != null && weakReference.get() != null) {
                    ((View) bottomSheetBehavior.Y.get()).requestLayout();
                    break;
                }
                break;
            case 3:
            default:
                super.onAnimationEnd(animator);
                break;
            case 4:
                qj7 qj7Var = (qj7) obj;
                qj7Var.b.setTranslationY(0.0f);
                qj7Var.b(0.0f);
                break;
            case 5:
                SideSheetBehavior sideSheetBehavior = (SideSheetBehavior) obj;
                sideSheetBehavior.w(5);
                WeakReference weakReference2 = sideSheetBehavior.p;
                if (weakReference2 != null && weakReference2.get() != null) {
                    ((View) sideSheetBehavior.p.get()).requestLayout();
                    break;
                }
                break;
            case 6:
                ((lve) obj).c();
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationStart(Animator animator) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 1:
                fw fwVar = (fw) obj;
                ArrayList arrayList = new ArrayList(fwVar.e);
                int size = arrayList.size();
                for (int i2 = 0; i2 < size; i2++) {
                    ((nu) arrayList.get(i2)).b(fwVar);
                }
                break;
            case 6:
                ((lve) obj).b();
                break;
            default:
                super.onAnimationStart(animator);
                break;
        }
    }

    public /* synthetic */ v5(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }
}
