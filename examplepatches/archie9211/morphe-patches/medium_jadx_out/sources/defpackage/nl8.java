package defpackage;

import com.medium.android.core.navigation.NotificationFilterType;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lnl8;", "Lque;", "gl8", "fl8", "al8", "tq2", "notifications_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class nl8 extends que {
    public final String b;
    public final ji7 c;
    public final s26 d;
    public final vob e;
    public final ax2 f;
    public final kbe g;
    public final String h;
    public final SourceParameter i;
    public final String j;
    public final LinkedHashSet k;
    public final r6c l;
    public final uua m;
    public final wua n;
    public final LinkedHashMap o;
    public final zk8 p;
    public final tg q;
    public final LinkedHashMap r;
    public final wua s;

    public nl8(String str, NotificationFilterType notificationFilterType, eo2 eo2Var, ji7 ji7Var, s26 s26Var, vob vobVar, ax2 ax2Var, kbe kbeVar, kb2 kb2Var) {
        el8 el8Var;
        List listR;
        str.getClass();
        notificationFilterType.getClass();
        eo2Var.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = ji7Var;
        this.d = s26Var;
        this.e = vobVar;
        this.f = ax2Var;
        this.g = kbeVar;
        this.h = "notifications";
        n92 n92Var = null;
        SourceParameter sourceParameter = new SourceParameter("notifications", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null);
        this.i = sourceParameter;
        this.j = gp7.u(sourceParameter);
        this.k = new LinkedHashSet();
        int i = 0;
        r6c r6cVarX = k40.x(0, 7, null);
        this.l = r6cVarX;
        this.m = bo.z(r6cVarX);
        pc1 pc1Var = new pc1(vobVar.c("selectedFilter", e(notificationFilterType)), 25, this);
        gp1 gp1VarF = f76.F(this);
        ync yncVar = new ync(5000L, Long.MAX_VALUE);
        NotificationFilterType notificationFilterType2 = (NotificationFilterType) vobVar.a("selectedFilter");
        this.n = bo.e0(pc1Var, gp1VarF, yncVar, e(notificationFilterType2 == null ? notificationFilterType : notificationFilterType2));
        g04 entries = NotificationFilterType.getEntries();
        int iP = ei7.P(cu1.k0(entries, 10));
        LinkedHashMap linkedHashMap = new LinkedHashMap(iP < 16 ? 16 : iP);
        for (Object obj : entries) {
            linkedHashMap.put(obj, (zk8) eo2Var.get());
        }
        this.o = linkedHashMap;
        this.p = (zk8) ei7.N(NotificationFilterType.ALL, linkedHashMap);
        this.q = new tg(12, n92Var, this);
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(ei7.P(linkedHashMap.size()));
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            Object key = entry.getKey();
            NotificationFilterType notificationFilterType3 = (NotificationFilterType) entry.getKey();
            zk8 zk8Var = (zk8) entry.getValue();
            notificationFilterType3.getClass();
            int i2 = aj8.a[notificationFilterType3.ordinal()];
            if (i2 == 1) {
                wj8.Companion.getClass();
                g04 entries2 = wj8.getEntries();
                ArrayList arrayList = new ArrayList(cu1.k0(entries2, 10));
                Iterator<E> it2 = entries2.iterator();
                while (it2.hasNext()) {
                    arrayList.add(((wj8) it2.next()).getIdentifier());
                }
                listR = arrayList;
            } else {
                if (i2 != 2) {
                    ygf.a();
                    throw null;
                }
                listR = d46.R(wj8.RESPONSE_CREATED.getIdentifier(), wj8.CATALOG_RESPONSE_CREATED.getIdentifier());
            }
            tg tgVar = this.q;
            zk8Var.getClass();
            tgVar.getClass();
            linkedHashMap2.put(key, bo.e0(w2g.r(zk8Var.b.Q(new yj2(zk8Var, listR, tgVar, null, 6)), kb2Var), f76.F(this), new ync(5000L, Long.MAX_VALUE), pz8.a));
        }
        this.r = linkedHashMap2;
        g04 entries3 = NotificationFilterType.getEntries();
        ArrayList arrayList2 = new ArrayList(cu1.k0(entries3, 10));
        Iterator<E> it3 = entries3.iterator();
        while (it3.hasNext()) {
            arrayList2.add(new pc1((bo4) ei7.N((NotificationFilterType) it3.next(), this.r), 24, this));
        }
        bo4 bo4VarR = w2g.r(new ll8((bo4[]) bu1.m1(arrayList2).toArray(new bo4[0]), i), kb2Var);
        gp1 gp1VarF2 = f76.F(this);
        ync yncVar2 = new ync(5000L, Long.MAX_VALUE);
        g04 entries4 = NotificationFilterType.getEntries();
        int iP2 = ei7.P(cu1.k0(entries4, 10));
        LinkedHashMap linkedHashMap3 = new LinkedHashMap(iP2 < 16 ? 16 : iP2);
        Iterator<E> it4 = entries4.iterator();
        while (true) {
            boolean zHasNext = it4.hasNext();
            el8Var = el8.a;
            if (!zHasNext) {
                break;
            }
            Object next = it4.next();
            linkedHashMap3.put(next, el8Var);
        }
        bo4 bo4VarR2 = w2g.r(new sp4(this.n, bo.e0(bo4VarR, gp1VarF2, yncVar2, linkedHashMap3), new m14(3, 4, (n92) null), i), kb2Var);
        gp1 gp1VarF3 = f76.F(this);
        ync yncVar3 = new ync(5000L, Long.MAX_VALUE);
        NotificationFilterType notificationFilterType4 = (NotificationFilterType) this.n.a.getValue();
        g04 entries5 = NotificationFilterType.getEntries();
        int iP3 = ei7.P(cu1.k0(entries5, 10));
        LinkedHashMap linkedHashMap4 = new LinkedHashMap(iP3 >= 16 ? iP3 : 16);
        for (Object obj2 : entries5) {
            linkedHashMap4.put(obj2, el8Var);
        }
        this.s = bo.e0(bo4VarR2, gp1VarF3, yncVar3, new gl8(notificationFilterType4, linkedHashMap4));
    }

    public static NotificationFilterType e(NotificationFilterType notificationFilterType) {
        if (!((i04) NotificationFilterType.getEntries()).contains(notificationFilterType)) {
            notificationFilterType = null;
        }
        return notificationFilterType == null ? NotificationFilterType.ALL : notificationFilterType;
    }

    public final Object f(String str, x45 x45Var, p4d p4dVar) {
        Object objL0 = this.p.b.l0(new q58(str, 8, x45Var), p4dVar);
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        c1e c1eVar = c1e.a;
        if (objL0 != tb2Var) {
            objL0 = c1eVar;
        }
        return objL0 == tb2Var ? objL0 : c1eVar;
    }
}
