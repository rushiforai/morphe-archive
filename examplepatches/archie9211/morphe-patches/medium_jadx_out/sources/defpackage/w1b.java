package defpackage;

import com.google.gson.JsonIOException;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class w1b {
    public static final to7 a;

    static {
        to7 u1bVar;
        try {
            u1bVar = new v1b();
        } catch (ReflectiveOperationException unused) {
            u1bVar = new u1b();
        }
        a = u1bVar;
    }

    public static void a(AccessibleObject accessibleObject, StringBuilder sb) {
        sb.append('(');
        Class<?>[] parameterTypes = accessibleObject instanceof Method ? ((Method) accessibleObject).getParameterTypes() : ((Constructor) accessibleObject).getParameterTypes();
        for (int i = 0; i < parameterTypes.length; i++) {
            if (i > 0) {
                sb.append(", ");
            }
            sb.append(parameterTypes[i].getSimpleName());
        }
        sb.append(')');
    }

    public static String b(Constructor constructor) {
        StringBuilder sb = new StringBuilder(constructor.getDeclaringClass().getName());
        a(constructor, sb);
        return sb.toString();
    }

    public static String c(Field field) {
        return field.getDeclaringClass().getName() + "#" + field.getName();
    }

    public static String d(AccessibleObject accessibleObject, boolean z) {
        String str;
        if (accessibleObject instanceof Field) {
            str = "field '" + c((Field) accessibleObject) + "'";
        } else if (accessibleObject instanceof Method) {
            Method method = (Method) accessibleObject;
            StringBuilder sb = new StringBuilder(method.getName());
            a(method, sb);
            str = "method '" + method.getDeclaringClass().getName() + "#" + sb.toString() + "'";
        } else if (accessibleObject instanceof Constructor) {
            str = "constructor '" + b((Constructor) accessibleObject) + "'";
        } else {
            str = "<unknown AccessibleObject> " + accessibleObject.toString();
        }
        if (!z || !Character.isLowerCase(str.charAt(0))) {
            return str;
        }
        return Character.toUpperCase(str.charAt(0)) + str.substring(1);
    }

    public static void f(AccessibleObject accessibleObject) {
        try {
            accessibleObject.setAccessible(true);
        } catch (Exception e) {
            StringBuilder sbU = lv8.u("Failed making ", d(accessibleObject, false), " accessible; either increase its visibility or write a custom TypeAdapter for its declaring type.");
            sbU.append(e(e));
            throw new JsonIOException(sbU.toString(), e);
        }
    }

    public static String e(Exception exc) {
        String str;
        if (!exc.getClass().getName().equals("java.lang.reflect.InaccessibleObjectException")) {
            return mgKMENwrbHf.QgvvPiAK;
        }
        String message = exc.getMessage();
        if (message != null && message.contains("to module com.google.gson")) {
            str = "reflection-inaccessible-to-module-gson";
        } else {
            str = "reflection-inaccessible";
        }
        return "\nSee ".concat("https://github.com/google/gson/blob/main/Troubleshooting.md#".concat(str));
    }
}
