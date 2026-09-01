package defpackage;

import android.content.Context;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.accessibility.AccessibilityManager;
import com.google.android.material.behavior.HideBottomViewOnScrollBehavior;
import com.google.android.material.behavior.HideViewOnScrollBehavior;
import com.medium.reader.R;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pp implements View.OnAttachStateChangeListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ pp(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                qp qpVar = (qp) obj;
                Context context = view.getContext();
                if (!qpVar.d) {
                    context.getApplicationContext().registerComponentCallbacks(qpVar.e);
                    qpVar.d = true;
                }
                break;
            case 2:
                View view2 = (View) obj;
                view2.removeOnAttachStateChangeListener(this);
                WeakHashMap weakHashMap = ute.a;
                view2.requestApplyInsets();
                break;
        }
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        AccessibilityManager accessibilityManager;
        AccessibilityManager accessibilityManager2;
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                qp qpVar = (qp) obj;
                Context context = view.getContext();
                if (qpVar.d) {
                    context.getApplicationContext().unregisterComponentCallbacks(qpVar.e);
                    qpVar.d = false;
                }
                break;
            case 1:
                p71 p71Var = (p71) obj;
                ViewTreeObserver viewTreeObserver = p71Var.x;
                if (viewTreeObserver != null) {
                    if (!viewTreeObserver.isAlive()) {
                        p71Var.x = view.getViewTreeObserver();
                    }
                    p71Var.x.removeGlobalOnLayoutListener(p71Var.i);
                }
                view.removeOnAttachStateChangeListener(this);
                break;
            case 2:
                break;
            case 3:
                HideBottomViewOnScrollBehavior hideBottomViewOnScrollBehavior = (HideBottomViewOnScrollBehavior) obj;
                oj5 oj5Var = hideBottomViewOnScrollBehavior.h;
                if (oj5Var != null && (accessibilityManager = hideBottomViewOnScrollBehavior.g) != null) {
                    accessibilityManager.removeTouchExplorationStateChangeListener(oj5Var);
                    hideBottomViewOnScrollBehavior.h = null;
                    break;
                }
                break;
            case 4:
                HideViewOnScrollBehavior hideViewOnScrollBehavior = (HideViewOnScrollBehavior) obj;
                oj5 oj5Var2 = hideViewOnScrollBehavior.c;
                if (oj5Var2 != null && (accessibilityManager2 = hideViewOnScrollBehavior.b) != null) {
                    accessibilityManager2.removeTouchExplorationStateChangeListener(oj5Var2);
                    hideViewOnScrollBehavior.c = null;
                    break;
                }
                break;
            case 5:
                knc kncVar = (knc) obj;
                ViewTreeObserver viewTreeObserver2 = kncVar.o;
                if (viewTreeObserver2 != null) {
                    if (!viewTreeObserver2.isAlive()) {
                        kncVar.o = view.getViewTreeObserver();
                    }
                    kncVar.o.removeGlobalOnLayoutListener(kncVar.i);
                }
                view.removeOnAttachStateChangeListener(this);
                break;
            case 6:
                x0 x0Var = (x0) obj;
                for (Object obj2 : szb.K0(x0Var.getParent(), mue.a)) {
                    if (obj2 instanceof View) {
                        View view2 = (View) obj2;
                        view2.getClass();
                        Object tag = view2.getTag(R.id.is_pooling_container_tag);
                        Boolean bool = tag instanceof Boolean ? (Boolean) tag : null;
                        if (bool != null ? bool.booleanValue() : false) {
                            break;
                        }
                    }
                }
                x0Var.e();
                break;
            default:
                view.removeOnAttachStateChangeListener(this);
                ((enc) obj).m(null);
                break;
        }
    }

    private final void a(View view) {
    }

    private final void b(View view) {
    }

    private final void c(View view) {
    }

    private final void d(View view) {
    }

    private final void e(View view) {
    }

    private final void f(View view) {
    }

    private final void g(View view) {
    }
}
