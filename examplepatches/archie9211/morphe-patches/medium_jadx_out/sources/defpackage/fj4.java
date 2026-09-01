package defpackage;

import android.content.Context;
import gen.model.SourceParameter;
import j$.util.concurrent.ConcurrentHashMap;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashSet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lfj4;", "Lque;", "zp2", "ni4", "xi4", "mi4", "addressbook_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class fj4 extends que {
    public final String A;
    public boolean B;
    public boolean C;
    public final LinkedHashSet D;
    public final String b;
    public final os4 c;
    public final fj7 d;
    public final t5e e;
    public final kne f;
    public final kbe g;
    public final s26 h;
    public final ax2 i;
    public final cx2 j;
    public final sh2 k;
    public final Context l;
    public final ConcurrentHashMap m;
    public final xpc n;
    public final xpc o;
    public final xpc p;
    public final u50 q;
    public final u50 r;
    public final xpc s;
    public final xpc t;
    public final pc1 u;
    public final wua v;
    public final r6c w;
    public final uua x;
    public final String y;
    public final SourceParameter z;

    public fj4(String str, os4 os4Var, fj7 fj7Var, t5e t5eVar, pu7 pu7Var, kne kneVar, kbe kbeVar, s26 s26Var, ax2 ax2Var, cx2 cx2Var, sh2 sh2Var, Context context, kb2 kb2Var) {
        str.getClass();
        pu7Var.getClass();
        this.b = str;
        this.c = os4Var;
        this.d = fj7Var;
        this.e = t5eVar;
        this.f = kneVar;
        this.g = kbeVar;
        this.h = s26Var;
        this.i = ax2Var;
        this.j = cx2Var;
        this.k = sh2Var;
        this.l = context;
        this.m = new ConcurrentHashMap();
        Boolean bool = Boolean.FALSE;
        xpc xpcVarJ = vv2.j(bool);
        this.n = xpcVarJ;
        xpc xpcVarJ2 = vv2.j(!sh2Var.b() ? ni4.RequestingPermission : pu7Var.l(ek6.LAST_CONTACTS_SHARED_AT, 0L) == 0 ? ni4.UploadingContacts : ni4.MatchedContacts);
        this.o = xpcVarJ2;
        xpc xpcVarJ3 = vv2.j(Boolean.valueOf(xpcVarJ2.getValue() == ni4.MatchedContacts));
        this.p = xpcVarJ3;
        n92 n92Var = null;
        this.q = new u50(12, new aj4(this, n92Var, 1));
        int i = 14;
        this.r = new u50(12, new fl2(i, n92Var, this));
        xpc xpcVarJ4 = vv2.j(bool);
        this.s = xpcVarJ4;
        xpc xpcVarJ5 = vv2.j(bool);
        this.t = xpcVarJ5;
        this.u = k40.R(new to4(fj7Var.b.Q(new ej7(fj7Var, 100, true, new cj4(this, null), null)), new rc0(this, n92Var, i), 3), xpcVarJ5, xpcVarJ4, xpcVarJ, xpcVarJ3, new dj4(this, null));
        this.v = bo.e0(w2g.r(ip4.b(xpcVarJ2, new yk(6, n92Var, this)), kb2Var), f76.F(this), l7c.b, pi4.a);
        r6c r6cVarX = k40.x(0, 7, null);
        this.w = r6cVarX;
        this.x = bo.z(r6cVarX);
        this.y = "find_friends";
        SourceParameter sourceParameter = new SourceParameter("find_friends", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null);
        this.z = sourceParameter;
        this.A = gp7.u(sourceParameter);
        this.D = new LinkedHashSet();
    }

    public final void e() {
        Collection collectionValues = this.m.values();
        collectionValues.getClass();
        Collection collection = collectionValues;
        boolean z = false;
        if (!collection.isEmpty()) {
            Iterator it2 = collection.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                } else if (!((Boolean) it2.next()).booleanValue()) {
                    z = true;
                    break;
                }
            }
        }
        Boolean boolValueOf = Boolean.valueOf(z);
        xpc xpcVar = this.s;
        xpcVar.getClass();
        xpcVar.m(null, boolValueOf);
    }
}
