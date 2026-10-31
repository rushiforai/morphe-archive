package bp;

import java.io.Serializable;
import java.net.URI;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import p7.u;

/* loaded from: classes4.dex */
public abstract class d implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final h f18363a;

    /* renamed from: b, reason: collision with root package name */
    public final i f18364b;

    /* renamed from: c, reason: collision with root package name */
    public final Set f18365c;

    /* renamed from: d, reason: collision with root package name */
    public final uo.a f18366d;

    /* renamed from: e, reason: collision with root package name */
    public final String f18367e;

    /* renamed from: f, reason: collision with root package name */
    public final URI f18368f;

    /* renamed from: g, reason: collision with root package name */
    public final lp.b f18369g;

    /* renamed from: h, reason: collision with root package name */
    public final lp.b f18370h;

    /* renamed from: i, reason: collision with root package name */
    public final List f18371i;

    /* renamed from: j, reason: collision with root package name */
    public final Date f18372j;

    /* renamed from: k, reason: collision with root package name */
    public final Date f18373k;

    /* renamed from: l, reason: collision with root package name */
    public final Date f18374l;

    /* renamed from: m, reason: collision with root package name */
    public final g f18375m;
    public final LinkedList n;

    public d(h hVar, i iVar, Set set, uo.a aVar, String str, URI uri, lp.b bVar, lp.b bVar2, List list, Date date, Date date2, Date date3, g gVar) {
        Objects.requireNonNull(hVar, "The key type \"kty\" parameter must not be null");
        this.f18363a = hVar;
        Map map = j.f18398a;
        if (iVar != null && set != null) {
            Map map2 = j.f18398a;
            if (map2.containsKey(iVar) && !((Set) map2.get(iVar)).containsAll(set)) {
                throw new IllegalArgumentException("The key use \"use\" and key options \"key_ops\" parameters are not consistent, see RFC 7517, section 4.3");
            }
        }
        this.f18364b = iVar;
        this.f18365c = set;
        this.f18366d = aVar;
        this.f18367e = str;
        this.f18368f = uri;
        this.f18369g = bVar;
        this.f18370h = bVar2;
        if (list != null && list.isEmpty()) {
            throw new IllegalArgumentException("The X.509 certificate chain \"x5c\" must not be empty");
        }
        this.f18371i = list;
        try {
            this.n = u.R(list);
            this.f18372j = date;
            this.f18373k = date2;
            this.f18374l = date3;
            this.f18375m = gVar;
        } catch (ParseException e3) {
            throw new IllegalArgumentException("Invalid X.509 certificate chain \"x5c\": " + e3.getMessage(), e3);
        }
    }

    public static d c(Map map) {
        ArrayList arrayList;
        List list;
        String str;
        Iterator it;
        String strF = lp.d.f("kty", map);
        if (strF == null) {
            throw new ParseException("Missing key type \"kty\" parameter", 0);
        }
        h hVarA = h.a(strF);
        if (hVarA == h.f18390b) {
            return b.h(map);
        }
        h hVar = h.f18391c;
        if (hVarA != hVar) {
            h hVar2 = h.f18392d;
            if (hVarA == hVar2) {
                if (hVar2.equals(lb0.b.M(map))) {
                    try {
                        return new l(lp.d.a("k", map), lb0.b.N(map), lb0.b.K(map), lb0.b.H(map), (String) lp.d.c(map, "kid", String.class), lp.d.h("x5u", map), lp.d.a("x5t", map), lp.d.a("x5t#S256", map), lb0.b.P(map), lb0.b.I(map), lb0.b.O(map), lb0.b.J(map), lb0.b.L(map));
                    } catch (Exception e3) {
                        throw new ParseException(e3.getMessage(), 0);
                    }
                }
                throw new ParseException("The key type kty must be " + hVar2.f18394a, 0);
            }
            h hVar3 = h.f18393e;
            if (hVarA != hVar3) {
                throw new ParseException("Unsupported key type \"kty\" parameter: " + hVarA, 0);
            }
            Set set = k.f18399t;
            if (!hVar3.equals(lb0.b.M(map))) {
                throw new ParseException("The key type kty must be " + hVar3.f18394a, 0);
            }
            try {
                a aVarB = a.b((String) lp.d.c(map, "crv", String.class));
                lp.b bVarA = lp.d.a("x", map);
                lp.b bVarA2 = lp.d.a("d", map);
                try {
                    return bVarA2 == null ? new k(aVarB, bVarA, lb0.b.N(map), lb0.b.K(map), lb0.b.H(map), (String) lp.d.c(map, "kid", String.class), lp.d.h("x5u", map), lp.d.a("x5t", map), lp.d.a("x5t#S256", map), lb0.b.P(map), lb0.b.I(map), lb0.b.O(map), lb0.b.J(map), lb0.b.L(map)) : new k(aVarB, bVarA, bVarA2, lb0.b.N(map), lb0.b.K(map), lb0.b.H(map), (String) lp.d.c(map, "kid", String.class), lp.d.h("x5u", map), lp.d.a("x5t", map), lp.d.a("x5t#S256", map), lb0.b.P(map), lb0.b.I(map), lb0.b.O(map), lb0.b.J(map), lb0.b.L(map));
                } catch (Exception e11) {
                    throw new ParseException(e11.getMessage(), 0);
                }
            } catch (IllegalArgumentException e12) {
                throw new ParseException(e12.getMessage(), 0);
            }
        }
        if (!hVar.equals(lb0.b.M(map))) {
            throw new ParseException("The key type \"kty\" must be RSA", 0);
        }
        lp.b bVarA3 = lp.d.a("n", map);
        lp.b bVarA4 = lp.d.a("e", map);
        lp.b bVarA5 = lp.d.a("d", map);
        lp.b bVarA6 = lp.d.a("p", map);
        lp.b bVarA7 = lp.d.a("q", map);
        lp.b bVarA8 = lp.d.a("dp", map);
        String str2 = "dq";
        lp.b bVarA9 = lp.d.a("dq", map);
        lp.b bVarA10 = lp.d.a("qi", map);
        if (!map.containsKey("oth") || (list = (List) lp.d.c(map, "oth", List.class)) == null) {
            arrayList = null;
        } else {
            arrayList = new ArrayList(list.size());
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                Object next = it2.next();
                if (next instanceof Map) {
                    Map map2 = (Map) next;
                    it = it2;
                    str = str2;
                    try {
                        arrayList.add(new m(lp.d.a("r", map2), lp.d.a(str2, map2), lp.d.a("t", map2)));
                    } catch (IllegalArgumentException e13) {
                        throw new ParseException(e13.getMessage(), 0);
                    }
                } else {
                    str = str2;
                    it = it2;
                }
                it2 = it;
                str2 = str;
            }
        }
        try {
            return new n(bVarA3, bVarA4, bVarA5, bVarA6, bVarA7, bVarA8, bVarA9, bVarA10, arrayList, lb0.b.N(map), lb0.b.K(map), lb0.b.H(map), (String) lp.d.c(map, "kid", String.class), lp.d.h("x5u", map), lp.d.a("x5t", map), lp.d.a("x5t#S256", map), lb0.b.P(map), lb0.b.I(map), lb0.b.O(map), lb0.b.J(map), lb0.b.L(map));
        } catch (Exception e14) {
            throw new ParseException(e14.getMessage(), 0);
        }
    }

    public final List a() {
        LinkedList linkedList = this.n;
        if (linkedList == null) {
            return null;
        }
        return Collections.unmodifiableList(linkedList);
    }

    public abstract boolean b();

    public HashMap d() {
        cp.m mVar = lp.d.f75084a;
        HashMap map = new HashMap();
        map.put("kty", this.f18363a.f18394a);
        i iVar = this.f18364b;
        if (iVar != null) {
            map.put("use", iVar.f18397a);
        }
        Set set = this.f18365c;
        if (set != null) {
            int i5 = lp.c.f75083a;
            ArrayList arrayList = new ArrayList();
            Iterator it = set.iterator();
            while (it.hasNext()) {
                arrayList.add(((e) it.next()).f18383a);
            }
            map.put("key_ops", arrayList);
        }
        uo.a aVar = this.f18366d;
        if (aVar != null) {
            map.put("alg", aVar.f91409a);
        }
        String str = this.f18367e;
        if (str != null) {
            map.put("kid", str);
        }
        URI uri = this.f18368f;
        if (uri != null) {
            map.put("x5u", uri.toString());
        }
        lp.b bVar = this.f18369g;
        if (bVar != null) {
            map.put("x5t", bVar.f75082a);
        }
        lp.b bVar2 = this.f18370h;
        if (bVar2 != null) {
            map.put("x5t#S256", bVar2.f75082a);
        }
        List list = this.f18371i;
        if (list != null) {
            int i11 = lp.c.f75083a;
            ArrayList arrayList2 = new ArrayList();
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                arrayList2.add(((lp.a) it2.next()).f75082a);
            }
            map.put("x5c", arrayList2);
        }
        Date date = this.f18372j;
        if (date != null) {
            map.put("exp", Long.valueOf(date.getTime() / 1000));
        }
        Date date2 = this.f18373k;
        if (date2 != null) {
            map.put("nbf", Long.valueOf(date2.getTime() / 1000));
        }
        Date date3 = this.f18374l;
        if (date3 != null) {
            map.put("iat", Long.valueOf(date3.getTime() / 1000));
        }
        g gVar = this.f18375m;
        if (gVar != null) {
            cp.m mVar2 = lp.d.f75084a;
            HashMap map2 = new HashMap();
            map2.put("revoked_at", Long.valueOf(gVar.f18388a.getTime() / 1000));
            f fVar = gVar.f18389b;
            if (fVar != null) {
                map2.put("reason", fVar.f18387a);
            }
            map.put("revoked", map2);
        }
        return map;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Objects.equals(this.f18363a, dVar.f18363a) && Objects.equals(this.f18364b, dVar.f18364b) && Objects.equals(this.f18365c, dVar.f18365c) && Objects.equals(this.f18366d, dVar.f18366d) && Objects.equals(this.f18367e, dVar.f18367e) && Objects.equals(this.f18368f, dVar.f18368f) && Objects.equals(this.f18369g, dVar.f18369g) && Objects.equals(this.f18370h, dVar.f18370h) && Objects.equals(this.f18371i, dVar.f18371i) && Objects.equals(this.f18372j, dVar.f18372j) && Objects.equals(this.f18373k, dVar.f18373k) && Objects.equals(this.f18374l, dVar.f18374l) && Objects.equals(this.f18375m, dVar.f18375m);
    }

    public int hashCode() {
        return Objects.hash(this.f18363a, this.f18364b, this.f18365c, this.f18366d, this.f18367e, this.f18368f, this.f18369g, this.f18370h, this.f18371i, this.f18372j, this.f18373k, this.f18374l, this.f18375m, null);
    }

    public final String toString() {
        return lp.d.j(d());
    }
}
