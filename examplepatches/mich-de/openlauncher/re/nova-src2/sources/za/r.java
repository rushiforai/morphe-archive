package za;

import android.view.MotionEvent;
import android.view.ViewGroup;
import o9.d4;

/* loaded from: classes2.dex */
public final class r extends o9.a {

    /* renamed from: c, reason: collision with root package name */
    public d4 f98483c;

    @Override // o9.a
    public final boolean J() {
        return true;
    }

    @Override // o9.a
    public final void Q(boolean z11) {
        if (this.f79742a) {
            d4 d4Var = this.f98483c;
            if (d4Var != null) {
                d4Var.run();
            } else if (getParent() instanceof ViewGroup) {
                ((ViewGroup) getParent()).removeView(this);
            }
        }
        this.f79742a = false;
    }

    @Override // o9.a
    public final boolean R(int i5) {
        return (i5 & 256) != 0;
    }

    @Override // ya.k0
    public final boolean l(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0) {
            Q(false);
        }
        return false;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.f79742a = true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.f79742a = false;
    }
}
