package ads_mobile_sdk;

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

/* loaded from: classes2.dex */
public abstract class np1 {

    /* renamed from: a, reason: collision with root package name */
    public static final char[] f7632a;

    static {
        char[] cArr = new char[80];
        f7632a = cArr;
        Arrays.fill(cArr, ' ');
    }

    public static void a(StringBuilder sb2, int i5, String str, Object obj) {
        char[] cArr;
        int i11;
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
        int i12 = i5;
        while (true) {
            cArr = f7632a;
            i11 = 0;
            int i13 = 80;
            if (i12 <= 0) {
                break;
            }
            if (i12 <= 80) {
                i13 = i12;
            }
            sb2.append(cArr, 0, i13);
            i12 -= i13;
        }
        if (!str.isEmpty()) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(Character.toLowerCase(str.charAt(0)));
            for (int i14 = 1; i14 < str.length(); i14++) {
                char cCharAt = str.charAt(i14);
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
            String string = (String) obj;
            String[] strArr = ke3.f5719a;
            int length = string.length();
            StringBuilder sb4 = null;
            int i15 = 0;
            while (true) {
                if (i11 < length) {
                    char cCharAt2 = string.charAt(i11);
                    if (cCharAt2 > 127) {
                        string = ke3.a(string.getBytes(StandardCharsets.UTF_8));
                        break;
                    }
                    String str2 = ke3.f5719a[cCharAt2];
                    if (str2 != null) {
                        if (sb4 == null) {
                            sb4 = new StringBuilder(length + 16);
                        }
                        if (i15 < i11) {
                            sb4.append((CharSequence) string, i15, i11);
                        }
                        sb4.append(str2);
                        i15 = i11 + 1;
                    }
                    i11++;
                } else if (sb4 != null) {
                    if (i15 < length) {
                        sb4.append((CharSequence) string, i15, length);
                    }
                    string = sb4.toString();
                }
            }
            sb2.append(string);
            sb2.append(AbstractJsonLexerKt.STRING);
            return;
        }
        if (obj instanceof sq) {
            sb2.append(": \"");
            String[] strArr2 = ke3.f5719a;
            sb2.append(ke3.a(((sq) obj).c()));
            sb2.append(AbstractJsonLexerKt.STRING);
            return;
        }
        if (obj instanceof cu0) {
            sb2.append(" {");
            a((cu0) obj, sb2, i5 + 2);
            sb2.append("\n");
            while (i5 > 0) {
                int i16 = i5 > 80 ? 80 : i5;
                sb2.append(cArr, 0, i16);
                i5 -= i16;
            }
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
        int i17 = i5 + 2;
        a(sb2, i17, DatabaseConstants.KEY_FIELD, entry.getKey());
        a(sb2, i17, "value", entry.getValue());
        sb2.append("\n");
        while (i5 > 0) {
            int i18 = i5 > 80 ? 80 : i5;
            sb2.append(cArr, 0, i18);
            i5 -= i18;
        }
        sb2.append("}");
    }

    /* JADX WARN: Removed duplicated region for block: B:105:0x01fd  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0155  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void a(cu0 cu0Var, StringBuilder sb2, int i5) {
        int i11;
        int i12;
        boolean zEquals;
        Method method;
        Method method2;
        HashSet hashSet = new HashSet();
        HashMap map = new HashMap();
        TreeMap treeMap = new TreeMap();
        Method[] declaredMethods = cu0Var.getClass().getDeclaredMethods();
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
            if (strSubstring.endsWith("List") && !strSubstring.endsWith("OrBuilderList") && !strSubstring.equals("List") && (method2 = (Method) entry.getValue()) != null && method2.getReturnType().equals(List.class)) {
                a(sb2, i5, b.u4.f(4, 0, strSubstring), cu0.a(method2, cu0Var, new Object[0]));
                i11 = 3;
            } else {
                if (strSubstring.endsWith("Map") && !strSubstring.equals("Map") && (method = (Method) entry.getValue()) != null && method.getReturnType().equals(Map.class) && !method.isAnnotationPresent(Deprecated.class) && Modifier.isPublic(method.getModifiers())) {
                    i12 = 3;
                    a(sb2, i5, b.u4.f(3, 0, strSubstring), cu0.a(method, cu0Var, new Object[0]));
                } else {
                    i12 = 3;
                    if (hashSet.contains("set".concat(strSubstring))) {
                        if (strSubstring.endsWith("Bytes")) {
                            if (!treeMap.containsKey("get" + b.u4.f(5, 0, strSubstring))) {
                                Method method4 = (Method) entry.getValue();
                                Method method5 = (Method) map.get("has".concat(strSubstring));
                                if (method4 != null) {
                                    Object objA = cu0.a(method4, cu0Var, new Object[0]);
                                    if (method5 == null) {
                                        if (objA instanceof Boolean) {
                                            zEquals = !((Boolean) objA).booleanValue();
                                        } else if (objA instanceof Integer) {
                                            if (((Integer) objA).intValue() != 0) {
                                                a(sb2, i5, strSubstring, objA);
                                            }
                                        } else if (objA instanceof Float) {
                                            if (Float.floatToRawIntBits(((Float) objA).floatValue()) != 0) {
                                            }
                                        } else if (objA instanceof Double) {
                                            if (Double.doubleToRawLongBits(((Double) objA).doubleValue()) != 0) {
                                            }
                                        } else if (objA instanceof String) {
                                            zEquals = objA.equals(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                                        } else if (objA instanceof sq) {
                                            zEquals = objA.equals(sq.f9634b);
                                        } else if (!(objA instanceof g) ? !(objA instanceof Enum) || ((Enum) objA).ordinal() != 0 : objA != cu0.a(((cu0) ((g) objA)).getClass())) {
                                        }
                                        if (!zEquals) {
                                        }
                                    } else if (((Boolean) cu0.a(method5, cu0Var, new Object[0])).booleanValue()) {
                                    }
                                }
                            }
                        }
                    }
                }
                i11 = i12;
            }
        }
        bm3 bm3Var = cu0Var.f2034b;
        if (bm3Var != null) {
            for (int i14 = 0; i14 < bm3Var.f1464a; i14++) {
                a(sb2, i5, String.valueOf(bm3Var.f1465b[i14] >>> 3), bm3Var.f1466c[i14]);
            }
        }
    }
}
