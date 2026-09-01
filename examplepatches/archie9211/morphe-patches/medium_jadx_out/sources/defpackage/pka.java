package defpackage;

import com.medium.android.core.models.EntityType;
import gen.model.SourceParameter;
import java.util.LinkedHashSet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lpka;", "Lque;", "ir2", "jka", "fka", "publication_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class pka extends que {
    public final String b;
    public final String c;
    public final fe4 d;
    public final uja e;
    public final o2b f;
    public final eoc g;
    public final fr9 h;
    public final tl i;
    public final ty2 j;
    public final ax2 k;
    public final r6c l;
    public final uua m;
    public final wua n;
    public final String o;
    public final SourceParameter p;
    public boolean q;
    public final LinkedHashSet r;

    public pka(String str, String str2, fe4 fe4Var, uja ujaVar, o2b o2bVar, eoc eocVar, mya myaVar, fr9 fr9Var, tl tlVar, ty2 ty2Var, ax2 ax2Var, kb2 kb2Var) {
        str.getClass();
        str2.getClass();
        this.b = str;
        this.c = str2;
        this.d = fe4Var;
        this.e = ujaVar;
        this.f = o2bVar;
        this.g = eocVar;
        this.h = fr9Var;
        this.i = tlVar;
        this.j = ty2Var;
        this.k = ax2Var;
        r6c r6cVarX = k40.x(0, 7, null);
        this.l = r6cVarX;
        this.m = bo.z(r6cVarX);
        this.n = bo.e0(w2g.r(k40.T(new u50(12, new nka(this, null)), myaVar.u(EntityType.COLLECTION, str, false), ujaVar.b.Q(new yj2(ujaVar, str, new tg(15, null, this), null, 8)), new oka(this, null)), kb2Var), f76.F(this), new ync(5000L, Long.MAX_VALUE), ika.a);
        this.o = "pub_entity/newsletter";
        this.p = new SourceParameter("pub_entity/newsletter", null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -18, 8191, null);
        this.r = new LinkedHashSet();
    }
}
