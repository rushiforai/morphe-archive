package eb0;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.LinkedHashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes5.dex */
public final class n0 {

    /* renamed from: y, reason: collision with root package name */
    public static final Pattern f52592y = Pattern.compile("\\{([a-zA-Z][a-zA-Z0-9_-]*)\\}");

    /* renamed from: z, reason: collision with root package name */
    public static final Pattern f52593z = Pattern.compile("[a-zA-Z][a-zA-Z0-9_-]*");

    /* renamed from: a, reason: collision with root package name */
    public final bm.t f52594a;

    /* renamed from: b, reason: collision with root package name */
    public final Class f52595b;

    /* renamed from: c, reason: collision with root package name */
    public final Method f52596c;

    /* renamed from: d, reason: collision with root package name */
    public final Annotation[] f52597d;

    /* renamed from: e, reason: collision with root package name */
    public final Annotation[][] f52598e;

    /* renamed from: f, reason: collision with root package name */
    public final Type[] f52599f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f52600g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f52601h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f52602i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f52603j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f52604k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f52605l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f52606m;
    public boolean n;
    public String o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f52607p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f52608q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f52609r;

    /* renamed from: s, reason: collision with root package name */
    public String f52610s;

    /* renamed from: t, reason: collision with root package name */
    public x80.u f52611t;

    /* renamed from: u, reason: collision with root package name */
    public x80.a0 f52612u;

    /* renamed from: v, reason: collision with root package name */
    public LinkedHashSet f52613v;

    /* renamed from: w, reason: collision with root package name */
    public w0[] f52614w;

    /* renamed from: x, reason: collision with root package name */
    public boolean f52615x;

    public n0(bm.t tVar, Class cls, Method method) {
        this.f52594a = tVar;
        this.f52595b = cls;
        this.f52596c = method;
        this.f52597d = method.getAnnotations();
        this.f52599f = method.getGenericParameterTypes();
        this.f52598e = method.getParameterAnnotations();
    }

    public static Class a(Class cls) {
        return Boolean.TYPE == cls ? Boolean.class : Byte.TYPE == cls ? Byte.class : Character.TYPE == cls ? Character.class : Double.TYPE == cls ? Double.class : Float.TYPE == cls ? Float.class : Integer.TYPE == cls ? Integer.class : Long.TYPE == cls ? Long.class : Short.TYPE == cls ? Short.class : cls;
    }

    public final void b(String str, String str2, boolean z11) {
        String str3 = this.o;
        Method method = this.f52596c;
        if (str3 != null) {
            throw w0.n(method, null, "Only one HTTP method is allowed. Found: %s and %s.", str3, str);
        }
        this.o = str;
        this.f52607p = z11;
        if (str2.isEmpty()) {
            return;
        }
        int iIndexOf = str2.indexOf(63);
        Pattern pattern = f52592y;
        if (iIndexOf != -1 && iIndexOf < str2.length() - 1) {
            String strSubstring = str2.substring(iIndexOf + 1);
            if (pattern.matcher(strSubstring).find()) {
                throw w0.n(method, null, "URL query string \"%s\" must not have replace block. For dynamic query parameters use @Query.", strSubstring);
            }
        }
        this.f52610s = str2;
        Matcher matcher = pattern.matcher(str2);
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        while (matcher.find()) {
            linkedHashSet.add(matcher.group(1));
        }
        this.f52613v = linkedHashSet;
    }

    public final void c(int i5, Type type) {
        if (w0.j(type)) {
            throw w0.o(this.f52596c, i5, "Parameter type must not include a type variable or wildcard: %s", type);
        }
    }
}
