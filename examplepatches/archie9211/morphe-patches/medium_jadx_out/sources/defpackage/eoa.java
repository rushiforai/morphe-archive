package defpackage;

import com.medium.android.graphql.type.PublicationStaffRole;
import gen.model.SourceParameter;
import java.util.LinkedHashSet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Leoa;", "Lque;", "lr2", "yna", "tna", "publication_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class eoa extends que {
    public final String b;
    public final kbe c;
    public final mya d;
    public final mya e;
    public final yye f;
    public final s26 g;
    public final ax2 h;
    public final vob i;
    public final r6c j;
    public final uua k;
    public final wua l;
    public final String m;
    public final SourceParameter n;
    public final LinkedHashSet o;

    public eoa(kb2 kb2Var, ax2 ax2Var, s26 s26Var, mya myaVar, mya myaVar2, vob vobVar, kbe kbeVar, yye yyeVar, String str, String str2) {
        str.getClass();
        str2.getClass();
        vobVar.getClass();
        this.b = str2;
        this.c = kbeVar;
        this.d = myaVar;
        this.e = myaVar2;
        this.f = yyeVar;
        this.g = s26Var;
        this.h = ax2Var;
        this.i = vobVar;
        r6c r6cVarX = k40.x(0, 7, null);
        this.j = r6cVarX;
        this.k = bo.z(r6cVarX);
        PublicationStaffRole publicationStaffRole = PublicationStaffRole.WRITER;
        doa doaVar = new doa(this, null);
        publicationStaffRole.getClass();
        this.l = bo.e0(w2g.r(new zh(yyeVar.b.Q(new ac4(yyeVar, str, publicationStaffRole, doaVar, null, 1)), 16), kb2Var), f76.F(this), new ync(5000L, Long.MAX_VALUE), wna.a);
        this.m = "pub_entity/writers";
        this.n = new SourceParameter("pub_entity/writers", null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -18, 8191, null);
        this.o = new LinkedHashSet();
    }
}
