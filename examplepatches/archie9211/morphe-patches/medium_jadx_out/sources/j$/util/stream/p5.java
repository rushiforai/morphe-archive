package j$.util.stream;

import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import j$.util.Spliterator;
import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class p5 extends y0 {
    public final /* synthetic */ long l;
    public final /* synthetic */ long m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p5(a1 a1Var, int i, long j, long j2) {
        super(a1Var, i);
        this.l = j;
        this.m = j2;
    }

    @Override // j$.util.stream.a
    public final g2 K(a aVar, Spliterator spliterator, IntFunction intFunction) {
        long jMin;
        long j;
        long jG = aVar.G(spliterator);
        if (jG > 0 && spliterator.hasCharacteristics(OlympusMakernoteDirectory.TAG_MAIN_INFO)) {
            a aVar2 = aVar;
            while (aVar2.e > 0) {
                aVar2 = aVar2.b;
            }
            return v3.C(aVar, v3.Y(aVar2.I(), spliterator, this.l, this.m), true);
        }
        if (y6.ORDERED.k(aVar.f)) {
            return (g2) new v5(this, aVar, spliterator, intFunction, this.l, this.m).invoke();
        }
        j$.util.u0 u0Var = (j$.util.u0) aVar.T(spliterator);
        long j2 = this.l;
        long j3 = this.m;
        if (j2 <= jG) {
            long j4 = jG - j2;
            jMin = j3 >= 0 ? Math.min(j3, j4) : j4;
            j = 0;
        } else {
            jMin = j3;
            j = j2;
        }
        return v3.C(this, new v7(u0Var, j, jMin), true);
    }

    @Override // j$.util.stream.a
    public final Spliterator L(a aVar, Spliterator spliterator) {
        long jG = aVar.G(spliterator);
        if (jG > 0 && spliterator.hasCharacteristics(OlympusMakernoteDirectory.TAG_MAIN_INFO)) {
            j$.util.u0 u0Var = (j$.util.u0) aVar.T(spliterator);
            long j = this.l;
            return new p7(u0Var, j, v3.z(j, this.m));
        }
        if (y6.ORDERED.k(aVar.f)) {
            return ((g2) new v5(this, aVar, spliterator, new u1(10), this.l, this.m).invoke()).spliterator();
        }
        j$.util.u0 u0Var2 = (j$.util.u0) aVar.T(spliterator);
        long j2 = this.l;
        long jMin = this.m;
        if (j2 <= jG) {
            long j3 = jG - j2;
            jMin = jMin >= 0 ? Math.min(jMin, j3) : j3;
            j2 = 0;
        }
        return new v7(u0Var2, j2, jMin);
    }

    @Override // j$.util.stream.a
    public final l5 N(int i, l5 l5Var) {
        return new o5(this, l5Var);
    }
}
