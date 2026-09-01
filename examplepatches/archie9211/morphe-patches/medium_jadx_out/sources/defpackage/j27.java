package defpackage;

import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j27 implements View.OnTouchListener {
    public final /* synthetic */ k27 a;

    public j27(k27 k27Var) {
        this.a = k27Var;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        k27 k27Var = this.a;
        g27 g27Var = k27Var.r;
        Handler handler = k27Var.v;
        p20 p20Var = k27Var.z;
        int action = motionEvent.getAction();
        int x = (int) motionEvent.getX();
        int y = (int) motionEvent.getY();
        if (action == 0 && p20Var != null && p20Var.isShowing() && x >= 0 && x < p20Var.getWidth() && y >= 0 && y < p20Var.getHeight()) {
            handler.postDelayed(g27Var, 250L);
            return false;
        }
        if (action != 1) {
            return false;
        }
        handler.removeCallbacks(g27Var);
        return false;
    }
}
