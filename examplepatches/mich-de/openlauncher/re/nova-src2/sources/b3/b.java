package b3;

import java.util.HashMap;
import java.util.Map;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public final z2.i1 f17151a;

    /* renamed from: c, reason: collision with root package name */
    public boolean f17153c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f17154d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f17155e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f17156f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f17157g;

    /* renamed from: h, reason: collision with root package name */
    public c f17158h;

    /* renamed from: b, reason: collision with root package name */
    public boolean f17152b = true;

    /* renamed from: i, reason: collision with root package name */
    public final HashMap f17159i = new HashMap();

    /* JADX WARN: Multi-variable type inference failed */
    public b(c cVar) {
        this.f17151a = (z2.i1) cVar;
    }

    /* JADX WARN: Type inference failed for: r12v5, types: [kotlin.jvm.functions.Function2, kotlin.jvm.internal.FunctionReferenceImpl] */
    /* JADX WARN: Type inference failed for: r3v3, types: [b3.c, z2.i1] */
    public static final void a(b bVar, z2.n nVar, int i5, t1 t1Var) {
        long jB;
        HashMap map = bVar.f17159i;
        float f11 = i5;
        long jFloatToRawIntBits = Float.floatToRawIntBits(f11) << 32;
        long jFloatToRawIntBits2 = Float.floatToRawIntBits(f11) & 4294967295L;
        loop0: while (true) {
            jB = jFloatToRawIntBits | jFloatToRawIntBits2;
            do {
                jB = bVar.b(t1Var, jB);
                t1Var = t1Var.f17360q;
                Intrinsics.d(t1Var);
                if (t1Var.equals(bVar.f17151a.B())) {
                    break loop0;
                }
            } while (!bVar.c(t1Var).containsKey(nVar));
            float fD = bVar.d(t1Var, nVar);
            long jFloatToRawIntBits3 = Float.floatToRawIntBits(fD);
            long jFloatToRawIntBits4 = Float.floatToRawIntBits(fD);
            jFloatToRawIntBits = jFloatToRawIntBits3 << 32;
            jFloatToRawIntBits2 = jFloatToRawIntBits4 & 4294967295L;
        }
        int iRound = Math.round(nVar instanceof z2.n ? Float.intBitsToFloat((int) (jB & 4294967295L)) : Float.intBitsToFloat((int) (jB >> 32)));
        if (map.containsKey(nVar)) {
            int iIntValue = ((Number) MapsKt.g0(nVar, map)).intValue();
            z2.n nVar2 = z2.c.f98028a;
            iRound = ((Number) nVar.f98106a.invoke(Integer.valueOf(iIntValue), Integer.valueOf(iRound))).intValue();
        }
        map.put(nVar, Integer.valueOf(iRound));
    }

    public abstract long b(t1 t1Var, long j11);

    public abstract Map c(t1 t1Var);

    public abstract int d(t1 t1Var, z2.n nVar);

    public final boolean e() {
        return this.f17153c || this.f17155e || this.f17156f || this.f17157g;
    }

    public final boolean f() {
        i();
        return this.f17158h != null;
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [b3.c, z2.i1] */
    public final void g() {
        this.f17152b = true;
        ?? r02 = this.f17151a;
        c cVarF = r02.f();
        if (cVarF == null) {
            return;
        }
        if (this.f17153c) {
            cVarF.N();
        } else if (this.f17155e || this.f17154d) {
            cVarF.requestLayout();
        }
        if (this.f17156f) {
            r02.N();
        }
        if (this.f17157g) {
            r02.requestLayout();
        }
        cVarF.a().g();
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [b3.c, z2.i1] */
    public final void h() {
        HashMap map = this.f17159i;
        map.clear();
        a aVar = new a(this);
        ?? r22 = this.f17151a;
        r22.o(aVar);
        map.putAll(c(r22.B()));
        this.f17152b = false;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0023  */
    /* JADX WARN: Type inference failed for: r1v0, types: [b3.c, z2.i1] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void i() {
        b bVarA;
        b bVarA2;
        boolean zE = e();
        ?? r12 = this.f17151a;
        c cVar = r12;
        if (!zE) {
            c cVarF = r12.f();
            if (cVarF == null) {
                return;
            }
            c cVar2 = cVarF.a().f17158h;
            if (cVar2 != null) {
                boolean zE2 = cVar2.a().e();
                cVar = cVar2;
                if (!zE2) {
                    c cVar3 = this.f17158h;
                    if (cVar3 == null || cVar3.a().e()) {
                        return;
                    }
                    c cVarF2 = cVar3.f();
                    if (cVarF2 != null && (bVarA2 = cVarF2.a()) != null) {
                        bVarA2.i();
                    }
                    c cVarF3 = cVar3.f();
                    cVar = (cVarF3 == null || (bVarA = cVarF3.a()) == null) ? null : bVarA.f17158h;
                }
            }
        }
        this.f17158h = cVar;
    }
}
