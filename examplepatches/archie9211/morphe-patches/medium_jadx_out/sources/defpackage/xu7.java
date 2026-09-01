package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class xu7 implements m45 {
    public final /* synthetic */ int a;
    public final yu7 b;
    public final j7a c;
    public final q1 d;
    public final hx e;
    public final int f;
    public final a7a g;

    public /* synthetic */ xu7(yu7 yu7Var, j7a j7aVar, q1 q1Var, hx hxVar, int i, a7a a7aVar, int i2) {
        this.a = i2;
        this.b = yu7Var;
        this.c = j7aVar;
        this.d = q1Var;
        this.e = hxVar;
        this.f = i;
        this.g = a7aVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        yu7 yu7Var = this.b;
        switch (i) {
            case 0:
                return bu1.m1(((i93) yu7Var.a.a).e.w(this.c, this.d, this.e, this.f, this.g));
            default:
                return bu1.m1(((i93) yu7Var.a.a).e.o(this.c, this.d, this.e, this.f, this.g));
        }
    }
}
