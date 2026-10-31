package ads_mobile_sdk;

import b.r5;
import c80.d;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes2.dex */
public final class ts3 extends c3.b implements r5 {

    /* renamed from: c, reason: collision with root package name */
    public final d f10059c;

    /* renamed from: d, reason: collision with root package name */
    public Boolean f10060d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ts3(t70.j0 uiScope, Map listeners) {
        super(uiScope, listeners);
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(listeners, "listeners");
        this.f10059c = new d();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.r5
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(qo3 qo3Var, Continuation continuation) {
        qs3 qs3Var;
        d dVar;
        ts3 ts3Var;
        if (continuation instanceof qs3) {
            qs3Var = (qs3) continuation;
            int i5 = qs3Var.f8793f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qs3Var.f8793f = i5 - Integer.MIN_VALUE;
            } else {
                qs3Var = new qs3(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = qs3Var.f8791d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qs3Var.f8793f;
        if (i11 == 0) {
            ResultKt.b(obj);
            qs3Var.f8788a = this;
            qs3Var.f8789b = qo3Var;
            dVar = this.f10059c;
            qs3Var.f8790c = dVar;
            qs3Var.f8793f = 1;
            if (dVar.e(qs3Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            ts3Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = qs3Var.f8790c;
            qo3 qo3Var2 = qs3Var.f8789b;
            ts3Var = qs3Var.f8788a;
            ResultKt.b(obj);
            dVar = dVar2;
            qo3Var = qo3Var2;
        }
        Continuation continuation2 = null;
        try {
            boolean z11 = qo3Var.f8763b;
            if (z11 && !Intrinsics.b(ts3Var.f10060d, Boolean.TRUE)) {
                for (Map.Entry entry : ((Map) ts3Var.f19223b).entrySet()) {
                    String str = (String) entry.getKey();
                    Object value = entry.getValue();
                    t70.j0 j0Var = (t70.j0) ts3Var.f19222a;
                    r10.r rVar = new r10.r(str, value, continuation2, 4);
                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, "<this>");
                    Intrinsics.g(context, "context");
                    m0.t(j0Var, context, null, new ar.a(rVar, null), 2);
                }
            } else if (!z11 && !Intrinsics.b(ts3Var.f10060d, Boolean.FALSE)) {
                for (Map.Entry entry2 : ((Map) ts3Var.f19223b).entrySet()) {
                    String str2 = (String) entry2.getKey();
                    Object value2 = entry2.getValue();
                    t70.j0 j0Var2 = (t70.j0) ts3Var.f19222a;
                    r10.r rVar2 = new r10.r(str2, value2, continuation2, 6);
                    EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var2, "<this>");
                    Intrinsics.g(context2, "context");
                    m0.t(j0Var2, context2, null, new ar.a(rVar2, null), 2);
                }
            }
            ts3Var.f10060d = Boolean.valueOf(z11);
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return unit;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }
}
