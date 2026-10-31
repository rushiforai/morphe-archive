package t00;

import g0.m1;
import java.util.LinkedHashMap;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;
import p1.e1;
import p1.s2;
import t70.j0;
import t70.m0;

/* loaded from: classes4.dex */
public final class a0 extends ah.a {

    /* renamed from: h, reason: collision with root package name */
    public static final ab.c0 f88319h = new ab.c0(7, new s(2), new s10.i(15));

    /* renamed from: e, reason: collision with root package name */
    public Integer f88320e;

    /* renamed from: f, reason: collision with root package name */
    public final m0.b0 f88321f;

    /* renamed from: g, reason: collision with root package name */
    public Pair f88322g;

    public a0(int i5, int i11, String str, boolean z11) {
        super(str, z11);
        this.f88321f = new m0.b0(i5, i11);
        this.f88322g = new Pair(Integer.valueOf(i5), Integer.valueOf(i11));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // ah.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object i(ContinuationImpl continuationImpl) {
        z zVar;
        a0 a0Var;
        a0 a0Var2;
        if (continuationImpl instanceof z) {
            zVar = (z) continuationImpl;
            int i5 = zVar.f88430w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zVar.f88430w = i5 - Integer.MIN_VALUE;
            } else {
                zVar = new z(this, continuationImpl);
            }
        }
        Object obj = zVar.f88428u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zVar.f88430w;
        if (i11 == 0) {
            ResultKt.b(obj);
            ((s2) ((e1) this.f12803a)).setValue(null);
            zVar.f88427t = this;
            zVar.f88430w = 1;
            if (m1.c(this.f88321f, zVar) != coroutineSingletons) {
                a0Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            a0Var2 = zVar.f88427t;
            ResultKt.b(obj);
            ((s2) ((e1) a0Var2.f12805c)).setValue(Boolean.FALSE);
            return Unit.f71706a;
        }
        a0Var = zVar.f88427t;
        ResultKt.b(obj);
        m0.b0 b0Var = a0Var.f88321f;
        int iIntValue = ((Number) a0Var.f88322g.f71683a).intValue();
        int iIntValue2 = ((Number) a0Var.f88322g.f71684b).intValue();
        zVar.f88427t = a0Var;
        zVar.f88430w = 2;
        if (b0Var.f(iIntValue, iIntValue2, zVar) != coroutineSingletons) {
            a0Var2 = a0Var;
            ((s2) ((e1) a0Var2.f12805c)).setValue(Boolean.FALSE);
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }

    @Override // ah.a
    public final Object j(String str, Continuation continuation) {
        ((s2) ((e1) this.f12805c)).setValue(Boolean.TRUE);
        ((s2) ((e1) this.f12803a)).setValue(str);
        m0.b0 b0Var = this.f88321f;
        this.f88322g = new Pair(new Integer(b0Var.f75397e.c()), new Integer(b0Var.f75397e.d()));
        Integer num = (Integer) ((LinkedHashMap) this.f12806d).get(str);
        Object objF = b0Var.f(num != null ? num.intValue() : 0, 0, (SuspendLambda) continuation);
        return objF == CoroutineSingletons.f71806a ? objF : Unit.f71706a;
    }

    public final void n(j0 j0Var, int i5) {
        LinkedHashMap linkedHashMap = (LinkedHashMap) this.f12806d;
        boolean zContainsKey = linkedHashMap.containsKey("COLORS");
        linkedHashMap.put("COLORS", Integer.valueOf(i5));
        if (zContainsKey || !Intrinsics.b(f(), "COLORS")) {
            return;
        }
        m0.t(j0Var, null, null, new io.h(this, i5, null, 5), 3);
    }
}
