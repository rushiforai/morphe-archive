package defpackage;

import android.graphics.Path;
import android.graphics.PointF;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pw3 implements l59, nn0, v72 {
    public final rc7 b;
    public final se5 c;
    public final rn0 d;
    public final bm1 e;
    public boolean g;
    public final Path a = new Path();
    public final ru f = new ru(2);

    public pw3(rc7 rc7Var, tn0 tn0Var, bm1 bm1Var) {
        this.b = rc7Var;
        rn0 rn0VarW = bm1Var.b.w();
        this.c = (se5) rn0VarW;
        rn0 rn0VarW2 = bm1Var.a.w();
        this.d = rn0VarW2;
        this.e = bm1Var;
        tn0Var.d(rn0VarW);
        tn0Var.d(rn0VarW2);
        rn0VarW.a(this);
        rn0VarW2.a(this);
    }

    @Override // defpackage.nn0
    public final void a() {
        this.g = false;
        this.b.invalidateSelf();
    }

    @Override // defpackage.v72
    public final void b(List list, List list2) {
        int i = 0;
        while (true) {
            ArrayList arrayList = (ArrayList) list;
            if (i >= arrayList.size()) {
                return;
            }
            v72 v72Var = (v72) arrayList.get(i);
            if (v72Var instanceof ntd) {
                ntd ntdVar = (ntd) v72Var;
                if (ntdVar.c == s4c.SIMULTANEOUSLY) {
                    this.f.b.add(ntdVar);
                    ntdVar.d(this);
                }
            }
            i++;
        }
    }

    @Override // defpackage.l59
    public final Path h() {
        boolean z = this.g;
        Path path = this.a;
        if (z) {
            return path;
        }
        path.reset();
        bm1 bm1Var = this.e;
        if (bm1Var.d) {
            this.g = true;
            return path;
        }
        PointF pointF = (PointF) this.c.d();
        float f = pointF.x / 2.0f;
        float f2 = pointF.y / 2.0f;
        float f3 = f * 0.55228f;
        float f4 = f2 * 0.55228f;
        path.reset();
        if (bm1Var.c) {
            float f5 = -f2;
            path.moveTo(0.0f, f5);
            float f6 = 0.0f - f3;
            float f7 = -f;
            float f8 = 0.0f - f4;
            path.cubicTo(f6, f5, f7, f8, f7, 0.0f);
            float f9 = f4 + 0.0f;
            path.cubicTo(f7, f9, f6, f2, 0.0f, f2);
            float f10 = f3 + 0.0f;
            path.cubicTo(f10, f2, f, f9, f, 0.0f);
            path.cubicTo(f, f8, f10, f5, 0.0f, f5);
        } else {
            float f11 = -f2;
            path.moveTo(0.0f, f11);
            float f12 = f3 + 0.0f;
            float f13 = 0.0f - f4;
            path.cubicTo(f12, f11, f, f13, f, 0.0f);
            float f14 = f4 + 0.0f;
            path.cubicTo(f, f14, f12, f2, 0.0f, f2);
            float f15 = 0.0f - f3;
            float f16 = -f;
            path.cubicTo(f15, f2, f16, f14, f16, 0.0f);
            path.cubicTo(f16, f13, f15, f11, 0.0f, f11);
        }
        PointF pointF2 = (PointF) this.d.d();
        path.offset(pointF2.x, pointF2.y);
        path.close();
        this.f.e(path);
        this.g = true;
        return path;
    }
}
