package defpackage;

import com.google.gson.JsonIOException;
import com.google.gson.JsonSyntaxException;
import com.google.gson.stream.MalformedJsonException;
import j$.util.Objects;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.EOFException;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.io.Writer;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ch5 {
    public final ThreadLocal a;
    public final ConcurrentHashMap b;
    public final o72 c;
    public final mb6 d;
    public final List e;
    public final i44 f;
    public final rf4 g;
    public final HashMap h;
    public final boolean i;
    public final boolean j;
    public final r05 k;
    public final boolean l;
    public final int m;
    public final int n;
    public final xa7 o;
    public final List p;
    public final List q;
    public final umd r;
    public final umd s;
    public final List t;

    public ch5(dh5 dh5Var) {
        this.a = new ThreadLocal();
        this.b = new ConcurrentHashMap();
        this.f = dh5Var.a;
        this.g = dh5Var.c;
        HashMap map = new HashMap(dh5Var.d);
        this.h = map;
        this.i = dh5Var.g;
        this.j = dh5Var.j;
        this.k = dh5Var.k;
        boolean z = dh5Var.l;
        this.l = z;
        this.o = dh5Var.b;
        this.m = dh5Var.h;
        this.n = dh5Var.i;
        this.p = dh5.b(dh5Var.e);
        this.q = dh5.b(dh5Var.f);
        this.r = dh5Var.m;
        this.s = dh5Var.n;
        List listB = dh5.b(dh5Var.o);
        this.t = listB;
        if (dh5Var == dh5.v) {
            this.c = dh5.t;
            this.d = dh5.u;
            this.e = dh5.w;
        } else {
            o72 o72Var = new o72(map, z, listB);
            this.c = o72Var;
            mb6 mb6Var = new mb6(o72Var);
            this.d = mb6Var;
            this.e = dh5Var.a(o72Var, mb6Var);
        }
    }

    public final Object a(gd6 gd6Var, kxd kxdVar) {
        boolean z;
        euc eucVar = gd6Var.b;
        if (eucVar == euc.LEGACY_STRICT) {
            gd6Var.E0(euc.LENIENT);
        }
        try {
            try {
                try {
                    gd6Var.p0();
                    z = false;
                    try {
                        jud judVarD = d(kxdVar);
                        Object objB = judVarD.b(gd6Var);
                        Class clsJ = er7.J(kxdVar.c());
                        if (objB != null && !clsJ.isInstance(objB)) {
                            throw new ClassCastException("Type adapter '" + judVarD + "' returned wrong type; requested " + kxdVar.c() + " but got instance of " + objB.getClass() + "\nVerify that the adapter was registered for the correct type.");
                        }
                        return objB;
                    } catch (EOFException e) {
                        e = e;
                        if (!z) {
                            throw new JsonSyntaxException(e);
                        }
                        gd6Var.E0(eucVar);
                        return null;
                    }
                } catch (EOFException e2) {
                    e = e2;
                    z = true;
                }
            } catch (IOException e3) {
                throw new JsonSyntaxException(e3);
            } catch (AssertionError e4) {
                throw new AssertionError("AssertionError (GSON 2.14.0): " + e4.getMessage(), e4);
            } catch (IllegalStateException e5) {
                throw new JsonSyntaxException(e5);
            }
        } finally {
            gd6Var.E0(eucVar);
        }
    }

    public final Object b(Reader reader, kxd kxdVar) {
        gd6 gd6Var = new gd6(reader);
        gd6Var.E0(euc.LEGACY_STRICT);
        Object objA = a(gd6Var, kxdVar);
        if (objA != null) {
            try {
                if (gd6Var.p0() != jd6.END_DOCUMENT) {
                    throw new JsonSyntaxException("JSON document was not fully consumed.");
                }
            } catch (MalformedJsonException e) {
                throw new JsonSyntaxException(e);
            } catch (IOException e2) {
                throw new JsonIOException(e2);
            }
        }
        return objA;
    }

    public final Object c(Class cls, String str) {
        kxd kxdVarA = kxd.a(cls);
        if (str == null) {
            return null;
        }
        return b(new StringReader(str), kxdVarA);
    }

    public final jud d(kxd kxdVar) {
        boolean z;
        Objects.requireNonNull(kxdVar, "type must not be null");
        ConcurrentHashMap concurrentHashMap = this.b;
        jud judVar = (jud) concurrentHashMap.get(kxdVar);
        if (judVar != null) {
            return judVar;
        }
        ThreadLocal threadLocal = this.a;
        Map map = (Map) threadLocal.get();
        if (map == null) {
            map = new HashMap();
            threadLocal.set(map);
            z = true;
        } else {
            jud judVar2 = (jud) map.get(kxdVar);
            if (judVar2 != null) {
                return judVar2;
            }
            z = false;
        }
        try {
            bh5 bh5Var = new bh5();
            map.put(kxdVar, bh5Var);
            Iterator it2 = this.e.iterator();
            jud judVarA = null;
            while (true) {
                if (!it2.hasNext()) {
                    break;
                }
                judVarA = ((kud) it2.next()).a(this, kxdVar);
                if (judVarA != null) {
                    if (bh5Var.a != null) {
                        throw new AssertionError("Delegate is already set");
                    }
                    bh5Var.a = judVarA;
                    map.put(kxdVar, judVarA);
                }
            }
            if (z) {
                threadLocal.remove();
            }
            if (judVarA == null) {
                ik4.h("GSON (2.14.0) cannot handle ", kxdVar);
                return null;
            }
            if (z) {
                concurrentHashMap.putAll(map);
            }
            return judVarA;
        } catch (Throwable th) {
            if (z) {
                threadLocal.remove();
            }
            throw th;
        }
    }

    public final jud e(Class cls) {
        return d(kxd.a(cls));
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0059  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.jud f(defpackage.kud r7, defpackage.kxd r8) {
        /*
            r6 = this;
            java.lang.String r0 = "skipPast must not be null"
            j$.util.Objects.requireNonNull(r7, r0)
            java.lang.String r0 = "type must not be null"
            j$.util.Objects.requireNonNull(r8, r0)
            mb6 r0 = r6.d
            r0.getClass()
            j$.util.concurrent.ConcurrentHashMap r1 = r0.b
            lb6 r2 = defpackage.mb6.c
            r3 = 1
            if (r7 != r2) goto L17
            goto L59
        L17:
            java.lang.Class r2 = r8.c()
            java.lang.Object r4 = r1.get(r2)
            kud r4 = (defpackage.kud) r4
            if (r4 == 0) goto L26
            if (r4 != r7) goto L5a
            goto L59
        L26:
            java.lang.Class<kb6> r4 = defpackage.kb6.class
            java.lang.annotation.Annotation r4 = r2.getAnnotation(r4)
            kb6 r4 = (defpackage.kb6) r4
            if (r4 != 0) goto L31
            goto L5a
        L31:
            java.lang.Class r4 = r4.value()
            java.lang.Class<kud> r5 = defpackage.kud.class
            boolean r5 = r5.isAssignableFrom(r4)
            if (r5 != 0) goto L3e
            goto L5a
        L3e:
            o72 r5 = r0.a
            kxd r4 = defpackage.kxd.a(r4)
            km8 r4 = r5.c(r4, r3)
            java.lang.Object r4 = r4.g()
            kud r4 = (defpackage.kud) r4
            java.lang.Object r1 = r1.putIfAbsent(r2, r4)
            kud r1 = (defpackage.kud) r1
            if (r1 == 0) goto L57
            r4 = r1
        L57:
            if (r4 != r7) goto L5a
        L59:
            r7 = r0
        L5a:
            java.util.List r0 = r6.e
            java.util.Iterator r0 = r0.iterator()
            r1 = 0
        L61:
            boolean r2 = r0.hasNext()
            if (r2 == 0) goto L7a
            java.lang.Object r2 = r0.next()
            kud r2 = (defpackage.kud) r2
            if (r1 != 0) goto L73
            if (r2 != r7) goto L61
            r1 = r3
            goto L61
        L73:
            jud r2 = r2.a(r6, r8)
            if (r2 == 0) goto L61
            return r2
        L7a:
            if (r1 != 0) goto L81
            jud r6 = r6.d(r8)
            return r6
        L81:
            java.lang.String r6 = "GSON cannot serialize or deserialize "
            defpackage.ik4.h(r6, r8)
            r6 = 0
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ch5.f(kud, kxd):jud");
    }

    public final yd6 g(Writer writer) {
        yd6 yd6Var = new yd6(writer);
        yd6Var.T(this.k);
        yd6Var.i = this.j;
        yd6Var.U(euc.LEGACY_STRICT);
        yd6Var.k = this.i;
        return yd6Var;
    }

    public final String h(Object obj) {
        if (obj == null) {
            StringBuilder sb = new StringBuilder();
            try {
                i(g(new auc(sb)));
                return sb.toString();
            } catch (IOException e) {
                throw new JsonIOException(e);
            }
        }
        Class<?> cls = obj.getClass();
        StringBuilder sb2 = new StringBuilder();
        try {
            j(obj, cls, g(new auc(sb2)));
            return sb2.toString();
        } catch (IOException e2) {
            throw new JsonIOException(e2);
        }
    }

    public final void i(yd6 yd6Var) {
        pc6 pc6Var = pc6.a;
        euc eucVar = yd6Var.h;
        boolean z = yd6Var.i;
        boolean z2 = yd6Var.k;
        yd6Var.i = this.j;
        yd6Var.k = this.i;
        if (eucVar == euc.LEGACY_STRICT) {
            yd6Var.U(euc.LENIENT);
        }
        try {
            try {
                jc6.a.getClass();
                jc6.g(yd6Var, pc6Var);
                yd6Var.U(eucVar);
                yd6Var.i = z;
                yd6Var.k = z2;
            } catch (IOException e) {
                throw new JsonIOException(e);
            } catch (AssertionError e2) {
                throw new AssertionError("AssertionError (GSON 2.14.0): " + e2.getMessage(), e2);
            }
        } catch (Throwable th) {
            yd6Var.U(eucVar);
            yd6Var.i = z;
            yd6Var.k = z2;
            throw th;
        }
    }

    public final void j(Object obj, Type type, yd6 yd6Var) {
        jud judVarD = d(kxd.b(type));
        euc eucVar = yd6Var.h;
        if (eucVar == euc.LEGACY_STRICT) {
            yd6Var.U(euc.LENIENT);
        }
        boolean z = yd6Var.i;
        boolean z2 = yd6Var.k;
        yd6Var.i = this.j;
        yd6Var.k = this.i;
        try {
            try {
                judVarD.c(yd6Var, obj);
            } catch (IOException e) {
                throw new JsonIOException(e);
            } catch (AssertionError e2) {
                throw new AssertionError("AssertionError (GSON 2.14.0): " + e2.getMessage(), e2);
            }
        } finally {
            yd6Var.U(eucVar);
            yd6Var.i = z;
            yd6Var.k = z2;
        }
    }

    public final String toString() {
        return "{serializeNulls:" + this.i + ",factories:" + this.e + ",instanceCreators:" + this.c + "}";
    }

    public ch5() {
        this(dh5.v);
    }
}
