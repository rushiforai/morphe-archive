package defpackage;

import com.medium.android.graphql.type.PublicationStaffRole;
import gen.model.SourceParameter;
import java.util.LinkedHashSet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Ldda;", "Lque;", "dr2", "wca", "rca", "publication_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class dda extends que {
    public final String b;
    public final mya c;
    public final mya d;
    public final yye e;
    public final s26 f;
    public final ax2 g;
    public final vob h;
    public final kbe i;
    public final r6c j;
    public final uua k;
    public final wua l;
    public final String m;
    public final SourceParameter n;
    public final LinkedHashSet o;

    public dda(kb2 kb2Var, ax2 ax2Var, s26 s26Var, mya myaVar, mya myaVar2, vob vobVar, kbe kbeVar, yye yyeVar, String str, String str2) {
        str.getClass();
        str2.getClass();
        vobVar.getClass();
        this.b = str2;
        this.c = myaVar;
        this.d = myaVar2;
        this.e = yyeVar;
        this.f = s26Var;
        this.g = ax2Var;
        this.h = vobVar;
        this.i = kbeVar;
        r6c r6cVarX = k40.x(0, 7, null);
        this.j = r6cVarX;
        this.k = bo.z(r6cVarX);
        PublicationStaffRole publicationStaffRole = PublicationStaffRole.EDITOR;
        cda cdaVar = new cda(this, null);
        publicationStaffRole.getClass();
        this.l = bo.e0(w2g.r(new zh(yyeVar.b.Q(new ac4(yyeVar, str, publicationStaffRole, cdaVar, null, 1)), 14), kb2Var), f76.F(this), new ync(5000L, Long.MAX_VALUE), vca.a);
        this.m = "pub_entity/editors";
        this.n = new SourceParameter("pub_entity/editors", null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -18, 8191, null);
        this.o = new LinkedHashSet();
    }
}
