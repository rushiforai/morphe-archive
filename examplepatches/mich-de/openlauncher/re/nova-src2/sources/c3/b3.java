package c3;

import java.util.List;

/* loaded from: classes.dex */
public final class b3 {

    /* renamed from: a, reason: collision with root package name */
    public final j3.k f19231a;

    /* renamed from: b, reason: collision with root package name */
    public final z.d0 f19232b;

    public b3(j3.q qVar, z.m mVar) {
        this.f19231a = qVar.f68823d;
        this.f19232b = new z.d0(j3.q.j(4, qVar).size());
        List listJ = j3.q.j(4, qVar);
        int size = listJ.size();
        for (int i5 = 0; i5 < size; i5++) {
            j3.q qVar2 = (j3.q) listJ.get(i5);
            if (mVar.a(qVar2.f68826g)) {
                this.f19232b.b(qVar2.f68826g);
            }
        }
    }
}
