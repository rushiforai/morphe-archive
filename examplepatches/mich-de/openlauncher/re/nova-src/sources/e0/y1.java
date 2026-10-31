package e0;

import kotlin.jvm.functions.Function0;

/* loaded from: classes2.dex */
public final /* synthetic */ class y1 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50166a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a2 f50167b;

    public /* synthetic */ y1(a2 a2Var, int i5) {
        this.f50166a = i5;
        this.f50167b = a2Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f50166a) {
            case 0:
                a2 a2Var = this.f50167b;
                return Boolean.valueOf(a2Var.h() < a2Var.g());
            case 1:
                return Boolean.valueOf(this.f50167b.h() > 0);
            default:
                return new y3.f(this.f50167b.h() > 0 ? 8 : 0);
        }
    }
}
