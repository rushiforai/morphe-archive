package n6;

import h6.f1;
import z.d1;

/* loaded from: classes2.dex */
public class e extends f1 {

    /* renamed from: c, reason: collision with root package name */
    public static final d f77900c = new d(0);

    /* renamed from: a, reason: collision with root package name */
    public final d1 f77901a = new d1(0);

    /* renamed from: b, reason: collision with root package name */
    public boolean f77902b = false;

    @Override // h6.f1
    public final void onCleared() {
        super.onCleared();
        d1 d1Var = this.f77901a;
        int iF = d1Var.f();
        for (int i5 = 0; i5 < iF; i5++) {
            b bVar = (b) d1Var.g(i5);
            mg.d dVar = bVar.f77895l;
            dVar.a();
            dVar.f76287d = true;
            c cVar = bVar.n;
            if (cVar != null) {
                bVar.i(cVar);
            }
            b bVar2 = dVar.f76284a;
            if (bVar2 == null) {
                throw new IllegalStateException("No listener register");
            }
            if (bVar2 != bVar) {
                throw new IllegalArgumentException("Attempting to unregister the wrong listener");
            }
            dVar.f76284a = null;
            if (cVar != null) {
                boolean z11 = cVar.f77898b;
            }
            dVar.f76288e = true;
            dVar.f76286c = false;
            dVar.f76287d = false;
            dVar.f76289f = false;
        }
        int i11 = d1Var.f97759d;
        Object[] objArr = d1Var.f97758c;
        for (int i12 = 0; i12 < i11; i12++) {
            objArr[i12] = null;
        }
        d1Var.f97759d = 0;
        d1Var.f97756a = false;
    }
}
