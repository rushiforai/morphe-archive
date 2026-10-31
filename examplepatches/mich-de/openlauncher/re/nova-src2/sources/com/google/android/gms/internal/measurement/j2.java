package com.google.android.gms.internal.measurement;

import com.amplitude.android.migration.DatabaseConstants;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public abstract class j2 {

    /* renamed from: a, reason: collision with root package name */
    public static final char[] f32675a;

    static {
        char[] cArr = new char[80];
        f32675a = cArr;
        Arrays.fill(cArr, ' ');
    }

    public static void a(StringBuilder sb2, int i5, String str, Object obj) {
        String strReplace;
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
        c(i5, sb2);
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
        if (!(obj instanceof String)) {
            if (obj instanceof v0) {
                sb2.append(": \"");
                sb2.append(h.d(((v0) obj).n()));
                sb2.append(AbstractJsonLexerKt.STRING);
                return;
            }
            if (obj instanceof o1) {
                sb2.append(" {");
                b((o1) obj, sb2, i5 + 2);
                sb2.append("\n");
                c(i5, sb2);
                sb2.append("}");
                return;
            }
            if (!(obj instanceof Map.Entry)) {
                sb2.append(": ");
                sb2.append(obj);
                return;
            }
            int i12 = i5 + 2;
            sb2.append(" {");
            Map.Entry entry = (Map.Entry) obj;
            a(sb2, i12, DatabaseConstants.KEY_FIELD, entry.getKey());
            a(sb2, i12, "value", entry.getValue());
            sb2.append("\n");
            c(i5, sb2);
            sb2.append("}");
            return;
        }
        sb2.append(": \"");
        String strReplace2 = (String) obj;
        boolean z11 = false;
        boolean z12 = false;
        boolean z13 = false;
        for (int i13 = 0; i13 < strReplace2.length(); i13++) {
            char cCharAt2 = strReplace2.charAt(i13);
            if (cCharAt2 < ' ' || cCharAt2 > '~') {
                strReplace = h.d(strReplace2.getBytes(StandardCharsets.UTF_8));
                break;
            }
            if (cCharAt2 == '\"') {
                z13 = true;
            } else if (cCharAt2 == '\'') {
                z12 = true;
            } else if (cCharAt2 == '\\') {
                z11 = true;
            }
        }
        if (z11) {
            strReplace2 = strReplace2.replace("\\", "\\\\");
        }
        strReplace = z12 ? strReplace2.replace("'", "\\'") : strReplace2;
        if (z13) {
            strReplace = strReplace.replace("\"", "\\\"");
        }
        sb2.append(strReplace);
        sb2.append(AbstractJsonLexerKt.STRING);
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x01f6  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0184  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void b(o1 o1Var, StringBuilder sb2, int i5) {
        int i11;
        int i12;
        boolean zBooleanValue;
        boolean zEquals;
        Method method;
        Method method2;
        HashSet hashSet = new HashSet();
        HashMap map = new HashMap();
        TreeMap treeMap = new TreeMap();
        Method[] declaredMethods = o1Var.getClass().getDeclaredMethods();
        int length = declaredMethods.length;
        int i13 = 0;
        while (true) {
            i11 = 3;
            if (i13 >= length) {
                break;
            }
            Method method3 = declaredMethods[i13];
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
            i13++;
        }
        for (Map.Entry entry : treeMap.entrySet()) {
            String strSubstring = ((String) entry.getKey()).substring(i11);
            if (!strSubstring.endsWith("List") || strSubstring.endsWith("OrBuilderList") || strSubstring.equals("List") || (method2 = (Method) entry.getValue()) == null) {
                i12 = i11;
            } else {
                i12 = i11;
                if (method2.getReturnType().equals(List.class)) {
                    a(sb2, i5, strSubstring.substring(0, strSubstring.length() - 4), o1.r(method2, o1Var, new Object[0]));
                }
                i11 = i12;
            }
            if (strSubstring.endsWith("Map") && !strSubstring.equals("Map") && (method = (Method) entry.getValue()) != null && method.getReturnType().equals(Map.class) && !method.isAnnotationPresent(Deprecated.class) && Modifier.isPublic(method.getModifiers())) {
                a(sb2, i5, strSubstring.substring(0, strSubstring.length() - 3), o1.r(method, o1Var, new Object[0]));
            } else if (hashSet.contains("set".concat(strSubstring)) && (!strSubstring.endsWith("Bytes") || !treeMap.containsKey("get".concat(String.valueOf(strSubstring.substring(0, strSubstring.length() - 5)))))) {
                Method method4 = (Method) entry.getValue();
                Method method5 = (Method) map.get("has".concat(strSubstring));
                if (method4 != null) {
                    Object objR = o1.r(method4, o1Var, new Object[0]);
                    if (method5 != null) {
                        zBooleanValue = ((Boolean) o1.r(method5, o1Var, new Object[0])).booleanValue();
                    } else if (objR instanceof Boolean) {
                        zBooleanValue = ((Boolean) objR).booleanValue();
                    } else if (objR instanceof Integer) {
                        if (((Integer) objR).intValue() == 0) {
                        }
                    } else if (objR instanceof Float) {
                        if (Float.floatToRawIntBits(((Float) objR).floatValue()) == 0) {
                        }
                    } else if (!(objR instanceof Double)) {
                        if (objR instanceof String) {
                            zEquals = objR.equals(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                        } else if (objR instanceof v0) {
                            zEquals = objR.equals(v0.f33120b);
                        } else if (!(objR instanceof n0) ? !(objR instanceof Enum) || ((Enum) objR).ordinal() != 0 : objR != ((o1) ((o1) ((n0) objR)).w(6))) {
                        }
                        if (zEquals) {
                        }
                    } else if (Double.doubleToRawLongBits(((Double) objR).doubleValue()) == 0) {
                    }
                    if (zBooleanValue) {
                        a(sb2, i5, strSubstring, objR);
                    }
                }
            }
            i11 = i12;
        }
        y2 y2Var = o1Var.zzc;
        if (y2Var != null) {
            for (int i14 = 0; i14 < y2Var.f33242a; i14++) {
                a(sb2, i5, String.valueOf(y2Var.f33243b[i14] >>> 3), y2Var.f33244c[i14]);
            }
        }
    }

    public static void c(int i5, StringBuilder sb2) {
        while (i5 > 0) {
            int i11 = 80;
            if (i5 <= 80) {
                i11 = i5;
            }
            sb2.append(f32675a, 0, i11);
            i5 -= i11;
        }
    }
}
