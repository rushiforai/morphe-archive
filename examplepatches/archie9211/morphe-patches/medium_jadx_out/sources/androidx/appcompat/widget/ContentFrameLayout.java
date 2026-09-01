package androidx.appcompat.widget;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.widget.FrameLayout;
import defpackage.bod;
import defpackage.e6;
import defpackage.e82;
import defpackage.f20;
import defpackage.h6;
import defpackage.jve;
import defpackage.lx7;
import defpackage.olb;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ContentFrameLayout extends FrameLayout {
    public TypedValue a;
    public TypedValue b;
    public TypedValue c;
    public TypedValue d;
    public TypedValue e;
    public TypedValue f;
    public final Rect g;
    public e82 h;

    public ContentFrameLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.g = new Rect();
    }

    public TypedValue getFixedHeightMajor() {
        TypedValue typedValue = this.e;
        if (typedValue != null) {
            return typedValue;
        }
        TypedValue typedValue2 = new TypedValue();
        this.e = typedValue2;
        return typedValue2;
    }

    public TypedValue getFixedHeightMinor() {
        TypedValue typedValue = this.f;
        if (typedValue != null) {
            return typedValue;
        }
        TypedValue typedValue2 = new TypedValue();
        this.f = typedValue2;
        return typedValue2;
    }

    public TypedValue getFixedWidthMajor() {
        TypedValue typedValue = this.c;
        if (typedValue != null) {
            return typedValue;
        }
        TypedValue typedValue2 = new TypedValue();
        this.c = typedValue2;
        return typedValue2;
    }

    public TypedValue getFixedWidthMinor() {
        TypedValue typedValue = this.d;
        if (typedValue != null) {
            return typedValue;
        }
        TypedValue typedValue2 = new TypedValue();
        this.d = typedValue2;
        return typedValue2;
    }

    public TypedValue getMinWidthMajor() {
        TypedValue typedValue = this.a;
        if (typedValue != null) {
            return typedValue;
        }
        TypedValue typedValue2 = new TypedValue();
        this.a = typedValue2;
        return typedValue2;
    }

    public TypedValue getMinWidthMinor() {
        TypedValue typedValue = this.b;
        if (typedValue != null) {
            return typedValue;
        }
        TypedValue typedValue2 = new TypedValue();
        this.b = typedValue2;
        return typedValue2;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        e82 e82Var = this.h;
        if (e82Var != null) {
            e82Var.getClass();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        h6 h6Var;
        super.onDetachedFromWindow();
        e82 e82Var = this.h;
        if (e82Var != null) {
            f20 f20Var = (f20) ((olb) e82Var).b;
            ActionBarOverlayLayout actionBarOverlayLayout = f20Var.q;
            if (actionBarOverlayLayout != null) {
                actionBarOverlayLayout.e();
                ActionMenuView actionMenuView = ((bod) actionBarOverlayLayout.e).a.a;
                if (actionMenuView != null && (h6Var = actionMenuView.t) != null) {
                    h6Var.e();
                    e6 e6Var = h6Var.t;
                    if (e6Var != null && e6Var.b()) {
                        e6Var.i.dismiss();
                    }
                }
            }
            if (f20Var.v != null) {
                f20Var.l.getDecorView().removeCallbacks(f20Var.w);
                if (f20Var.v.isShowing()) {
                    try {
                        f20Var.v.dismiss();
                    } catch (IllegalArgumentException unused) {
                    }
                }
                f20Var.v = null;
            }
            jve jveVar = f20Var.x;
            if (jveVar != null) {
                jveVar.b();
            }
            lx7 lx7Var = f20Var.z(0).h;
            if (lx7Var != null) {
                lx7Var.c(true);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x004e  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00de  */
    @Override // android.widget.FrameLayout, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onMeasure(int r17, int r18) {
        /*
            Method dump skipped, instruction units count: 229
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.appcompat.widget.ContentFrameLayout.onMeasure(int, int):void");
    }

    public void setAttachListener(e82 e82Var) {
        this.h = e82Var;
    }

    public ContentFrameLayout(Context context) {
        this(context, null);
    }
}
