package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class c22 implements x45 {
    public final /* synthetic */ int a;
    public final y05 b;

    public /* synthetic */ c22(y05 y05Var, int i) {
        this.a = i;
        this.b = y05Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        y05 y05Var = this.b;
        switch (i) {
            case 0:
                ly lyVar = (ly) obj;
                lyVar.getClass();
                return lyVar.i(y05Var);
            default:
                y05 y05Var2 = (y05) obj;
                y05Var2.getClass();
                return Boolean.valueOf(!y05Var2.a.c() && y05Var2.b().equals(y05Var));
        }
    }
}
