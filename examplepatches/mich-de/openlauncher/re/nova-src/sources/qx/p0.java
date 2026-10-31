package qx;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class p0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f84575a;

    public p0(Ref.ObjectRef objectRef) {
        this.f84575a = objectRef;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        r rVar = (r) this.f84575a.f71863a;
        if (rVar != null) {
            rVar.a();
        }
        return Unit.f71706a;
    }
}
