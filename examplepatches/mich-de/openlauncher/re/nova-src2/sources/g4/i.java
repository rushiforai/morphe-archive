package g4;

import h4.n;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public abstract class i extends d {

    /* renamed from: p0, reason: collision with root package name */
    public d[] f57164p0 = new d[4];

    /* renamed from: q0, reason: collision with root package name */
    public int f57165q0 = 0;

    public final void M(int i5, n nVar, ArrayList arrayList) {
        for (int i11 = 0; i11 < this.f57165q0; i11++) {
            d dVar = this.f57164p0[i11];
            ArrayList arrayList2 = nVar.f59127a;
            if (!arrayList2.contains(dVar)) {
                arrayList2.add(dVar);
            }
        }
        for (int i12 = 0; i12 < this.f57165q0; i12++) {
            h4.h.b(this.f57164p0[i12], i5, arrayList, nVar);
        }
    }

    public void N() {
    }
}
