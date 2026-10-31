package c0;

import com.moloco.sdk.internal.services.C2962j;
import com.moloco.sdk.publisher.MediationInfo;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import p1.s2;

/* loaded from: classes.dex */
public final /* synthetic */ class a implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18685a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f18686b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f18687c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f18688d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f18689e;

    public /* synthetic */ a(Object obj, Object obj2, Object obj3, Object obj4, int i5) {
        this.f18685a = i5;
        this.f18686b = obj;
        this.f18687c = obj2;
        this.f18688d = obj3;
        this.f18689e = obj4;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f18685a) {
            case 0:
                e eVar = (e) this.f18686b;
                n nVar = (n) this.f18687c;
                Function1 function1 = (Function1) this.f18688d;
                Ref.BooleanRef booleanRef = (Ref.BooleanRef) this.f18689e;
                l lVar = (l) obj;
                n nVar2 = eVar.f18756c;
                s1.i(lVar, nVar2);
                s2 s2Var = (s2) lVar.f18861e;
                Object objA = e.a(eVar, s2Var.getValue());
                if (!Intrinsics.b(objA, s2Var.getValue())) {
                    ((s2) nVar2.f18878b).setValue(objA);
                    ((s2) nVar.f18878b).setValue(objA);
                    if (function1 != null) {
                        function1.invoke(eVar);
                    }
                    lVar.a();
                    booleanRef.f71859a = true;
                } else if (function1 != null) {
                    function1.invoke(eVar);
                }
                return Unit.f71706a;
            default:
                return com.moloco.sdk.internal.services.init.e.a((com.moloco.sdk.internal.services.init.e) this.f18686b, (com.moloco.sdk.internal.services.x) this.f18687c, (MediationInfo) this.f18688d, (C2962j) this.f18689e, (o50.n) obj);
        }
    }
}
