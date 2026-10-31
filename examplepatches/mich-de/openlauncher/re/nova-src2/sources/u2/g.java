package u2;

import b3.u2;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class g extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f90456j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(Ref.ObjectRef objectRef) {
        super(1);
        this.f90456j = objectRef;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        boolean z11;
        u2 u2Var = (u2) obj;
        if (u2Var.getNode().getIsAttached()) {
            this.f90456j.f71863a = u2Var;
            z11 = false;
        } else {
            z11 = true;
        }
        return Boolean.valueOf(z11);
    }
}
