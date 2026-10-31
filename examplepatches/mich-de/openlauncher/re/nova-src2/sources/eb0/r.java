package eb0;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;
import java.net.URI;
import java.util.Map;
import java.util.regex.Pattern;
import kotlin.coroutines.Continuation;

/* loaded from: classes5.dex */
public abstract class r {

    /* renamed from: a, reason: collision with root package name */
    public final o0 f52639a;

    /* renamed from: b, reason: collision with root package name */
    public final x80.h f52640b;

    /* renamed from: c, reason: collision with root package name */
    public final m f52641c;

    public r(o0 o0Var, x80.h hVar, m mVar) {
        this.f52639a = o0Var;
        this.f52640b = hVar;
        this.f52641c = mVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:52:0x0118, code lost:
    
        throw eb0.w0.n(r29, null, "@Headers value must be in the form \"Name: Value\". Found: \"%s\"", r14);
     */
    /* JADX WARN: Removed duplicated region for block: B:386:0x08f3  */
    /* JADX WARN: Removed duplicated region for block: B:590:0x08f7 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static r c(bm.t tVar, Class cls, Method method) {
        Type genericReturnType;
        boolean z11;
        boolean z12;
        boolean zM;
        w0 w0Var;
        int i5;
        int i11;
        w0[] w0VarArr;
        int i12;
        int i13;
        String str;
        w0 i0Var;
        w0 e0Var;
        z zVar;
        z zVar2;
        n0 n0Var = new n0(tVar, cls, method);
        Annotation[] annotationArr = n0Var.f52597d;
        int length = annotationArr.length;
        int i14 = 0;
        int i15 = 0;
        loop0: while (true) {
            String str2 = "HEAD";
            boolean z13 = true;
            w0 w0Var2 = null;
            if (i15 >= length) {
                if (n0Var.o == null) {
                    throw w0.n(method, null, "HTTP method annotation is required (e.g., @GET, @POST, etc.).", new Object[0]);
                }
                if (!n0Var.f52607p) {
                    if (n0Var.f52609r) {
                        throw w0.n(method, null, "Multipart can only be specified on HTTP methods with request body (e.g., @POST).", new Object[0]);
                    }
                    if (n0Var.f52608q) {
                        throw w0.n(method, null, "FormUrlEncoded can only be specified on HTTP methods with request body (e.g., @POST).", new Object[0]);
                    }
                }
                Annotation[][] annotationArr2 = n0Var.f52598e;
                int length2 = annotationArr2.length;
                n0Var.f52614w = new w0[length2];
                int i16 = length2 - 1;
                int i17 = 0;
                while (i17 < length2) {
                    w0[] w0VarArr2 = n0Var.f52614w;
                    Type type = n0Var.f52599f[i17];
                    Annotation[] annotationArr3 = annotationArr2[i17];
                    int i18 = i17 == i16 ? 1 : i14;
                    if (annotationArr3 != null) {
                        int length3 = annotationArr3.length;
                        w0Var = w0Var2;
                        int i19 = i14;
                        while (i19 < length3) {
                            Annotation annotation = annotationArr3[i19];
                            Annotation[][] annotationArr4 = annotationArr2;
                            int i21 = length2;
                            if (annotation instanceof gb0.y) {
                                n0Var.c(i17, type);
                                if (n0Var.n) {
                                    throw w0.o(method, i17, "Multiple @Url method annotations found.", new Object[0]);
                                }
                                if (n0Var.f52603j) {
                                    throw w0.o(method, i17, "@Path parameters may not be used with @Url.", new Object[0]);
                                }
                                if (n0Var.f52604k) {
                                    throw w0.o(method, i17, "A @Url parameter must not come after a @Query.", new Object[0]);
                                }
                                if (n0Var.f52605l) {
                                    throw w0.o(method, i17, "A @Url parameter must not come after a @QueryName.", new Object[0]);
                                }
                                if (n0Var.f52606m) {
                                    throw w0.o(method, i17, "A @Url parameter must not come after a @QueryMap.", new Object[0]);
                                }
                                if (n0Var.f52610s != null) {
                                    throw w0.o(method, i17, "@Url cannot be used with @%s URL", n0Var.o);
                                }
                                n0Var.n = true;
                                if (type != x80.w.class && type != String.class && type != URI.class && (!(type instanceof Class) || !"android.net.Uri".equals(((Class) type).getName()))) {
                                    throw w0.o(method, i17, "@Url must be okhttp3.HttpUrl, String, java.net.URI, or android.net.Uri type.", new Object[0]);
                                }
                                i0Var = new d0(method, i17, 1);
                                str = str2;
                                i5 = i16;
                            } else {
                                i5 = i16;
                                boolean z14 = annotation instanceof gb0.s;
                                bm.t tVar2 = n0Var.f52594a;
                                if (z14) {
                                    n0Var.c(i17, type);
                                    if (n0Var.f52604k) {
                                        throw w0.o(method, i17, "A @Path parameter must not come after a @Query.", new Object[0]);
                                    }
                                    if (n0Var.f52605l) {
                                        throw w0.o(method, i17, "A @Path parameter must not come after a @QueryName.", new Object[0]);
                                    }
                                    if (n0Var.f52606m) {
                                        throw w0.o(method, i17, "A @Path parameter must not come after a @QueryMap.", new Object[0]);
                                    }
                                    if (n0Var.n) {
                                        throw w0.o(method, i17, "@Path parameters may not be used with @Url.", new Object[0]);
                                    }
                                    if (n0Var.f52610s == null) {
                                        throw w0.o(method, i17, "@Path can only be used with relative url on @%s", n0Var.o);
                                    }
                                    n0Var.f52603j = true;
                                    gb0.s sVar = (gb0.s) annotation;
                                    String strValue = sVar.value();
                                    if (!n0.f52593z.matcher(strValue).matches()) {
                                        throw w0.o(method, i17, "@Path parameter name must match %s. Found: %s", n0.f52592y.pattern(), strValue);
                                    }
                                    if (!n0Var.f52613v.contains(strValue)) {
                                        throw w0.o(method, i17, "URL \"%s\" does not contain \"{%s}\".", n0Var.f52610s, strValue);
                                    }
                                    tVar2.x(type, annotationArr3);
                                    i0Var = new f0(n0Var.f52596c, i17, strValue, sVar.encoded());
                                    str = str2;
                                } else {
                                    i11 = i19;
                                    w0VarArr = w0VarArr2;
                                    if (annotation instanceof gb0.t) {
                                        n0Var.c(i17, type);
                                        gb0.t tVar3 = (gb0.t) annotation;
                                        String strValue2 = tVar3.value();
                                        boolean zEncoded = tVar3.encoded();
                                        i12 = i18;
                                        Class clsH = w0.h(type);
                                        i13 = length3;
                                        n0Var.f52604k = true;
                                        if (Iterable.class.isAssignableFrom(clsH)) {
                                            if (!(type instanceof ParameterizedType)) {
                                                throw w0.o(method, i17, clsH.getSimpleName() + " must include generic type (e.g., " + clsH.getSimpleName() + "<String>)", new Object[0]);
                                            }
                                            tVar2.x(w0.g(0, (ParameterizedType) type), annotationArr3);
                                            zVar2 = new z(new b0(2, strValue2, zEncoded), 0);
                                        } else if (clsH.isArray()) {
                                            tVar2.x(n0.a(clsH.getComponentType()), annotationArr3);
                                            zVar2 = new z(new b0(2, strValue2, zEncoded), 1);
                                        } else {
                                            tVar2.x(type, annotationArr3);
                                            i0Var = new b0(2, strValue2, zEncoded);
                                            str = str2;
                                        }
                                        i0Var = zVar2;
                                        str = str2;
                                    } else {
                                        i12 = i18;
                                        i13 = length3;
                                        if (annotation instanceof gb0.v) {
                                            n0Var.c(i17, type);
                                            boolean zEncoded2 = ((gb0.v) annotation).encoded();
                                            Class clsH2 = w0.h(type);
                                            n0Var.f52605l = true;
                                            if (Iterable.class.isAssignableFrom(clsH2)) {
                                                if (!(type instanceof ParameterizedType)) {
                                                    throw w0.o(method, i17, clsH2.getSimpleName() + " must include generic type (e.g., " + clsH2.getSimpleName() + "<String>)", new Object[0]);
                                                }
                                                tVar2.x(w0.g(0, (ParameterizedType) type), annotationArr3);
                                                zVar2 = new z(new g0(zEncoded2), 0);
                                            } else if (clsH2.isArray()) {
                                                tVar2.x(n0.a(clsH2.getComponentType()), annotationArr3);
                                                zVar2 = new z(new g0(zEncoded2), 1);
                                            } else {
                                                tVar2.x(type, annotationArr3);
                                                i0Var = new g0(zEncoded2);
                                            }
                                            i0Var = zVar2;
                                        } else if (annotation instanceof gb0.u) {
                                            n0Var.c(i17, type);
                                            Class clsH3 = w0.h(type);
                                            n0Var.f52606m = true;
                                            if (!Map.class.isAssignableFrom(clsH3)) {
                                                throw w0.o(method, i17, "@QueryMap parameter type must be Map.", new Object[0]);
                                            }
                                            Type typeI = w0.i(type, clsH3);
                                            if (!(typeI instanceof ParameterizedType)) {
                                                throw w0.o(method, i17, "Map must include generic types (e.g., Map<String, String>)", new Object[0]);
                                            }
                                            ParameterizedType parameterizedType = (ParameterizedType) typeI;
                                            Type typeG = w0.g(0, parameterizedType);
                                            if (String.class != typeG) {
                                                throw w0.o(method, i17, "@QueryMap keys must be of type String: " + typeG, new Object[0]);
                                            }
                                            tVar2.x(w0.g(1, parameterizedType), annotationArr3);
                                            i0Var = new c0(method, i17, ((gb0.u) annotation).encoded(), 2);
                                        } else {
                                            str = str2;
                                            if (annotation instanceof gb0.i) {
                                                n0Var.c(i17, type);
                                                gb0.i iVar = (gb0.i) annotation;
                                                String strValue3 = iVar.value();
                                                Class clsH4 = w0.h(type);
                                                if (Iterable.class.isAssignableFrom(clsH4)) {
                                                    if (!(type instanceof ParameterizedType)) {
                                                        throw w0.o(method, i17, clsH4.getSimpleName() + " must include generic type (e.g., " + clsH4.getSimpleName() + "<String>)", new Object[0]);
                                                    }
                                                    tVar2.x(w0.g(0, (ParameterizedType) type), annotationArr3);
                                                    e0Var = new z(new b0(1, strValue3, iVar.allowUnsafeNonAsciiValues()), 0);
                                                } else if (clsH4.isArray()) {
                                                    tVar2.x(n0.a(clsH4.getComponentType()), annotationArr3);
                                                    e0Var = new z(new b0(1, strValue3, iVar.allowUnsafeNonAsciiValues()), 1);
                                                } else {
                                                    tVar2.x(type, annotationArr3);
                                                    i0Var = new b0(1, strValue3, iVar.allowUnsafeNonAsciiValues());
                                                }
                                                i0Var = e0Var;
                                            } else if (annotation instanceof gb0.j) {
                                                if (type == x80.u.class) {
                                                    i0Var = new d0(method, i17, 0);
                                                } else {
                                                    n0Var.c(i17, type);
                                                    Class clsH5 = w0.h(type);
                                                    if (!Map.class.isAssignableFrom(clsH5)) {
                                                        throw w0.o(method, i17, "@HeaderMap parameter type must be Map or Headers.", new Object[0]);
                                                    }
                                                    Type typeI2 = w0.i(type, clsH5);
                                                    if (!(typeI2 instanceof ParameterizedType)) {
                                                        throw w0.o(method, i17, "Map must include generic types (e.g., Map<String, String>)", new Object[0]);
                                                    }
                                                    ParameterizedType parameterizedType2 = (ParameterizedType) typeI2;
                                                    Type typeG2 = w0.g(0, parameterizedType2);
                                                    if (String.class != typeG2) {
                                                        throw w0.o(method, i17, "@HeaderMap keys must be of type String: " + typeG2, new Object[0]);
                                                    }
                                                    tVar2.x(w0.g(1, parameterizedType2), annotationArr3);
                                                    i0Var = new c0(method, i17, ((gb0.j) annotation).allowUnsafeNonAsciiValues(), 1);
                                                }
                                            } else if (annotation instanceof gb0.c) {
                                                n0Var.c(i17, type);
                                                if (!n0Var.f52608q) {
                                                    throw w0.o(method, i17, "@Field parameters can only be used with form encoding.", new Object[0]);
                                                }
                                                gb0.c cVar = (gb0.c) annotation;
                                                String strValue4 = cVar.value();
                                                boolean zEncoded3 = cVar.encoded();
                                                n0Var.f52600g = true;
                                                Class clsH6 = w0.h(type);
                                                if (Iterable.class.isAssignableFrom(clsH6)) {
                                                    if (!(type instanceof ParameterizedType)) {
                                                        throw w0.o(method, i17, clsH6.getSimpleName() + " must include generic type (e.g., " + clsH6.getSimpleName() + "<String>)", new Object[0]);
                                                    }
                                                    tVar2.x(w0.g(0, (ParameterizedType) type), annotationArr3);
                                                    e0Var = new z(new b0(0, strValue4, zEncoded3), 0);
                                                } else if (clsH6.isArray()) {
                                                    tVar2.x(n0.a(clsH6.getComponentType()), annotationArr3);
                                                    e0Var = new z(new b0(0, strValue4, zEncoded3), 1);
                                                } else {
                                                    tVar2.x(type, annotationArr3);
                                                    i0Var = new b0(0, strValue4, zEncoded3);
                                                }
                                                i0Var = e0Var;
                                            } else if (annotation instanceof gb0.d) {
                                                n0Var.c(i17, type);
                                                if (!n0Var.f52608q) {
                                                    throw w0.o(method, i17, "@FieldMap parameters can only be used with form encoding.", new Object[0]);
                                                }
                                                Class clsH7 = w0.h(type);
                                                if (!Map.class.isAssignableFrom(clsH7)) {
                                                    throw w0.o(method, i17, "@FieldMap parameter type must be Map.", new Object[0]);
                                                }
                                                Type typeI3 = w0.i(type, clsH7);
                                                if (!(typeI3 instanceof ParameterizedType)) {
                                                    throw w0.o(method, i17, "Map must include generic types (e.g., Map<String, String>)", new Object[0]);
                                                }
                                                ParameterizedType parameterizedType3 = (ParameterizedType) typeI3;
                                                Type typeG3 = w0.g(0, parameterizedType3);
                                                if (String.class != typeG3) {
                                                    throw w0.o(method, i17, "@FieldMap keys must be of type String: " + typeG3, new Object[0]);
                                                }
                                                tVar2.x(w0.g(1, parameterizedType3), annotationArr3);
                                                n0Var.f52600g = true;
                                                i0Var = new c0(method, i17, ((gb0.d) annotation).encoded(), 0);
                                            } else if (annotation instanceof gb0.q) {
                                                n0Var.c(i17, type);
                                                if (!n0Var.f52609r) {
                                                    throw w0.o(method, i17, "@Part parameters can only be used with multipart encoding.", new Object[0]);
                                                }
                                                gb0.q qVar = (gb0.q) annotation;
                                                n0Var.f52601h = true;
                                                String strValue5 = qVar.value();
                                                Class clsH8 = w0.h(type);
                                                if (strValue5.isEmpty()) {
                                                    boolean zIsAssignableFrom = Iterable.class.isAssignableFrom(clsH8);
                                                    h0 h0Var = h0.f52565d;
                                                    if (zIsAssignableFrom) {
                                                        if (!(type instanceof ParameterizedType)) {
                                                            throw w0.o(method, i17, clsH8.getSimpleName() + " must include generic type (e.g., " + clsH8.getSimpleName() + "<String>)", new Object[0]);
                                                        }
                                                        if (!x80.b0.class.isAssignableFrom(w0.h(w0.g(0, (ParameterizedType) type)))) {
                                                            throw w0.o(method, i17, "@Part annotation must supply a name or use MultipartBody.Part parameter type.", new Object[0]);
                                                        }
                                                        i0Var = new z(h0Var, 0);
                                                    } else if (clsH8.isArray()) {
                                                        if (!x80.b0.class.isAssignableFrom(clsH8.getComponentType())) {
                                                            throw w0.o(method, i17, "@Part annotation must supply a name or use MultipartBody.Part parameter type.", new Object[0]);
                                                        }
                                                        i0Var = new z(h0Var, 1);
                                                    } else {
                                                        if (!x80.b0.class.isAssignableFrom(clsH8)) {
                                                            throw w0.o(method, i17, "@Part annotation must supply a name or use MultipartBody.Part parameter type.", new Object[0]);
                                                        }
                                                        i0Var = h0Var;
                                                    }
                                                } else {
                                                    x80.u uVarO = v4.a.o("Content-Disposition", b.c0.l("form-data; name=\"", strValue5, "\""), "Content-Transfer-Encoding", qVar.encoding());
                                                    if (Iterable.class.isAssignableFrom(clsH8)) {
                                                        if (!(type instanceof ParameterizedType)) {
                                                            throw w0.o(method, i17, clsH8.getSimpleName() + " must include generic type (e.g., " + clsH8.getSimpleName() + "<String>)", new Object[0]);
                                                        }
                                                        Type typeG4 = w0.g(0, (ParameterizedType) type);
                                                        if (x80.b0.class.isAssignableFrom(w0.h(typeG4))) {
                                                            throw w0.o(method, i17, "@Part parameters using the MultipartBody.Part must not include a part name in the annotation.", new Object[0]);
                                                        }
                                                        zVar = new z(new e0(method, i17, uVarO, tVar2.r(typeG4, annotationArr3, annotationArr)), 0);
                                                    } else if (clsH8.isArray()) {
                                                        Class clsA = n0.a(clsH8.getComponentType());
                                                        if (x80.b0.class.isAssignableFrom(clsA)) {
                                                            throw w0.o(method, i17, "@Part parameters using the MultipartBody.Part must not include a part name in the annotation.", new Object[0]);
                                                        }
                                                        zVar = new z(new e0(method, i17, uVarO, tVar2.r(clsA, annotationArr3, annotationArr)), 1);
                                                    } else {
                                                        if (x80.b0.class.isAssignableFrom(clsH8)) {
                                                            throw w0.o(method, i17, "@Part parameters using the MultipartBody.Part must not include a part name in the annotation.", new Object[0]);
                                                        }
                                                        e0Var = new e0(method, i17, uVarO, tVar2.r(type, annotationArr3, annotationArr));
                                                        i0Var = e0Var;
                                                    }
                                                    i0Var = zVar;
                                                }
                                            } else if (annotation instanceof gb0.r) {
                                                n0Var.c(i17, type);
                                                if (!n0Var.f52609r) {
                                                    throw w0.o(method, i17, "@PartMap parameters can only be used with multipart encoding.", new Object[0]);
                                                }
                                                n0Var.f52601h = true;
                                                Class clsH9 = w0.h(type);
                                                if (!Map.class.isAssignableFrom(clsH9)) {
                                                    throw w0.o(method, i17, "@PartMap parameter type must be Map.", new Object[0]);
                                                }
                                                Type typeI4 = w0.i(type, clsH9);
                                                if (!(typeI4 instanceof ParameterizedType)) {
                                                    throw w0.o(method, i17, "Map must include generic types (e.g., Map<String, String>)", new Object[0]);
                                                }
                                                ParameterizedType parameterizedType4 = (ParameterizedType) typeI4;
                                                Type typeG5 = w0.g(0, parameterizedType4);
                                                if (String.class != typeG5) {
                                                    throw w0.o(method, i17, "@PartMap keys must be of type String: " + typeG5, new Object[0]);
                                                }
                                                Type typeG6 = w0.g(1, parameterizedType4);
                                                if (x80.b0.class.isAssignableFrom(w0.h(typeG6))) {
                                                    throw w0.o(method, i17, "@PartMap values cannot be MultipartBody.Part. Use @Part List<Part> or a different value type instead.", new Object[0]);
                                                }
                                                i0Var = new e0(method, i17, tVar2.r(typeG6, annotationArr3, annotationArr), ((gb0.r) annotation).encoding());
                                            } else if (annotation instanceof gb0.a) {
                                                n0Var.c(i17, type);
                                                if (n0Var.f52608q || n0Var.f52609r) {
                                                    throw w0.o(method, i17, "@Body parameters cannot be used with form or multi-part encoding.", new Object[0]);
                                                }
                                                if (n0Var.f52602i) {
                                                    throw w0.o(method, i17, "Multiple @Body method annotations found.", new Object[0]);
                                                }
                                                try {
                                                    m mVarR = tVar2.r(type, annotationArr3, annotationArr);
                                                    n0Var.f52602i = true;
                                                    i0Var = new a0(method, i17, mVarR);
                                                } catch (RuntimeException e3) {
                                                    throw w0.p(method, e3, i17, "Unable to create @Body converter for %s", type);
                                                }
                                            } else if (annotation instanceof gb0.x) {
                                                n0Var.c(i17, type);
                                                Class clsH10 = w0.h(type);
                                                for (int i22 = i17 - 1; i22 >= 0; i22--) {
                                                    w0 w0Var3 = n0Var.f52614w[i22];
                                                    if ((w0Var3 instanceof i0) && ((i0) w0Var3).f52568d.equals(clsH10)) {
                                                        throw w0.o(method, i17, "@Tag type " + clsH10.getName() + " is duplicate of " + j0.f52571b.c(method, i22) + " and would always overwrite its value.", new Object[0]);
                                                    }
                                                }
                                                i0Var = new i0(clsH10);
                                            } else {
                                                i0Var = null;
                                            }
                                        }
                                        str = str2;
                                    }
                                    if (i0Var != null) {
                                        if (w0Var != null) {
                                            throw w0.o(method, i17, "Multiple Retrofit annotations found, only one allowed.", new Object[0]);
                                        }
                                        w0Var = i0Var;
                                    }
                                    i19 = i11 + 1;
                                    annotationArr2 = annotationArr4;
                                    i16 = i5;
                                    length2 = i21;
                                    i18 = i12;
                                    str2 = str;
                                    w0VarArr2 = w0VarArr;
                                    length3 = i13;
                                }
                            }
                            i11 = i19;
                            w0VarArr = w0VarArr2;
                            i12 = i18;
                            i13 = length3;
                            if (i0Var != null) {
                            }
                            i19 = i11 + 1;
                            annotationArr2 = annotationArr4;
                            i16 = i5;
                            length2 = i21;
                            i18 = i12;
                            str2 = str;
                            w0VarArr2 = w0VarArr;
                            length3 = i13;
                        }
                    } else {
                        w0Var = null;
                    }
                    Annotation[][] annotationArr5 = annotationArr2;
                    int i23 = length2;
                    String str3 = str2;
                    int i24 = i16;
                    w0[] w0VarArr3 = w0VarArr2;
                    int i25 = i18;
                    if (w0Var == null) {
                        if (i25 != 0) {
                            try {
                                if (w0.h(type) == Continuation.class) {
                                    n0Var.f52615x = true;
                                    w0Var = null;
                                }
                            } catch (NoClassDefFoundError unused) {
                            }
                        }
                        throw w0.o(method, i17, "No Retrofit annotation found.", new Object[0]);
                    }
                    w0VarArr3[i17] = w0Var;
                    i17++;
                    annotationArr2 = annotationArr5;
                    i16 = i24;
                    length2 = i23;
                    str2 = str3;
                    i14 = 0;
                    w0Var2 = null;
                }
                String str4 = str2;
                if (n0Var.f52610s == null && !n0Var.n) {
                    throw w0.n(method, null, "Missing either @%s URL or @Url parameter.", n0Var.o);
                }
                boolean z15 = n0Var.f52608q;
                if (!z15 && !n0Var.f52609r && !n0Var.f52607p && n0Var.f52602i) {
                    throw w0.n(method, null, "Non-body HTTP method cannot contain @Body.", new Object[0]);
                }
                if (z15 && !n0Var.f52600g) {
                    throw w0.n(method, null, "Form-encoded method must contain at least one @Field.", new Object[0]);
                }
                if (n0Var.f52609r && !n0Var.f52601h) {
                    throw w0.n(method, null, "Multipart method must contain at least one @Part.", new Object[0]);
                }
                o0 o0Var = new o0(n0Var);
                Type genericReturnType2 = method.getGenericReturnType();
                if (w0.j(genericReturnType2)) {
                    throw w0.n(method, null, "Method return type must not include a type variable or wildcard: %s", genericReturnType2);
                }
                if (genericReturnType2 == Void.TYPE) {
                    throw w0.n(method, null, "Service methods cannot return void.", new Object[0]);
                }
                Annotation[] annotations = method.getAnnotations();
                boolean z16 = o0Var.f52628l;
                if (z16) {
                    Type[] genericParameterTypes = method.getGenericParameterTypes();
                    Type typeG7 = ((ParameterizedType) genericParameterTypes[genericParameterTypes.length - 1]).getActualTypeArguments()[0];
                    if (typeG7 instanceof WildcardType) {
                        typeG7 = ((WildcardType) typeG7).getLowerBounds()[0];
                    }
                    if (w0.h(typeG7) == p0.class && (typeG7 instanceof ParameterizedType)) {
                        typeG7 = w0.g(0, (ParameterizedType) typeG7);
                        zM = false;
                        z12 = true;
                    } else {
                        if (w0.h(typeG7) == d.class) {
                            throw w0.n(method, null, "Suspend functions should not return Call, as they already execute asynchronously.\nChange its return type to %s", w0.g(0, (ParameterizedType) typeG7));
                        }
                        zM = w0.m(typeG7);
                        z12 = false;
                    }
                    genericReturnType = new u0(null, d.class, typeG7);
                    if (!w0.l(annotations, r0.class)) {
                        Annotation[] annotationArr6 = new Annotation[annotations.length + 1];
                        annotationArr6[0] = s0.f52646c;
                        System.arraycopy(annotations, 0, annotationArr6, 1, annotations.length);
                        annotations = annotationArr6;
                    }
                    z11 = zM;
                } else {
                    genericReturnType = method.getGenericReturnType();
                    z11 = false;
                    z12 = false;
                }
                try {
                    f fVarK = tVar.k(genericReturnType, annotations);
                    Type typeC = fVarK.c();
                    if (typeC == x80.m0.class) {
                        throw w0.n(method, null, "'" + w0.h(typeC).getName() + "' is not a valid response body type. Did you mean ResponseBody?", new Object[0]);
                    }
                    if (typeC == p0.class) {
                        throw w0.n(method, null, "Response must include generic type (e.g., Response<String>)", new Object[0]);
                    }
                    if (o0Var.f52620d.equals(str4) && !Void.class.equals(typeC) && !w0.m(typeC)) {
                        throw w0.n(method, null, "HEAD method must use Void or Unit as response type.", new Object[0]);
                    }
                    try {
                        m mVarS = tVar.s(typeC, method.getAnnotations());
                        x80.h hVar = (x80.h) tVar.f18111c;
                        if (z16) {
                            return z12 ? new p(o0Var, hVar, mVarS, fVarK, 1) : new q(o0Var, hVar, mVarS, fVarK, z11);
                        }
                        return new p(o0Var, hVar, mVarS, fVarK, 0);
                    } catch (RuntimeException e11) {
                        throw w0.n(method, e11, "Unable to create converter for %s", typeC);
                    }
                } catch (RuntimeException e12) {
                    throw w0.n(method, e12, "Unable to create call adapter for %s", genericReturnType);
                }
            }
            Annotation annotation2 = annotationArr[i15];
            if (annotation2 instanceof gb0.b) {
                n0Var.b("DELETE", ((gb0.b) annotation2).value(), false);
            } else if (annotation2 instanceof gb0.f) {
                n0Var.b("GET", ((gb0.f) annotation2).value(), false);
            } else if (annotation2 instanceof gb0.g) {
                n0Var.b("HEAD", ((gb0.g) annotation2).value(), false);
            } else if (annotation2 instanceof gb0.n) {
                n0Var.b("PATCH", ((gb0.n) annotation2).value(), true);
            } else if (annotation2 instanceof gb0.o) {
                n0Var.b("POST", ((gb0.o) annotation2).value(), true);
            } else if (annotation2 instanceof gb0.p) {
                n0Var.b("PUT", ((gb0.p) annotation2).value(), true);
            } else if (annotation2 instanceof gb0.m) {
                n0Var.b("OPTIONS", ((gb0.m) annotation2).value(), false);
            } else if (annotation2 instanceof gb0.h) {
                gb0.h hVar2 = (gb0.h) annotation2;
                n0Var.b(hVar2.method(), hVar2.path(), hVar2.hasBody());
            } else if (annotation2 instanceof gb0.k) {
                gb0.k kVar = (gb0.k) annotation2;
                String[] strArrValue = kVar.value();
                if (strArrValue.length == 0) {
                    throw w0.n(method, null, "@Headers annotation is empty.", new Object[0]);
                }
                boolean zAllowUnsafeNonAsciiValues = kVar.allowUnsafeNonAsciiValues();
                o2.h hVar3 = new o2.h(1);
                int length4 = strArrValue.length;
                int i26 = 0;
                while (i26 < length4) {
                    String str5 = strArrValue[i26];
                    int iIndexOf = str5.indexOf(58);
                    boolean z17 = z13;
                    if (iIndexOf == -1 || iIndexOf == 0 || iIndexOf == str5.length() - 1) {
                        break loop0;
                    }
                    String strSubstring = str5.substring(0, iIndexOf);
                    String strTrim = str5.substring(iIndexOf + 1).trim();
                    if ("Content-Type".equalsIgnoreCase(strSubstring)) {
                        try {
                            Pattern pattern = x80.a0.f95396e;
                            n0Var.f52612u = x80.z.a(strTrim);
                        } catch (IllegalArgumentException e13) {
                            throw w0.n(method, e13, "Malformed content type: %s", strTrim);
                        }
                    } else if (zAllowUnsafeNonAsciiValues) {
                        hVar3.d(strSubstring, strTrim);
                    } else {
                        hVar3.a(strSubstring, strTrim);
                    }
                    i26++;
                    z13 = z17;
                }
                n0Var.f52611t = hVar3.f();
            } else if (annotation2 instanceof gb0.l) {
                if (n0Var.f52608q) {
                    throw w0.n(method, null, "Only one encoding annotation is allowed.", new Object[0]);
                }
                n0Var.f52609r = true;
            } else if (!(annotation2 instanceof gb0.e)) {
                continue;
            } else {
                if (n0Var.f52609r) {
                    throw w0.n(method, null, "Only one encoding annotation is allowed.", new Object[0]);
                }
                n0Var.f52608q = true;
            }
            i15++;
        }
    }

    public abstract Object a(y yVar, Object[] objArr);

    public final Object b(Object obj, Object[] objArr) {
        return a(new y(this.f52639a, obj, objArr, this.f52640b, this.f52641c), objArr);
    }
}
