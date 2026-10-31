package r;

import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;

/* loaded from: classes.dex */
public final class s1 implements View.OnTouchListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t1 f84855a;

    public s1(t1 t1Var) {
        this.f84855a = t1Var;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        t1 t1Var = this.f84855a;
        p1 p1Var = t1Var.f84875r;
        Handler handler = t1Var.f84879v;
        u uVar = t1Var.f84883z;
        int action = motionEvent.getAction();
        int x11 = (int) motionEvent.getX();
        int y11 = (int) motionEvent.getY();
        if (action == 0 && uVar != null && uVar.isShowing() && x11 >= 0 && x11 < uVar.getWidth() && y11 >= 0 && y11 < uVar.getHeight()) {
            handler.postDelayed(p1Var, 250L);
            return false;
        }
        if (action != 1) {
            return false;
        }
        handler.removeCallbacks(p1Var);
        return false;
    }
}
