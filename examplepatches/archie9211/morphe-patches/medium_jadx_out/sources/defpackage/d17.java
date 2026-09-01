package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d17 implements zk7 {
    public final /* synthetic */ int a;
    public final Object b;

    public /* synthetic */ d17(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.zk7
    public final /* synthetic */ int a(y66 y66Var, List list, int i) {
        int i2 = this.a;
        return ev6.c(this, y66Var, list, i);
    }

    @Override // defpackage.zk7
    public final al7 b(bl7 bl7Var, List list, long j) {
        int iMax;
        int iMax2;
        int i;
        int i2;
        int iW0;
        int i3 = this.a;
        fy3 fy3Var = fy3.a;
        switch (i3) {
            case 0:
                return bl7Var.q0(f72.h(j), f72.g(j), fy3Var, new si3(list, 24, this));
            default:
                bgc bgcVar = (bgc) this.b;
                float[] fArr = bgcVar.f;
                hw8 hw8Var = bgcVar.l;
                int size = list.size();
                int i4 = 0;
                while (true) {
                    if (i4 < size) {
                        tk7 tk7Var = (tk7) list.get(i4);
                        if (kng.F(tk7Var) == rfc.THUMB) {
                            final t99 t99VarS = tk7Var.s(j);
                            int size2 = list.size();
                            for (int i5 = 0; i5 < size2; i5++) {
                                tk7 tk7Var2 = (tk7) list.get(i5);
                                if (kng.F(tk7Var2) == rfc.TRACK) {
                                    hw8 hw8Var2 = hw8.Vertical;
                                    t99 t99VarS2 = hw8Var == hw8Var2 ? tk7Var2.s(f72.a(h72.j(0, -t99VarS.b, 1, j), 0, 0, 0, 0, 14)) : tk7Var2.s(f72.a(h72.j(-t99VarS.a, 0, 2, j), 0, 0, 0, 0, 11));
                                    final pya pyaVar = new pya();
                                    float fC = bgcVar.c();
                                    fArr.getClass();
                                    if (!g76.I(fC, fArr.length == 0 ? null : Float.valueOf(fArr[0]))) {
                                        g76.I(fC, k80.G0(fArr));
                                    }
                                    t99VarS2.M(agc.f);
                                    if (hw8Var == hw8Var2) {
                                        iMax = Math.max(t99VarS2.a, t99VarS.a);
                                        int i6 = t99VarS.b;
                                        int i7 = t99VarS2.b;
                                        iMax2 = i6 + i7;
                                        i = (iMax - t99VarS2.a) / 2;
                                        i2 = i6 / 2;
                                        iW0 = (iMax - t99VarS.a) / 2;
                                        pyaVar.a = nk7.w0(i7 * fC);
                                    } else {
                                        iMax = t99VarS.a + t99VarS2.a;
                                        iMax2 = Math.max(t99VarS2.b, t99VarS.b);
                                        i = t99VarS.a / 2;
                                        i2 = (iMax2 - t99VarS2.b) / 2;
                                        iW0 = nk7.w0(t99VarS2.a * fC);
                                        pyaVar.a = (iMax2 - t99VarS.b) / 2;
                                    }
                                    final int i8 = i2;
                                    final int i9 = i;
                                    final int i10 = iW0;
                                    bgcVar.g.h(iMax);
                                    bgcVar.h.h(iMax2);
                                    final t99 t99Var = t99VarS2;
                                    return bl7Var.q0(iMax, iMax2, fy3Var, new x45() { // from class: xfc
                                        @Override // defpackage.x45
                                        public final Object invoke(Object obj) {
                                            s99 s99Var = (s99) obj;
                                            s99.j(s99Var, t99Var, i9, i8);
                                            s99.j(s99Var, t99VarS, i10, pyaVar.a);
                                            return c1e.a;
                                        }
                                    });
                                }
                            }
                            z27.c("Collection contains no element matching the predicate.");
                            z72.b();
                        } else {
                            i4++;
                        }
                    } else {
                        z27.c("Collection contains no element matching the predicate.");
                        z72.b();
                    }
                }
                return null;
        }
    }

    @Override // defpackage.zk7
    public final /* synthetic */ int c(y66 y66Var, List list, int i) {
        int i2 = this.a;
        return ev6.g(this, y66Var, list, i);
    }

    @Override // defpackage.zk7
    public final /* synthetic */ int d(y66 y66Var, List list, int i) {
        int i2 = this.a;
        return ev6.a(this, y66Var, list, i);
    }

    @Override // defpackage.zk7
    public final /* synthetic */ int e(y66 y66Var, List list, int i) {
        int i2 = this.a;
        return ev6.e(this, y66Var, list, i);
    }
}
