package h4;

import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public o f59122a;

    /* renamed from: b, reason: collision with root package name */
    public ArrayList f59123b;

    public static long a(f fVar, long j11) {
        o oVar = fVar.f59110d;
        ArrayList arrayList = fVar.f59117k;
        if (oVar instanceof j) {
            return j11;
        }
        int size = arrayList.size();
        long jMin = j11;
        for (int i5 = 0; i5 < size; i5++) {
            d dVar = (d) arrayList.get(i5);
            if (dVar instanceof f) {
                f fVar2 = (f) dVar;
                if (fVar2.f59110d != oVar) {
                    jMin = Math.min(jMin, a(fVar2, fVar2.f59112f + j11));
                }
            }
        }
        f fVar3 = oVar.f59140i;
        f fVar4 = oVar.f59139h;
        if (fVar != fVar3) {
            return jMin;
        }
        long j12 = j11 - oVar.j();
        return Math.min(Math.min(jMin, a(fVar4, j12)), j12 - fVar4.f59112f);
    }

    public static long b(f fVar, long j11) {
        o oVar = fVar.f59110d;
        ArrayList arrayList = fVar.f59117k;
        if (oVar instanceof j) {
            return j11;
        }
        int size = arrayList.size();
        long jMax = j11;
        for (int i5 = 0; i5 < size; i5++) {
            d dVar = (d) arrayList.get(i5);
            if (dVar instanceof f) {
                f fVar2 = (f) dVar;
                if (fVar2.f59110d != oVar) {
                    jMax = Math.max(jMax, b(fVar2, fVar2.f59112f + j11));
                }
            }
        }
        f fVar3 = oVar.f59139h;
        f fVar4 = oVar.f59140i;
        if (fVar != fVar3) {
            return jMax;
        }
        long j12 = oVar.j() + j11;
        return Math.max(Math.max(jMax, b(fVar4, j12)), j12 - fVar4.f59112f);
    }
}
