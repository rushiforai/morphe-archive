package e10;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class l2 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51634a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ s2 f51635b;

    public /* synthetic */ l2(s2 s2Var, int i5) {
        this.f51634a = i5;
        this.f51635b = s2Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        String str = (String) obj;
        switch (this.f51634a) {
            case 0:
                return this.f51635b.l();
            default:
                return Boolean.valueOf(Intrinsics.b(str, this.f51635b.d()));
        }
    }
}
