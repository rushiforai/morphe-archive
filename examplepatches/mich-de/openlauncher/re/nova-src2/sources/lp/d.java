package lp;

import b.c0;
import com.nimbusds.jose.shaded.gson.JsonIOException;
import cp.m;
import cp.n;
import cp.x;
import ep.g;
import ep.i;
import java.io.IOException;
import java.io.StringWriter;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.net.URI;
import java.net.URISyntaxException;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes4.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final m f75084a;

    static {
        n nVar = new n();
        nVar.f47777l = 3;
        nVar.f47772g = true;
        nVar.n = x.f47786c;
        nVar.f47775j = false;
        f75084a = nVar.a();
    }

    public static b a(String str, Map map) {
        String strF = f(str, map);
        if (strF == null) {
            return null;
        }
        return new b(strF);
    }

    public static Date b(String str, Map map) {
        Number number = (Number) c(map, str, Number.class);
        if (number == null) {
            return null;
        }
        return new Date(number.longValue() * 1000);
    }

    public static Object c(Map map, String str, Class cls) throws ParseException {
        if (map.get(str) == null) {
            return null;
        }
        Object obj = map.get(str);
        if (cls.isAssignableFrom(obj.getClass())) {
            return obj;
        }
        throw new ParseException(c0.l("Unexpected type of JSON object member ", str, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), 0);
    }

    public static Map d(String str, Map map) {
        Map map2 = (Map) c(map, str, Map.class);
        if (map2 == null) {
            return null;
        }
        Iterator it = map2.keySet().iterator();
        while (it.hasNext()) {
            if (!(it.next() instanceof String)) {
                throw new ParseException(c0.l("JSON object member ", str, " not a JSON object"), 0);
            }
        }
        return map2;
    }

    public static long e(String str, Map map) throws ParseException {
        Number number = (Number) c(map, str, Number.class);
        if (number != null) {
            return number.longValue();
        }
        throw new ParseException(c0.l("JSON object member ", str, " is missing or null"), 0);
    }

    public static String f(String str, Map map) {
        return (String) c(map, str, String.class);
    }

    public static List g(String str, Map map) {
        String[] strArr;
        List list = (List) c(map, str, List.class);
        if (list == null) {
            strArr = null;
        } else {
            try {
                strArr = (String[]) list.toArray(new String[0]);
            } catch (ArrayStoreException unused) {
                throw new ParseException(c0.l("JSON object member ", str, " is not an array of strings"), 0);
            }
        }
        if (strArr == null) {
            return null;
        }
        return Arrays.asList(strArr);
    }

    public static URI h(String str, Map map) {
        String strF = f(str, map);
        if (strF == null) {
            return null;
        }
        try {
            return new URI(strF);
        } catch (URISyntaxException e3) {
            throw new ParseException(e3.getMessage(), 0);
        }
    }

    public static Map i(int i5, String str) {
        if (str == null) {
            throw new ParseException("The JSON object string must not be null", 0);
        }
        if (str.trim().isEmpty()) {
            throw new ParseException("Invalid JSON object", 0);
        }
        if (i5 >= 0 && str.length() > i5) {
            throw new ParseException(c0.i(i5, "The parsed string is longer than the max accepted size of ", " characters"), 0);
        }
        Type[] typeArr = {String.class, Object.class};
        TypeVariable[] typeParameters = Map.class.getTypeParameters();
        int length = typeParameters.length;
        if (2 != length) {
            throw new IllegalArgumentException(Map.class.getName() + " requires " + length + " type arguments, but got 2");
        }
        if (!Modifier.isStatic(Map.class.getModifiers()) && Map.class.getDeclaringClass() != null) {
            throw new IllegalArgumentException("Raw type " + Map.class.getName() + " is not supported because it requires specifying an owner type");
        }
        for (int i11 = 0; i11 < length; i11++) {
            Type type = typeArr[i11];
            Objects.requireNonNull(type, "Type argument must not be null");
            Class<?> clsH = i.h(type);
            TypeVariable typeVariable = typeParameters[i11];
            for (Type type2 : typeVariable.getBounds()) {
                if (!i.h(type2).isAssignableFrom(clsH)) {
                    throw new IllegalArgumentException("Type argument " + type + " does not satisfy bounds for type variable " + typeVariable + " declared by " + Map.class);
                }
            }
        }
        Type typeA = i.a(new g(null, Map.class, typeArr));
        i.h(typeA);
        typeA.hashCode();
        try {
            return (Map) f75084a.b(str, typeA);
        } catch (Exception unused) {
            throw new ParseException("Invalid JSON object", 0);
        } catch (StackOverflowError unused2) {
            throw new ParseException("Excessive JSON object and / or array nesting", 0);
        }
    }

    public static String j(Map map) {
        Objects.requireNonNull(map);
        m mVar = f75084a;
        mVar.getClass();
        Class<?> cls = map.getClass();
        StringWriter stringWriter = new StringWriter();
        try {
            kp.b bVar = new kp.b(stringWriter);
            bVar.w(mVar.f47764h);
            bVar.f72109i = mVar.f47763g;
            int i5 = mVar.f47765i;
            if (i5 == 0) {
                i5 = 2;
            }
            bVar.A(i5);
            bVar.f72111k = mVar.f47762f;
            mVar.d(map, cls, bVar);
            return stringWriter.toString();
        } catch (IOException e3) {
            throw new JsonIOException(e3);
        }
    }
}
