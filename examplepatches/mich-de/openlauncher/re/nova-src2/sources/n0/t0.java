package n0;

import c0.s1;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import f1.s2;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public abstract class t0 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f77505a = 2500;

    /* renamed from: b, reason: collision with root package name */
    public static final float f77506b = TTAdConstant.STYLE_SIZE_RADIO_3_2;

    /* renamed from: c, reason: collision with root package name */
    public static final float f77507c = 50;

    /* JADX WARN: Removed duplicated region for block: B:36:0x00ca A[Catch: g -> 0x01c5, TryCatch #3 {g -> 0x01c5, blocks: (B:34:0x00c6, B:36:0x00ca, B:37:0x00cc, B:38:0x00cf, B:41:0x00e4, B:54:0x010e, B:58:0x013d, B:62:0x0145, B:39:0x00d8), top: B:105:0x00c6 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0208  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x020c  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0230  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:71:0x0195 -> B:18:0x0062). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(m0.v vVar, int i5, int i11, int i12, y3.c cVar, ContinuationImpl continuationImpl) {
        s0 s0Var;
        m0.v vVar2;
        int i13;
        int i14;
        float fMo102toPx0680j_4;
        float fMo102toPx0680j_42;
        float fMo102toPx0680j_43;
        Ref.BooleanRef booleanRef;
        Ref.ObjectRef objectRef;
        final int i15;
        final int i16;
        final float f11;
        final Ref.IntRef intRef;
        float f12;
        s0 s0Var2;
        float f13;
        int i17;
        int i18;
        m0.v vVar3;
        s0 s0Var3;
        c0.n nVarE;
        Float f14;
        boolean z11;
        s2 s2Var;
        m0.v vVar4;
        int i19;
        int i21;
        s0 s0Var4;
        int iM;
        float fMax;
        final m0.v vVar5;
        final int i22;
        final Ref.BooleanRef booleanRef2;
        final Ref.ObjectRef objectRef2;
        final float f15;
        float f16;
        int i23;
        float f17;
        int i24;
        if (continuationImpl instanceof s0) {
            s0Var = (s0) continuationImpl;
            int i25 = s0Var.F;
            if ((i25 & Integer.MIN_VALUE) != 0) {
                s0Var.F = i25 - Integer.MIN_VALUE;
            } else {
                s0Var = new s0(continuationImpl);
            }
        }
        Object obj = s0Var.E;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i26 = s0Var.F;
        float f18 = 0.0f;
        boolean z12 = true;
        if (i26 == 0) {
            ResultKt.b(obj);
            if (i5 < 0.0f) {
                j0.b.a("Index should be non-negative");
            }
            try {
                fMo102toPx0680j_4 = cVar.mo102toPx0680j_4(f77505a);
                fMo102toPx0680j_42 = cVar.mo102toPx0680j_4(f77506b);
                fMo102toPx0680j_43 = cVar.mo102toPx0680j_4(f77507c);
                booleanRef = new Ref.BooleanRef();
                booleanRef.f71859a = true;
                objectRef = new Ref.ObjectRef();
                objectRef.f71863a = c0.f.b(30, 0.0f, 0.0f);
            } catch (g e3) {
                e = e3;
                vVar2 = vVar;
                i13 = i11;
                i14 = i5;
            }
            if (c(vVar, i5)) {
                throw new g(vVar.b(i5), (c0.n) objectRef.f71863a);
            }
            int i27 = i5 > vVar.c() ? 1 : 0;
            Ref.IntRef intRef2 = new Ref.IntRef();
            intRef2.f71861a = 1;
            i15 = i11;
            i16 = i12;
            f11 = fMo102toPx0680j_42;
            intRef = intRef2;
            f12 = fMo102toPx0680j_4;
            s0Var2 = s0Var;
            f13 = fMo102toPx0680j_43;
            i17 = i5;
            i18 = i27;
            vVar3 = vVar;
            if (booleanRef.f71859a) {
            }
            return Unit.f71706a;
        }
        if (i26 != 1) {
            if (i26 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i21 = s0Var.f77485y;
            i19 = s0Var.f77484x;
            vVar4 = s0Var.f77480t;
            ResultKt.b(obj);
            vVar4.f(i19, i21);
            return Unit.f71706a;
        }
        i18 = s0Var.A;
        float f19 = s0Var.D;
        float f21 = s0Var.C;
        f12 = s0Var.B;
        int i28 = s0Var.f77486z;
        int i29 = s0Var.f77485y;
        int i31 = s0Var.f77484x;
        Ref.IntRef intRef3 = s0Var.f77483w;
        Ref.ObjectRef objectRef3 = s0Var.f77482v;
        Ref.BooleanRef booleanRef3 = s0Var.f77481u;
        m0.v vVar6 = s0Var.f77480t;
        try {
            ResultKt.b(obj);
            f17 = f21;
            vVar2 = vVar6;
            i15 = i29;
            s0Var2 = s0Var;
            f13 = f19;
            i24 = 1;
            i23 = i28;
            try {
                booleanRef = booleanRef3;
                objectRef = objectRef3;
                try {
                    intRef3.f71861a += i24;
                } catch (g e11) {
                    e = e11;
                    s0Var3 = s0Var2;
                    i14 = i31;
                    i13 = i15;
                }
            } catch (g e12) {
                e = e12;
                i14 = i17;
                s0Var4 = s0Var2;
                i13 = i15;
                vVar2 = vVar3;
            }
            vVar3 = vVar2;
            i17 = i31;
            intRef = intRef3;
            f11 = f17;
            f18 = 0.0f;
            i16 = i23;
            z12 = true;
        } catch (g e13) {
            e = e13;
            vVar2 = vVar6;
            i13 = i29;
            i14 = i31;
        }
        if (booleanRef.f71859a) {
            switch (vVar3.f75503a) {
                case 0:
                    iM = ((m0.b0) vVar3.f75505c).h().n;
                    break;
                default:
                    iM = ((p0.y) vVar3.f75505c).m();
                    break;
            }
            if (iM > 0) {
                try {
                    try {
                        try {
                            int iB = vVar3.b(i17) + i15;
                            if (Math.abs(iB) >= f12) {
                                fMax = i18 != 0 ? f12 : -f12;
                            } else {
                                try {
                                    fMax = Math.max(Math.abs(iB), f13);
                                    if (i18 == 0) {
                                        fMax = -fMax;
                                    }
                                } catch (g e14) {
                                    e = e14;
                                    i14 = i17;
                                    s0Var3 = s0Var2;
                                    i13 = i15;
                                    vVar2 = vVar3;
                                }
                            }
                            objectRef.f71863a = c0.f.e((c0.n) objectRef.f71863a, f18, f18, 30);
                            final Ref.FloatRef floatRef = new Ref.FloatRef();
                            c0.n nVar = (c0.n) objectRef.f71863a;
                            Float f22 = new Float(fMax);
                            boolean z13 = (((Number) ((c0.n) objectRef.f71863a).a()).floatValue() == f18 ? z12 : false) ^ z12;
                            final boolean z14 = i18 != 0 ? z12 : false;
                            Function1 function1 = new Function1() { // from class: n0.r0
                                /* JADX WARN: Removed duplicated region for block: B:19:0x005c  */
                                /* JADX WARN: Removed duplicated region for block: B:39:0x00ba  */
                                /* JADX WARN: Removed duplicated region for block: B:9:0x002d A[PHI: r2
                                  0x002d: PHI (r2v22 float) = (r2v8 float), (r2v27 float) binds: [B:11:0x003f, B:7:0x002a] A[DONT_GENERATE, DONT_INLINE]] */
                                @Override // kotlin.jvm.functions.Function1
                                /*
                                    Code decompiled incorrectly, please refer to instructions dump.
                                */
                                public final Object invoke(Object obj2) {
                                    float fFloatValue;
                                    float f23;
                                    float fA;
                                    c0.l lVar = (c0.l) obj2;
                                    m0.v vVar7 = vVar5;
                                    int i32 = i22;
                                    boolean zC = t0.c(vVar7, i32);
                                    Ref.BooleanRef booleanRef4 = booleanRef2;
                                    boolean z15 = z14;
                                    int i33 = i15;
                                    if (!zC) {
                                        float f24 = f15;
                                        if (f24 > 0.0f) {
                                            fFloatValue = ((Number) ((p1.s2) lVar.f18861e).getValue()).floatValue();
                                            if (fFloatValue <= f24) {
                                                f24 = fFloatValue;
                                            }
                                            Ref.FloatRef floatRef2 = floatRef;
                                            f23 = f24 - floatRef2.f71860a;
                                            fA = vVar7.a(f23);
                                            if (!t0.c(vVar7, i32) && !t0.b(z15, vVar7, i32, i33)) {
                                                if (f23 == fA) {
                                                    lVar.a();
                                                    booleanRef4.f71859a = false;
                                                    return Unit.f71706a;
                                                }
                                                floatRef2.f71860a += f23;
                                                float f25 = f11;
                                                if (z15) {
                                                    if (((Number) ((p1.s2) lVar.f18861e).getValue()).floatValue() > f25) {
                                                        lVar.a();
                                                    }
                                                } else if (((Number) ((p1.s2) lVar.f18861e).getValue()).floatValue() < (-f25)) {
                                                    lVar.a();
                                                }
                                                Ref.IntRef intRef4 = intRef;
                                                int i34 = i16;
                                                if (z15) {
                                                    if (intRef4.f71861a >= 2 && i32 - vVar7.e() > i34) {
                                                        vVar7.f(i32 - i34, 0);
                                                    }
                                                } else if (intRef4.f71861a >= 2 && vVar7.c() - i32 > i34) {
                                                    vVar7.f(i34 + i32, 0);
                                                }
                                            }
                                        } else {
                                            fFloatValue = ((Number) ((p1.s2) lVar.f18861e).getValue()).floatValue();
                                            if (fFloatValue >= f24) {
                                            }
                                            Ref.FloatRef floatRef22 = floatRef;
                                            f23 = f24 - floatRef22.f71860a;
                                            fA = vVar7.a(f23);
                                            if (!t0.c(vVar7, i32)) {
                                                if (f23 == fA) {
                                                }
                                            }
                                        }
                                    }
                                    if (!t0.b(z15, vVar7, i32, i33)) {
                                        if (t0.c(vVar7, i32)) {
                                            throw new g(vVar7.b(i32), (c0.n) objectRef2.f71863a);
                                        }
                                        return Unit.f71706a;
                                    }
                                    vVar7.f(i32, i33);
                                    booleanRef4.f71859a = false;
                                    lVar.a();
                                    return Unit.f71706a;
                                }
                            };
                            s0Var2.f77480t = vVar2;
                            s0Var2.f77481u = booleanRef3;
                            s0Var2.f77482v = objectRef3;
                            s0Var2.f77483w = intRef3;
                            s0Var2.f77484x = i14;
                            s0Var2.f77485y = i13;
                            s0Var2.f77486z = i23;
                            s0Var2.B = f12;
                            s0Var2.C = f16;
                            s0Var2.D = f13;
                            s0Var2.A = i18;
                            f17 = f16;
                            i24 = 1;
                            s0Var2.F = 1;
                            if (s1.f(nVar, f22, null, z13, function1, s0Var4, 2) != coroutineSingletons) {
                                i31 = i14;
                                i15 = i13;
                                s0Var2 = s0Var4;
                                booleanRef = booleanRef3;
                                objectRef = objectRef3;
                                intRef3.f71861a += i24;
                                vVar3 = vVar2;
                                i17 = i31;
                                intRef = intRef3;
                                f11 = f17;
                                f18 = 0.0f;
                                i16 = i23;
                                z12 = true;
                                if (booleanRef.f71859a) {
                                }
                            }
                        } catch (g e15) {
                            e = e15;
                            s0Var4 = s0Var2;
                            vVar2 = vVar5;
                            i14 = i22;
                            i13 = i15;
                        }
                        vVar5 = vVar3;
                        i22 = i17;
                        booleanRef2 = booleanRef;
                        objectRef2 = objectRef;
                        f15 = fMax;
                    } catch (g e16) {
                        e = e16;
                        s0Var4 = s0Var2;
                    }
                    vVar2 = vVar5;
                    i14 = i22;
                    booleanRef3 = booleanRef2;
                    f16 = f11;
                    intRef3 = intRef;
                    i23 = i16;
                    i13 = i15;
                    objectRef3 = objectRef2;
                } catch (g e17) {
                    e = e17;
                    s0Var3 = s0Var4;
                    nVarE = c0.f.e(e.f77421b, 0.0f, 0.0f, 30);
                    float f23 = e.f77420a + i13;
                    Ref.FloatRef floatRef2 = new Ref.FloatRef();
                    f14 = new Float(f23);
                    if (((Number) nVarE.a()).floatValue() != 0.0f) {
                    }
                    s2Var = new s2(f23, floatRef2, vVar2, 3);
                    s0Var3.f77480t = vVar2;
                    s0Var3.f77481u = null;
                    s0Var3.f77482v = null;
                    s0Var3.f77483w = null;
                    s0Var3.f77484x = i14;
                    s0Var3.f77485y = i13;
                    s0Var3.F = 2;
                    if (s1.f(nVarE, f14, null, !z11, s2Var, s0Var3, 2) != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
                s0Var4 = s0Var2;
                return coroutineSingletons;
            }
        }
        return Unit.f71706a;
        s0Var3 = s0Var;
        nVarE = c0.f.e(e.f77421b, 0.0f, 0.0f, 30);
        float f232 = e.f77420a + i13;
        Ref.FloatRef floatRef22 = new Ref.FloatRef();
        f14 = new Float(f232);
        z11 = ((Number) nVarE.a()).floatValue() != 0.0f;
        s2Var = new s2(f232, floatRef22, vVar2, 3);
        s0Var3.f77480t = vVar2;
        s0Var3.f77481u = null;
        s0Var3.f77482v = null;
        s0Var3.f77483w = null;
        s0Var3.f77484x = i14;
        s0Var3.f77485y = i13;
        s0Var3.F = 2;
        if (s1.f(nVarE, f14, null, !z11, s2Var, s0Var3, 2) != coroutineSingletons) {
            vVar4 = vVar2;
            i19 = i14;
            i21 = i13;
            vVar4.f(i19, i21);
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }

    public static final boolean b(boolean z11, m0.v vVar, int i5, int i11) {
        if (z11) {
            if (vVar.c() > i5) {
                return true;
            }
            return vVar.c() == i5 && vVar.d() > i11;
        }
        if (vVar.c() < i5) {
            return true;
        }
        return vVar.c() == i5 && vVar.d() < i11;
    }

    public static final boolean c(m0.v vVar, int i5) {
        return i5 <= vVar.e() && vVar.c() <= i5;
    }
}
