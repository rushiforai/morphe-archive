package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class uu7 implements m45 {
    public final /* synthetic */ int a;
    public final yu7 b;
    public final i6a c;
    public final fa3 d;

    public /* synthetic */ uu7(yu7 yu7Var, i6a i6aVar, fa3 fa3Var, int i) {
        this.a = i;
        this.b = yu7Var;
        this.c = i6aVar;
        this.d = fa3Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        fa3 fa3Var = this.d;
        i6a i6aVar = this.c;
        yu7 yu7Var = this.b;
        switch (i) {
            case 0:
                x67 x67Var = ((i93) yu7Var.a.a).a;
                uu7 uu7Var = new uu7(yu7Var, i6aVar, fa3Var, 2);
                x67Var.getClass();
                return new t67(x67Var, uu7Var);
            case 1:
                x67 x67Var2 = ((i93) yu7Var.a.a).a;
                uu7 uu7Var2 = new uu7(yu7Var, i6aVar, fa3Var, 3);
                x67Var2.getClass();
                return new t67(x67Var2, uu7Var2);
            case 2:
                sj0 sj0Var = yu7Var.a;
                j7a j7aVarA = yu7Var.a((yv2) sj0Var.c);
                j7aVarA.getClass();
                rx rxVar = ((i93) sj0Var.a).e;
                mn6 returnType = fa3Var.getReturnType();
                returnType.getClass();
                return (f52) rxVar.r(j7aVarA, i6aVar, returnType);
            default:
                sj0 sj0Var2 = yu7Var.a;
                j7a j7aVarA2 = yu7Var.a((yv2) sj0Var2.c);
                j7aVarA2.getClass();
                rx rxVar2 = ((i93) sj0Var2.a).e;
                mn6 returnType2 = fa3Var.getReturnType();
                returnType2.getClass();
                return (f52) rxVar2.d(j7aVarA2, i6aVar, returnType2);
        }
    }
}
