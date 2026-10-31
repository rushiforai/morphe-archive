package c3;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class i3 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f19326j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i3(Ref.ObjectRef objectRef) {
        super(0);
        this.f19326j = objectRef;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        ((Function0) this.f19326j.f71863a).invoke();
        return Unit.f71706a;
    }
}
