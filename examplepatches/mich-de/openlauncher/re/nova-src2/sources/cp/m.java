package cp;

import com.nimbusds.jose.shaded.gson.JsonIOException;
import com.nimbusds.jose.shaded.gson.JsonSyntaxException;
import com.nimbusds.jose.shaded.gson.stream.MalformedJsonException;
import e1.m0;
import java.io.EOFException;
import java.io.IOException;
import java.io.StringReader;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicLongArray;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: j, reason: collision with root package name */
    public static final i f47754j = i.f47746d;

    /* renamed from: k, reason: collision with root package name */
    public static final t f47755k = x.f47784a;

    /* renamed from: l, reason: collision with root package name */
    public static final u f47756l = x.f47785b;

    /* renamed from: a, reason: collision with root package name */
    public final ThreadLocal f47757a = new ThreadLocal();

    /* renamed from: b, reason: collision with root package name */
    public final ConcurrentHashMap f47758b = new ConcurrentHashMap();

    /* renamed from: c, reason: collision with root package name */
    public final m0 f47759c;

    /* renamed from: d, reason: collision with root package name */
    public final fp.q f47760d;

    /* renamed from: e, reason: collision with root package name */
    public final List f47761e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f47762f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f47763g;

    /* renamed from: h, reason: collision with root package name */
    public final i f47764h;

    /* renamed from: i, reason: collision with root package name */
    public final int f47765i;

    public m(ep.e eVar, a aVar, HashMap map, boolean z11, boolean z12, i iVar, int i5, boolean z13, int i11, ArrayList arrayList, ArrayList arrayList2, ArrayList arrayList3, x xVar, x xVar2, ArrayList arrayList4) {
        m0 m0Var = new m0(map, z13, arrayList4, 1);
        this.f47759c = m0Var;
        this.f47762f = z11;
        this.f47763g = z12;
        this.f47764h = iVar;
        this.f47765i = i5;
        ArrayList arrayList5 = new ArrayList();
        arrayList5.add(fp.s.A);
        arrayList5.add(xVar == x.f47784a ? fp.j.f55510c : new fp.h(xVar, 1));
        arrayList5.add(eVar);
        arrayList5.addAll(arrayList3);
        arrayList5.add(fp.s.f55555p);
        arrayList5.add(fp.s.f55548g);
        arrayList5.add(fp.s.f55545d);
        arrayList5.add(fp.s.f55546e);
        arrayList5.add(fp.s.f55547f);
        z jVar = i11 == 1 ? fp.s.f55552k : new j(2);
        arrayList5.add(new fp.r(Long.TYPE, Long.class, jVar));
        arrayList5.add(new fp.r(Double.TYPE, Double.class, new j(0)));
        arrayList5.add(new fp.r(Float.TYPE, Float.class, new j(1)));
        arrayList5.add(xVar2 == x.f47785b ? fp.i.f55508b : new fp.h(new fp.i(xVar2), 0));
        arrayList5.add(fp.s.f55549h);
        arrayList5.add(fp.s.f55550i);
        arrayList5.add(new fp.q(AtomicLong.class, new k(jVar, 0).a(), 0));
        int i12 = 0;
        arrayList5.add(new fp.q(AtomicLongArray.class, new k(jVar, 1).a(), i12));
        arrayList5.add(fp.s.f55551j);
        arrayList5.add(fp.s.f55553l);
        arrayList5.add(fp.s.f55556q);
        arrayList5.add(fp.s.f55557r);
        arrayList5.add(new fp.q(BigDecimal.class, fp.s.f55554m, i12));
        arrayList5.add(new fp.q(BigInteger.class, fp.s.n, i12));
        arrayList5.add(new fp.q(ep.k.class, fp.s.o, i12));
        arrayList5.add(fp.s.f55558s);
        arrayList5.add(fp.s.f55559t);
        arrayList5.add(fp.s.f55561v);
        arrayList5.add(fp.s.f55562w);
        arrayList5.add(fp.s.f55564y);
        arrayList5.add(fp.s.f55560u);
        arrayList5.add(fp.s.f55543b);
        arrayList5.add(fp.b.f55491e);
        arrayList5.add(fp.s.f55563x);
        if (ip.c.f67954a) {
            arrayList5.add(ip.c.f67958e);
            arrayList5.add(ip.c.f67957d);
            arrayList5.add(ip.c.f67959f);
        }
        arrayList5.add(fp.b.f55490d);
        arrayList5.add(fp.s.f55542a);
        arrayList5.add(new fp.c(m0Var, 0));
        arrayList5.add(new fp.c(m0Var, 1));
        fp.q qVar = new fp.q(m0Var);
        this.f47760d = qVar;
        arrayList5.add(qVar);
        arrayList5.add(fp.s.B);
        arrayList5.add(new fp.p(m0Var, aVar, eVar, qVar, arrayList4));
        this.f47761e = Collections.unmodifiableList(arrayList5);
    }

    public static void a(double d5) {
        if (Double.isNaN(d5) || Double.isInfinite(d5)) {
            throw new IllegalArgumentException(d5 + " is not a valid double value as per JSON specification. To override this behavior, use GsonBuilder.serializeSpecialFloatingPointValues() method.");
        }
    }

    public final Object b(String str, Type type) {
        Object objB;
        jp.a aVar = new jp.a(type);
        Object obj = null;
        if (str == null) {
            return null;
        }
        kp.a aVar2 = new kp.a(new StringReader(str));
        int i5 = this.f47765i;
        int i11 = i5 == 0 ? 2 : i5;
        if (i11 == 0) {
            throw null;
        }
        aVar2.o = i11;
        boolean z11 = true;
        if (i5 != 0) {
            if (i5 == 0) {
                throw null;
            }
            aVar2.o = i5;
        } else if (i11 == 2) {
            aVar2.o = 1;
        }
        try {
            try {
                try {
                    try {
                        aVar2.f0();
                        z11 = false;
                        z zVarC = c(aVar);
                        Class cls = aVar.f69629a;
                        objB = zVarC.b(aVar2);
                        Class clsL = ep.i.l(cls);
                        if (objB != null && !clsL.isInstance(objB)) {
                            throw new ClassCastException("Type adapter '" + zVarC + "' returned wrong type; requested " + cls + " but got instance of " + objB.getClass() + "\nVerify that the adapter was registered for the correct type.");
                        }
                    } catch (EOFException e3) {
                        if (!z11) {
                            throw new JsonSyntaxException(e3);
                        }
                        if (i11 == 0) {
                            throw null;
                        }
                        aVar2.o = i11;
                    }
                    if (i11 == 0) {
                        throw null;
                    }
                    aVar2.o = i11;
                    obj = objB;
                    if (obj != null) {
                        try {
                            if (aVar2.f0() != 10) {
                                throw new JsonSyntaxException("JSON document was not fully consumed.");
                            }
                        } catch (MalformedJsonException e11) {
                            throw new JsonSyntaxException(e11);
                        } catch (IOException e12) {
                            throw new JsonIOException(e12);
                        }
                    }
                    return obj;
                } catch (IllegalStateException e13) {
                    throw new JsonSyntaxException(e13);
                }
            } catch (IOException e14) {
                throw new JsonSyntaxException(e14);
            } catch (AssertionError e15) {
                throw new AssertionError("AssertionError (GSON 2.13.1): " + e15.getMessage(), e15);
            }
        } catch (Throwable th2) {
            if (i11 == 0) {
                throw null;
            }
            aVar2.o = i11;
            throw th2;
        }
    }

    public final z c(jp.a aVar) {
        boolean z11;
        ConcurrentHashMap concurrentHashMap = this.f47758b;
        z zVar = (z) concurrentHashMap.get(aVar);
        if (zVar != null) {
            return zVar;
        }
        ThreadLocal threadLocal = this.f47757a;
        Map map = (Map) threadLocal.get();
        if (map == null) {
            map = new HashMap();
            threadLocal.set(map);
            z11 = true;
        } else {
            z zVar2 = (z) map.get(aVar);
            if (zVar2 != null) {
                return zVar2;
            }
            z11 = false;
        }
        try {
            l lVar = new l();
            z zVarA = null;
            lVar.f47753a = null;
            map.put(aVar, lVar);
            Iterator it = this.f47761e.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                zVarA = ((a0) it.next()).a(this, aVar);
                if (zVarA != null) {
                    if (lVar.f47753a != null) {
                        throw new AssertionError("Delegate is already set");
                    }
                    lVar.f47753a = zVarA;
                    map.put(aVar, zVarA);
                }
            }
            if (z11) {
                threadLocal.remove();
            }
            if (zVarA != null) {
                if (z11) {
                    concurrentHashMap.putAll(map);
                }
                return zVarA;
            }
            throw new IllegalArgumentException("GSON (2.13.1) cannot handle " + aVar);
        } catch (Throwable th2) {
            if (z11) {
                threadLocal.remove();
            }
            throw th2;
        }
    }

    public final void d(Map map, Class cls, kp.b bVar) {
        z zVarC = c(new jp.a(cls));
        int i5 = bVar.f72108h;
        int i11 = this.f47765i;
        if (i11 != 0) {
            bVar.A(i11);
        } else if (i5 == 2) {
            bVar.f72108h = 1;
        }
        boolean z11 = bVar.f72109i;
        boolean z12 = bVar.f72111k;
        bVar.f72109i = this.f47763g;
        bVar.f72111k = this.f47762f;
        try {
            try {
                try {
                    zVarC.c(bVar, map);
                } catch (IOException e3) {
                    throw new JsonIOException(e3);
                }
            } catch (AssertionError e11) {
                throw new AssertionError("AssertionError (GSON 2.13.1): " + e11.getMessage(), e11);
            }
        } finally {
            bVar.A(i5);
            bVar.f72109i = z11;
            bVar.f72111k = z12;
        }
    }

    public final String toString() {
        return "{serializeNulls:" + this.f47762f + ",factories:" + this.f47761e + ",instanceCreators:" + this.f47759c + "}";
    }
}
