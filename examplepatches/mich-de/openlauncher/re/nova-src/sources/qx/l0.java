package qx;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class l0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f84555a;

    public l0(Ref.ObjectRef objectRef) {
        this.f84555a = objectRef;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        r rVar = (r) this.f84555a.f71863a;
        if (rVar != null) {
            rVar.a();
        }
        return Unit.f71706a;
    }
}
