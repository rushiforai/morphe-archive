package r5;

import a5.a1;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import androidx.compose.ui.node.LayoutNode;
import b5.g;
import java.util.ArrayList;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public abstract class b extends a5.b {
    public static final Rect n = new Rect(LayoutNode.NotPlacedPlaceOrder, LayoutNode.NotPlacedPlaceOrder, Integer.MIN_VALUE, Integer.MIN_VALUE);

    /* renamed from: h, reason: collision with root package name */
    public final AccessibilityManager f85499h;

    /* renamed from: i, reason: collision with root package name */
    public final View f85500i;

    /* renamed from: j, reason: collision with root package name */
    public a f85501j;

    /* renamed from: d, reason: collision with root package name */
    public final Rect f85495d = new Rect();

    /* renamed from: e, reason: collision with root package name */
    public final Rect f85496e = new Rect();

    /* renamed from: f, reason: collision with root package name */
    public final Rect f85497f = new Rect();

    /* renamed from: g, reason: collision with root package name */
    public final int[] f85498g = new int[2];

    /* renamed from: k, reason: collision with root package name */
    public int f85502k = Integer.MIN_VALUE;

    /* renamed from: l, reason: collision with root package name */
    public int f85503l = Integer.MIN_VALUE;

    /* renamed from: m, reason: collision with root package name */
    public int f85504m = Integer.MIN_VALUE;

    public b(View view) {
        if (view == null) {
            throw new IllegalArgumentException("View may not be null");
        }
        this.f85500i = view;
        this.f85499h = (AccessibilityManager) view.getContext().getSystemService("accessibility");
        view.setFocusable(true);
        WeakHashMap weakHashMap = a1.f250a;
        if (view.getImportantForAccessibility() == 0) {
            view.setImportantForAccessibility(1);
        }
    }

    @Override // a5.b
    public final vm.c b(View view) {
        if (this.f85501j == null) {
            this.f85501j = new a(this);
        }
        return this.f85501j;
    }

    @Override // a5.b
    public final void d(View view, g gVar) {
        this.f258a.onInitializeAccessibilityNodeInfo(view, gVar.k0());
        p(gVar);
    }

    public final boolean j(MotionEvent motionEvent) {
        int i5;
        AccessibilityManager accessibilityManager = this.f85499h;
        if (!accessibilityManager.isEnabled() || !accessibilityManager.isTouchExplorationEnabled()) {
            return false;
        }
        int action = motionEvent.getAction();
        if (action == 7 || action == 9) {
            int iK = k(motionEvent.getX(), motionEvent.getY());
            int i11 = this.f85504m;
            if (i11 != iK) {
                this.f85504m = iK;
                s(iK, 128);
                s(i11, 256);
            }
            if (iK == Integer.MIN_VALUE) {
                return false;
            }
        } else {
            if (action != 10 || (i5 = this.f85504m) == Integer.MIN_VALUE) {
                return false;
            }
            if (i5 != Integer.MIN_VALUE) {
                this.f85504m = Integer.MIN_VALUE;
                s(Integer.MIN_VALUE, 128);
                s(i5, 256);
                return true;
            }
        }
        return true;
    }

    public abstract int k(float f11, float f12);

    public abstract void l(ArrayList arrayList);

    public final g m(int i5) {
        View view = this.f85500i;
        if (i5 == -1) {
            AccessibilityNodeInfo accessibilityNodeInfoObtain = AccessibilityNodeInfo.obtain(view);
            g gVar = new g(accessibilityNodeInfoObtain);
            WeakHashMap weakHashMap = a1.f250a;
            view.onInitializeAccessibilityNodeInfo(accessibilityNodeInfoObtain);
            ArrayList arrayList = new ArrayList();
            l(arrayList);
            if (accessibilityNodeInfoObtain.getChildCount() > 0 && arrayList.size() > 0) {
                throw new RuntimeException("Views cannot have both real and virtual children");
            }
            int size = arrayList.size();
            for (int i11 = 0; i11 < size; i11++) {
                gVar.c(((Integer) arrayList.get(i11)).intValue(), view);
            }
            return gVar;
        }
        g gVarQ = g.q();
        AccessibilityNodeInfo accessibilityNodeInfo = gVarQ.f17551a;
        gVarQ.G(true);
        gVarQ.I(true);
        gVarQ.y("android.view.View");
        Rect rect = n;
        accessibilityNodeInfo.setBoundsInParent(rect);
        gVarQ.v(rect);
        gVarQ.T(view);
        q(i5, gVarQ);
        if (gVarQ.m() == null && accessibilityNodeInfo.getContentDescription() == null) {
            throw new RuntimeException("Callbacks must add text or a content description in populateNodeForVirtualViewId()");
        }
        Rect rect2 = this.f85496e;
        gVarQ.h(rect2);
        if (rect2.equals(rect)) {
            throw new RuntimeException("Callbacks must set parent bounds in populateNodeForVirtualViewId()");
        }
        int actions = accessibilityNodeInfo.getActions();
        if ((actions & 64) != 0) {
            throw new RuntimeException("Callbacks must not add ACTION_ACCESSIBILITY_FOCUS in populateNodeForVirtualViewId()");
        }
        if ((actions & 128) != 0) {
            throw new RuntimeException("Callbacks must not add ACTION_CLEAR_ACCESSIBILITY_FOCUS in populateNodeForVirtualViewId()");
        }
        gVarQ.Q(view.getContext().getPackageName());
        gVarQ.a0(i5, view);
        if (this.f85502k == i5) {
            gVarQ.s(true);
            gVarQ.a(128);
        } else {
            gVarQ.s(false);
            gVarQ.a(64);
        }
        boolean z11 = this.f85503l == i5;
        if (z11) {
            gVarQ.a(2);
        } else if (accessibilityNodeInfo.isFocusable()) {
            gVarQ.a(1);
        }
        gVarQ.J(z11);
        int[] iArr = this.f85498g;
        view.getLocationOnScreen(iArr);
        Rect rect3 = this.f85495d;
        accessibilityNodeInfo.getBoundsInScreen(rect3);
        if (rect3.equals(rect)) {
            gVarQ.h(rect3);
            if (gVarQ.f17552b != -1) {
                g gVarQ2 = g.q();
                for (int i12 = gVarQ.f17552b; i12 != -1; i12 = gVarQ2.f17552b) {
                    gVarQ2.S(-1, view);
                    gVarQ2.f17551a.setBoundsInParent(rect);
                    q(i12, gVarQ2);
                    gVarQ2.h(rect2);
                    rect3.offset(rect2.left, rect2.top);
                }
            }
            rect3.offset(iArr[0] - view.getScrollX(), iArr[1] - view.getScrollY());
        }
        Rect rect4 = this.f85497f;
        if (view.getLocalVisibleRect(rect4)) {
            rect4.offset(iArr[0] - view.getScrollX(), iArr[1] - view.getScrollY());
            if (rect3.intersect(rect4)) {
                gVarQ.v(rect3);
                if (!rect3.isEmpty() && view.getWindowVisibility() == 0) {
                    Object parent = view.getParent();
                    while (true) {
                        if (parent instanceof View) {
                            View view2 = (View) parent;
                            if (view2.getAlpha() <= 0.0f || view2.getVisibility() != 0) {
                                break;
                            }
                            parent = view2.getParent();
                        } else if (parent != null) {
                            gVarQ.j0(true);
                        }
                    }
                }
            }
        }
        return gVarQ;
    }

    public abstract boolean n(int i5, int i11);

    public void o(int i5, AccessibilityEvent accessibilityEvent) {
    }

    public void p(g gVar) {
    }

    public abstract void q(int i5, g gVar);

    public void r(int i5, boolean z11) {
    }

    public final void s(int i5, int i11) {
        View view;
        ViewParent parent;
        AccessibilityEvent accessibilityEventObtain;
        if (i5 == Integer.MIN_VALUE || !this.f85499h.isEnabled() || (parent = (view = this.f85500i).getParent()) == null) {
            return;
        }
        if (i5 != -1) {
            accessibilityEventObtain = AccessibilityEvent.obtain(i11);
            g gVarM = m(i5);
            accessibilityEventObtain.getText().add(gVarM.m());
            AccessibilityNodeInfo accessibilityNodeInfo = gVarM.f17551a;
            accessibilityEventObtain.setContentDescription(accessibilityNodeInfo.getContentDescription());
            accessibilityEventObtain.setScrollable(accessibilityNodeInfo.isScrollable());
            accessibilityEventObtain.setPassword(accessibilityNodeInfo.isPassword());
            accessibilityEventObtain.setEnabled(accessibilityNodeInfo.isEnabled());
            accessibilityEventObtain.setChecked(accessibilityNodeInfo.isChecked());
            o(i5, accessibilityEventObtain);
            if (accessibilityEventObtain.getText().isEmpty() && accessibilityEventObtain.getContentDescription() == null) {
                throw new RuntimeException("Callbacks must add text or a content description in populateEventForVirtualViewId()");
            }
            accessibilityEventObtain.setClassName(accessibilityNodeInfo.getClassName());
            accessibilityEventObtain.setSource(view, i5);
            accessibilityEventObtain.setPackageName(view.getContext().getPackageName());
        } else {
            accessibilityEventObtain = AccessibilityEvent.obtain(i11);
            view.onInitializeAccessibilityEvent(accessibilityEventObtain);
        }
        parent.requestSendAccessibilityEvent(view, accessibilityEventObtain);
    }
}
