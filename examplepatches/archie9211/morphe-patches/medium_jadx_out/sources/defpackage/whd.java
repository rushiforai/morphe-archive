package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class whd {
    public final kx6 a;
    public final lid b;
    public final uid c;
    public final boolean d;
    public final boolean e;
    public final akd f;
    public final yqa g;
    public final wzd h;
    public final tv2 i;
    public final x45 j;
    public final int k;

    public whd(kx6 kx6Var, lid lidVar, uid uidVar, boolean z, boolean z2, akd akdVar, yqa yqaVar, wzd wzdVar, tv2 tv2Var, x45 x45Var, int i) {
        this.a = kx6Var;
        this.b = lidVar;
        this.c = uidVar;
        this.d = z;
        this.e = z2;
        this.f = akdVar;
        this.g = yqaVar;
        this.h = wzdVar;
        this.i = tv2Var;
        this.j = x45Var;
        this.k = i;
    }

    public final void a(List list) {
        lig ligVar = this.a.d;
        ArrayList arrayList = new ArrayList(list);
        arrayList.add(0, new sj4());
        this.j.invoke(ligVar.n(arrayList));
    }
}
