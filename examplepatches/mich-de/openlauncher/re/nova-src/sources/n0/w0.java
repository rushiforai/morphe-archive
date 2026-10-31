package n0;

import kotlin.jvm.functions.Function0;

/* loaded from: classes.dex */
public final /* synthetic */ class w0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77514a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ x0 f77515b;

    public /* synthetic */ w0(x0 x0Var, int i5) {
        this.f77514a = i5;
        this.f77515b = x0Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f77514a) {
            case 0:
                return Float.valueOf(this.f77515b.f77525b.f());
            case 1:
                return Float.valueOf(this.f77515b.f77525b.c());
            default:
                x0 x0Var = this.f77515b;
                return Float.valueOf(x0Var.f77525b.e() - x0Var.f77525b.a());
        }
    }
}
