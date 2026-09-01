package defpackage;

import java.util.ArrayList;
import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class hj5 extends c62 implements u84 {
    public final qpc k0;
    public final opc l0;
    public final ArrayList m0;

    public hj5(qpc qpcVar, opc opcVar) {
        super(qpcVar);
        this.m0 = new ArrayList();
        this.k0 = qpcVar;
        this.l0 = opcVar;
    }

    @Override // defpackage.c62, defpackage.sya
    public final b72 b() {
        return s();
    }

    public final void q(Object... objArr) {
        Collections.addAll(this.m0, objArr);
    }

    public final void r() {
        super.apply();
    }

    public jj5 s() {
        return null;
    }

    @Override // defpackage.c62, defpackage.sya
    public void apply() {
    }
}
