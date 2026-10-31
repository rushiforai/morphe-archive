package c3;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class u extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f19427j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(Ref.ObjectRef objectRef) {
        super(1);
        this.f19427j = objectRef;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        this.f19427j.f71863a = (g2.z) obj;
        return Boolean.TRUE;
    }
}
