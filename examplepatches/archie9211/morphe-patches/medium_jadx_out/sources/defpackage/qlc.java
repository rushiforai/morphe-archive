package defpackage;

import android.graphics.PointF;
import java.util.ArrayList;
import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qlc extends rn0 {
    public final PointF h;
    public final PointF i;
    public final zu1 j;
    public final zu1 k;

    public qlc(zu1 zu1Var, zu1 zu1Var2) {
        super(Collections.EMPTY_LIST);
        this.h = new PointF();
        this.i = new PointF();
        this.j = zu1Var;
        this.k = zu1Var2;
        g(this.d);
    }

    @Override // defpackage.rn0
    public final Object d() {
        PointF pointF = this.h;
        float f = pointF.x;
        PointF pointF2 = this.i;
        pointF2.set(f, 0.0f);
        pointF2.set(pointF2.x, pointF.y);
        return pointF2;
    }

    @Override // defpackage.rn0
    public final Object e(uk6 uk6Var, float f) {
        PointF pointF = this.h;
        float f2 = pointF.x;
        PointF pointF2 = this.i;
        pointF2.set(f2, 0.0f);
        pointF2.set(pointF2.x, pointF.y);
        return pointF2;
    }

    @Override // defpackage.rn0
    public final void g(float f) {
        zu1 zu1Var = this.j;
        zu1Var.g(f);
        zu1 zu1Var2 = this.k;
        zu1Var2.g(f);
        this.h.set(((Float) zu1Var.d()).floatValue(), ((Float) zu1Var2.d()).floatValue());
        int i = 0;
        while (true) {
            ArrayList arrayList = this.a;
            if (i >= arrayList.size()) {
                return;
            }
            ((nn0) arrayList.get(i)).a();
            i++;
        }
    }
}
