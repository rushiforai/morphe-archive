package uo;

import java.io.Serializable;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: classes4.dex */
public abstract class c implements Serializable {
    public static final Map n = Collections.unmodifiableMap(new HashMap());

    /* renamed from: a, reason: collision with root package name */
    public final a f91410a;

    /* renamed from: b, reason: collision with root package name */
    public final h f91411b;

    /* renamed from: c, reason: collision with root package name */
    public final String f91412c;

    /* renamed from: d, reason: collision with root package name */
    public final Set f91413d;

    /* renamed from: e, reason: collision with root package name */
    public final Map f91414e;

    /* renamed from: f, reason: collision with root package name */
    public final lp.b f91415f;

    /* renamed from: g, reason: collision with root package name */
    public final URI f91416g;

    /* renamed from: h, reason: collision with root package name */
    public final bp.d f91417h;

    /* renamed from: i, reason: collision with root package name */
    public final URI f91418i;

    /* renamed from: j, reason: collision with root package name */
    public final lp.b f91419j;

    /* renamed from: k, reason: collision with root package name */
    public final lp.b f91420k;

    /* renamed from: l, reason: collision with root package name */
    public final List f91421l;

    /* renamed from: m, reason: collision with root package name */
    public final String f91422m;

    public c(a aVar, h hVar, String str, Set set, URI uri, bp.d dVar, URI uri2, lp.b bVar, lp.b bVar2, List list, String str2, Map map, lp.b bVar3) {
        this.f91410a = aVar;
        this.f91411b = hVar;
        this.f91412c = str;
        if (set != null) {
            this.f91413d = Collections.unmodifiableSet(new HashSet(set));
        } else {
            this.f91413d = null;
        }
        if (map != null) {
            this.f91414e = Collections.unmodifiableMap(new HashMap(map));
        } else {
            this.f91414e = n;
        }
        this.f91415f = bVar3;
        this.f91416g = uri;
        this.f91417h = dVar;
        this.f91418i = uri2;
        this.f91419j = bVar;
        this.f91420k = bVar2;
        if (list != null) {
            this.f91421l = Collections.unmodifiableList(new ArrayList(list));
        } else {
            this.f91421l = null;
        }
        this.f91422m = str2;
    }

    public final lp.b a() {
        lp.b bVar = this.f91415f;
        return bVar == null ? lp.b.c(toString().getBytes(lp.f.f75086a)) : bVar;
    }

    public HashMap b() {
        cp.m mVar = lp.d.f75084a;
        HashMap map = new HashMap();
        map.putAll(this.f91414e);
        a aVar = this.f91410a;
        if (aVar != null) {
            map.put("alg", aVar.f91409a);
        }
        h hVar = this.f91411b;
        if (hVar != null) {
            map.put("typ", hVar.f91437a);
        }
        String str = this.f91412c;
        if (str != null) {
            map.put("cty", str);
        }
        Set set = this.f91413d;
        if (set != null && !set.isEmpty()) {
            map.put("crit", new ArrayList(set));
        }
        URI uri = this.f91416g;
        if (uri != null) {
            map.put("jku", uri.toString());
        }
        bp.d dVar = this.f91417h;
        if (dVar != null) {
            map.put("jwk", dVar.d());
        }
        URI uri2 = this.f91418i;
        if (uri2 != null) {
            map.put("x5u", uri2.toString());
        }
        lp.b bVar = this.f91419j;
        if (bVar != null) {
            map.put("x5t", bVar.f75082a);
        }
        lp.b bVar2 = this.f91420k;
        if (bVar2 != null) {
            map.put("x5t#S256", bVar2.f75082a);
        }
        List list = this.f91421l;
        if (list != null && !list.isEmpty()) {
            ArrayList arrayList = new ArrayList(list.size());
            Iterator it = list.iterator();
            while (it.hasNext()) {
                arrayList.add(((lp.a) it.next()).f75082a);
            }
            map.put("x5c", arrayList);
        }
        String str2 = this.f91422m;
        if (str2 != null) {
            map.put("kid", str2);
        }
        return map;
    }

    public final String toString() {
        return lp.d.j(b());
    }
}
