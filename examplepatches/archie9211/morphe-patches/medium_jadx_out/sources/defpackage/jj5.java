package defpackage;

import java.util.ArrayList;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class jj5 extends b72 {
    public b72[] r0 = new b72[4];
    public int s0 = 0;

    public final void V(b72 b72Var) {
        if (b72Var == this || b72Var == null) {
            return;
        }
        int i = this.s0 + 1;
        b72[] b72VarArr = this.r0;
        if (i > b72VarArr.length) {
            b72VarArr = (b72[]) Arrays.copyOf(b72VarArr, b72VarArr.length * 2);
            this.r0 = b72VarArr;
        }
        int i2 = this.s0;
        b72VarArr[i2] = b72Var;
        this.s0 = i2 + 1;
    }

    public final void W(int i, j3f j3fVar, ArrayList arrayList) {
        for (int i2 = 0; i2 < this.s0; i2++) {
            b72 b72Var = this.r0[i2];
            ArrayList arrayList2 = j3fVar.a;
            if (!arrayList2.contains(b72Var)) {
                arrayList2.add(b72Var);
            }
        }
        for (int i3 = 0; i3 < this.s0; i3++) {
            rv8.A(this.r0[i3], i, arrayList, j3fVar);
        }
    }
}
