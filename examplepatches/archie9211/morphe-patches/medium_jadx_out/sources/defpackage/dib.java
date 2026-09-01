package defpackage;

import com.medium.proto.event.ResponseAutoExpanded;
import java.io.IOException;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dib extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ nib d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ dib(nib nibVar, String str, String str2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = nibVar;
        this.e = str;
        this.f = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                dib dibVar = new dib(this.d, this.e, this.f, n92Var, 0);
                dibVar.c = obj;
                return dibVar;
            case 1:
                dib dibVar2 = new dib(this.d, this.e, this.f, n92Var, 1);
                dibVar2.c = obj;
                return dibVar2;
            default:
                dib dibVar3 = new dib(this.d, this.e, this.f, n92Var, 2);
                dibVar3.c = obj;
                return dibVar3;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) throws IOException {
        int i = this.b;
        c1e c1eVar = c1e.a;
        qgb qgbVar = (qgb) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
            case 0:
                ((dib) create(qgbVar, n92Var)).invokeSuspend(c1eVar);
                break;
            case 1:
                ((dib) create(qgbVar, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((dib) create(qgbVar, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws IOException {
        rgb rgbVar;
        String str;
        int i = this.b;
        String str2 = this.e;
        c1e c1eVar = c1e.a;
        nib nibVar = this.d;
        switch (i) {
            case 0:
                String str3 = nibVar.F;
                qgb qgbVar = (qgb) this.c;
                br7.v(obj);
                ugb ugbVarG = iq7.G(qgbVar.j, new ov5(str2, 26));
                if (ugbVarG == null) {
                    ygf.f("responsesTreeNode is null");
                } else {
                    ugb ugbVarG2 = iq7.G(qgbVar.j, new wgb(ugbVarG, 1));
                    String str4 = (ugbVarG2 == null || (str = ugbVarG2.a) == null) ? str3 : str;
                    if (g76.L(str4, str3)) {
                        str = qgbVar.c;
                    } else if (ugbVarG2 != null && (rgbVar = ugbVarG2.e) != null) {
                        str = rgbVar.b;
                    }
                    String str5 = str;
                    String strF0 = bu1.F0(ugbVarG.c, "\n\n", null, null, cib.b, 30);
                    if (g76.L(str4, str3)) {
                        nibVar.k(strF0);
                    }
                    uid uidVarF = nibVar.f();
                    int length = strF0.length();
                    nibVar.N.setValue(uid.b(uidVarF, strF0, lk7.q(length, length), 4));
                    vob vobVar = nibVar.A;
                    bib bibVarE = nibVar.e();
                    String str6 = ugbVarG.a;
                    vobVar.d("write_state", bib.a(bibVarE, str4, this.f, str6, str5, false, str6, true, null, 579));
                }
                break;
            case 1:
                qgb qgbVar2 = (qgb) this.c;
                br7.v(obj);
                ugb ugbVarG3 = iq7.G(qgbVar2.j, new ov5(str2, 27));
                if (ugbVarG3 != null) {
                    vob vobVar2 = nibVar.A;
                    bib bibVarE2 = nibVar.e();
                    String str7 = ugbVarG3.a;
                    rgb rgbVar2 = ugbVarG3.e;
                    vobVar2.d("write_state", bib.a(bibVarE2, str7, this.f, str7, rgbVar2 != null ? rgbVar2.b : null, false, null, true, null, 67));
                }
                break;
            default:
                qgb qgbVar3 = (qgb) this.c;
                br7.v(obj);
                List list = qgbVar3.j;
                String str8 = this.e;
                ugb ugbVarG4 = iq7.G(list, new ov5(str8, 28));
                if (ugbVarG4 != null) {
                    qy2 qy2Var = nibVar.w;
                    String str9 = nibVar.F;
                    String str10 = ugbVarG4.q;
                    String str11 = str10 == null ? str9 : str10;
                    Integer num = ugbVarG4.r;
                    String str12 = nibVar.b;
                    String str13 = nibVar.J;
                    qy2Var.getClass();
                    str8.getClass();
                    str9.getClass();
                    str11.getClass();
                    str12.getClass();
                    str13.getClass();
                    rqd.a(qy2Var.a, new ResponseAutoExpanded(null, str8, str9, null, str11, num, null, 73, null), str12, this.f, false, null, str13, 24);
                }
                break;
        }
        return c1eVar;
    }
}
