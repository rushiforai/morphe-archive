package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oz5 implements iz5 {
    public static oz5 I;
    public final Method A;
    public final Method B;
    public final Method C;
    public final Method D;
    public final Method E;
    public final Method F;
    public final Object a;
    public final Class b;
    public final Class c;
    public final Class d;
    public final Class e;
    public final Class f;
    public final Class g;
    public final Class h;
    public final Class i;
    public final Class j;
    public final Class k;
    public final Class l;
    public final Class m;
    public final Class n;
    public final Class o;
    public final Method p;
    public final Method q;
    public final Method r;
    public final Method s;
    public final Method t;
    public final Method u;
    public final Method v;
    public final Method w;
    public final Method x;
    public final Method y;
    public final Method z;
    public static final lz5 G = new lz5(1);
    public static final AtomicBoolean H = new AtomicBoolean(false);
    public static final ConcurrentHashMap J = new ConcurrentHashMap();
    public static final ConcurrentHashMap K = new ConcurrentHashMap();
    public static final ConcurrentHashMap L = new ConcurrentHashMap();

    public oz5(Object obj, Class cls, Class cls2, Class cls3, Class cls4, Class cls5, Class cls6, Class cls7, Class cls8, Class cls9, Class cls10, Class cls11, Class cls12, Class cls13, Class cls14, Method method, Method method2, Method method3, Method method4, Method method5, Method method6, Method method7, Method method8, Method method9, Method method10, Method method11, Method method12, Method method13, Method method14, Method method15, Method method16, Method method17) {
        this.a = obj;
        this.b = cls;
        this.c = cls2;
        this.d = cls3;
        this.e = cls4;
        this.f = cls5;
        this.g = cls6;
        this.h = cls7;
        this.i = cls8;
        this.j = cls9;
        this.k = cls10;
        this.l = cls11;
        this.m = cls12;
        this.n = cls13;
        this.o = cls14;
        this.p = method;
        this.q = method2;
        this.r = method3;
        this.s = method4;
        this.t = method5;
        this.u = method6;
        this.v = method7;
        this.w = method8;
        this.x = method9;
        this.y = method10;
        this.z = method11;
        this.A = method12;
        this.B = method13;
        this.C = method14;
        this.D = method15;
        this.E = method16;
        this.F = method17;
    }

    public static final String b() {
        if (ec2.a.contains(oz5.class)) {
            return null;
        }
        return "oz5";
    }

    @Override // defpackage.iz5
    public final void a(wz5 wz5Var, Runnable runnable) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            wz5Var.getClass();
            c(new ss(this, wz5Var, runnable, 11));
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final void c(Runnable runnable) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            if (H.get()) {
                runnable.run();
            } else {
                l(runnable);
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final Object d() {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            return this.a;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    public final String e(String str) {
        if (!ec2.a.contains(this)) {
            try {
                Pattern patternCompile = Pattern.compile("jsonString='(.*?)'");
                patternCompile.getClass();
                Matcher matcher = patternCompile.matcher(str);
                matcher.getClass();
                ij7 ij7VarR = ep7.r(matcher, 0, str);
                if (ij7VarR != null) {
                    return (String) bu1.A0(1, ij7VarR.a());
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return null;
            }
        }
        return null;
    }

    public final Object f(wz5 wz5Var, ArrayList arrayList) {
        Class cls = this.j;
        Class cls2 = this.l;
        if (!ec2.a.contains(this)) {
            try {
                if (!arrayList.isEmpty()) {
                    ArrayList arrayList2 = new ArrayList();
                    Iterator it2 = arrayList.iterator();
                    while (it2.hasNext()) {
                        Object objA0 = xz5.a0(cls2, xz5.a0(cls2, xz5.a0(cls2, xz5.a0(this.f, null, this.z, new Object[0]), this.B, (String) it2.next()), this.C, wz5Var.getType()), this.A, new Object[0]);
                        if (objA0 != null) {
                            arrayList2.add(objA0);
                        }
                    }
                    return xz5.a0(cls, xz5.a0(cls, xz5.a0(this.h, null, this.w, new Object[0]), this.y, arrayList2), this.x, new Object[0]);
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return null;
            }
        }
        return null;
    }

    public final Object g(wz5 wz5Var) {
        Class cls = this.k;
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            return xz5.a0(cls, xz5.a0(cls, xz5.a0(this.i, null, this.r, new Object[0]), this.t, wz5Var.getType()), this.s, new Object[0]);
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    public final void h(Object[] objArr, Object[] objArr2) {
        if (ec2.a.contains(this) || objArr2 == null) {
            return;
        }
        try {
            if (objArr2.length == 0) {
                return;
            }
            if (g76.L(xz5.a0(this.g, objArr2[0], this.F, new Object[0]), 0)) {
                H.set(true);
                if (objArr.length == 0) {
                    return;
                }
                Object obj = objArr[0];
                if (obj instanceof Runnable) {
                    ((Runnable) obj).run();
                }
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final void i(Object[] objArr, Object[] objArr2) {
        String strE;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            Object objY0 = k80.y0(0, objArr);
            Object objY02 = objArr2 != null ? k80.y0(1, objArr2) : null;
            if (objY02 != null && (objY02 instanceof List)) {
                Iterator it2 = ((List) objY02).iterator();
                while (it2.hasNext()) {
                    try {
                        Object objA0 = xz5.a0(this.d, it2.next(), this.D, new Object[0]);
                        String str = objA0 instanceof String ? (String) objA0 : null;
                        if (str != null && (strE = e(str)) != null) {
                            JSONObject jSONObject = new JSONObject(strE);
                            if (jSONObject.has("productId")) {
                                String string = jSONObject.getString("productId");
                                ConcurrentHashMap concurrentHashMap = L;
                                string.getClass();
                                concurrentHashMap.put(string, jSONObject);
                            }
                        }
                    } catch (Exception unused) {
                    }
                }
                if (objY0 == null || !(objY0 instanceof Runnable)) {
                    return;
                }
                ((Runnable) objY0).run();
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final void j(Object[] objArr, Object[] objArr2) {
        oz5 oz5Var;
        Throwable th;
        Object objY0;
        Object objY02;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            objY0 = k80.y0(0, objArr);
        } catch (Throwable th2) {
            th = th2;
            oz5Var = this;
        }
        if (objY0 != null && (objY0 instanceof wz5)) {
            Object objY03 = k80.y0(1, objArr);
            if (objY03 instanceof Runnable) {
                if (objArr2 != null) {
                    try {
                        objY02 = k80.y0(1, objArr2);
                    } catch (Throwable th3) {
                        th = th3;
                        oz5Var = this;
                    }
                } else {
                    objY02 = null;
                }
                if (objY02 != null && (objY02 instanceof List)) {
                    ArrayList arrayList = new ArrayList();
                    Iterator it2 = ((List) objY02).iterator();
                    while (it2.hasNext()) {
                        try {
                            Object objA0 = xz5.a0(this.e, it2.next(), this.u, new Object[0]);
                            String str = objA0 instanceof String ? (String) objA0 : null;
                            if (str != null) {
                                JSONObject jSONObject = new JSONObject(str);
                                if (jSONObject.has("productId")) {
                                    String string = jSONObject.getString("productId");
                                    if (!L.containsKey(string)) {
                                        string.getClass();
                                        arrayList.add(string);
                                    }
                                    if (objY0 == wz5.INAPP) {
                                        ConcurrentHashMap concurrentHashMap = J;
                                        string.getClass();
                                        concurrentHashMap.put(string, jSONObject);
                                    } else {
                                        ConcurrentHashMap concurrentHashMap2 = K;
                                        string.getClass();
                                        concurrentHashMap2.put(string, jSONObject);
                                    }
                                }
                            }
                        } catch (Exception unused) {
                        }
                    }
                    if (arrayList.isEmpty()) {
                        oz5Var = this;
                        try {
                            ((Runnable) objY03).run();
                            return;
                        } catch (Throwable th4) {
                            th = th4;
                        }
                    } else {
                        wz5 wz5Var = (wz5) objY0;
                        Runnable runnable = (Runnable) objY03;
                        try {
                            try {
                                if (ec2.a.contains(this)) {
                                    return;
                                }
                                try {
                                    oz5Var = this;
                                    try {
                                        oz5Var.c(new q13(oz5Var, runnable, wz5Var, arrayList, 2));
                                        return;
                                    } catch (Throwable th5) {
                                        th = th5;
                                        try {
                                            ec2.a(oz5Var, th);
                                            return;
                                        } catch (Throwable th6) {
                                            th = th6;
                                            th = th;
                                            ec2.a(oz5Var, th);
                                        }
                                    }
                                } catch (Throwable th7) {
                                    th = th7;
                                    oz5Var = this;
                                }
                            } catch (Throwable th8) {
                                th = th8;
                                oz5Var = this;
                            }
                        } catch (Throwable th9) {
                            th = th9;
                            oz5Var = this;
                        }
                    }
                }
                return;
            }
            return;
            th = th;
            ec2.a(oz5Var, th);
        }
    }

    public final void k(Object[] objArr, Object[] objArr2) {
        oz5 oz5Var;
        Throwable th;
        Object objY0;
        Object objY02;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            objY0 = k80.y0(0, objArr);
        } catch (Throwable th2) {
            th = th2;
            oz5Var = this;
        }
        if (objY0 != null && (objY0 instanceof wz5)) {
            Object objY03 = k80.y0(1, objArr);
            if (objY03 instanceof Runnable) {
                if (objArr2 != null) {
                    try {
                        objY02 = k80.y0(1, objArr2);
                    } catch (Throwable th3) {
                        th = th3;
                        oz5Var = this;
                    }
                } else {
                    objY02 = null;
                }
                if (objY02 != null && (objY02 instanceof List)) {
                    ArrayList arrayList = new ArrayList();
                    Iterator it2 = ((List) objY02).iterator();
                    while (it2.hasNext()) {
                        Object objA0 = xz5.a0(this.c, it2.next(), this.p, new Object[0]);
                        String str = objA0 instanceof String ? (String) objA0 : null;
                        if (str != null) {
                            JSONObject jSONObject = new JSONObject(str);
                            if (jSONObject.has("productId")) {
                                String string = jSONObject.getString("productId");
                                if (!L.containsKey(string)) {
                                    string.getClass();
                                    arrayList.add(string);
                                }
                                if (objY0 == wz5.INAPP) {
                                    ConcurrentHashMap concurrentHashMap = J;
                                    string.getClass();
                                    concurrentHashMap.put(string, jSONObject);
                                } else {
                                    ConcurrentHashMap concurrentHashMap2 = K;
                                    string.getClass();
                                    concurrentHashMap2.put(string, jSONObject);
                                }
                            }
                        }
                    }
                    if (arrayList.isEmpty()) {
                        oz5Var = this;
                        try {
                            ((Runnable) objY03).run();
                            return;
                        } catch (Throwable th4) {
                            th = th4;
                        }
                    } else {
                        wz5 wz5Var = (wz5) objY0;
                        Runnable runnable = (Runnable) objY03;
                        try {
                            try {
                                if (ec2.a.contains(this)) {
                                    return;
                                }
                                try {
                                    oz5Var = this;
                                    try {
                                        oz5Var.c(new q13(oz5Var, runnable, wz5Var, arrayList, 2));
                                        return;
                                    } catch (Throwable th5) {
                                        th = th5;
                                        try {
                                            ec2.a(oz5Var, th);
                                            return;
                                        } catch (Throwable th6) {
                                            th = th6;
                                            th = th;
                                            ec2.a(oz5Var, th);
                                        }
                                    }
                                } catch (Throwable th7) {
                                    th = th7;
                                    oz5Var = this;
                                }
                            } catch (Throwable th8) {
                                th = th8;
                                oz5Var = this;
                            }
                        } catch (Throwable th9) {
                            th = th9;
                            oz5Var = this;
                        }
                    }
                }
                return;
            }
            return;
            th = th;
            ec2.a(oz5Var, th);
        }
    }

    public final void l(Runnable runnable) {
        Class cls = this.m;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            Object objNewProxyInstance = Proxy.newProxyInstance(cls.getClassLoader(), new Class[]{cls}, new mz5(this, new Object[]{runnable}, 1));
            xz5.a0(this.b, d(), this.E, objNewProxyInstance);
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
