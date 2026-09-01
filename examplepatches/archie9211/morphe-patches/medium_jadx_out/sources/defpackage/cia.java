package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class cia implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ cv9 b;
    public final /* synthetic */ hia c;

    public /* synthetic */ cia(cv9 cv9Var, hia hiaVar, int i) {
        this.a = i;
        this.b = cv9Var;
        this.c = hiaVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        hia hiaVar = this.c;
        cv9 cv9Var = this.b;
        switch (i) {
            case 0:
                String str = hiaVar.a;
                SourceParameter sourceParameter = hiaVar.j;
                str.getClass();
                sw9 sw9Var = cv9Var.a;
                vx0.c0(f76.F(sw9Var), null, null, new gs9(sw9Var, str, sourceParameter, null, 14), 3);
                break;
            case 1:
                String str2 = hiaVar.a;
                SourceParameter sourceParameter2 = hiaVar.j;
                str2.getClass();
                cv9Var.a.k(str2, sourceParameter2);
                break;
            case 2:
                String str3 = hiaVar.a;
                SourceParameter sourceParameter3 = hiaVar.j;
                str3.getClass();
                cv9Var.a.F(str3, sourceParameter3);
                break;
            default:
                String str4 = hiaVar.a;
                SourceParameter sourceParameter4 = hiaVar.j;
                str4.getClass();
                sw9 sw9Var2 = cv9Var.a;
                vx0.c0(f76.F(sw9Var2), null, null, new gs9(sw9Var2, str4, sourceParameter4, null, 15), 3);
                break;
        }
        return c1eVar;
    }
}
