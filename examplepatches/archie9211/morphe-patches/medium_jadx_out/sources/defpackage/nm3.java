package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class nm3 {
    public static final cud a = new cud(256, (yn3) null, 6);

    public static final om3 a(pm3 pm3Var, x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            objM = new iz2(11);
            p65Var.j0(objM);
        }
        x45 x45Var = (x45) objM;
        Object[] objArr = new Object[0];
        int i = 3;
        mya myaVar = new mya(new v02(28, (byte) 0), i, new ju0(1, x45Var));
        boolean zF = ((p65) x12Var).f(x45Var);
        p65 p65Var2 = (p65) x12Var;
        Object objM2 = p65Var2.M();
        if (zF || objM2 == uobVar) {
            objM2 = new gd3(pm3Var, 2, x45Var);
            p65Var2.j0(objM2);
        }
        return (om3) hp7.F(objArr, myaVar, (m45) objM2, p65Var2, 0);
    }
}
