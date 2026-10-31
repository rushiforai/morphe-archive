package v2;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class e extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f91926j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(Ref.ObjectRef objectRef) {
        super(1);
        this.f91926j = objectRef;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        h hVar = (h) obj;
        Ref.ObjectRef objectRef = this.f91926j;
        Object obj2 = objectRef.f71863a;
        if (obj2 == null && hVar.f91933c) {
            objectRef.f71863a = hVar;
        } else if (obj2 != null) {
            hVar.getClass();
        }
        return Boolean.TRUE;
    }
}
