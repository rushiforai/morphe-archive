package bw;

import androidx.activity.result.IntentSenderRequest;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import w70.i2;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18654a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f18655b;

    public /* synthetic */ d(e eVar, int i5) {
        this.f18654a = i5;
        this.f18655b = eVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f18654a) {
            case 0:
                Throwable e3 = (Throwable) obj;
                Intrinsics.g(e3, "e");
                this.f18655b.f18657b.d(e3);
                return Unit.f71706a;
            case 1:
                IntentSenderRequest intentSenderRequest = (IntentSenderRequest) obj;
                Intrinsics.g(intentSenderRequest, "intentSenderRequest");
                e eVar = this.f18655b;
                eVar.f18657b.b();
                h.k kVar = eVar.f18662g;
                if (kVar != null) {
                    kVar.a(intentSenderRequest, eVar.f18656a);
                    return Unit.f71706a;
                }
                Intrinsics.m("activityLauncher");
                throw null;
            case 2:
                Throwable e11 = (Throwable) obj;
                Intrinsics.g(e11, "e");
                e eVar2 = this.f18655b;
                i2 i2Var = eVar2.f18660e;
                Boolean bool = Boolean.FALSE;
                i2Var.getClass();
                i2Var.k(null, bool);
                eVar2.f18657b.c(e11);
                return Unit.f71706a;
            default:
                IntentSenderRequest it = (IntentSenderRequest) obj;
                Intrinsics.g(it, "it");
                e eVar3 = this.f18655b;
                i2 i2Var2 = eVar3.f18660e;
                Boolean bool2 = Boolean.TRUE;
                i2Var2.getClass();
                i2Var2.k(null, bool2);
                eVar3.f18657b.e();
                return Unit.f71706a;
        }
    }
}
