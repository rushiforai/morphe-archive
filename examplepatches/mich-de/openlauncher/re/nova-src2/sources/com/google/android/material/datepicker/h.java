package com.google.android.material.datepicker;

import android.graphics.Rect;
import android.os.Bundle;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.widget.ScrollView;
import androidx.core.widget.NestedScrollView;

/* loaded from: classes3.dex */
public final class h extends a5.b {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f34252d;

    public /* synthetic */ h(int i5) {
        this.f34252d = i5;
    }

    @Override // a5.b
    public void c(View view, AccessibilityEvent accessibilityEvent) {
        switch (this.f34252d) {
            case 3:
                super.c(view, accessibilityEvent);
                NestedScrollView nestedScrollView = (NestedScrollView) view;
                accessibilityEvent.setClassName(ScrollView.class.getName());
                accessibilityEvent.setScrollable(nestedScrollView.m() > 0);
                accessibilityEvent.setScrollX(nestedScrollView.getScrollX());
                accessibilityEvent.setScrollY(nestedScrollView.getScrollY());
                accessibilityEvent.setMaxScrollX(nestedScrollView.getScrollX());
                accessibilityEvent.setMaxScrollY(nestedScrollView.m());
                break;
            default:
                super.c(view, accessibilityEvent);
                break;
        }
    }

    @Override // a5.b
    public final void d(View view, b5.g gVar) {
        int iM;
        switch (this.f34252d) {
            case 0:
                this.f258a.onInitializeAccessibilityNodeInfo(view, gVar.k0());
                gVar.A(null);
                break;
            case 1:
                this.f258a.onInitializeAccessibilityNodeInfo(view, gVar.k0());
                gVar.Y(false);
                break;
            case 2:
                this.f258a.onInitializeAccessibilityNodeInfo(view, gVar.k0());
                gVar.A(null);
                break;
            default:
                this.f258a.onInitializeAccessibilityNodeInfo(view, gVar.k0());
                NestedScrollView nestedScrollView = (NestedScrollView) view;
                gVar.y(ScrollView.class.getName());
                if (nestedScrollView.isEnabled() && (iM = nestedScrollView.m()) > 0) {
                    gVar.Y(true);
                    if (nestedScrollView.getScrollY() > 0) {
                        gVar.b(b5.d.f17539i);
                        gVar.b(b5.d.f17543m);
                    }
                    if (nestedScrollView.getScrollY() < iM) {
                        gVar.b(b5.d.f17538h);
                        gVar.b(b5.d.o);
                        break;
                    }
                }
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0075  */
    @Override // a5.b
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean g(View view, int i5, Bundle bundle) {
        switch (this.f34252d) {
            case 3:
                if (super.g(view, i5, bundle)) {
                    return true;
                }
                NestedScrollView nestedScrollView = (NestedScrollView) view;
                if (nestedScrollView.isEnabled()) {
                    int height = nestedScrollView.getHeight();
                    Rect rect = new Rect();
                    if (nestedScrollView.getMatrix().isIdentity() && nestedScrollView.getGlobalVisibleRect(rect)) {
                        height = rect.height();
                    }
                    if (i5 == 4096) {
                        int iMin = Math.min(nestedScrollView.getScrollY() + ((height - nestedScrollView.getPaddingBottom()) - nestedScrollView.getPaddingTop()), nestedScrollView.m());
                        if (iMin != nestedScrollView.getScrollY()) {
                            nestedScrollView.x(0 - nestedScrollView.getScrollX(), iMin - nestedScrollView.getScrollY(), true);
                            return true;
                        }
                    } else if (i5 == 8192 || i5 == 16908344) {
                        int iMax = Math.max(nestedScrollView.getScrollY() - ((height - nestedScrollView.getPaddingBottom()) - nestedScrollView.getPaddingTop()), 0);
                        if (iMax != nestedScrollView.getScrollY()) {
                            nestedScrollView.x(0 - nestedScrollView.getScrollX(), iMax - nestedScrollView.getScrollY(), true);
                            return true;
                        }
                    } else if (i5 == 16908346) {
                    }
                }
                return false;
            default:
                return super.g(view, i5, bundle);
        }
    }
}
