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
import java.util.Set;
import p7.u;

/* loaded from: classes4.dex */
public final class n extends c {

    /* renamed from: p, reason: collision with root package name */
    public static final Set f91490p;
    public final boolean o;

    static {
        HashSet hashSet = new HashSet();
        hashSet.add("alg");
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
        hashSet.add("b64");
        f91490p = Collections.unmodifiableSet(hashSet);
    }

    public n(m mVar, h hVar, String str, Set set, URI uri, bp.d dVar, URI uri2, lp.b bVar, lp.b bVar2, List list, String str2, boolean z11, Map map, lp.b bVar3) {
        super(mVar, hVar, str, set, uri, dVar, uri2, bVar, bVar2, list, str2, map, bVar3);
        if (mVar.f91409a.equals(a.f91408b.f91409a)) {
            throw new IllegalArgumentException("The JWS algorithm \"alg\" cannot be \"none\"");
        }
        this.o = z11;
    }

    public static n c(lp.b bVar) throws ParseException {
        a aVarA;
        Map mapI = lp.d.i(HttpClient.Request.DEFAULT_READ_TIMEOUT_MS, new String(bVar.a(), lp.f.f75086a));
        String strF = lp.d.f("alg", mapI);
        if (strF == null) {
            throw new ParseException("Missing \"alg\" in header JSON object", 0);
        }
        a aVar = a.f91408b;
        if (strF.equals(aVar.f91409a)) {
            aVarA = aVar;
        } else if (mapI.containsKey("enc")) {
            aVarA = i.a(strF);
        } else {
            m mVar = m.f91476c;
            if (!strF.equals(mVar.f91409a)) {
                mVar = m.f91477d;
                if (!strF.equals(mVar.f91409a)) {
                    mVar = m.f91478e;
                    if (!strF.equals(mVar.f91409a)) {
                        mVar = m.f91479f;
                        if (!strF.equals(mVar.f91409a)) {
                            mVar = m.f91480g;
                            if (!strF.equals(mVar.f91409a)) {
                                mVar = m.f91481h;
                                if (!strF.equals(mVar.f91409a)) {
                                    mVar = m.f91482i;
                                    if (!strF.equals(mVar.f91409a)) {
                                        mVar = m.f91483j;
                                        if (!strF.equals(mVar.f91409a)) {
                                            mVar = m.f91484k;
                                            if (!strF.equals(mVar.f91409a)) {
                                                mVar = m.f91485l;
                                                if (!strF.equals(mVar.f91409a)) {
                                                    mVar = m.f91486m;
                                                    if (!strF.equals(mVar.f91409a)) {
                                                        mVar = m.n;
                                                        if (!strF.equals(mVar.f91409a)) {
                                                            mVar = m.o;
                                                            if (!strF.equals(mVar.f91409a)) {
                                                                mVar = m.f91487p;
                                                                if (!strF.equals(mVar.f91409a)) {
                                                                    mVar = m.f91488q;
                                                                    if (!strF.equals(mVar.f91409a)) {
                                                                        mVar = m.f91489r;
                                                                        if (!strF.equals(mVar.f91409a)) {
                                                                            mVar = new m(strF);
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            aVarA = mVar;
        }
        if (!(aVarA instanceof m)) {
            throw new ParseException("Not a JWS header", 0);
        }
        m mVar2 = (m) aVarA;
        if (mVar2.f91409a.equals(aVar.f91409a)) {
            throw new IllegalArgumentException("The JWS algorithm \"alg\" cannot be \"none\"");
        }
        boolean zBooleanValue = true;
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
        HashMap map = null;
        for (String str3 : mapI.keySet()) {
            if (!"alg".equals(str3)) {
                if ("typ".equals(str3)) {
                    String str4 = (String) lp.d.c(mapI, str3, String.class);
                    if (str4 != null) {
                        hVar = new h(str4);
                    }
                } else if ("cty".equals(str3)) {
                    str = (String) lp.d.c(mapI, str3, String.class);
                } else if ("crit".equals(str3)) {
                    List listG = lp.d.g(str3, mapI);
                    if (listG != null) {
                        hashSet = new HashSet(listG);
                    }
                } else if ("jku".equals(str3)) {
                    uriH = lp.d.h(str3, mapI);
                } else if ("jwk".equals(str3)) {
                    Map mapD = lp.d.d(str3, mapI);
                    if (mapD == null) {
                        dVar = null;
                    } else {
                        bp.d dVarC = bp.d.c(mapD);
                        if (dVarC.b()) {
                            throw new ParseException("Non-public key in jwk header parameter", 0);
                        }
                        dVar = dVarC;
                    }
                    if (dVar != null && dVar.b()) {
                        throw new IllegalArgumentException("The JWK must be public");
                    }
                } else if ("x5u".equals(str3)) {
                    uriH2 = lp.d.h(str3, mapI);
                } else if ("x5t".equals(str3)) {
                    bVarD = lp.b.d((String) lp.d.c(mapI, str3, String.class));
                } else if ("x5t#S256".equals(str3)) {
                    bVarD2 = lp.b.d((String) lp.d.c(mapI, str3, String.class));
                } else if ("x5c".equals(str3)) {
                    linkedListY = u.Y((List) lp.d.c(mapI, str3, List.class));
                } else if ("kid".equals(str3)) {
                    str2 = (String) lp.d.c(mapI, str3, String.class);
                } else if ("b64".equals(str3)) {
                    Boolean bool = (Boolean) lp.d.c(mapI, str3, Boolean.class);
                    if (bool == null) {
                        throw new ParseException(c0.l("JSON object member ", str3, " is missing or null"), 0);
                    }
                    zBooleanValue = bool.booleanValue();
                } else {
                    Object obj = mapI.get(str3);
                    if (f91490p.contains(str3)) {
                        throw new IllegalArgumentException(c0.l("The parameter name \"", str3, "\" matches a registered name"));
                    }
                    if (map == null) {
                        map = new HashMap();
                    }
                    HashMap map2 = map;
                    map2.put(str3, obj);
                    map = map2;
                }
            }
        }
        return new n(mVar2, hVar, str, hashSet, uriH, dVar, uriH2, bVarD, bVarD2, linkedListY, str2, zBooleanValue, map, bVar);
    }

    @Override // uo.c
    public final HashMap b() {
        HashMap mapB = super.b();
        if (!this.o) {
            mapB.put("b64", Boolean.FALSE);
        }
        return mapB;
    }
}
