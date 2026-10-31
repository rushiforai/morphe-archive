package s0;

import i2.j0;
import i2.k0;
import i2.r0;
import i2.v0;
import y3.n;

/* loaded from: classes.dex */
public abstract class a implements v0 {

    /* renamed from: a, reason: collision with root package name */
    public final b f86504a;

    /* renamed from: b, reason: collision with root package name */
    public final b f86505b;

    /* renamed from: c, reason: collision with root package name */
    public final b f86506c;

    /* renamed from: d, reason: collision with root package name */
    public final b f86507d;

    public a(b bVar, b bVar2, b bVar3, b bVar4) {
        this.f86504a = bVar;
        this.f86505b = bVar2;
        this.f86506c = bVar3;
        this.f86507d = bVar4;
    }

    public static g b(a aVar, b bVar, b bVar2, b bVar3, int i5) {
        if ((i5 & 1) != 0) {
            bVar = aVar.f86504a;
        }
        b bVar4 = (i5 & 2) != 0 ? aVar.f86505b : d.f86508a;
        if ((i5 & 4) != 0) {
            bVar2 = aVar.f86506c;
        }
        if ((i5 & 8) != 0) {
            bVar3 = aVar.f86507d;
        }
        ((g) aVar).getClass();
        return new g(bVar, bVar4, bVar2, bVar3);
    }

    @Override // i2.v0
    public final r0 a(long j11, n nVar, y3.c cVar) {
        float fA = this.f86504a.a(j11, cVar);
        float fA2 = this.f86505b.a(j11, cVar);
        float fA3 = this.f86506c.a(j11, cVar);
        float fA4 = this.f86507d.a(j11, cVar);
        float fC = h2.e.c(j11);
        float f11 = fA + fA4;
        if (f11 > fC) {
            float f12 = fC / f11;
            fA *= f12;
            fA4 *= f12;
        }
        float f13 = fA2 + fA3;
        if (f13 > fC) {
            float f14 = fC / f13;
            fA2 *= f14;
            fA3 *= f14;
        }
        if (fA < 0.0f || fA2 < 0.0f || fA3 < 0.0f || fA4 < 0.0f) {
            j0.b.a("Corner size in Px can't be negative(topStart = " + fA + ", topEnd = " + fA2 + ", bottomEnd = " + fA3 + ", bottomStart = " + fA4 + ")!");
        }
        if (fA + fA2 + fA3 + fA4 == 0.0f) {
            return new j0(bh.g.p(0L, j11));
        }
        h2.c cVarP = bh.g.p(0L, j11);
        n nVar2 = n.f96612a;
        float f15 = nVar == nVar2 ? fA : fA2;
        long jFloatToRawIntBits = (Float.floatToRawIntBits(f15) << 32) | (Float.floatToRawIntBits(f15) & 4294967295L);
        if (nVar == nVar2) {
            fA = fA2;
        }
        long jFloatToRawIntBits2 = (Float.floatToRawIntBits(fA) << 32) | (Float.floatToRawIntBits(fA) & 4294967295L);
        float f16 = nVar == nVar2 ? fA3 : fA4;
        long jFloatToRawIntBits3 = (Float.floatToRawIntBits(f16) << 32) | (Float.floatToRawIntBits(f16) & 4294967295L);
        if (nVar != nVar2) {
            fA4 = fA3;
        }
        return new k0(new h2.d(cVarP.f59018a, cVarP.f59019b, cVarP.f59020c, cVarP.f59021d, jFloatToRawIntBits, jFloatToRawIntBits2, jFloatToRawIntBits3, (Float.floatToRawIntBits(fA4) << 32) | (Float.floatToRawIntBits(fA4) & 4294967295L)));
    }
}
