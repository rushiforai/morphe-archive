package com.fyber.inneractive.sdk.protobuf;

import com.amplitude.android.migration.DatabaseConstants;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public abstract class f2 {
    /* JADX WARN: Removed duplicated region for block: B:87:0x0204  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0206  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void a(d2 d2Var, StringBuilder sb2, int i5) {
        boolean zEquals;
        HashMap map = new HashMap();
        HashMap map2 = new HashMap();
        TreeSet treeSet = new TreeSet();
        for (Method method : d2Var.getClass().getDeclaredMethods()) {
            map2.put(method.getName(), method);
            if (method.getParameterTypes().length == 0) {
                map.put(method.getName(), method);
                if (method.getName().startsWith("get")) {
                    treeSet.add(method.getName());
                }
            }
        }
        Iterator it = treeSet.iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            String strSubstring = str.startsWith("get") ? str.substring(3) : str;
            boolean zBooleanValue = true;
            if (strSubstring.endsWith("List") && !strSubstring.endsWith("OrBuilderList") && !strSubstring.equals("List")) {
                String str2 = strSubstring.substring(0, 1).toLowerCase() + strSubstring.substring(1, strSubstring.length() - 4);
                Method method2 = (Method) map.get(str);
                if (method2 != null && method2.getReturnType().equals(List.class)) {
                    a(sb2, i5, a(str2), z0.invokeOrDie(method2, d2Var, new Object[0]));
                }
            }
            if (strSubstring.endsWith("Map") && !strSubstring.equals("Map")) {
                String str3 = strSubstring.substring(0, 1).toLowerCase() + strSubstring.substring(1, strSubstring.length() - 3);
                Method method3 = (Method) map.get(str);
                if (method3 != null && method3.getReturnType().equals(Map.class) && !method3.isAnnotationPresent(Deprecated.class) && Modifier.isPublic(method3.getModifiers())) {
                    a(sb2, i5, a(str3), z0.invokeOrDie(method3, d2Var, new Object[0]));
                }
            }
            if (((Method) map2.get("set".concat(strSubstring))) != null) {
                if (strSubstring.endsWith("Bytes")) {
                    if (map.containsKey("get" + strSubstring.substring(0, strSubstring.length() - 5))) {
                    }
                }
                String str4 = strSubstring.substring(0, 1).toLowerCase() + strSubstring.substring(1);
                Method method4 = (Method) map.get("get".concat(strSubstring));
                Method method5 = (Method) map.get("has".concat(strSubstring));
                if (method4 != null) {
                    Object objInvokeOrDie = z0.invokeOrDie(method4, d2Var, new Object[0]);
                    if (method5 == null) {
                        if (objInvokeOrDie instanceof Boolean) {
                            zEquals = !((Boolean) objInvokeOrDie).booleanValue();
                        } else if (objInvokeOrDie instanceof Integer) {
                            zEquals = ((Integer) objInvokeOrDie).intValue() == 0;
                        } else if (objInvokeOrDie instanceof Float) {
                            if (((Float) objInvokeOrDie).floatValue() == 0.0f) {
                            }
                        } else if (objInvokeOrDie instanceof Double) {
                            if (((Double) objInvokeOrDie).doubleValue() == 0.0d) {
                            }
                        } else if (objInvokeOrDie instanceof String) {
                            zEquals = objInvokeOrDie.equals(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                        } else if (objInvokeOrDie instanceof s) {
                            zEquals = objInvokeOrDie.equals(s.f30889b);
                        } else if (!(objInvokeOrDie instanceof d2) ? !(objInvokeOrDie instanceof Enum) || ((Enum) objInvokeOrDie).ordinal() != 0 : objInvokeOrDie != ((d2) objInvokeOrDie).getDefaultInstanceForType()) {
                        }
                        if (zEquals) {
                            zBooleanValue = false;
                        }
                    } else {
                        zBooleanValue = ((Boolean) z0.invokeOrDie(method5, d2Var, new Object[0])).booleanValue();
                    }
                    if (zBooleanValue) {
                        a(sb2, i5, a(str4), objInvokeOrDie);
                    }
                }
            }
        }
        if (d2Var instanceof GeneratedMessageLite$ExtendableMessage) {
            Iterator itD = ((GeneratedMessageLite$ExtendableMessage) d2Var).extensions.d();
            while (itD.hasNext()) {
                Map.Entry entry = (Map.Entry) itD.next();
                a(sb2, i5, b.c0.o(new StringBuilder("["), ((w0) entry.getKey()).f30933b, "]"), entry.getValue());
            }
        }
        n3 n3Var = ((z0) d2Var).unknownFields;
        if (n3Var != null) {
            for (int i11 = 0; i11 < n3Var.f30861a; i11++) {
                a(sb2, i5, String.valueOf(n3Var.f30862b[i11] >>> 3), n3Var.f30863c[i11]);
            }
        }
    }

    public static final void a(StringBuilder sb2, int i5, String str, Object obj) {
        if (obj instanceof List) {
            Iterator it = ((List) obj).iterator();
            while (it.hasNext()) {
                a(sb2, i5, str, it.next());
            }
            return;
        }
        if (obj instanceof Map) {
            Iterator it2 = ((Map) obj).entrySet().iterator();
            while (it2.hasNext()) {
                a(sb2, i5, str, (Map.Entry) it2.next());
            }
            return;
        }
        sb2.append('\n');
        int i11 = 0;
        for (int i12 = 0; i12 < i5; i12++) {
            sb2.append(' ');
        }
        sb2.append(str);
        if (obj instanceof String) {
            sb2.append(": \"");
            sb2.append(h3.a(s.a((String) obj)));
            sb2.append(AbstractJsonLexerKt.STRING);
            return;
        }
        if (obj instanceof s) {
            sb2.append(": \"");
            sb2.append(h3.a((s) obj));
            sb2.append(AbstractJsonLexerKt.STRING);
            return;
        }
        if (obj instanceof z0) {
            sb2.append(" {");
            a((z0) obj, sb2, i5 + 2);
            sb2.append("\n");
            while (i11 < i5) {
                sb2.append(' ');
                i11++;
            }
            sb2.append("}");
            return;
        }
        if (obj instanceof Map.Entry) {
            sb2.append(" {");
            Map.Entry entry = (Map.Entry) obj;
            int i13 = i5 + 2;
            a(sb2, i13, DatabaseConstants.KEY_FIELD, entry.getKey());
            a(sb2, i13, "value", entry.getValue());
            sb2.append("\n");
            while (i11 < i5) {
                sb2.append(' ');
                i11++;
            }
            sb2.append("}");
            return;
        }
        sb2.append(": ");
        sb2.append(obj.toString());
    }

    public static final String a(String str) {
        StringBuilder sb2 = new StringBuilder();
        for (int i5 = 0; i5 < str.length(); i5++) {
            char cCharAt = str.charAt(i5);
            if (Character.isUpperCase(cCharAt)) {
                sb2.append("_");
            }
            sb2.append(Character.toLowerCase(cCharAt));
        }
        return sb2.toString();
    }
}
