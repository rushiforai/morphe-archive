package a5;

import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import java.util.Collections;
import java.util.List;
import java.util.WeakHashMap;

/* loaded from: classes.dex */
public final class a extends View.AccessibilityDelegate {

    /* renamed from: a, reason: collision with root package name */
    public final b f249a;

    public a(b bVar) {
        this.f249a = bVar;
    }

    @Override // android.view.View.AccessibilityDelegate
    public final boolean dispatchPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        return this.f249a.a(view, accessibilityEvent);
    }

    @Override // android.view.View.AccessibilityDelegate
    public final AccessibilityNodeProvider getAccessibilityNodeProvider(View view) {
        vm.c cVarB = this.f249a.b(view);
        if (cVarB != null) {
            return (AccessibilityNodeProvider) cVarB.f92857b;
        }
        return null;
    }

    @Override // android.view.View.AccessibilityDelegate
    public final void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        this.f249a.c(view, accessibilityEvent);
    }

    @Override // android.view.View.AccessibilityDelegate
    public final void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfo accessibilityNodeInfo) {
        b5.g gVarL0 = b5.g.l0(accessibilityNodeInfo);
        WeakHashMap weakHashMap = a1.f250a;
        Boolean bool = (Boolean) new o0(0).a(view);
        gVarL0.X(bool != null && bool.booleanValue());
        Boolean bool2 = (Boolean) new o0(3).a(view);
        gVarL0.K(bool2 != null && bool2.booleanValue());
        gVarL0.R(a1.c(view));
        gVarL0.b0((CharSequence) new o0(2).a(view));
        this.f249a.d(view, gVarL0);
        accessibilityNodeInfo.getText();
        List list = (List) view.getTag(2131428975);
        if (list == null) {
            list = Collections.EMPTY_LIST;
        }
        for (int i5 = 0; i5 < list.size(); i5++) {
            gVarL0.b((b5.d) list.get(i5));
        }
    }

    @Override // android.view.View.AccessibilityDelegate
    public final void onPopulateAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        this.f249a.e(view, accessibilityEvent);
    }

    @Override // android.view.View.AccessibilityDelegate
    public final boolean onRequestSendAccessibilityEvent(ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent) {
        return this.f249a.f(viewGroup, view, accessibilityEvent);
    }

    @Override // android.view.View.AccessibilityDelegate
    public final boolean performAccessibilityAction(View view, int i5, Bundle bundle) {
        return this.f249a.g(view, i5, bundle);
    }

    @Override // android.view.View.AccessibilityDelegate
    public final void sendAccessibilityEvent(View view, int i5) {
        this.f249a.h(view, i5);
    }

    @Override // android.view.View.AccessibilityDelegate
    public final void sendAccessibilityEventUnchecked(View view, AccessibilityEvent accessibilityEvent) {
        this.f249a.i(view, accessibilityEvent);
    }
}
