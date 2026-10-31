package u60;

import com.instabridge.ai.chat.ui.AiSdkGrammarLocatorDef;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final AiSdkGrammarLocatorDef f90651a;

    public g(AiSdkGrammarLocatorDef aiSdkGrammarLocatorDef) {
        this.f90651a = aiSdkGrammarLocatorDef;
    }

    public static a a(String str, j... jVarArr) {
        int length = jVarArr.length;
        ArrayList arrayList = new ArrayList(length);
        if (length > 0) {
            Collections.addAll(arrayList, jVarArr);
        }
        return new a(str, arrayList);
    }

    public static void b(String str, ArrayList arrayList, e eVar, int i5, int i11, boolean z11, j jVar) {
        j jVar2;
        int i12;
        Iterator it;
        boolean z12;
        int length;
        String strSubstring;
        int i13;
        boolean z13;
        int i14;
        Matcher matcher;
        int i15;
        int i16;
        Pattern pattern;
        int i17;
        int i18;
        String str2 = str;
        int length2 = str2.length();
        Iterator it2 = eVar.tokens().iterator();
        while (it2.hasNext() && (jVar2 = (j) it2.next()) != jVar) {
            Iterator it3 = jVar2.f90660b.iterator();
            while (it3.hasNext()) {
                d dVar = (d) it3.next();
                boolean z14 = dVar.f90647b;
                boolean z15 = dVar.f90648c;
                Pattern pattern2 = dVar.f90646a;
                int i19 = i5;
                int iA = i11;
                int length3 = 0;
                while (i19 < arrayList.size()) {
                    if (arrayList.size() > length2) {
                        throw new RuntimeException("Prism4j internal error. Number of entry nodes is greater that the text length.\nNodes: " + arrayList + "\nText: " + str2);
                    }
                    f fVar = (f) arrayList.get(i19);
                    if (fVar.b()) {
                        z12 = z15;
                        pattern = pattern2;
                        i12 = length2;
                        it = it2;
                    } else {
                        String str3 = ((i) fVar).f90658a;
                        if (!z15 || i19 == arrayList.size() - 1) {
                            z12 = z15;
                            i12 = length2;
                            it = it2;
                            Matcher matcher2 = pattern2.matcher(str3);
                            length = iA;
                            strSubstring = str3;
                            i13 = 0;
                            z13 = false;
                            i14 = i19;
                            matcher = matcher2;
                            i15 = 1;
                        } else {
                            Matcher matcher3 = pattern2.matcher(str2);
                            matcher3.region(iA, length2);
                            if (!matcher3.find()) {
                                break;
                            }
                            int iStart = matcher3.start();
                            z12 = z15;
                            if (z14) {
                                iStart += matcher3.group(1).length();
                            }
                            int length4 = matcher3.group(0).length() + matcher3.start();
                            int size = arrayList.size();
                            i12 = length2;
                            it = it2;
                            int iA2 = iA;
                            length = iA2;
                            i14 = i19;
                            while (i19 < size) {
                                if (iA2 >= length4) {
                                    if (((f) arrayList.get(i19)).b()) {
                                        break;
                                    }
                                    i18 = length4;
                                    f fVar2 = (f) arrayList.get(i19 - 1);
                                    if (fVar2.b() && ((h) fVar2).f90656e) {
                                        break;
                                    }
                                } else {
                                    i18 = length4;
                                }
                                iA2 += ((f) arrayList.get(i19)).a();
                                if (iStart >= iA2) {
                                    i14++;
                                    length = iA2;
                                }
                                i19++;
                                length4 = i18;
                            }
                            if (!((f) arrayList.get(i14)).b()) {
                                i15 = i19 - i14;
                                i13 = -length;
                                strSubstring = str2.substring(length, iA2);
                                matcher = matcher3;
                                z13 = true;
                            }
                            pattern = pattern2;
                            i19 = i14;
                            iA = length;
                        }
                        if (z13 || matcher.find()) {
                            if (z14) {
                                String strGroup = matcher.group(1);
                                length3 = strGroup != null ? strGroup.length() : 0;
                            }
                            int iStart2 = matcher.start() + i13 + length3;
                            String strSubstring2 = length3 > 0 ? matcher.group().substring(length3) : matcher.group();
                            int length5 = strSubstring2.length() + iStart2;
                            for (int i21 = 0; i21 < i15; i21++) {
                                arrayList.remove(i14);
                            }
                            if (iStart2 != 0) {
                                String strSubstring3 = strSubstring.substring(0, iStart2);
                                length = strSubstring3.length() + length;
                                arrayList.add(i14, new i(strSubstring3));
                                i16 = i14 + 1;
                            } else {
                                i16 = i14;
                            }
                            pattern = pattern2;
                            int i22 = i16;
                            e eVar2 = dVar.f90650e;
                            boolean z16 = eVar2 != null;
                            List listH = z16 ? h(strSubstring2, eVar2) : Collections.singletonList(new i(strSubstring2));
                            int i23 = i16 + 1;
                            int i24 = length3;
                            arrayList.add(i16, new h(jVar2.f90659a, listH, dVar.f90649d, strSubstring2, z12, z16));
                            if (length5 < strSubstring.length()) {
                                arrayList.add(i23, new i(strSubstring.substring(length5)));
                            }
                            if (i15 != 1) {
                                str2 = str;
                                i17 = length;
                                b(str2, arrayList, eVar, i22, i17, true, jVar2);
                            } else {
                                str2 = str;
                                i17 = length;
                            }
                            if (z11) {
                                break;
                            }
                            i19 = i22;
                            iA = i17;
                            length3 = i24;
                        } else {
                            if (z11) {
                                break;
                            }
                            pattern = pattern2;
                            i19 = i14;
                            iA = length;
                        }
                        length2 = i12;
                        it2 = it;
                    }
                    iA += ((f) arrayList.get(i19)).a();
                    i19++;
                    z15 = z12;
                    length2 = i12;
                    it2 = it;
                    pattern2 = pattern;
                }
                i12 = length2;
                it = it2;
                length2 = i12;
                it2 = it;
            }
        }
    }

    public static d c(Pattern pattern) {
        return new d(pattern, false, false, null, null);
    }

    public static d d(Pattern pattern, boolean z11) {
        return new d(pattern, z11, true, null, null);
    }

    public static d e(Pattern pattern, boolean z11, boolean z12, String str) {
        return new d(pattern, z11, z12, str, null);
    }

    public static d f(Pattern pattern) {
        return new d(pattern, true, false, null, null);
    }

    public static j g(String str, d... dVarArr) {
        int length = dVarArr.length;
        ArrayList arrayList = new ArrayList(length);
        if (length > 0) {
            Collections.addAll(arrayList, dVarArr);
        }
        return new j(str, arrayList);
    }

    public static ArrayList h(String str, e eVar) {
        ArrayList arrayList = new ArrayList(3);
        arrayList.add(new i(str));
        b(str, arrayList, eVar, 0, 0, false, null);
        return arrayList;
    }
}
