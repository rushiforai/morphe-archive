package sn;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final rn.a f87551a;

    /* renamed from: b, reason: collision with root package name */
    public final int f87552b;

    /* renamed from: c, reason: collision with root package name */
    public final int f87553c;

    /* renamed from: d, reason: collision with root package name */
    public final int f87554d;

    /* renamed from: e, reason: collision with root package name */
    public final d f87555e;

    /* renamed from: f, reason: collision with root package name */
    public final int f87556f;

    public d(ck.e eVar, rn.a aVar, int i5, int i11, int i12, d dVar, rn.b bVar) {
        this.f87551a = aVar;
        this.f87552b = i5;
        rn.a aVar2 = rn.a.BYTE;
        int i13 = (aVar == aVar2 || dVar == null) ? i11 : dVar.f87553c;
        this.f87553c = i13;
        this.f87554d = i12;
        this.f87555e = dVar;
        boolean z11 = false;
        int iA = dVar != null ? dVar.f87556f : 0;
        if ((aVar == aVar2 && dVar == null && i13 != 0) || (dVar != null && i13 != dVar.f87553c)) {
            z11 = true;
        }
        iA = (dVar == null || aVar != dVar.f87551a || z11) ? iA + aVar.a(bVar) + 4 : iA;
        int iOrdinal = aVar.ordinal();
        if (iOrdinal != 1) {
            if (iOrdinal == 2) {
                iA += i12 != 1 ? 11 : 6;
            } else if (iOrdinal == 4) {
                iA += ((String) eVar.f19979d).substring(i5, i12 + i5).getBytes(((on.d) eVar.f19980e).f80544a[i11].charset()).length * 8;
                if (z11) {
                    iA += 12;
                }
            } else if (iOrdinal == 6) {
                iA += 13;
            }
        } else {
            iA += i12 != 1 ? i12 == 2 ? 7 : 10 : 4;
        }
        this.f87556f = iA;
    }
}
