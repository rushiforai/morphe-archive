package defpackage;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.LinkedHashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xbb {
    public static final Pattern y = Pattern.compile("\\{([a-zA-Z][a-zA-Z0-9_-]*)\\}");
    public static final Pattern z = Pattern.compile("[a-zA-Z][a-zA-Z0-9_-]*");
    public final kjb a;
    public final Class b;
    public final Method c;
    public final Annotation[] d;
    public final Annotation[][] e;
    public final Type[] f;
    public boolean g;
    public boolean h;
    public boolean i;
    public boolean j;
    public boolean k;
    public boolean l;
    public boolean m;
    public boolean n;
    public String o;
    public boolean p;
    public boolean q;
    public boolean r;
    public String s;
    public yi5 t;
    public fn7 u;
    public LinkedHashSet v;
    public to7[] w;
    public boolean x;

    public xbb(kjb kjbVar, Class cls, Method method) {
        this.a = kjbVar;
        this.b = cls;
        this.c = method;
        this.d = method.getAnnotations();
        this.f = method.getGenericParameterTypes();
        this.e = method.getParameterAnnotations();
    }

    public static Class a(Class cls) {
        return Boolean.TYPE == cls ? Boolean.class : Byte.TYPE == cls ? Byte.class : Character.TYPE == cls ? Character.class : Double.TYPE == cls ? Double.class : Float.TYPE == cls ? Float.class : Integer.TYPE == cls ? Integer.class : Long.TYPE == cls ? Long.class : Short.TYPE == cls ? Short.class : cls;
    }

    public final void b(String str, String str2, boolean z2) {
        String str3 = this.o;
        Method method = this.c;
        if (str3 != null) {
            throw vv2.R(method, null, "Only one HTTP method is allowed. Found: %s and %s.", str3, str);
        }
        this.o = str;
        this.p = z2;
        if (str2.isEmpty()) {
            return;
        }
        int iIndexOf = str2.indexOf(63);
        Pattern pattern = y;
        if (iIndexOf != -1 && iIndexOf < str2.length() - 1) {
            String strSubstring = str2.substring(iIndexOf + 1);
            if (pattern.matcher(strSubstring).find()) {
                throw vv2.R(method, null, "URL query string \"%s\" must not have replace block. For dynamic query parameters use @Query.", strSubstring);
            }
        }
        this.s = str2;
        Matcher matcher = pattern.matcher(str2);
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        while (matcher.find()) {
            linkedHashSet.add(matcher.group(1));
        }
        this.v = linkedHashSet;
    }

    public final void c(int i, Type type) {
        if (vv2.N(type)) {
            throw vv2.S(this.c, i, "Parameter type must not include a type variable or wildcard: %s", type);
        }
    }
}
