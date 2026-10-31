package ads_mobile_sdk;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class dj2 extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ fl2 f2551a;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f2552j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ dj2(fl2 fl2Var, int i5) {
        super(1);
        this.f2552j = i5;
        this.f2551a = fl2Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f2552j) {
            case 0:
                qw2 it = (qw2) obj;
                Intrinsics.g(it, "it");
                return Boolean.valueOf(it == qw2.f8860e && this.f2551a.f3420t);
            default:
                qw2 it2 = (qw2) obj;
                Intrinsics.g(it2, "it");
                return Boolean.valueOf(it2 == qw2.f8860e && this.f2551a.f3420t);
        }
    }
}
