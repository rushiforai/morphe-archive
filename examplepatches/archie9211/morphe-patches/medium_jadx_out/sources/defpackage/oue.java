package defpackage;

import android.graphics.Canvas;
import android.graphics.Outline;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oue extends View {
    public static final vb3 k = new vb3(3);
    public final wl3 a;
    public final h61 b;
    public final g61 c;
    public boolean d;
    public Outline e;
    public boolean f;
    public m73 g;
    public ip6 h;
    public x45 i;
    public of5 j;

    public oue(wl3 wl3Var, h61 h61Var, g61 g61Var) {
        super(wl3Var.getContext());
        this.a = wl3Var;
        this.b = h61Var;
        this.c = g61Var;
        setOutlineProvider(k);
        this.f = true;
        this.g = flb.g;
        this.h = ip6.Ltr;
        qf5.a.getClass();
        this.i = zu2.t;
        setWillNotDraw(false);
        setClipBounds(null);
    }

    @Override // android.view.View
    public final void dispatchDraw(Canvas canvas) {
        h61 h61Var = this.b;
        pm pmVar = h61Var.a;
        Canvas canvas2 = pmVar.a;
        pmVar.a = canvas;
        m73 m73Var = this.g;
        ip6 ip6Var = this.h;
        float width = getWidth();
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(getHeight())) & 4294967295L) | (Float.floatToRawIntBits(width) << 32);
        of5 of5Var = this.j;
        x45 x45Var = this.i;
        g61 g61Var = this.c;
        m73 m73VarY = g61Var.b.y();
        m50 m50Var = g61Var.b;
        ip6 ip6VarA = m50Var.A();
        e61 e61VarX = m50Var.x();
        long jB = m50Var.B();
        of5 of5Var2 = (of5) m50Var.c;
        m50Var.O(m73Var);
        m50Var.P(ip6Var);
        m50Var.M(pmVar);
        m50Var.Q(jFloatToRawIntBits);
        m50Var.c = of5Var;
        pmVar.h();
        try {
            x45Var.invoke(g61Var);
            pmVar.q();
            m50Var.O(m73VarY);
            m50Var.P(ip6VarA);
            m50Var.M(e61VarX);
            m50Var.Q(jB);
            m50Var.c = of5Var2;
            h61Var.a.a = canvas2;
            this.d = false;
        } catch (Throwable th) {
            pmVar.q();
            m50Var.O(m73VarY);
            m50Var.P(ip6VarA);
            m50Var.M(e61VarX);
            m50Var.Q(jB);
            m50Var.c = of5Var2;
            throw th;
        }
    }

    public final boolean getCanUseCompositingLayer$ui_graphics() {
        return this.f;
    }

    public final h61 getCanvasHolder() {
        return this.b;
    }

    public final View getOwnerView() {
        return this.a;
    }

    @Override // android.view.View
    public final boolean hasOverlappingRendering() {
        return this.f;
    }

    @Override // android.view.View
    public final void invalidate() {
        if (this.d) {
            return;
        }
        this.d = true;
        super.invalidate();
    }

    public final void setCanUseCompositingLayer$ui_graphics(boolean z) {
        if (this.f != z) {
            this.f = z;
            invalidate();
        }
    }

    public final void setInvalidated(boolean z) {
        this.d = z;
    }

    @Override // android.view.View
    public final void forceLayout() {
    }

    @Override // android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
    }
}
