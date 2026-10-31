package sf;

import android.graphics.Color;
import android.text.SpannableStringBuilder;
import android.text.SpannedString;
import android.text.TextUtils;
import android.text.style.AbsoluteSizeSpan;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import android.text.style.StrikethroughSpan;
import android.text.style.StyleSpan;
import android.text.style.TypefaceSpan;
import android.text.style.UnderlineSpan;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import mk.v;

/* loaded from: classes3.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final Pattern f87408a = Pattern.compile("^(\\S+)\\s+-->\\s+(\\S+)(.*)?$");

    /* renamed from: b, reason: collision with root package name */
    public static final Pattern f87409b = Pattern.compile("(\\S+?):(\\S+)");

    /* renamed from: c, reason: collision with root package name */
    public static final Map f87410c;

    /* renamed from: d, reason: collision with root package name */
    public static final Map f87411d;

    static {
        HashMap map = new HashMap();
        map.put("white", Integer.valueOf(Color.rgb(255, 255, 255)));
        map.put("lime", Integer.valueOf(Color.rgb(0, 255, 0)));
        map.put("cyan", Integer.valueOf(Color.rgb(0, 255, 255)));
        map.put("red", Integer.valueOf(Color.rgb(255, 0, 0)));
        map.put("yellow", Integer.valueOf(Color.rgb(255, 255, 0)));
        map.put("magenta", Integer.valueOf(Color.rgb(255, 0, 255)));
        map.put("blue", Integer.valueOf(Color.rgb(0, 0, 255)));
        map.put("black", Integer.valueOf(Color.rgb(0, 0, 0)));
        f87410c = Collections.unmodifiableMap(map);
        HashMap map2 = new HashMap();
        map2.put("bg_white", Integer.valueOf(Color.rgb(255, 255, 255)));
        map2.put("bg_lime", Integer.valueOf(Color.rgb(0, 255, 0)));
        map2.put("bg_cyan", Integer.valueOf(Color.rgb(0, 255, 255)));
        map2.put("bg_red", Integer.valueOf(Color.rgb(255, 0, 0)));
        map2.put("bg_yellow", Integer.valueOf(Color.rgb(255, 255, 0)));
        map2.put("bg_magenta", Integer.valueOf(Color.rgb(255, 0, 255)));
        map2.put("bg_blue", Integer.valueOf(Color.rgb(0, 0, 255)));
        map2.put("bg_black", Integer.valueOf(Color.rgb(0, 0, 0)));
        f87411d = Collections.unmodifiableMap(map2);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:4:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void a(String str, e eVar, List list, SpannableStringBuilder spannableStringBuilder, List list2) {
        int i5;
        int length;
        i5 = eVar.f87392b;
        length = spannableStringBuilder.length();
        String str2 = eVar.f87391a;
        str2.getClass();
        switch (str2) {
            case "":
            case "v":
            case "lang":
                break;
            case "b":
                spannableStringBuilder.setSpan(new StyleSpan(1), i5, length, 33);
                break;
            case "c":
                for (String str3 : eVar.f87394d) {
                    Map map = f87410c;
                    if (map.containsKey(str3)) {
                        spannableStringBuilder.setSpan(new ForegroundColorSpan(((Integer) map.get(str3)).intValue()), i5, length, 33);
                    } else {
                        Map map2 = f87411d;
                        if (map2.containsKey(str3)) {
                            spannableStringBuilder.setSpan(new BackgroundColorSpan(((Integer) map2.get(str3)).intValue()), i5, length, 33);
                        }
                    }
                }
                break;
            case "i":
                spannableStringBuilder.setSpan(new StyleSpan(2), i5, length, 33);
                break;
            case "u":
                spannableStringBuilder.setSpan(new UnderlineSpan(), i5, length, 33);
                break;
            case "ruby":
                c(list2, str, eVar);
                ArrayList arrayList = new ArrayList(list.size());
                arrayList.addAll(list);
                Collections.sort(arrayList, d.f87388c);
                int i11 = eVar.f87392b;
                int length2 = 0;
                for (int i12 = 0; i12 < arrayList.size(); i12++) {
                    if ("rt".equals(((d) arrayList.get(i12)).f87389a.f87391a)) {
                        d dVar = (d) arrayList.get(i12);
                        c(list2, str, dVar.f87389a);
                        int i13 = dVar.f87389a.f87392b - length2;
                        int i14 = dVar.f87390b - length2;
                        CharSequence charSequenceSubSequence = spannableStringBuilder.subSequence(i13, i14);
                        spannableStringBuilder.delete(i13, i14);
                        charSequenceSubSequence.toString();
                        spannableStringBuilder.setSpan(new nf.a(), i11, i13, 33);
                        length2 += charSequenceSubSequence.length();
                        i11 = i13;
                    }
                }
                break;
            default:
                return;
        }
        ArrayList arrayListB = b(list2, str, eVar);
        for (int i15 = 0; i15 < arrayListB.size(); i15++) {
            b bVar = ((f) arrayListB.get(i15)).f87396b;
            int i16 = bVar.f87381l;
            if (((i16 == -1 && bVar.f87382m == -1) ? -1 : (i16 == 1 ? (char) 1 : (char) 0) | (bVar.f87382m == 1 ? (char) 2 : (char) 0)) != -1) {
                int i17 = bVar.f87381l;
                v.x(spannableStringBuilder, new StyleSpan((i17 == -1 && bVar.f87382m == -1) ? -1 : (i17 == 1 ? 1 : 0) | (bVar.f87382m == 1 ? 2 : 0)), i5, length);
            }
            if (bVar.f87379j == 1) {
                spannableStringBuilder.setSpan(new StrikethroughSpan(), i5, length, 33);
            }
            if (bVar.f87380k == 1) {
                spannableStringBuilder.setSpan(new UnderlineSpan(), i5, length, 33);
            }
            if (bVar.f87376g) {
                if (!bVar.f87376g) {
                    throw new IllegalStateException("Font color not defined");
                }
                v.x(spannableStringBuilder, new ForegroundColorSpan(bVar.f87375f), i5, length);
            }
            if (bVar.f87378i) {
                if (!bVar.f87378i) {
                    throw new IllegalStateException("Background color not defined.");
                }
                v.x(spannableStringBuilder, new BackgroundColorSpan(bVar.f87377h), i5, length);
            }
            if (bVar.f87374e != null) {
                v.x(spannableStringBuilder, new TypefaceSpan(bVar.f87374e), i5, length);
            }
            int i18 = bVar.n;
            if (i18 == 1) {
                v.x(spannableStringBuilder, new AbsoluteSizeSpan((int) bVar.o, true), i5, length);
            } else if (i18 == 2) {
                v.x(spannableStringBuilder, new RelativeSizeSpan(bVar.o), i5, length);
            } else if (i18 == 3) {
                v.x(spannableStringBuilder, new RelativeSizeSpan(bVar.o / 100.0f), i5, length);
            }
            if (bVar.f87384q) {
                spannableStringBuilder.setSpan(new nf.a(), i5, length, 33);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static ArrayList b(List list, String str, e eVar) {
        int size;
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < list.size(); i5++) {
            b bVar = (b) list.get(i5);
            String str2 = eVar.f87391a;
            Set set = eVar.f87394d;
            String str3 = eVar.f87393c;
            if (bVar.f87370a.isEmpty() && bVar.f87371b.isEmpty() && bVar.f87372c.isEmpty() && bVar.f87373d.isEmpty()) {
                size = TextUtils.isEmpty(str2);
            } else {
                int iA = b.a(b.a(b.a(0, 1073741824, bVar.f87370a, str), 2, bVar.f87371b, str2), 4, bVar.f87373d, str3);
                size = (iA == -1 || !set.containsAll(bVar.f87372c)) ? 0 : iA + (bVar.f87372c.size() * 4);
            }
            if (size > 0) {
                arrayList.add(new f(size, bVar));
            }
        }
        Collections.sort(arrayList);
        return arrayList;
    }

    public static void c(List list, String str, e eVar) {
        ArrayList arrayListB = b(list, str, eVar);
        for (int i5 = 0; i5 < arrayListB.size() && ((f) arrayListB.get(i5)).f87396b.f87383p == -1; i5++) {
        }
    }

    public static c d(String str, Matcher matcher, com.google.android.gms.internal.consent_sdk.a aVar, ArrayList arrayList) {
        g gVar = new g();
        try {
            String strGroup = matcher.group(1);
            strGroup.getClass();
            gVar.f87397a = j.b(strGroup);
            String strGroup2 = matcher.group(2);
            strGroup2.getClass();
            gVar.f87398b = j.b(strGroup2);
            String strGroup3 = matcher.group(3);
            strGroup3.getClass();
            e(strGroup3, gVar);
            StringBuilder sb2 = new StringBuilder();
            String strB = aVar.B();
            while (!TextUtils.isEmpty(strB)) {
                if (sb2.length() > 0) {
                    sb2.append("\n");
                }
                sb2.append(strB.trim());
                strB = aVar.B();
            }
            gVar.f87399c = f(str, sb2.toString(), arrayList);
            return new c(gVar.a().a(), gVar.f87397a, gVar.f87398b);
        } catch (NumberFormatException unused) {
            wf.a.D("WebvttCueParser", "Skipping cue with bad header: " + matcher.group());
            return null;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:14:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00bf  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void e(String str, g gVar) {
        int i5;
        int i11;
        int i12;
        Matcher matcher = f87409b.matcher(str);
        while (matcher.find()) {
            String strGroup = matcher.group(1);
            strGroup.getClass();
            String strGroup2 = matcher.group(2);
            strGroup2.getClass();
            try {
                if ("line".equals(strGroup)) {
                    g(strGroup2, gVar);
                } else {
                    char c11 = 5;
                    boolean z11 = false;
                    if ("align".equals(strGroup)) {
                        switch (strGroup2.hashCode()) {
                            case -1364013995:
                                if (!strGroup2.equals("center")) {
                                    z11 = -1;
                                    break;
                                }
                                break;
                            case -1074341483:
                                if (strGroup2.equals("middle")) {
                                    z11 = true;
                                    break;
                                }
                                break;
                            case 100571:
                                if (strGroup2.equals("end")) {
                                    z11 = 2;
                                    break;
                                }
                                break;
                            case 3317767:
                                if (strGroup2.equals("left")) {
                                    z11 = 3;
                                    break;
                                }
                                break;
                            case 108511772:
                                if (strGroup2.equals("right")) {
                                    z11 = 4;
                                    break;
                                }
                                break;
                            case 109757538:
                                if (strGroup2.equals("start")) {
                                    z11 = 5;
                                    break;
                                }
                                break;
                        }
                        switch (z11) {
                            case false:
                            case true:
                                i5 = 2;
                                break;
                            case true:
                                i5 = 3;
                                break;
                            case true:
                                i5 = 4;
                                break;
                            case true:
                                i5 = 5;
                                break;
                            case true:
                                i5 = 1;
                                break;
                            default:
                                wf.a.D("WebvttCueParser", "Invalid alignment value: ".concat(strGroup2));
                                i5 = 2;
                                break;
                        }
                        gVar.f87400d = i5;
                    } else if ("position".equals(strGroup)) {
                        int iIndexOf = strGroup2.indexOf(44);
                        if (iIndexOf != -1) {
                            String strSubstring = strGroup2.substring(iIndexOf + 1);
                            strSubstring.getClass();
                            switch (strSubstring.hashCode()) {
                                case -1842484672:
                                    if (!strSubstring.equals("line-left")) {
                                        c11 = 65535;
                                        break;
                                    } else {
                                        c11 = 0;
                                        break;
                                    }
                                case -1364013995:
                                    if (strSubstring.equals("center")) {
                                        c11 = 1;
                                        break;
                                    }
                                    break;
                                case -1276788989:
                                    if (strSubstring.equals("line-right")) {
                                        c11 = 2;
                                        break;
                                    }
                                    break;
                                case -1074341483:
                                    if (strSubstring.equals("middle")) {
                                        c11 = 3;
                                        break;
                                    }
                                    break;
                                case 100571:
                                    if (strSubstring.equals("end")) {
                                        c11 = 4;
                                        break;
                                    }
                                    break;
                                case 109757538:
                                    if (!strSubstring.equals("start")) {
                                    }
                                    break;
                            }
                            switch (c11) {
                                case 0:
                                case 5:
                                    i11 = 0;
                                    break;
                                case 1:
                                case 3:
                                    i11 = 1;
                                    break;
                                case 2:
                                case 4:
                                    i11 = 2;
                                    break;
                                default:
                                    wf.a.D("WebvttCueParser", "Invalid anchor value: ".concat(strSubstring));
                                    i11 = Integer.MIN_VALUE;
                                    break;
                            }
                            gVar.f87405i = i11;
                            strGroup2 = strGroup2.substring(0, iIndexOf);
                        }
                        gVar.f87404h = j.a(strGroup2);
                    } else if ("size".equals(strGroup)) {
                        gVar.f87406j = j.a(strGroup2);
                    } else if ("vertical".equals(strGroup)) {
                        if (strGroup2.equals("lr")) {
                            i12 = 2;
                        } else if (strGroup2.equals("rl")) {
                            i12 = 1;
                        } else {
                            wf.a.D("WebvttCueParser", "Invalid 'vertical' value: ".concat(strGroup2));
                            i12 = Integer.MIN_VALUE;
                        }
                        gVar.f87407k = i12;
                    } else {
                        wf.a.D("WebvttCueParser", "Unknown cue setting " + strGroup + ":" + strGroup2);
                    }
                }
            } catch (NumberFormatException unused) {
                wf.a.D("WebvttCueParser", "Skipping bad cue setting: " + matcher.group());
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00a7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static SpannedString f(String str, String str2, List list) {
        String str3;
        char c11;
        String strSubstring;
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        ArrayDeque arrayDeque = new ArrayDeque();
        ArrayList arrayList = new ArrayList();
        int i5 = 0;
        while (true) {
            int length = str2.length();
            String strTrim = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            if (i5 >= length) {
                while (!arrayDeque.isEmpty()) {
                    a(str, (e) arrayDeque.pop(), arrayList, spannableStringBuilder, list);
                }
                a(str, new e(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, 0, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, Collections.EMPTY_SET), Collections.EMPTY_LIST, spannableStringBuilder, list);
                return SpannedString.valueOf(spannableStringBuilder);
            }
            char cCharAt = str2.charAt(i5);
            if (cCharAt == '&') {
                i5++;
                int iIndexOf = str2.indexOf(59, i5);
                int iIndexOf2 = str2.indexOf(32, i5);
                if (iIndexOf == -1) {
                    iIndexOf = iIndexOf2;
                } else if (iIndexOf2 != -1) {
                    iIndexOf = Math.min(iIndexOf, iIndexOf2);
                }
                if (iIndexOf != -1) {
                    strSubstring = str2.substring(i5, iIndexOf);
                    strSubstring.getClass();
                    switch (strSubstring) {
                        case "gt":
                            spannableStringBuilder.append('>');
                            break;
                        case "lt":
                            spannableStringBuilder.append('<');
                            break;
                        case "amp":
                            spannableStringBuilder.append('&');
                            break;
                        case "nbsp":
                            spannableStringBuilder.append(' ');
                            break;
                        default:
                            wf.a.D("WebvttCueParser", "ignoring unsupported entity: '&" + strSubstring + ";'");
                            break;
                    }
                    if (iIndexOf == iIndexOf2) {
                        spannableStringBuilder.append((CharSequence) " ");
                    }
                    i5 = iIndexOf + 1;
                } else {
                    spannableStringBuilder.append(cCharAt);
                }
            } else if (cCharAt != '<') {
                spannableStringBuilder.append(cCharAt);
                i5++;
            } else {
                int length2 = i5 + 1;
                if (length2 < str2.length()) {
                    boolean z11 = str2.charAt(length2) == '/';
                    int iIndexOf3 = str2.indexOf(62, length2);
                    length2 = iIndexOf3 == -1 ? str2.length() : iIndexOf3 + 1;
                    int i11 = length2 - 2;
                    boolean z12 = str2.charAt(i11) == '/';
                    int i12 = i5 + (z11 ? 2 : 1);
                    if (!z12) {
                        i11 = length2 - 1;
                    }
                    String strSubstring2 = str2.substring(i12, i11);
                    if (!strSubstring2.trim().isEmpty()) {
                        String strTrim2 = strSubstring2.trim();
                        wf.a.e(!strTrim2.isEmpty());
                        int i13 = wf.v.f94376a;
                        str3 = strTrim2.split("[ \\.]", 2)[0];
                        str3.getClass();
                        switch (str3) {
                            case "b":
                            case "c":
                            case "i":
                            case "u":
                            case "v":
                            case "rt":
                            case "lang":
                            case "ruby":
                                if (z11) {
                                    while (!arrayDeque.isEmpty()) {
                                        e eVar = (e) arrayDeque.pop();
                                        a(str, eVar, arrayList, spannableStringBuilder, list);
                                        if (arrayDeque.isEmpty()) {
                                            arrayList.clear();
                                        } else {
                                            arrayList.add(new d(eVar, spannableStringBuilder.length()));
                                        }
                                        if (eVar.f87391a.equals(str3)) {
                                            break;
                                        }
                                    }
                                    break;
                                } else if (!z12) {
                                    int length3 = spannableStringBuilder.length();
                                    String strTrim3 = strSubstring2.trim();
                                    wf.a.e(!strTrim3.isEmpty());
                                    int iIndexOf4 = strTrim3.indexOf(" ");
                                    if (iIndexOf4 == -1) {
                                        c11 = 0;
                                    } else {
                                        strTrim = strTrim3.substring(iIndexOf4).trim();
                                        c11 = 0;
                                        strTrim3 = strTrim3.substring(0, iIndexOf4);
                                    }
                                    String[] strArrSplit = strTrim3.split("\\.", -1);
                                    String str4 = strArrSplit[c11];
                                    HashSet hashSet = new HashSet();
                                    for (int i14 = 1; i14 < strArrSplit.length; i14++) {
                                        hashSet.add(strArrSplit[i14]);
                                    }
                                    arrayDeque.push(new e(str4, length3, strTrim, hashSet));
                                    break;
                                }
                                break;
                        }
                    }
                }
                i5 = length2;
            }
        }
    }

    public static void g(String str, g gVar) {
        String strSubstring;
        int i5;
        int iIndexOf = str.indexOf(44);
        if (iIndexOf != -1) {
            strSubstring = str.substring(iIndexOf + 1);
            strSubstring.getClass();
            i5 = 2;
            switch (strSubstring) {
                case "center":
                case "middle":
                    i5 = 1;
                    break;
                case "end":
                    break;
                case "start":
                    i5 = 0;
                    break;
                default:
                    wf.a.D("WebvttCueParser", "Invalid anchor value: ".concat(strSubstring));
                    i5 = Integer.MIN_VALUE;
                    break;
            }
            gVar.f87403g = i5;
            str = str.substring(0, iIndexOf);
        }
        if (str.endsWith("%")) {
            gVar.f87401e = j.a(str);
            gVar.f87402f = 0;
        } else {
            gVar.f87401e = Integer.parseInt(str);
            gVar.f87402f = 1;
        }
    }
}
