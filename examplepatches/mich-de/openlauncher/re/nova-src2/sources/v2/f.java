package v2;

import b3.t2;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class f extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f91928j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(Ref.BooleanRef booleanRef) {
        super(1);
        this.f91928j = booleanRef;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        if (!((h) obj).f91933c) {
            return t2.f17370a;
        }
        this.f91928j.f71859a = false;
        return t2.f17372c;
    }
}
