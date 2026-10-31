package qx;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class u implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f84615a;

    public u(Ref.ObjectRef objectRef) {
        this.f84615a = objectRef;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        r rVar = (r) this.f84615a.f71863a;
        if (rVar != null) {
            rVar.a();
        }
        return Unit.f71706a;
    }
}
