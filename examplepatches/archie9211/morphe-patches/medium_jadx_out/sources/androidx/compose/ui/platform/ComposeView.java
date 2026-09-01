package androidx.compose.ui.platform;

import android.content.Context;
import android.util.AttributeSet;
import defpackage.b55;
import defpackage.k49;
import defpackage.mwa;
import defpackage.p65;
import defpackage.qo7;
import defpackage.w0;
import defpackage.x0;
import defpackage.x12;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ComposeView extends x0 {
    public final k49 j;
    public boolean k;

    public ComposeView(Context context, AttributeSet attributeSet, int i) {
        super(context, (i & 2) != 0 ? null : attributeSet);
        this.j = qo7.u(null);
    }

    @Override // defpackage.x0
    public final void a(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(420213850);
        int i2 = 4;
        int i3 = (p65Var.h(this) ? 4 : 2) | i;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            b55 b55Var = (b55) this.j.getValue();
            if (b55Var == null) {
                p65Var.Y(-1238823553);
            } else {
                p65Var.Y(98585282);
                b55Var.invoke(p65Var, 0);
            }
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new w0(this, i, i2);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public CharSequence getAccessibilityClassName() {
        return "androidx.compose.ui.platform.ComposeView";
    }

    @Override // defpackage.x0
    public boolean getShouldCreateCompositionOnAttachedToWindow() {
        return this.k;
    }

    public final void setContent(b55 b55Var) {
        this.k = true;
        this.j.setValue(b55Var);
        if (isAttachedToWindow() || getComposeViewContext$ui() != null) {
            d();
        }
    }

    public ComposeView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 4);
    }

    public ComposeView(Context context) {
        this(context, null, 6);
    }

    public static /* synthetic */ void getShouldCreateCompositionOnAttachedToWindow$annotations() {
    }
}
