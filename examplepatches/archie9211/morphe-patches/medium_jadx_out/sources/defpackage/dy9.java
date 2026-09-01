package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class dy9 implements x45 {
    public final /* synthetic */ int a;
    public final String b;
    public final String c;

    public /* synthetic */ dy9(String str, String str2, int i) {
        this.a = i;
        this.b = str;
        this.c = str2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        String str = this.c;
        String str2 = this.b;
        ydc ydcVar = (ydc) obj;
        switch (i) {
            case 0:
                ydcVar.getClass();
                y96 y96Var = fy9.b;
                ydcVar.a(str2, y96Var);
                y96 y96Var2 = fy9.a;
                ydcVar.a(str, y96Var, y96Var, y96Var2, y96Var2);
                ydcVar.c(str2, y96Var2);
                break;
            case 1:
                ydcVar.getClass();
                y96 y96Var3 = fy9.b;
                ydcVar.a(str2, y96Var3);
                ydcVar.a(str, y96Var3, y96Var3, y96Var3);
                ydcVar.c(str2, y96Var3);
                break;
            case 2:
                ydcVar.getClass();
                y96 y96Var4 = fy9.b;
                ydcVar.a(str2, y96Var4);
                y96 y96Var5 = fy9.a;
                ydcVar.a(str, y96Var4, y96Var4, fy9.c, y96Var5);
                ydcVar.c(str2, y96Var5);
                break;
            case 3:
                ydcVar.getClass();
                y96 y96Var6 = fy9.b;
                ydcVar.a(str2, y96Var6);
                y96 y96Var7 = fy9.c;
                ydcVar.a(str2, y96Var7);
                y96 y96Var8 = fy9.a;
                ydcVar.a(str, y96Var6, y96Var7, y96Var7, y96Var8);
                ydcVar.c(str2, y96Var8);
                break;
            case 4:
                ydcVar.getClass();
                y96 y96Var9 = fy9.c;
                ydcVar.a(str2, y96Var9);
                ydcVar.c(str, fy9.b, y96Var9);
                break;
            default:
                ydcVar.getClass();
                ydcVar.a(str2, fy9.a);
                ydcVar.c(str, fy9.b, fy9.c);
                break;
        }
        return c1eVar;
    }
}
