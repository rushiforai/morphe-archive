package g0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import kotlin.math.MathKt;

/* loaded from: classes2.dex */
public final class y0 extends SuspendLambda implements Function2 {
    public final /* synthetic */ Ref.ObjectRef A;
    public final /* synthetic */ float B;
    public final /* synthetic */ c1 C;
    public final /* synthetic */ float D;
    public final /* synthetic */ h2 E;

    /* renamed from: t, reason: collision with root package name */
    public Ref.BooleanRef f56767t;

    /* renamed from: u, reason: collision with root package name */
    public Ref.BooleanRef f56768u;

    /* renamed from: v, reason: collision with root package name */
    public int f56769v;

    /* renamed from: w, reason: collision with root package name */
    public int f56770w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f56771x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ Ref.FloatRef f56772y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f56773z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y0(Ref.FloatRef floatRef, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, float f11, c1 c1Var, float f12, h2 h2Var, Continuation continuation) {
        super(2, continuation);
        this.f56772y = floatRef;
        this.f56773z = objectRef;
        this.A = objectRef2;
        this.B = f11;
        this.C = c1Var;
        this.D = f12;
        this.E = h2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        y0 y0Var = new y0(this.f56772y, this.f56773z, this.A, this.B, this.C, this.D, this.E, continuation);
        y0Var.f56771x = obj;
        return y0Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((y0) create((f2) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0168  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0198  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x01cb  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x0187 -> B:36:0x0188). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:38:0x0198 -> B:13:0x006f). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        f2 f2Var;
        Ref.BooleanRef booleanRef;
        Ref.FloatRef floatRef;
        Ref.ObjectRef objectRef;
        int i5;
        f2 f2Var2;
        int i11;
        Ref.ObjectRef objectRef2;
        int i12;
        char c11;
        Ref.ObjectRef objectRef3;
        y0 y0Var = this;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = y0Var.f56770w;
        Ref.ObjectRef objectRef4 = y0Var.A;
        c1 c1Var = y0Var.C;
        Ref.FloatRef floatRef2 = y0Var.f56772y;
        char c12 = 3;
        int i14 = 2;
        int i15 = 1;
        Ref.ObjectRef objectRef5 = y0Var.f56773z;
        if (i13 == 0) {
            ResultKt.b(obj);
            f2Var = (f2) y0Var.f56771x;
            Ref.BooleanRef booleanRef2 = new Ref.BooleanRef();
            booleanRef2.f71859a = true;
            booleanRef = booleanRef2;
            if (!booleanRef.f71859a) {
            }
        } else if (i13 == 1) {
            Ref.BooleanRef booleanRef3 = y0Var.f56768u;
            Ref.BooleanRef booleanRef4 = y0Var.f56767t;
            f2Var2 = (f2) y0Var.f56771x;
            ResultKt.b(obj);
            i5 = 1;
            objectRef3 = objectRef5;
            c11 = 3;
            booleanRef = booleanRef4;
            i11 = 2;
            booleanRef3.f71859a = ((Boolean) obj).booleanValue();
            y0Var = this;
            objectRef5 = objectRef3;
            i14 = i11;
            f2Var = f2Var2;
            i15 = i5;
            c12 = c11;
            if (!booleanRef.f71859a) {
            }
        } else if (i13 == 2) {
            i12 = y0Var.f56769v;
            Ref.BooleanRef booleanRef5 = y0Var.f56767t;
            f2Var2 = (f2) y0Var.f56771x;
            ResultKt.b(obj);
            objectRef = objectRef4;
            floatRef = floatRef2;
            i5 = 1;
            objectRef2 = objectRef5;
            booleanRef = booleanRef5;
            i11 = 2;
            if (booleanRef.f71859a) {
            }
        } else {
            if (i13 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Ref.BooleanRef booleanRef6 = y0Var.f56768u;
            Ref.BooleanRef booleanRef7 = y0Var.f56767t;
            f2Var2 = (f2) y0Var.f56771x;
            ResultKt.b(obj);
            i5 = 1;
            objectRef3 = objectRef5;
            c11 = 3;
            booleanRef = booleanRef7;
            i11 = 2;
            Object objB = obj;
            booleanRef6.f71859a = ((Boolean) objB).booleanValue();
            objectRef5 = objectRef3;
            i14 = i11;
            f2Var = f2Var2;
            i15 = i5;
            c12 = c11;
            if (!booleanRef.f71859a) {
                booleanRef.f71859a = false;
                float fFloatValue = floatRef2.f71860a - ((Number) ((p1.s2) ((c0.n) objectRef5.f71863a).f18878b).getValue()).floatValue();
                if (!((w0) objectRef4.f71863a).f56743c) {
                    float fAbs = Math.abs(fFloatValue);
                    float f11 = y0Var.B;
                    if (fAbs < f11) {
                        f2 f2Var3 = f2Var;
                        i11 = i14;
                        i5 = i15;
                        objectRef3 = objectRef5;
                        c11 = c12;
                        Ref.BooleanRef booleanRef8 = booleanRef;
                        c1Var.c(f2Var3, fFloatValue);
                        y0Var.f56771x = f2Var3;
                        y0Var.f56767t = booleanRef8;
                        y0Var.f56768u = booleanRef8;
                        y0Var.f56770w = i5;
                        Object objB2 = c1.b(c1Var, objectRef4, floatRef2, y0Var.E, objectRef3, 50L, y0Var);
                        if (objB2 != coroutineSingletons) {
                            f2Var2 = f2Var3;
                            booleanRef = booleanRef8;
                            booleanRef8.f71859a = ((Boolean) objB2).booleanValue();
                            y0Var = this;
                            objectRef5 = objectRef3;
                            i14 = i11;
                            f2Var = f2Var2;
                            i15 = i5;
                            c12 = c11;
                        }
                    } else {
                        float fSignum = Math.signum(fFloatValue) * f11;
                        c1Var.c(f2Var, fSignum);
                        c0.n nVar = (c0.n) objectRef5.f71863a;
                        c0.n nVarE = c0.f.e(nVar, ((Number) ((p1.s2) nVar.f18878b).getValue()).floatValue() + fSignum, 0.0f, 30);
                        objectRef5.f71863a = nVarE;
                        int iB = MathKt.b(Math.abs(floatRef2.f71860a - ((Number) ((p1.s2) nVarE.f18878b).getValue()).floatValue()) / y0Var.D);
                        if (iB > 100) {
                            iB = 100;
                        }
                        c0.n nVar2 = (c0.n) objectRef5.f71863a;
                        float f12 = floatRef2.f71860a;
                        int i16 = iB;
                        Ref.ObjectRef objectRef6 = objectRef4;
                        Ref.FloatRef floatRef3 = floatRef2;
                        c1.a aVar = new c1.a(c1Var, objectRef6, floatRef3, y0Var.E, booleanRef, 5);
                        objectRef = objectRef6;
                        floatRef = floatRef3;
                        Ref.BooleanRef booleanRef9 = booleanRef;
                        y0Var.f56771x = f2Var;
                        y0Var.f56767t = booleanRef9;
                        y0Var.f56768u = null;
                        y0Var.f56769v = i16;
                        y0Var.f56770w = i14;
                        c1 c1Var2 = c1Var;
                        Ref.FloatRef floatRef4 = new Ref.FloatRef();
                        floatRef4.f71860a = ((Number) ((p1.s2) nVar2.f18878b).getValue()).floatValue();
                        Float f13 = new Float(f12);
                        c0.h2 h2VarI = c0.f.i(i16, 0, c0.b0.f18713d, i14);
                        f2 f2Var4 = f2Var;
                        b10.r rVar = new b10.r(floatRef4, c1Var2, f2Var4, aVar, 9);
                        c1Var = c1Var2;
                        i5 = 1;
                        i11 = i14;
                        objectRef2 = objectRef5;
                        Object objE = c0.s1.e(nVar2, f13, h2VarI, true, rVar, y0Var);
                        if (objE != CoroutineSingletons.f71806a) {
                            objE = Unit.f71706a;
                        }
                        if (objE != coroutineSingletons) {
                            i12 = i16;
                            f2Var2 = f2Var4;
                            booleanRef = booleanRef9;
                            if (booleanRef.f71859a) {
                                y0Var.f56771x = f2Var2;
                                y0Var.f56767t = booleanRef;
                                y0Var.f56768u = booleanRef;
                                y0Var.f56770w = 3;
                                c11 = 3;
                                objectRef3 = objectRef2;
                                objectRef4 = objectRef;
                                floatRef2 = floatRef;
                                objB = c1.b(c1Var, objectRef4, floatRef2, y0Var.E, objectRef3, 50 - i12, y0Var);
                                if (objB != coroutineSingletons) {
                                    booleanRef6 = booleanRef;
                                    booleanRef6.f71859a = ((Boolean) objB).booleanValue();
                                    objectRef5 = objectRef3;
                                    i14 = i11;
                                    f2Var = f2Var2;
                                    i15 = i5;
                                    c12 = c11;
                                }
                            } else {
                                objectRef5 = objectRef2;
                                i14 = i11;
                                f2Var = f2Var2;
                                i15 = i5;
                                c12 = 3;
                                objectRef4 = objectRef;
                                floatRef2 = floatRef;
                            }
                        }
                    }
                    return coroutineSingletons;
                }
                if (!booleanRef.f71859a) {
                    return Unit.f71706a;
                }
            }
        }
    }
}
