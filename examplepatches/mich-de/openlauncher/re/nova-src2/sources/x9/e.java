package x9;

import android.graphics.Point;
import android.os.SystemClock;
import android.view.DragEvent;
import android.view.MotionEvent;
import o9.m0;

/* loaded from: classes2.dex */
public final class e extends c3.b {

    /* renamed from: g, reason: collision with root package name */
    public final long f95641g;

    /* renamed from: h, reason: collision with root package name */
    public float f95642h;

    /* renamed from: i, reason: collision with root package name */
    public float f95643i;

    public e(t tVar, aa.w wVar) {
        super(tVar, wVar);
        this.f95642h = 0.0f;
        this.f95643i = 0.0f;
        this.f95641g = SystemClock.uptimeMillis();
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x003c A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:16:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0049 A[FALL_THROUGH, RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x004e  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0095  */
    @Override // c3.b
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean v(DragEvent dragEvent) {
        int i5;
        t tVar = (t) this.f19222a;
        int action = dragEvent.getAction();
        if (action == 1) {
            i5 = 0;
        } else if (action != 2) {
            if (action == 4) {
                i5 = 1;
            }
            switch (dragEvent.getAction()) {
                case 1:
                    this.f95642h = dragEvent.getX();
                    this.f95643i = dragEvent.getY();
                    return true;
                case 2:
                    this.f95642h = dragEvent.getX();
                    this.f95643i = dragEvent.getY();
                    Point pointJ = tVar.j(dragEvent.getX(), dragEvent.getY());
                    tVar.m(pointJ.x, pointJ.y);
                    return true;
                case 3:
                    this.f95642h = dragEvent.getX();
                    this.f95643i = dragEvent.getY();
                    Point pointJ2 = tVar.j(dragEvent.getX(), dragEvent.getY());
                    tVar.m(pointJ2.x, pointJ2.y);
                    tVar.p(this.f95642h, this.f95643i);
                    return true;
                case 4:
                    tVar.d();
                    return true;
                case 6:
                    m0 m0Var = tVar.f95716l;
                    if (m0Var != null) {
                        m0Var.x(tVar.f95713i);
                        tVar.f95716l = null;
                    }
                case 5:
                    return true;
                default:
                    return false;
            }
        } else {
            i5 = 2;
        }
        MotionEvent motionEventObtain = MotionEvent.obtain(this.f95641g, SystemClock.uptimeMillis(), i5, dragEvent.getX(), dragEvent.getY(), 0);
        ((aa.w) this.f19223b).accept(motionEventObtain);
        motionEventObtain.recycle();
        switch (dragEvent.getAction()) {
        }
    }

    @Override // c3.b
    public final boolean w(MotionEvent motionEvent) {
        return false;
    }
}
