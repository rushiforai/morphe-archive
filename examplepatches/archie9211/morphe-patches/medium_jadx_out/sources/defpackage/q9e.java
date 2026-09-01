package defpackage;

import gen.model.SourceParameter;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lq9e;", "Lque;", "mo2", "m9e", "k9e", "l9e", "profile_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class q9e extends que {
    public final String b;
    public final String c;
    public final zk2 d;
    public final dae e;
    public final tl f;
    public final ty2 g;
    public final ax2 h;
    public final vob i;
    public final kb2 j;
    public final boolean k;
    public final g04 l;
    public final LinkedHashMap m;
    public final r6c n;
    public final uua o;
    public final wua p;
    public final o33 q;
    public final LinkedHashMap r;
    public final wua s;
    public final String t;
    public final SourceParameter u;
    public final String v;
    public boolean w;
    public final LinkedHashSet x;

    public q9e(String str, String str2, md5 md5Var, eo2 eo2Var, sc5 sc5Var, zk2 zk2Var, dae daeVar, tl tlVar, ty2 ty2Var, ax2 ax2Var, vob vobVar, kb2 kb2Var) {
        str.getClass();
        eo2Var.getClass();
        zk2Var.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = str2;
        this.d = zk2Var;
        this.e = daeVar;
        this.f = tlVar;
        this.g = ty2Var;
        this.h = ax2Var;
        this.i = vobVar;
        this.j = kb2Var;
        this.k = str.equals(((zk2) md5Var.b).m());
        g04 entries = w9e.getEntries();
        this.l = entries;
        int iP = ei7.P(cu1.k0(entries, 10));
        LinkedHashMap linkedHashMap = new LinkedHashMap(iP < 16 ? 16 : iP);
        for (Object obj : entries) {
            linkedHashMap.put(obj, (c9e) eo2Var.get());
        }
        this.m = linkedHashMap;
        int i = 0;
        n92 n92Var = null;
        if (this.k) {
            vx0.c0(f76.F(this), null, null, new e9e(this, n92Var, i), 3);
        }
        r6c r6cVarX = k40.x(0, 7, null);
        this.n = r6cVarX;
        this.o = bo.z(r6cVarX);
        this.p = this.i.c("selectedActivityType", w9e.ALL_ACTIVITIES);
        this.q = vx0.F(f76.F(this), this.j, wb2.LAZY, new cfd(sc5Var, this, n92Var, 9));
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(ei7.P(linkedHashMap.size()));
        Iterator it2 = linkedHashMap.entrySet().iterator();
        while (true) {
            boolean zHasNext = it2.hasNext();
            int i2 = 1;
            u3b u3bVar = l7c.b;
            if (!zHasNext) {
                this.r = linkedHashMap2;
                this.s = bo.e0(w2g.r(ip4.b(this.p, new yk(19, n92Var, this)), this.j), f76.F(this), u3bVar, new m9e(true, (w9e) this.p.a.getValue(), this.l, h9e.a));
                this.t = "user_activity";
                SourceParameter sourceParameter = new SourceParameter("user_activity", null, null, null, null, null, null, null, null, null, null, null, this.b, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4098, 8191, null);
                this.u = sourceParameter;
                this.v = gp7.u(sourceParameter);
                this.x = new LinkedHashSet();
                return;
            }
            Map.Entry entry = (Map.Entry) it2.next();
            Object key = entry.getKey();
            w9e w9eVar = (w9e) entry.getKey();
            c9e c9eVar = (c9e) entry.getValue();
            String str3 = this.b;
            xnc xncVar = new xnc(this, n92Var, i2);
            c9eVar.getClass();
            str3.getClass();
            w9eVar.getClass();
            linkedHashMap2.put(key, bo.e0(w2g.r(new to4(new a74(2, 8, n92Var), new u50(12, new b9e(w9eVar, c9eVar, str3, xncVar, null))), this.j), f76.F(this), u3bVar, r8e.a));
        }
    }
}
