package x9;

import android.graphics.Point;
import android.view.MotionEvent;

/* loaded from: classes2.dex */
public final class d extends c3.b {
    @Override // c3.b
    public final boolean w(MotionEvent motionEvent) {
        t tVar = (t) this.f19222a;
        ((aa.w) this.f19223b).accept(motionEvent);
        int action = motionEvent.getAction();
        if (action == 1) {
            tVar.p(motionEvent.getX(), motionEvent.getY());
            return true;
        }
        if (action != 3) {
            return true;
        }
        tVar.d();
        return true;
    }

    @Override // c3.b
    public final boolean x(MotionEvent motionEvent) {
        t tVar = (t) this.f19222a;
        ((aa.w) this.f19223b).accept(motionEvent);
        int action = motionEvent.getAction();
        if (action == 1) {
            Point pointJ = tVar.j(motionEvent.getX(), motionEvent.getY());
            tVar.m(pointJ.x, pointJ.y);
            tVar.p(motionEvent.getX(), motionEvent.getY());
            return true;
        }
        if (action == 2) {
            Point pointJ2 = tVar.j(motionEvent.getX(), motionEvent.getY());
            tVar.m(pointJ2.x, pointJ2.y);
            return true;
        }
        if (action != 3) {
            return true;
        }
        tVar.d();
        return true;
    }
}
