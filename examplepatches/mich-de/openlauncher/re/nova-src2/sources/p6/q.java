package p6;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class q extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f82239j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ t f82240k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ q(t tVar, int i5) {
        super(1);
        this.f82239j = i5;
        this.f82240k = tVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f82239j) {
            case 0:
                e0 destination = (e0) obj;
                Intrinsics.g(destination, "destination");
                return Boolean.valueOf(!this.f82240k.f82264m.containsKey(Integer.valueOf(destination.f82157f)));
            default:
                e0 destination2 = (e0) obj;
                Intrinsics.g(destination2, "destination");
                return Boolean.valueOf(!this.f82240k.f82264m.containsKey(Integer.valueOf(destination2.f82157f)));
        }
    }
}
