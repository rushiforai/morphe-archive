package c80;

import com.moloco.sdk.internal.b0;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import t0.v1;
import z2.i1;
import z2.q0;
import z2.t0;

/* loaded from: classes.dex */
public final /* synthetic */ class b implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19831a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f19832b;

    public /* synthetic */ b(d dVar, c cVar) {
        this.f19831a = 0;
        this.f19832b = dVar;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f19831a) {
            case 0:
                d dVar = (d) this.f19832b;
                d.f19835h.set(dVar, null);
                dVar.g(null);
                return Unit.f71706a;
            case 1:
                ((i) this.f19832b).c();
                return Unit.f71706a;
            case 2:
                y3.a aVar = (y3.a) obj3;
                long j11 = ((v1) this.f19832b).f88250f;
                long j12 = aVar.f96596a;
                int iJ = y3.a.j(j12);
                long j13 = aVar.f96596a;
                i1 i1VarH = ((q0) obj2).H(y3.a.a(j12, kotlin.ranges.a.e0((int) (j11 >> 32), iJ, y3.a.h(j13)), 0, kotlin.ranges.a.e0((int) (j11 & 4294967295L), y3.a.i(j13), y3.a.g(j13)), 0, 10));
                return ((t0) obj).y(i1VarH.f98081a, i1VarH.f98082b, b70.h.f17594a, new d1.k(i1VarH, 5));
            case 3:
                ((Function1) this.f19832b).invoke((Throwable) obj);
                return Unit.f71706a;
            default:
                return new b0(2, obj3, (v70.i) this.f19832b, (b80.g) obj);
        }
    }

    public /* synthetic */ b(Object obj, int i5) {
        this.f19831a = i5;
        this.f19832b = obj;
    }
}
