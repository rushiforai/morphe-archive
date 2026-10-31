package m;

import android.view.KeyEvent;
import android.view.MotionEvent;
import androidx.appcompat.widget.ContentFrameLayout;
import e10.z2;

/* loaded from: classes2.dex */
public final class d0 extends ContentFrameLayout {

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ f0 f75198i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d0(f0 f0Var, androidx.appcompat.view.d dVar) {
        super(dVar, null);
        this.f75198i = f0Var;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return this.f75198i.L(keyEvent) || super.dispatchKeyEvent(keyEvent);
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0) {
            int x11 = (int) motionEvent.getX();
            int y11 = (int) motionEvent.getY();
            if (x11 < -5 || y11 < -5 || x11 > getWidth() + 5 || y11 > getHeight() + 5) {
                f0 f0Var = this.f75198i;
                f0Var.J(f0Var.Q(0), true);
                return true;
            }
        }
        return super.onInterceptTouchEvent(motionEvent);
    }

    @Override // android.view.View
    public final void setBackgroundResource(int i5) {
        setBackgroundDrawable(z2.b0(getContext(), i5));
    }
}
