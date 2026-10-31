package uo;

import b.c0;
import com.amplitude.core.utilities.http.HttpClient;
import java.net.URI;
import java.text.ParseException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import p7.u;

/* loaded from: classes4.dex */
public final class k extends c {
    public static final Set B;
    public final List A;
    public final f o;

    /* renamed from: p, reason: collision with root package name */
    public final bp.d f91459p;

    /* renamed from: q, reason: collision with root package name */
    public final d f91460q;

    /* renamed from: r, reason: collision with root package name */
    public final lp.b f91461r;

    /* renamed from: s, reason: collision with root package name */
    public final lp.b f91462s;

    /* renamed from: t, reason: collision with root package name */
    public final lp.b f91463t;

    /* renamed from: u, reason: collision with root package name */
    public final int f91464u;

    /* renamed from: v, reason: collision with root package name */
    public final lp.b f91465v;

    /* renamed from: w, reason: collision with root package name */
    public final lp.b f91466w;

    /* renamed from: x, reason: collision with root package name */
    public final String f91467x;

    /* renamed from: y, reason: collision with root package name */
    public final String f91468y;

    /* renamed from: z, reason: collision with root package name */
    public final String f91469z;

    static {
        HashSet hashSet = new HashSet();
        hashSet.add("alg");
        hashSet.add("enc");
        hashSet.add("epk");
        hashSet.add("zip");
        hashSet.add("jku");
        hashSet.add("jwk");
        hashSet.add("x5u");
        hashSet.add("x5t");
        hashSet.add("x5t#S256");
        hashSet.add("x5c");
        hashSet.add("kid");
        hashSet.add("typ");
        hashSet.add("cty");
        hashSet.add("crit");
        hashSet.add("apu");
        hashSet.add("apv");
        hashSet.add("p2s");
        hashSet.add("p2c");
        hashSet.add("iv");
        hashSet.add("tag");
        hashSet.add("skid");
        hashSet.add("iss");
        hashSet.add("sub");
        hashSet.add("aud");
        hashSet.add("authTag");
        B = Collections.unmodifiableSet(hashSet);
    }

    public k(a aVar, f fVar, h hVar, String str, HashSet hashSet, URI uri, bp.d dVar, URI uri2, lp.b bVar, lp.b bVar2, LinkedList linkedList, String str2, bp.d dVar2, d dVar3, lp.b bVar3, lp.b bVar4, lp.b bVar5, int i5, lp.b bVar6, lp.b bVar7, String str3, String str4, String str5, List list, HashMap map, lp.b bVar8) {
        super(aVar, hVar, str, hashSet, uri, dVar, uri2, bVar, bVar2, linkedList, str2, map, bVar8);
        if (aVar != null && aVar.f91409a.equals(a.f91408b.f91409a)) {
            throw new IllegalArgumentException("The JWE algorithm cannot be \"none\"");
        }
        if (dVar2 != null && dVar2.b()) {
            throw new IllegalArgumentException("Ephemeral public key should not be a private key");
        }
        Objects.requireNonNull(fVar);
        this.o = fVar;
        this.f91459p = dVar2;
        this.f91460q = dVar3;
        this.f91461r = bVar3;
        this.f91462s = bVar4;
        this.f91463t = bVar5;
        this.f91464u = i5;
        this.f91465v = bVar6;
        this.f91466w = bVar7;
        this.f91467x = str3;
        this.f91468y = str4;
        this.f91469z = str5;
        this.A = list;
    }

    public static k c(lp.b bVar) throws ParseException {
        Map mapI = lp.d.i(HttpClient.Request.DEFAULT_READ_TIMEOUT_MS, new String(bVar.a(), lp.f.f75086a));
        String strF = lp.d.f("enc", mapI);
        f fVar = f.f91426d;
        if (!strF.equals(fVar.f91409a)) {
            fVar = f.f91427e;
            if (!strF.equals(fVar.f91409a)) {
                fVar = f.f91428f;
                if (!strF.equals(fVar.f91409a)) {
                    fVar = f.f91431i;
                    if (!strF.equals(fVar.f91409a)) {
                        fVar = f.f91432j;
                        if (!strF.equals(fVar.f91409a)) {
                            fVar = f.f91433k;
                            if (!strF.equals(fVar.f91409a)) {
                                fVar = f.f91429g;
                                if (!strF.equals(fVar.f91409a)) {
                                    fVar = f.f91430h;
                                    if (!strF.equals(fVar.f91409a)) {
                                        fVar = f.f91434l;
                                        if (!strF.equals(fVar.f91409a)) {
                                            fVar = new f(strF, 0);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        f fVar2 = fVar;
        int iIntValue = 0;
        i iVarA = null;
        h hVar = null;
        String str = null;
        HashSet hashSet = null;
        URI uriH = null;
        bp.d dVar = null;
        URI uriH2 = null;
        lp.b bVarD = null;
        lp.b bVarD2 = null;
        LinkedList linkedListY = null;
        String str2 = null;
        bp.d dVarC = null;
        d dVar2 = null;
        lp.b bVarD3 = null;
        lp.b bVarD4 = null;
        lp.b bVarD5 = null;
        lp.b bVarD6 = null;
        lp.b bVarD7 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        List listSingletonList = null;
        HashMap map = null;
        for (String str6 : mapI.keySet()) {
            if ("alg".equals(str6)) {
                iVarA = i.a((String) lp.d.c(mapI, str6, String.class));
            } else if ("enc".equals(str6)) {
                continue;
            } else if ("typ".equals(str6)) {
                String str7 = (String) lp.d.c(mapI, str6, String.class);
                if (str7 != null) {
                    hVar = new h(str7);
                }
            } else if ("cty".equals(str6)) {
                str = (String) lp.d.c(mapI, str6, String.class);
            } else if ("crit".equals(str6)) {
                List listG = lp.d.g(str6, mapI);
                if (listG != null) {
                    hashSet = new HashSet(listG);
                }
            } else if ("jku".equals(str6)) {
                uriH = lp.d.h(str6, mapI);
            } else if ("jwk".equals(str6)) {
                Map mapD = lp.d.d(str6, mapI);
                if (mapD == null) {
                    dVar = null;
                } else {
                    bp.d dVarC2 = bp.d.c(mapD);
                    if (dVarC2.b()) {
                        throw new ParseException("Non-public key in jwk header parameter", 0);
                    }
                    dVar = dVarC2;
                }
                if (dVar != null && dVar.b()) {
                    throw new IllegalArgumentException("The JWK must be public");
                }
            } else if ("x5u".equals(str6)) {
                uriH2 = lp.d.h(str6, mapI);
            } else if ("x5t".equals(str6)) {
                bVarD = lp.b.d((String) lp.d.c(mapI, str6, String.class));
            } else if ("x5t#S256".equals(str6)) {
                bVarD2 = lp.b.d((String) lp.d.c(mapI, str6, String.class));
            } else if ("x5c".equals(str6)) {
                linkedListY = u.Y((List) lp.d.c(mapI, str6, List.class));
            } else if ("kid".equals(str6)) {
                str2 = (String) lp.d.c(mapI, str6, String.class);
            } else if ("epk".equals(str6)) {
                dVarC = bp.d.c(lp.d.d(str6, mapI));
            } else if ("zip".equals(str6)) {
                String str8 = (String) lp.d.c(mapI, str6, String.class);
                if (str8 != null) {
                    dVar2 = new d(str8);
                }
            } else if ("apu".equals(str6)) {
                bVarD3 = lp.b.d((String) lp.d.c(mapI, str6, String.class));
            } else if ("apv".equals(str6)) {
                bVarD4 = lp.b.d((String) lp.d.c(mapI, str6, String.class));
            } else if ("p2s".equals(str6)) {
                bVarD5 = lp.b.d((String) lp.d.c(mapI, str6, String.class));
            } else if ("p2c".equals(str6)) {
                Number number = (Number) lp.d.c(mapI, str6, Number.class);
                if (number == null) {
                    throw new ParseException(c0.l("JSON object member ", str6, " is missing or null"), 0);
                }
                iIntValue = number.intValue();
                if (iIntValue < 0) {
                    throw new IllegalArgumentException("The PBES2 count parameter must not be negative");
                }
            } else if ("iv".equals(str6)) {
                bVarD6 = lp.b.d((String) lp.d.c(mapI, str6, String.class));
            } else if ("tag".equals(str6)) {
                bVarD7 = lp.b.d((String) lp.d.c(mapI, str6, String.class));
            } else if ("skid".equals(str6)) {
                str3 = (String) lp.d.c(mapI, str6, String.class);
            } else if ("iss".equals(str6)) {
                str4 = (String) lp.d.c(mapI, str6, String.class);
            } else if ("sub".equals(str6)) {
                str5 = (String) lp.d.c(mapI, str6, String.class);
            } else if ("aud".equals(str6)) {
                listSingletonList = mapI.get(str6) instanceof String ? Collections.singletonList((String) lp.d.c(mapI, str6, String.class)) : lp.d.g(str6, mapI);
            } else {
                Object obj = mapI.get(str6);
                if (B.contains(str6)) {
                    throw new IllegalArgumentException(c0.l("The parameter name \"", str6, "\" matches a registered name"));
                }
                if (map == null) {
                    map = new HashMap();
                }
                HashMap map2 = map;
                map2.put(str6, obj);
                map = map2;
            }
        }
        return new k(iVarA, fVar2, hVar, str, hashSet, uriH, dVar, uriH2, bVarD, bVarD2, linkedListY, str2, dVarC, dVar2, bVarD3, bVarD4, bVarD5, iIntValue, bVarD6, bVarD7, str3, str4, str5, listSingletonList, map, bVar);
    }

    @Override // uo.c
    public final HashMap b() {
        HashMap mapB = super.b();
        f fVar = this.o;
        if (fVar != null) {
            mapB.put("enc", fVar.f91409a);
        }
        bp.d dVar = this.f91459p;
        if (dVar != null) {
            mapB.put("epk", dVar.d());
        }
        d dVar2 = this.f91460q;
        if (dVar2 != null) {
            mapB.put("zip", dVar2.f91424a);
        }
        lp.b bVar = this.f91461r;
        if (bVar != null) {
            mapB.put("apu", bVar.f75082a);
        }
        lp.b bVar2 = this.f91462s;
        if (bVar2 != null) {
            mapB.put("apv", bVar2.f75082a);
        }
        lp.b bVar3 = this.f91463t;
        if (bVar3 != null) {
            mapB.put("p2s", bVar3.f75082a);
        }
        int i5 = this.f91464u;
        if (i5 > 0) {
            mapB.put("p2c", Integer.valueOf(i5));
        }
        lp.b bVar4 = this.f91465v;
        if (bVar4 != null) {
            mapB.put("iv", bVar4.f75082a);
        }
        lp.b bVar5 = this.f91466w;
        if (bVar5 != null) {
            mapB.put("tag", bVar5.f75082a);
        }
        String str = this.f91467x;
        if (str != null) {
            mapB.put("skid", str);
        }
        String str2 = this.f91468y;
        if (str2 != null) {
            mapB.put("iss", str2);
        }
        String str3 = this.f91469z;
        if (str3 != null) {
            mapB.put("sub", str3);
        }
        List list = this.A;
        if (list != null) {
            if (list.size() == 1) {
                mapB.put("aud", list.get(0));
                return mapB;
            }
            if (!list.isEmpty()) {
                mapB.put("aud", list);
            }
        }
        return mapB;
    }
}
