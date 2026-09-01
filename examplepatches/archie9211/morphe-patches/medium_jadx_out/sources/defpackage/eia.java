package defpackage;

import com.medium.android.core.models.EntityType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class eia implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ cv9 b;
    public final /* synthetic */ hia c;
    public final /* synthetic */ String d;

    public /* synthetic */ eia(cv9 cv9Var, String str, hia hiaVar) {
        this.a = 0;
        this.b = cv9Var;
        this.d = str;
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
                SourceParameter sourceParameter = hiaVar.j;
                String str = this.d;
                str.getClass();
                sw9 sw9Var = cv9Var.a;
                vx0.c0(f76.F(sw9Var), null, null, new gs9(sw9Var, str, sourceParameter, null, 13), 3);
                break;
            case 1:
                String str2 = hiaVar.g.a;
                String str3 = hiaVar.a;
                SourceParameter sourceParameter2 = hiaVar.j;
                str3.getClass();
                String str4 = this.d;
                str4.getClass();
                cv9Var.a.G(str2, EntityType.COLLECTION, str3, str4, gp7.u(sourceParameter2));
                break;
            default:
                String str5 = hiaVar.g.a;
                String str6 = hiaVar.a;
                SourceParameter sourceParameter3 = hiaVar.j;
                str6.getClass();
                String str7 = this.d;
                str7.getClass();
                cv9Var.a.v(str5, EntityType.COLLECTION, str6, str7, gp7.u(sourceParameter3));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ eia(cv9 cv9Var, hia hiaVar, String str, int i) {
        this.a = i;
        this.b = cv9Var;
        this.c = hiaVar;
        this.d = str;
    }
}
