package defpackage;

import java.util.LinkedHashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class sn1 {
    public static final String a;
    public static final LinkedHashMap b;

    static {
        String str;
        String strF0 = bu1.F0(d46.R('k', 'o', 't', 'l', 'i', 'n'), "", null, null, null, 62);
        a = strF0;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        List listR = d46.R("Boolean", "Z", "Char", "C", "Byte", "B", "Short", "S", "Int", "I", "Float", "F", "Long", "J", "Double", "D");
        int iU = hk7.u(0, listR.size() - 1, 2);
        if (iU >= 0) {
            int i = 0;
            while (true) {
                StringBuilder sb = new StringBuilder();
                str = a;
                sb.append(str);
                sb.append('/');
                sb.append((String) listR.get(i));
                int i2 = i + 1;
                linkedHashMap.put(sb.toString(), listR.get(i2));
                StringBuilder sb2 = new StringBuilder();
                sb2.append(str);
                sb2.append('/');
                linkedHashMap.put(ka1.v(sb2, (String) listR.get(i), "Array"), "[" + ((String) listR.get(i2)));
                if (i == iU) {
                    break;
                } else {
                    i += 2;
                }
            }
            strF0 = str;
        }
        linkedHashMap.put(strF0 + "/Unit", "V");
        a(linkedHashMap, "Any", "java/lang/Object");
        a(linkedHashMap, "Nothing", "java/lang/Void");
        a(linkedHashMap, "Annotation", "java/lang/annotation/Annotation");
        for (String str2 : d46.R("String", "CharSequence", "Throwable", "Cloneable", "Number", "Comparable", "Enum")) {
            a(linkedHashMap, str2, "java/lang/" + str2);
        }
        for (String str3 : d46.R("Iterator", "Collection", "List", "Set", "Map", "ListIterator")) {
            a(linkedHashMap, ka1.r("collections/", str3), "java/util/" + str3);
            a(linkedHashMap, "collections/Mutable" + str3, "java/util/" + str3);
        }
        a(linkedHashMap, "collections/Iterable", "java/lang/Iterable");
        a(linkedHashMap, "collections/MutableIterable", "java/lang/Iterable");
        a(linkedHashMap, "collections/Map.Entry", "java/util/Map$Entry");
        a(linkedHashMap, "collections/MutableMap.MutableEntry", "java/util/Map$Entry");
        for (int i3 = 0; i3 < 23; i3++) {
            String strW = b09.w(i3, "Function");
            StringBuilder sb3 = new StringBuilder();
            String str4 = a;
            sb3.append(str4);
            sb3.append("/jvm/functions/Function");
            sb3.append(i3);
            a(linkedHashMap, strW, sb3.toString());
            a(linkedHashMap, "reflect/KFunction" + i3, str4 + "/reflect/KFunction");
        }
        for (String str5 : d46.R("Char", "Byte", "Short", "Int", "Float", "Long", "Double", "String", "Enum")) {
            a(linkedHashMap, km4.y(str5, ".Companion"), km4.C(new StringBuilder(), a, "/jvm/internal/", str5, "CompanionObject"));
        }
        b = linkedHashMap;
    }

    public static final void a(LinkedHashMap linkedHashMap, String str, String str2) {
        linkedHashMap.put(a + '/' + str, "L" + str2 + ';');
    }

    public static final String b(String str) {
        str.getClass();
        String str2 = (String) b.get(str);
        if (str2 != null) {
            return str2;
        }
        StringBuilder sb = new StringBuilder("L");
        String strReplace = str.replace('.', '$');
        strReplace.getClass();
        sb.append(strReplace);
        sb.append(';');
        return sb.toString();
    }
}
