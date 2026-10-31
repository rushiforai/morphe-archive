package b5;

import android.view.accessibility.AccessibilityEvent;

/* loaded from: classes2.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final AccessibilityEvent f17555a;

    public i(AccessibilityEvent accessibilityEvent) {
        this.f17555a = accessibilityEvent;
    }

    public final int a() {
        return this.f17555a.getFromIndex();
    }

    public final int b() {
        return this.f17555a.getToIndex();
    }

    public final void c(int i5) {
        this.f17555a.setFromIndex(i5);
    }

    public final void d(int i5) {
        this.f17555a.setItemCount(i5);
    }

    public final void e(int i5) {
        this.f17555a.setToIndex(i5);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        AccessibilityEvent accessibilityEvent = ((i) obj).f17555a;
        AccessibilityEvent accessibilityEvent2 = this.f17555a;
        return accessibilityEvent2 == null ? accessibilityEvent == null : accessibilityEvent2.equals(accessibilityEvent);
    }

    public final int hashCode() {
        AccessibilityEvent accessibilityEvent = this.f17555a;
        if (accessibilityEvent == null) {
            return 0;
        }
        return accessibilityEvent.hashCode();
    }
}
