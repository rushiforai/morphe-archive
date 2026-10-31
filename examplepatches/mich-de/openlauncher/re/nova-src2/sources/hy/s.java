package hy;

import e0.f1;
import g0.l0;
import gy.o1;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Ref;
import p1.y2;

/* loaded from: classes4.dex */
public final class s implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.LongRef f61033a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f61034b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ float f61035c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ l0 f61036d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ y2 f61037e;

    public s(Ref.LongRef longRef, boolean z11, float f11, l0 l0Var, y2 y2Var) {
        this.f61033a = longRef;
        this.f61034b = z11;
        this.f61035c = f11;
        this.f61036d = l0Var;
        this.f61037e = y2Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // w70.n
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(i0.h hVar, Continuation continuation) {
        r rVar;
        s sVar;
        if (continuation instanceof r) {
            rVar = (r) continuation;
            int i5 = rVar.f61032w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rVar.f61032w = i5 - Integer.MIN_VALUE;
            } else {
                rVar = new r(this, continuation);
            }
        }
        Object obj = rVar.f61030u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = rVar.f61032w;
        if (i11 == 0) {
            ResultKt.b(obj);
            boolean z11 = hVar instanceof i0.b;
            l0 l0Var = this.f61036d;
            Ref.LongRef longRef = this.f61033a;
            if (z11) {
                if (!h2.b.b(longRef.f71862a, 9205357640488583168L)) {
                    float fIntBitsToFloat = Float.intBitsToFloat((int) (longRef.f71862a >> 32));
                    if (this.f61034b) {
                        fIntBitsToFloat = this.f61035c - fIntBitsToFloat;
                    }
                    l0Var.a(fIntBitsToFloat - ((Number) this.f61037e.getValue()).floatValue());
                    longRef.f71862a = 9205357640488583168L;
                }
            } else if (hVar instanceof i0.k) {
                longRef.f71862a = ((i0.k) hVar).f61089a;
            } else if (hVar instanceof i0.l) {
                f1 f1Var = f1.f49977b;
                o1 o1Var = new o1(hVar, this.f61034b, this.f61035c, this.f61037e, null, 1);
                rVar.f61029t = this;
                rVar.f61032w = 1;
                if (l0Var.b(f1Var, o1Var, rVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                sVar = this;
            } else if (hVar instanceof i0.j) {
                longRef.f71862a = 9205357640488583168L;
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        sVar = rVar.f61029t;
        ResultKt.b(obj);
        sVar.f61033a.f71862a = 9205357640488583168L;
        return Unit.f71706a;
    }
}
