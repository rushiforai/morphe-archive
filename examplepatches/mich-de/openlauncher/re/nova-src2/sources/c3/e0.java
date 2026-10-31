package c3;

import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityManager;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e0 implements View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19266a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f19267b;

    public /* synthetic */ e0(Object obj, int i5) {
        this.f19266a = i5;
        this.f19267b = obj;
    }

    private final void a(View view) {
    }

    private final void b(View view) {
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        switch (this.f19266a) {
            case 0:
                j0 j0Var = (j0) this.f19267b;
                AccessibilityManager accessibilityManager = j0Var.f19331g;
                j0Var.f19336l = accessibilityManager.getEnabledAccessibilityServiceList(-1);
                accessibilityManager.addAccessibilityStateChangeListener(j0Var.f19334j);
                accessibilityManager.addTouchExplorationStateChangeListener(j0Var.f19335k);
                break;
        }
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        boolean z11;
        switch (this.f19266a) {
            case 0:
                j0 j0Var = (j0) this.f19267b;
                j0Var.f19337m.removeCallbacks(j0Var.O);
                AccessibilityManager accessibilityManager = j0Var.f19331g;
                accessibilityManager.removeAccessibilityStateChangeListener(j0Var.f19334j);
                accessibilityManager.removeTouchExplorationStateChangeListener(j0Var.f19335k);
                break;
            case 1:
                a aVar = (a) this.f19267b;
                Iterator f71970a = q70.d.p0(aVar.getParent(), a5.f1.f284d).getF71970a();
                while (true) {
                    if (f71970a.hasNext()) {
                        Object obj = (ViewParent) f71970a.next();
                        if (obj instanceof View) {
                            View view2 = (View) obj;
                            Intrinsics.g(view2, "<this>");
                            Object tag = view2.getTag(2131428239);
                            Boolean bool = tag instanceof Boolean ? (Boolean) tag : null;
                            if (bool != null ? bool.booleanValue() : false) {
                                z11 = true;
                            }
                        }
                    }
                }
                if (!z11) {
                    aVar.disposeComposition();
                    break;
                }
                break;
            default:
                view.removeOnAttachStateChangeListener(this);
                ((t70.g2) this.f19267b).c(null);
                break;
        }
    }
}
