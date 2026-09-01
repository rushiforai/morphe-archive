package defpackage;

import com.medium.android.core.navigation.PublicationStatsReference;
import com.medium.android.graphql.type.UserDismissableFlags;
import gen.model.SourceParameter;
import java.util.Calendar;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lw9a;", "Lque;", "q9a", "ar2", "stats_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class w9a extends que {
    public static final Calendar o;
    public final PublicationStatsReference b;
    public final String c;
    public final x8a d;
    public final l8a e;
    public final og3 f;
    public final qy2 g;
    public final ax2 h;
    public final slc i;
    public final String j;
    public SourceParameter k;
    public boolean l;
    public final xpc m;
    public final wua n;

    static {
        Calendar calendarG = pwd.G(null);
        calendarG.set(1, 2023);
        calendarG.set(2, 0);
        calendarG.set(5, 1);
        o = calendarG;
    }

    public w9a(PublicationStatsReference publicationStatsReference, String str, x8a x8aVar, l8a l8aVar, hha hhaVar, og3 og3Var, qy2 qy2Var, ax2 ax2Var, slc slcVar, vob vobVar, kb2 kb2Var) {
        publicationStatsReference.getClass();
        str.getClass();
        x8aVar.getClass();
        slcVar.getClass();
        vobVar.getClass();
        this.b = publicationStatsReference;
        this.c = str;
        this.d = x8aVar;
        this.e = l8aVar;
        this.f = og3Var;
        this.g = qy2Var;
        this.h = ax2Var;
        this.i = slcVar;
        this.j = "stats_pub_stats";
        n92 n92Var = null;
        PublicationStatsReference.PubById pubById = publicationStatsReference instanceof PublicationStatsReference.PubById ? (PublicationStatsReference.PubById) publicationStatsReference : null;
        this.k = new SourceParameter("stats_pub_stats", null, null, null, pubById != null ? pubById.getPublicationId() : null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -18, 8191, null);
        xpc xpcVarB = vobVar.b(xqc.PUBLISHED_AT_DESC);
        this.m = xpcVarB;
        this.n = bo.e0(w2g.r(k40.T(new pc1(new u50(12, new w8a(x8aVar, publicationStatsReference, null)), 29, this), ip4.b(xpcVarB, new yk(10, n92Var, this)), m40.J(new zz(hhaVar.k(UserDismissableFlags.PUB_STATS_UPDATE_TOAST), 15)), new mg7(1, n92Var, this)), kb2Var), f76.F(this), l7c.b, l9a.a);
    }
}
