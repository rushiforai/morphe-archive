package ads_mobile_sdk;

import b.m9;
import b0.b0;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import t70.k0;
import t70.m0;

/* loaded from: classes2.dex */
public final class y2 extends c3.b implements b.va, m9 {

    /* renamed from: c, reason: collision with root package name */
    public final z1 f11921c;

    /* renamed from: d, reason: collision with root package name */
    public final AtomicBoolean f11922d;

    /* renamed from: e, reason: collision with root package name */
    public final AtomicBoolean f11923e;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicBoolean f11924f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y2(t70.j0 backgroundScope, Map listeners, z1 adConfiguration) {
        super(backgroundScope, listeners);
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(listeners, "listeners");
        Intrinsics.g(adConfiguration, "adConfiguration");
        this.f11921c = adConfiguration;
        this.f11922d = new AtomicBoolean(false);
        this.f11923e = new AtomicBoolean(false);
        this.f11924f = new AtomicBoolean(false);
        new AtomicBoolean(false);
    }

    @Override // b.va
    public final Object a(Continuation continuation) {
        if (!this.f11924f.getAndSet(true)) {
            for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
                String str = (String) entry.getKey();
                Object value = entry.getValue();
                t70.j0 j0Var = (t70.j0) this.f19222a;
                i2 i2Var = new i2(str, value, null, 3);
                EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                Intrinsics.g(j0Var, "<this>");
                Intrinsics.g(context, "context");
                m0.t(j0Var, context, null, new ar.a(i2Var, null), 2);
            }
        }
        return Unit.f71706a;
    }

    @Override // b.m9
    public final Unit d(Continuation continuation) {
        Unit unitO = o(continuation);
        return unitO == CoroutineSingletons.f71806a ? unitO : Unit.f71706a;
    }

    @Override // b.va
    public final Unit e() {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            i2 i2Var = new i2(str, value, null, 11);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(i2Var, null), 2);
        }
        return Unit.f71706a;
    }

    @Override // b.va
    public final Object g(Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            i2 i2Var = new i2(str, value, null, 5);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(i2Var, null), 2);
        }
        return Unit.f71706a;
    }

    @Override // b.m9
    public final Unit h(Continuation continuation) {
        Object objG = g(continuation);
        if (objG != CoroutineSingletons.f71806a) {
            objG = Unit.f71706a;
        }
        return (Unit) objG;
    }

    @Override // b.va
    public final Object i(Continuation continuation) {
        Object objD = k0.d(new u2(this, null, 0), continuation);
        return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
    }

    @Override // b.va
    public final Object j(Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            i2 i2Var = new i2(str, value, null, 13);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(i2Var, null), 2);
        }
        return Unit.f71706a;
    }

    @Override // b.va
    public final Object n(Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            i2 i2Var = new i2(str, value, null, 0);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(i2Var, null), 2);
        }
        return Unit.f71706a;
    }

    @Override // b.va
    public final Unit o(Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            i2 i2Var = new i2(str, value, null, 14);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(i2Var, null), 2);
        }
        return Unit.f71706a;
    }

    @Override // b.va
    public final Object q(Continuation continuation) {
        Unit unitA;
        if (this.f11922d.getAndSet(true)) {
            return Unit.f71706a;
        }
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            i2 i2Var = new i2(str, value, null, 8);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(i2Var, null), 2);
        }
        o9 o9Var = this.f11921c.f12391m;
        return o9Var == null ? Unit.f71706a : (o9Var.f7803a == q9.f8527g && !this.f11923e.getAndSet(true) && (unitA = a(new ni.m(o9Var.f7805c, o9Var.f7804b, o9Var.f7806d), continuation)) == CoroutineSingletons.f71806a) ? unitA : Unit.f71706a;
    }

    @Override // b.va
    public final Unit e(Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            r10.r rVar = new r10.r(str, value, null, 5);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(rVar, null), 2);
        }
        return Unit.f71706a;
    }

    @Override // b.va
    public final Object a(ni.s sVar, Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            ni.s sVar2 = sVar;
            b0 b0Var = new b0(str, value, (Continuation) null, sVar2, 11);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(b0Var, null), 2);
            sVar = sVar2;
        }
        return Unit.f71706a;
    }

    @Override // b.va
    public final Unit a(ni.m mVar, Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            ni.m mVar2 = mVar;
            b0 b0Var = new b0(str, value, (Continuation) null, mVar2, 14);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(b0Var, null), 2);
            mVar = mVar2;
        }
        return Unit.f71706a;
    }

    public final Unit a(ni.m mVar, dx2 dx2Var) {
        if (this.f11923e.getAndSet(true)) {
            return Unit.f71706a;
        }
        Unit unitA = a(mVar, (Continuation) dx2Var);
        return unitA == CoroutineSingletons.f71806a ? unitA : Unit.f71706a;
    }

    @Override // b.va
    public final Unit a(String str, String str2, Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str3 = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            String str4 = str;
            String str5 = str2;
            b00.q qVar = new b00.q(str3, value, (Continuation) null, str4, str5);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(qVar, null), 2);
            str = str4;
            str2 = str5;
        }
        return Unit.f71706a;
    }

    @Override // b.va
    public final Unit a(String str, Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str2 = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            String str3 = str;
            androidx.room.q qVar = new androidx.room.q(str2, value, (Continuation) null, str3, 17);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(qVar, null), 2);
            str = str3;
        }
        return Unit.f71706a;
    }
}
