package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pv implements zk7 {
    public final mw a;
    public boolean b;

    public pv(mw mwVar) {
        this.a = mwVar;
    }

    @Override // defpackage.zk7
    public final int a(y66 y66Var, List list, int i) {
        if (list.isEmpty()) {
            return 0;
        }
        int iN = ((tk7) list.get(0)).n(i);
        int i2 = 1;
        int size = list.size() - 1;
        if (1 <= size) {
            while (true) {
                int iN2 = ((tk7) list.get(i2)).n(i);
                if (iN2 > iN) {
                    iN = iN2;
                }
                if (i2 == size) {
                    break;
                }
                i2++;
            }
        }
        return iN;
    }

    @Override // defpackage.zk7
    public final al7 b(bl7 bl7Var, List list, long j) {
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        int iMax = 0;
        int iMax2 = 0;
        for (int i = 0; i < size; i++) {
            t99 t99VarS = ((tk7) list.get(i)).s(j);
            iMax = Math.max(iMax, t99VarS.a);
            iMax2 = Math.max(iMax2, t99VarS.b);
            arrayList.add(t99VarS);
        }
        boolean zW = bl7Var.W();
        mw mwVar = this.a;
        if (zW) {
            this.b = true;
            mwVar.a.setValue(new s46((4294967295L & ((long) iMax2)) | (((long) iMax) << 32)));
        } else if (!this.b) {
            mwVar.a.setValue(new s46((4294967295L & ((long) iMax2)) | (((long) iMax) << 32)));
        }
        return bl7Var.q0(iMax, iMax2, fy3.a, new xo(2, arrayList));
    }

    @Override // defpackage.zk7
    public final int c(y66 y66Var, List list, int i) {
        if (list.isEmpty()) {
            return 0;
        }
        int iK = ((tk7) list.get(0)).k(i);
        int i2 = 1;
        int size = list.size() - 1;
        if (1 <= size) {
            while (true) {
                int iK2 = ((tk7) list.get(i2)).k(i);
                if (iK2 > iK) {
                    iK = iK2;
                }
                if (i2 == size) {
                    break;
                }
                i2++;
            }
        }
        return iK;
    }

    @Override // defpackage.zk7
    public final int d(y66 y66Var, List list, int i) {
        if (list.isEmpty()) {
            return 0;
        }
        int iA = ((tk7) list.get(0)).a(i);
        int i2 = 1;
        int size = list.size() - 1;
        if (1 <= size) {
            while (true) {
                int iA2 = ((tk7) list.get(i2)).a(i);
                if (iA2 > iA) {
                    iA = iA2;
                }
                if (i2 == size) {
                    break;
                }
                i2++;
            }
        }
        return iA;
    }

    @Override // defpackage.zk7
    public final int e(y66 y66Var, List list, int i) {
        if (list.isEmpty()) {
            return 0;
        }
        int iL = ((tk7) list.get(0)).L(i);
        int i2 = 1;
        int size = list.size() - 1;
        if (1 <= size) {
            while (true) {
                int iL2 = ((tk7) list.get(i2)).L(i);
                if (iL2 > iL) {
                    iL = iL2;
                }
                if (i2 == size) {
                    break;
                }
                i2++;
            }
        }
        return iL;
    }
}
