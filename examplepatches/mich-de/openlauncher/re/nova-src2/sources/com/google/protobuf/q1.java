package com.google.protobuf;

import b.u4;
import com.amplitude.android.migration.DatabaseConstants;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public abstract class q1 {

    /* renamed from: a, reason: collision with root package name */
    public static final char[] f34943a;

    static {
        char[] cArr = new char[80];
        f34943a = cArr;
        Arrays.fill(cArr, ' ');
    }

    public static void a(int i5, StringBuilder sb2) {
        while (i5 > 0) {
            int i11 = 80;
            if (i5 <= 80) {
                i11 = i5;
            }
            sb2.append(f34943a, 0, i11);
            i5 -= i11;
        }
    }

    public static void b(StringBuilder sb2, int i5, String str, Object obj) {
        if (obj instanceof List) {
            Iterator it = ((List) obj).iterator();
            while (it.hasNext()) {
                b(sb2, i5, str, it.next());
            }
            return;
        }
        if (obj instanceof Map) {
            Iterator it2 = ((Map) obj).entrySet().iterator();
            while (it2.hasNext()) {
                b(sb2, i5, str, (Map.Entry) it2.next());
            }
            return;
        }
        sb2.append('\n');
        a(i5, sb2);
        if (!str.isEmpty()) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(Character.toLowerCase(str.charAt(0)));
            for (int i11 = 1; i11 < str.length(); i11++) {
                char cCharAt = str.charAt(i11);
                if (Character.isUpperCase(cCharAt)) {
                    sb3.append("_");
                }
                sb3.append(Character.toLowerCase(cCharAt));
            }
            str = sb3.toString();
        }
        sb2.append(str);
        if (obj instanceof String) {
            sb2.append(": \"");
            sb2.append(g.x(l.f((String) obj)));
            sb2.append(AbstractJsonLexerKt.STRING);
            return;
        }
        if (obj instanceof l) {
            sb2.append(": \"");
            sb2.append(g.x((l) obj));
            sb2.append(AbstractJsonLexerKt.STRING);
            return;
        }
        if (obj instanceof n0) {
            sb2.append(" {");
            c((n0) obj, sb2, i5 + 2);
            sb2.append("\n");
            a(i5, sb2);
            sb2.append("}");
            return;
        }
        if (!(obj instanceof Map.Entry)) {
            sb2.append(": ");
            sb2.append(obj);
            return;
        }
        sb2.append(" {");
        Map.Entry entry = (Map.Entry) obj;
        int i12 = i5 + 2;
        b(sb2, i12, DatabaseConstants.KEY_FIELD, entry.getKey());
        b(sb2, i12, "value", entry.getValue());
        sb2.append("\n");
        a(i5, sb2);
        sb2.append("}");
    }

    /* JADX WARN: Removed duplicated region for block: B:63:0x0157  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x018d  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x018f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void c(n0 n0Var, StringBuilder sb2, int i5) {
        int i11;
        boolean zBooleanValue;
        boolean zEquals;
        Method method;
        Method method2;
        HashSet hashSet = new HashSet();
        HashMap map = new HashMap();
        TreeMap treeMap = new TreeMap();
        Method[] declaredMethods = n0Var.getClass().getDeclaredMethods();
        int length = declaredMethods.length;
        int i12 = 0;
        while (true) {
            i11 = 3;
            if (i12 >= length) {
                break;
            }
            Method method3 = declaredMethods[i12];
            if (!Modifier.isStatic(method3.getModifiers()) && method3.getName().length() >= 3) {
                if (method3.getName().startsWith("set")) {
                    hashSet.add(method3.getName());
                } else if (Modifier.isPublic(method3.getModifiers()) && method3.getParameterTypes().length == 0) {
                    if (method3.getName().startsWith("has")) {
                        map.put(method3.getName(), method3);
                    } else if (method3.getName().startsWith("get")) {
                        treeMap.put(method3.getName(), method3);
                    }
                }
            }
            i12++;
        }
        for (Map.Entry entry : treeMap.entrySet()) {
            String strSubstring = ((String) entry.getKey()).substring(i11);
            if (strSubstring.endsWith("List") && !strSubstring.endsWith("OrBuilderList") && !strSubstring.equals("List") && (method2 = (Method) entry.getValue()) != null && method2.getReturnType().equals(List.class)) {
                b(sb2, i5, u4.f(4, 0, strSubstring), n0.invokeOrDie(method2, n0Var, new Object[0]));
            } else if (strSubstring.endsWith("Map") && !strSubstring.equals("Map") && (method = (Method) entry.getValue()) != null && method.getReturnType().equals(Map.class) && !method.isAnnotationPresent(Deprecated.class) && Modifier.isPublic(method.getModifiers())) {
                b(sb2, i5, u4.f(3, 0, strSubstring), n0.invokeOrDie(method, n0Var, new Object[0]));
            } else if (hashSet.contains("set".concat(strSubstring))) {
                if (strSubstring.endsWith("Bytes")) {
                    if (!treeMap.containsKey("get" + strSubstring.substring(0, strSubstring.length() - 5))) {
                        Method method4 = (Method) entry.getValue();
                        Method method5 = (Method) map.get("has".concat(strSubstring));
                        if (method4 != null) {
                            Object objInvokeOrDie = n0.invokeOrDie(method4, n0Var, new Object[0]);
                            if (method5 == null) {
                                zBooleanValue = true;
                                if (objInvokeOrDie instanceof Boolean) {
                                    zEquals = !((Boolean) objInvokeOrDie).booleanValue();
                                } else if (objInvokeOrDie instanceof Integer) {
                                    zEquals = ((Integer) objInvokeOrDie).intValue() == 0;
                                } else if (objInvokeOrDie instanceof Float) {
                                    if (Float.floatToRawIntBits(((Float) objInvokeOrDie).floatValue()) == 0) {
                                    }
                                } else if (objInvokeOrDie instanceof Double) {
                                    if (Double.doubleToRawLongBits(((Double) objInvokeOrDie).doubleValue()) == 0) {
                                    }
                                } else if (objInvokeOrDie instanceof String) {
                                    zEquals = objInvokeOrDie.equals(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                                } else if (objInvokeOrDie instanceof l) {
                                    zEquals = objInvokeOrDie.equals(l.f34884b);
                                } else if (!(objInvokeOrDie instanceof o1) ? !(objInvokeOrDie instanceof Enum) || ((Enum) objInvokeOrDie).ordinal() != 0 : objInvokeOrDie != ((o1) objInvokeOrDie).getDefaultInstanceForType()) {
                                }
                                if (zEquals) {
                                    zBooleanValue = false;
                                }
                            } else {
                                zBooleanValue = ((Boolean) n0.invokeOrDie(method5, n0Var, new Object[0])).booleanValue();
                            }
                            if (zBooleanValue) {
                                b(sb2, i5, strSubstring, objInvokeOrDie);
                            }
                        }
                    }
                }
            }
            i11 = 3;
        }
        if (n0Var instanceof j0) {
            Iterator itS = ((j0) n0Var).extensions.s();
            while (itS.hasNext()) {
                Map.Entry entry2 = (Map.Entry) itS.next();
                b(sb2, i5, "[" + ((k0) entry2.getKey()).getNumber() + "]", entry2.getValue());
            }
        }
        g2 g2Var = n0Var.unknownFields;
        if (g2Var != null) {
            for (int i13 = 0; i13 < g2Var.f34862a; i13++) {
                b(sb2, i5, String.valueOf(g2Var.f34863b[i13] >>> 3), g2Var.f34864c[i13]);
            }
        }
    }
}
