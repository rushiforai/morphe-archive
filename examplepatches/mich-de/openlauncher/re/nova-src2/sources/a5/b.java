package a5;

import android.os.Bundle;
import android.text.style.ClickableSpan;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeProvider;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class b {

    /* renamed from: c, reason: collision with root package name */
    public static final View.AccessibilityDelegate f257c = new View.AccessibilityDelegate();

    /* renamed from: a, reason: collision with root package name */
    public final View.AccessibilityDelegate f258a;

    /* renamed from: b, reason: collision with root package name */
    public final a f259b;

    public b() {
        this(f257c);
    }

    public boolean a(View view, AccessibilityEvent accessibilityEvent) {
        return this.f258a.dispatchPopulateAccessibilityEvent(view, accessibilityEvent);
    }

    public vm.c b(View view) {
        AccessibilityNodeProvider accessibilityNodeProvider = this.f258a.getAccessibilityNodeProvider(view);
        if (accessibilityNodeProvider != null) {
            return new vm.c(accessibilityNodeProvider, 3);
        }
        return null;
    }

    public void c(View view, AccessibilityEvent accessibilityEvent) {
        this.f258a.onInitializeAccessibilityEvent(view, accessibilityEvent);
    }

    public void d(View view, b5.g gVar) {
        this.f258a.onInitializeAccessibilityNodeInfo(view, gVar.k0());
    }

    public void e(View view, AccessibilityEvent accessibilityEvent) {
        this.f258a.onPopulateAccessibilityEvent(view, accessibilityEvent);
    }

    public boolean f(ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent) {
        return this.f258a.onRequestSendAccessibilityEvent(viewGroup, view, accessibilityEvent);
    }

    public boolean g(View view, int i5, Bundle bundle) {
        boolean zPerformAccessibilityAction;
        WeakReference weakReference;
        ClickableSpan clickableSpan;
        List list = (List) view.getTag(2131428975);
        if (list == null) {
            list = Collections.EMPTY_LIST;
        }
        int i11 = 0;
        while (true) {
            if (i11 >= list.size()) {
                zPerformAccessibilityAction = false;
                break;
            }
            b5.d dVar = (b5.d) list.get(i11);
            if (dVar.b() == i5) {
                zPerformAccessibilityAction = dVar.d(view);
                break;
            }
            i11++;
        }
        if (!zPerformAccessibilityAction) {
            zPerformAccessibilityAction = this.f258a.performAccessibilityAction(view, i5, bundle);
        }
        if (zPerformAccessibilityAction || i5 != 2131427345 || bundle == null) {
            return zPerformAccessibilityAction;
        }
        int i12 = bundle.getInt("ACCESSIBILITY_CLICKABLE_SPAN_ID", -1);
        SparseArray sparseArray = (SparseArray) view.getTag(2131428976);
        if (sparseArray != null && (weakReference = (WeakReference) sparseArray.get(i12)) != null && (clickableSpan = (ClickableSpan) weakReference.get()) != null) {
            ClickableSpan[] clickableSpanArrI = b5.g.i(view.createAccessibilityNodeInfo().getText());
            for (int i13 = 0; clickableSpanArrI != null && i13 < clickableSpanArrI.length; i13++) {
                if (clickableSpan.equals(clickableSpanArrI[i13])) {
                    clickableSpan.onClick(view);
                    return true;
                }
            }
        }
        return false;
    }

    public void h(View view, int i5) {
        this.f258a.sendAccessibilityEvent(view, i5);
    }

    public void i(View view, AccessibilityEvent accessibilityEvent) {
        this.f258a.sendAccessibilityEventUnchecked(view, accessibilityEvent);
    }

    public b(View.AccessibilityDelegate accessibilityDelegate) {
        this.f258a = accessibilityDelegate;
        this.f259b = new a(this);
    }
}
