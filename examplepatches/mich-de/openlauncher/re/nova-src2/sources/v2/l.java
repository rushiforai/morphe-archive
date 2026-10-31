package v2;

import e1.m0;

/* loaded from: classes.dex */
public class l {

    /* renamed from: a, reason: collision with root package name */
    public final r1.e f91963a = new r1.e(new k[16]);

    /* renamed from: b, reason: collision with root package name */
    public final z.j0 f91964b = new z.j0(10);

    public boolean a(z.v vVar, z2.y yVar, m0 m0Var, boolean z11) {
        r1.e eVar = this.f91963a;
        Object[] objArr = eVar.f85077a;
        int i5 = eVar.f85079c;
        boolean z12 = false;
        for (int i11 = 0; i11 < i5; i11++) {
            z12 = ((k) objArr[i11]).a(vVar, yVar, m0Var, z11) || z12;
        }
        return z12;
    }

    public void b(m0 m0Var) {
        r1.e eVar = this.f91963a;
        int i5 = eVar.f85079c;
        while (true) {
            i5--;
            if (-1 >= i5) {
                return;
            }
            if (((k) eVar.f85077a[i5]).f91954d.g()) {
                eVar.k(i5);
            }
        }
    }
}
