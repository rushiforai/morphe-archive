package defpackage;

import android.net.Uri;
import android.os.Bundle;
import com.drew.imaging.eps.ld.PdtluglzAX;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class qa8 {
    public static final x2b q = new x2b("^[a-zA-Z]+[+\\w\\-.]*:");
    public static final x2b r = new x2b("\\{(.+?)\\}");
    public static final x2b s = new x2b("http[s]?://");
    public static final x2b t = new x2b(".*");
    public static final x2b u = new x2b("([^/]*?|)");
    public static final x2b v = new x2b("^[^?#]+\\?([^#]*).*");
    public final String a;
    public final String b;
    public final String c;
    public final ArrayList d;
    public final String e;
    public final w5d f;
    public final w5d g;
    public final vq6 h;
    public boolean i;
    public final vq6 j;
    public final vq6 k;
    public final vq6 l;
    public final w5d m;
    public final String n;
    public final w5d o;
    public final boolean p;

    public qa8(String str, String str2, String str3) {
        List listQ;
        List listG1;
        this.a = str;
        this.b = str2;
        this.c = str3;
        ArrayList arrayList = new ArrayList();
        this.d = arrayList;
        final int i = 0;
        this.f = new w5d(new m45(this) { // from class: na8
            public final /* synthetic */ qa8 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                List list;
                int i2 = i;
                qa8 qa8Var = this.b;
                switch (i2) {
                    case 0:
                        String str4 = qa8Var.e;
                        if (str4 != null) {
                            return new x2b(str4, y2b.IGNORE_CASE);
                        }
                        return null;
                    case 1:
                        String str5 = qa8Var.a;
                        return Boolean.valueOf(str5 != null && qa8.v.c(str5));
                    case 2:
                        String str6 = qa8Var.a;
                        LinkedHashMap linkedHashMap = new LinkedHashMap();
                        if (((Boolean) qa8Var.g.getValue()).booleanValue()) {
                            str6.getClass();
                            Uri uri = Uri.parse(str6);
                            uri.getClass();
                            for (String str7 : uri.getQueryParameterNames()) {
                                StringBuilder sb = new StringBuilder();
                                List<String> queryParameters = uri.getQueryParameters(str7);
                                if (queryParameters.size() > 1) {
                                    ywb.g(ev6.y("Query parameter ", str7, " must only be present once in ", str6, ". To support repeated query parameters, use an array type for your argument and the pattern provided in your URI will be used to parse each query parameter instance."));
                                    return null;
                                }
                                String str8 = (String) bu1.z0(queryParameters);
                                if (str8 == null) {
                                    qa8Var.i = true;
                                    str8 = str7;
                                }
                                x2b x2bVar = qa8.r;
                                x2bVar.getClass();
                                str8.getClass();
                                Matcher matcher = x2bVar.a.matcher(str8);
                                matcher.getClass();
                                pa8 pa8Var = new pa8();
                                int i3 = 0;
                                for (ij7 ij7VarR = ep7.r(matcher, 0, str8); ij7VarR != null; ij7VarR = ij7VarR.c()) {
                                    cj7 cj7VarD = ij7VarR.c.d(1);
                                    cj7VarD.getClass();
                                    pa8Var.b.add(cj7VarD.a);
                                    if (ij7VarR.b().a > i3) {
                                        String strQuote = Pattern.quote(str8.substring(i3, ij7VarR.b().a));
                                        strQuote.getClass();
                                        sb.append(strQuote);
                                    }
                                    sb.append("([\\s\\S]+?)?");
                                    i3 = ij7VarR.b().b + 1;
                                }
                                if (i3 < str8.length()) {
                                    String strQuote2 = Pattern.quote(str8.substring(i3));
                                    strQuote2.getClass();
                                    sb.append(strQuote2);
                                }
                                sb.append("$");
                                pa8Var.a = qa8.h(sb.toString());
                                linkedHashMap.put(str7, pa8Var);
                            }
                        }
                        return linkedHashMap;
                    case 3:
                        String str9 = qa8Var.a;
                        if (str9 == null) {
                            return null;
                        }
                        Uri uri2 = Uri.parse(str9);
                        uri2.getClass();
                        if (uri2.getFragment() == null) {
                            return null;
                        }
                        ArrayList arrayList2 = new ArrayList();
                        Uri uri3 = Uri.parse(str9);
                        uri3.getClass();
                        String fragment = uri3.getFragment();
                        StringBuilder sb2 = new StringBuilder();
                        fragment.getClass();
                        qa8.a(fragment, arrayList2, sb2);
                        return new f09(arrayList2, sb2.toString());
                    case 4:
                        f09 f09Var = (f09) qa8Var.j.getValue();
                        return (f09Var == null || (list = (List) f09Var.a) == null) ? new ArrayList() : list;
                    case 5:
                        f09 f09Var2 = (f09) qa8Var.j.getValue();
                        if (f09Var2 != null) {
                            return (String) f09Var2.b;
                        }
                        return null;
                    case 6:
                        String str10 = (String) qa8Var.l.getValue();
                        if (str10 != null) {
                            return new x2b(str10, y2b.IGNORE_CASE);
                        }
                        return null;
                    default:
                        String str11 = qa8Var.n;
                        if (str11 != null) {
                            return new x2b(str11);
                        }
                        return null;
                }
            }
        });
        final int i2 = 1;
        this.g = new w5d(new m45(this) { // from class: na8
            public final /* synthetic */ qa8 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                List list;
                int i22 = i2;
                qa8 qa8Var = this.b;
                switch (i22) {
                    case 0:
                        String str4 = qa8Var.e;
                        if (str4 != null) {
                            return new x2b(str4, y2b.IGNORE_CASE);
                        }
                        return null;
                    case 1:
                        String str5 = qa8Var.a;
                        return Boolean.valueOf(str5 != null && qa8.v.c(str5));
                    case 2:
                        String str6 = qa8Var.a;
                        LinkedHashMap linkedHashMap = new LinkedHashMap();
                        if (((Boolean) qa8Var.g.getValue()).booleanValue()) {
                            str6.getClass();
                            Uri uri = Uri.parse(str6);
                            uri.getClass();
                            for (String str7 : uri.getQueryParameterNames()) {
                                StringBuilder sb = new StringBuilder();
                                List<String> queryParameters = uri.getQueryParameters(str7);
                                if (queryParameters.size() > 1) {
                                    ywb.g(ev6.y("Query parameter ", str7, " must only be present once in ", str6, ". To support repeated query parameters, use an array type for your argument and the pattern provided in your URI will be used to parse each query parameter instance."));
                                    return null;
                                }
                                String str8 = (String) bu1.z0(queryParameters);
                                if (str8 == null) {
                                    qa8Var.i = true;
                                    str8 = str7;
                                }
                                x2b x2bVar = qa8.r;
                                x2bVar.getClass();
                                str8.getClass();
                                Matcher matcher = x2bVar.a.matcher(str8);
                                matcher.getClass();
                                pa8 pa8Var = new pa8();
                                int i3 = 0;
                                for (ij7 ij7VarR = ep7.r(matcher, 0, str8); ij7VarR != null; ij7VarR = ij7VarR.c()) {
                                    cj7 cj7VarD = ij7VarR.c.d(1);
                                    cj7VarD.getClass();
                                    pa8Var.b.add(cj7VarD.a);
                                    if (ij7VarR.b().a > i3) {
                                        String strQuote = Pattern.quote(str8.substring(i3, ij7VarR.b().a));
                                        strQuote.getClass();
                                        sb.append(strQuote);
                                    }
                                    sb.append("([\\s\\S]+?)?");
                                    i3 = ij7VarR.b().b + 1;
                                }
                                if (i3 < str8.length()) {
                                    String strQuote2 = Pattern.quote(str8.substring(i3));
                                    strQuote2.getClass();
                                    sb.append(strQuote2);
                                }
                                sb.append("$");
                                pa8Var.a = qa8.h(sb.toString());
                                linkedHashMap.put(str7, pa8Var);
                            }
                        }
                        return linkedHashMap;
                    case 3:
                        String str9 = qa8Var.a;
                        if (str9 == null) {
                            return null;
                        }
                        Uri uri2 = Uri.parse(str9);
                        uri2.getClass();
                        if (uri2.getFragment() == null) {
                            return null;
                        }
                        ArrayList arrayList2 = new ArrayList();
                        Uri uri3 = Uri.parse(str9);
                        uri3.getClass();
                        String fragment = uri3.getFragment();
                        StringBuilder sb2 = new StringBuilder();
                        fragment.getClass();
                        qa8.a(fragment, arrayList2, sb2);
                        return new f09(arrayList2, sb2.toString());
                    case 4:
                        f09 f09Var = (f09) qa8Var.j.getValue();
                        return (f09Var == null || (list = (List) f09Var.a) == null) ? new ArrayList() : list;
                    case 5:
                        f09 f09Var2 = (f09) qa8Var.j.getValue();
                        if (f09Var2 != null) {
                            return (String) f09Var2.b;
                        }
                        return null;
                    case 6:
                        String str10 = (String) qa8Var.l.getValue();
                        if (str10 != null) {
                            return new x2b(str10, y2b.IGNORE_CASE);
                        }
                        return null;
                    default:
                        String str11 = qa8Var.n;
                        if (str11 != null) {
                            return new x2b(str11);
                        }
                        return null;
                }
            }
        });
        yw6 yw6Var = yw6.NONE;
        final int i3 = 2;
        this.h = vx0.d0(yw6Var, new m45(this) { // from class: na8
            public final /* synthetic */ qa8 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                List list;
                int i22 = i3;
                qa8 qa8Var = this.b;
                switch (i22) {
                    case 0:
                        String str4 = qa8Var.e;
                        if (str4 != null) {
                            return new x2b(str4, y2b.IGNORE_CASE);
                        }
                        return null;
                    case 1:
                        String str5 = qa8Var.a;
                        return Boolean.valueOf(str5 != null && qa8.v.c(str5));
                    case 2:
                        String str6 = qa8Var.a;
                        LinkedHashMap linkedHashMap = new LinkedHashMap();
                        if (((Boolean) qa8Var.g.getValue()).booleanValue()) {
                            str6.getClass();
                            Uri uri = Uri.parse(str6);
                            uri.getClass();
                            for (String str7 : uri.getQueryParameterNames()) {
                                StringBuilder sb = new StringBuilder();
                                List<String> queryParameters = uri.getQueryParameters(str7);
                                if (queryParameters.size() > 1) {
                                    ywb.g(ev6.y("Query parameter ", str7, " must only be present once in ", str6, ". To support repeated query parameters, use an array type for your argument and the pattern provided in your URI will be used to parse each query parameter instance."));
                                    return null;
                                }
                                String str8 = (String) bu1.z0(queryParameters);
                                if (str8 == null) {
                                    qa8Var.i = true;
                                    str8 = str7;
                                }
                                x2b x2bVar = qa8.r;
                                x2bVar.getClass();
                                str8.getClass();
                                Matcher matcher = x2bVar.a.matcher(str8);
                                matcher.getClass();
                                pa8 pa8Var = new pa8();
                                int i32 = 0;
                                for (ij7 ij7VarR = ep7.r(matcher, 0, str8); ij7VarR != null; ij7VarR = ij7VarR.c()) {
                                    cj7 cj7VarD = ij7VarR.c.d(1);
                                    cj7VarD.getClass();
                                    pa8Var.b.add(cj7VarD.a);
                                    if (ij7VarR.b().a > i32) {
                                        String strQuote = Pattern.quote(str8.substring(i32, ij7VarR.b().a));
                                        strQuote.getClass();
                                        sb.append(strQuote);
                                    }
                                    sb.append("([\\s\\S]+?)?");
                                    i32 = ij7VarR.b().b + 1;
                                }
                                if (i32 < str8.length()) {
                                    String strQuote2 = Pattern.quote(str8.substring(i32));
                                    strQuote2.getClass();
                                    sb.append(strQuote2);
                                }
                                sb.append("$");
                                pa8Var.a = qa8.h(sb.toString());
                                linkedHashMap.put(str7, pa8Var);
                            }
                        }
                        return linkedHashMap;
                    case 3:
                        String str9 = qa8Var.a;
                        if (str9 == null) {
                            return null;
                        }
                        Uri uri2 = Uri.parse(str9);
                        uri2.getClass();
                        if (uri2.getFragment() == null) {
                            return null;
                        }
                        ArrayList arrayList2 = new ArrayList();
                        Uri uri3 = Uri.parse(str9);
                        uri3.getClass();
                        String fragment = uri3.getFragment();
                        StringBuilder sb2 = new StringBuilder();
                        fragment.getClass();
                        qa8.a(fragment, arrayList2, sb2);
                        return new f09(arrayList2, sb2.toString());
                    case 4:
                        f09 f09Var = (f09) qa8Var.j.getValue();
                        return (f09Var == null || (list = (List) f09Var.a) == null) ? new ArrayList() : list;
                    case 5:
                        f09 f09Var2 = (f09) qa8Var.j.getValue();
                        if (f09Var2 != null) {
                            return (String) f09Var2.b;
                        }
                        return null;
                    case 6:
                        String str10 = (String) qa8Var.l.getValue();
                        if (str10 != null) {
                            return new x2b(str10, y2b.IGNORE_CASE);
                        }
                        return null;
                    default:
                        String str11 = qa8Var.n;
                        if (str11 != null) {
                            return new x2b(str11);
                        }
                        return null;
                }
            }
        });
        final int i4 = 3;
        this.j = vx0.d0(yw6Var, new m45(this) { // from class: na8
            public final /* synthetic */ qa8 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                List list;
                int i22 = i4;
                qa8 qa8Var = this.b;
                switch (i22) {
                    case 0:
                        String str4 = qa8Var.e;
                        if (str4 != null) {
                            return new x2b(str4, y2b.IGNORE_CASE);
                        }
                        return null;
                    case 1:
                        String str5 = qa8Var.a;
                        return Boolean.valueOf(str5 != null && qa8.v.c(str5));
                    case 2:
                        String str6 = qa8Var.a;
                        LinkedHashMap linkedHashMap = new LinkedHashMap();
                        if (((Boolean) qa8Var.g.getValue()).booleanValue()) {
                            str6.getClass();
                            Uri uri = Uri.parse(str6);
                            uri.getClass();
                            for (String str7 : uri.getQueryParameterNames()) {
                                StringBuilder sb = new StringBuilder();
                                List<String> queryParameters = uri.getQueryParameters(str7);
                                if (queryParameters.size() > 1) {
                                    ywb.g(ev6.y("Query parameter ", str7, " must only be present once in ", str6, ". To support repeated query parameters, use an array type for your argument and the pattern provided in your URI will be used to parse each query parameter instance."));
                                    return null;
                                }
                                String str8 = (String) bu1.z0(queryParameters);
                                if (str8 == null) {
                                    qa8Var.i = true;
                                    str8 = str7;
                                }
                                x2b x2bVar = qa8.r;
                                x2bVar.getClass();
                                str8.getClass();
                                Matcher matcher = x2bVar.a.matcher(str8);
                                matcher.getClass();
                                pa8 pa8Var = new pa8();
                                int i32 = 0;
                                for (ij7 ij7VarR = ep7.r(matcher, 0, str8); ij7VarR != null; ij7VarR = ij7VarR.c()) {
                                    cj7 cj7VarD = ij7VarR.c.d(1);
                                    cj7VarD.getClass();
                                    pa8Var.b.add(cj7VarD.a);
                                    if (ij7VarR.b().a > i32) {
                                        String strQuote = Pattern.quote(str8.substring(i32, ij7VarR.b().a));
                                        strQuote.getClass();
                                        sb.append(strQuote);
                                    }
                                    sb.append("([\\s\\S]+?)?");
                                    i32 = ij7VarR.b().b + 1;
                                }
                                if (i32 < str8.length()) {
                                    String strQuote2 = Pattern.quote(str8.substring(i32));
                                    strQuote2.getClass();
                                    sb.append(strQuote2);
                                }
                                sb.append("$");
                                pa8Var.a = qa8.h(sb.toString());
                                linkedHashMap.put(str7, pa8Var);
                            }
                        }
                        return linkedHashMap;
                    case 3:
                        String str9 = qa8Var.a;
                        if (str9 == null) {
                            return null;
                        }
                        Uri uri2 = Uri.parse(str9);
                        uri2.getClass();
                        if (uri2.getFragment() == null) {
                            return null;
                        }
                        ArrayList arrayList2 = new ArrayList();
                        Uri uri3 = Uri.parse(str9);
                        uri3.getClass();
                        String fragment = uri3.getFragment();
                        StringBuilder sb2 = new StringBuilder();
                        fragment.getClass();
                        qa8.a(fragment, arrayList2, sb2);
                        return new f09(arrayList2, sb2.toString());
                    case 4:
                        f09 f09Var = (f09) qa8Var.j.getValue();
                        return (f09Var == null || (list = (List) f09Var.a) == null) ? new ArrayList() : list;
                    case 5:
                        f09 f09Var2 = (f09) qa8Var.j.getValue();
                        if (f09Var2 != null) {
                            return (String) f09Var2.b;
                        }
                        return null;
                    case 6:
                        String str10 = (String) qa8Var.l.getValue();
                        if (str10 != null) {
                            return new x2b(str10, y2b.IGNORE_CASE);
                        }
                        return null;
                    default:
                        String str11 = qa8Var.n;
                        if (str11 != null) {
                            return new x2b(str11);
                        }
                        return null;
                }
            }
        });
        final int i5 = 4;
        this.k = vx0.d0(yw6Var, new m45(this) { // from class: na8
            public final /* synthetic */ qa8 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                List list;
                int i22 = i5;
                qa8 qa8Var = this.b;
                switch (i22) {
                    case 0:
                        String str4 = qa8Var.e;
                        if (str4 != null) {
                            return new x2b(str4, y2b.IGNORE_CASE);
                        }
                        return null;
                    case 1:
                        String str5 = qa8Var.a;
                        return Boolean.valueOf(str5 != null && qa8.v.c(str5));
                    case 2:
                        String str6 = qa8Var.a;
                        LinkedHashMap linkedHashMap = new LinkedHashMap();
                        if (((Boolean) qa8Var.g.getValue()).booleanValue()) {
                            str6.getClass();
                            Uri uri = Uri.parse(str6);
                            uri.getClass();
                            for (String str7 : uri.getQueryParameterNames()) {
                                StringBuilder sb = new StringBuilder();
                                List<String> queryParameters = uri.getQueryParameters(str7);
                                if (queryParameters.size() > 1) {
                                    ywb.g(ev6.y("Query parameter ", str7, " must only be present once in ", str6, ". To support repeated query parameters, use an array type for your argument and the pattern provided in your URI will be used to parse each query parameter instance."));
                                    return null;
                                }
                                String str8 = (String) bu1.z0(queryParameters);
                                if (str8 == null) {
                                    qa8Var.i = true;
                                    str8 = str7;
                                }
                                x2b x2bVar = qa8.r;
                                x2bVar.getClass();
                                str8.getClass();
                                Matcher matcher = x2bVar.a.matcher(str8);
                                matcher.getClass();
                                pa8 pa8Var = new pa8();
                                int i32 = 0;
                                for (ij7 ij7VarR = ep7.r(matcher, 0, str8); ij7VarR != null; ij7VarR = ij7VarR.c()) {
                                    cj7 cj7VarD = ij7VarR.c.d(1);
                                    cj7VarD.getClass();
                                    pa8Var.b.add(cj7VarD.a);
                                    if (ij7VarR.b().a > i32) {
                                        String strQuote = Pattern.quote(str8.substring(i32, ij7VarR.b().a));
                                        strQuote.getClass();
                                        sb.append(strQuote);
                                    }
                                    sb.append("([\\s\\S]+?)?");
                                    i32 = ij7VarR.b().b + 1;
                                }
                                if (i32 < str8.length()) {
                                    String strQuote2 = Pattern.quote(str8.substring(i32));
                                    strQuote2.getClass();
                                    sb.append(strQuote2);
                                }
                                sb.append("$");
                                pa8Var.a = qa8.h(sb.toString());
                                linkedHashMap.put(str7, pa8Var);
                            }
                        }
                        return linkedHashMap;
                    case 3:
                        String str9 = qa8Var.a;
                        if (str9 == null) {
                            return null;
                        }
                        Uri uri2 = Uri.parse(str9);
                        uri2.getClass();
                        if (uri2.getFragment() == null) {
                            return null;
                        }
                        ArrayList arrayList2 = new ArrayList();
                        Uri uri3 = Uri.parse(str9);
                        uri3.getClass();
                        String fragment = uri3.getFragment();
                        StringBuilder sb2 = new StringBuilder();
                        fragment.getClass();
                        qa8.a(fragment, arrayList2, sb2);
                        return new f09(arrayList2, sb2.toString());
                    case 4:
                        f09 f09Var = (f09) qa8Var.j.getValue();
                        return (f09Var == null || (list = (List) f09Var.a) == null) ? new ArrayList() : list;
                    case 5:
                        f09 f09Var2 = (f09) qa8Var.j.getValue();
                        if (f09Var2 != null) {
                            return (String) f09Var2.b;
                        }
                        return null;
                    case 6:
                        String str10 = (String) qa8Var.l.getValue();
                        if (str10 != null) {
                            return new x2b(str10, y2b.IGNORE_CASE);
                        }
                        return null;
                    default:
                        String str11 = qa8Var.n;
                        if (str11 != null) {
                            return new x2b(str11);
                        }
                        return null;
                }
            }
        });
        final int i6 = 5;
        this.l = vx0.d0(yw6Var, new m45(this) { // from class: na8
            public final /* synthetic */ qa8 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                List list;
                int i22 = i6;
                qa8 qa8Var = this.b;
                switch (i22) {
                    case 0:
                        String str4 = qa8Var.e;
                        if (str4 != null) {
                            return new x2b(str4, y2b.IGNORE_CASE);
                        }
                        return null;
                    case 1:
                        String str5 = qa8Var.a;
                        return Boolean.valueOf(str5 != null && qa8.v.c(str5));
                    case 2:
                        String str6 = qa8Var.a;
                        LinkedHashMap linkedHashMap = new LinkedHashMap();
                        if (((Boolean) qa8Var.g.getValue()).booleanValue()) {
                            str6.getClass();
                            Uri uri = Uri.parse(str6);
                            uri.getClass();
                            for (String str7 : uri.getQueryParameterNames()) {
                                StringBuilder sb = new StringBuilder();
                                List<String> queryParameters = uri.getQueryParameters(str7);
                                if (queryParameters.size() > 1) {
                                    ywb.g(ev6.y("Query parameter ", str7, " must only be present once in ", str6, ". To support repeated query parameters, use an array type for your argument and the pattern provided in your URI will be used to parse each query parameter instance."));
                                    return null;
                                }
                                String str8 = (String) bu1.z0(queryParameters);
                                if (str8 == null) {
                                    qa8Var.i = true;
                                    str8 = str7;
                                }
                                x2b x2bVar = qa8.r;
                                x2bVar.getClass();
                                str8.getClass();
                                Matcher matcher = x2bVar.a.matcher(str8);
                                matcher.getClass();
                                pa8 pa8Var = new pa8();
                                int i32 = 0;
                                for (ij7 ij7VarR = ep7.r(matcher, 0, str8); ij7VarR != null; ij7VarR = ij7VarR.c()) {
                                    cj7 cj7VarD = ij7VarR.c.d(1);
                                    cj7VarD.getClass();
                                    pa8Var.b.add(cj7VarD.a);
                                    if (ij7VarR.b().a > i32) {
                                        String strQuote = Pattern.quote(str8.substring(i32, ij7VarR.b().a));
                                        strQuote.getClass();
                                        sb.append(strQuote);
                                    }
                                    sb.append("([\\s\\S]+?)?");
                                    i32 = ij7VarR.b().b + 1;
                                }
                                if (i32 < str8.length()) {
                                    String strQuote2 = Pattern.quote(str8.substring(i32));
                                    strQuote2.getClass();
                                    sb.append(strQuote2);
                                }
                                sb.append("$");
                                pa8Var.a = qa8.h(sb.toString());
                                linkedHashMap.put(str7, pa8Var);
                            }
                        }
                        return linkedHashMap;
                    case 3:
                        String str9 = qa8Var.a;
                        if (str9 == null) {
                            return null;
                        }
                        Uri uri2 = Uri.parse(str9);
                        uri2.getClass();
                        if (uri2.getFragment() == null) {
                            return null;
                        }
                        ArrayList arrayList2 = new ArrayList();
                        Uri uri3 = Uri.parse(str9);
                        uri3.getClass();
                        String fragment = uri3.getFragment();
                        StringBuilder sb2 = new StringBuilder();
                        fragment.getClass();
                        qa8.a(fragment, arrayList2, sb2);
                        return new f09(arrayList2, sb2.toString());
                    case 4:
                        f09 f09Var = (f09) qa8Var.j.getValue();
                        return (f09Var == null || (list = (List) f09Var.a) == null) ? new ArrayList() : list;
                    case 5:
                        f09 f09Var2 = (f09) qa8Var.j.getValue();
                        if (f09Var2 != null) {
                            return (String) f09Var2.b;
                        }
                        return null;
                    case 6:
                        String str10 = (String) qa8Var.l.getValue();
                        if (str10 != null) {
                            return new x2b(str10, y2b.IGNORE_CASE);
                        }
                        return null;
                    default:
                        String str11 = qa8Var.n;
                        if (str11 != null) {
                            return new x2b(str11);
                        }
                        return null;
                }
            }
        });
        final int i7 = 6;
        this.m = new w5d(new m45(this) { // from class: na8
            public final /* synthetic */ qa8 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                List list;
                int i22 = i7;
                qa8 qa8Var = this.b;
                switch (i22) {
                    case 0:
                        String str4 = qa8Var.e;
                        if (str4 != null) {
                            return new x2b(str4, y2b.IGNORE_CASE);
                        }
                        return null;
                    case 1:
                        String str5 = qa8Var.a;
                        return Boolean.valueOf(str5 != null && qa8.v.c(str5));
                    case 2:
                        String str6 = qa8Var.a;
                        LinkedHashMap linkedHashMap = new LinkedHashMap();
                        if (((Boolean) qa8Var.g.getValue()).booleanValue()) {
                            str6.getClass();
                            Uri uri = Uri.parse(str6);
                            uri.getClass();
                            for (String str7 : uri.getQueryParameterNames()) {
                                StringBuilder sb = new StringBuilder();
                                List<String> queryParameters = uri.getQueryParameters(str7);
                                if (queryParameters.size() > 1) {
                                    ywb.g(ev6.y("Query parameter ", str7, " must only be present once in ", str6, ". To support repeated query parameters, use an array type for your argument and the pattern provided in your URI will be used to parse each query parameter instance."));
                                    return null;
                                }
                                String str8 = (String) bu1.z0(queryParameters);
                                if (str8 == null) {
                                    qa8Var.i = true;
                                    str8 = str7;
                                }
                                x2b x2bVar = qa8.r;
                                x2bVar.getClass();
                                str8.getClass();
                                Matcher matcher = x2bVar.a.matcher(str8);
                                matcher.getClass();
                                pa8 pa8Var = new pa8();
                                int i32 = 0;
                                for (ij7 ij7VarR = ep7.r(matcher, 0, str8); ij7VarR != null; ij7VarR = ij7VarR.c()) {
                                    cj7 cj7VarD = ij7VarR.c.d(1);
                                    cj7VarD.getClass();
                                    pa8Var.b.add(cj7VarD.a);
                                    if (ij7VarR.b().a > i32) {
                                        String strQuote = Pattern.quote(str8.substring(i32, ij7VarR.b().a));
                                        strQuote.getClass();
                                        sb.append(strQuote);
                                    }
                                    sb.append("([\\s\\S]+?)?");
                                    i32 = ij7VarR.b().b + 1;
                                }
                                if (i32 < str8.length()) {
                                    String strQuote2 = Pattern.quote(str8.substring(i32));
                                    strQuote2.getClass();
                                    sb.append(strQuote2);
                                }
                                sb.append("$");
                                pa8Var.a = qa8.h(sb.toString());
                                linkedHashMap.put(str7, pa8Var);
                            }
                        }
                        return linkedHashMap;
                    case 3:
                        String str9 = qa8Var.a;
                        if (str9 == null) {
                            return null;
                        }
                        Uri uri2 = Uri.parse(str9);
                        uri2.getClass();
                        if (uri2.getFragment() == null) {
                            return null;
                        }
                        ArrayList arrayList2 = new ArrayList();
                        Uri uri3 = Uri.parse(str9);
                        uri3.getClass();
                        String fragment = uri3.getFragment();
                        StringBuilder sb2 = new StringBuilder();
                        fragment.getClass();
                        qa8.a(fragment, arrayList2, sb2);
                        return new f09(arrayList2, sb2.toString());
                    case 4:
                        f09 f09Var = (f09) qa8Var.j.getValue();
                        return (f09Var == null || (list = (List) f09Var.a) == null) ? new ArrayList() : list;
                    case 5:
                        f09 f09Var2 = (f09) qa8Var.j.getValue();
                        if (f09Var2 != null) {
                            return (String) f09Var2.b;
                        }
                        return null;
                    case 6:
                        String str10 = (String) qa8Var.l.getValue();
                        if (str10 != null) {
                            return new x2b(str10, y2b.IGNORE_CASE);
                        }
                        return null;
                    default:
                        String str11 = qa8Var.n;
                        if (str11 != null) {
                            return new x2b(str11);
                        }
                        return null;
                }
            }
        });
        final int i8 = 7;
        this.o = new w5d(new m45(this) { // from class: na8
            public final /* synthetic */ qa8 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                List list;
                int i22 = i8;
                qa8 qa8Var = this.b;
                switch (i22) {
                    case 0:
                        String str4 = qa8Var.e;
                        if (str4 != null) {
                            return new x2b(str4, y2b.IGNORE_CASE);
                        }
                        return null;
                    case 1:
                        String str5 = qa8Var.a;
                        return Boolean.valueOf(str5 != null && qa8.v.c(str5));
                    case 2:
                        String str6 = qa8Var.a;
                        LinkedHashMap linkedHashMap = new LinkedHashMap();
                        if (((Boolean) qa8Var.g.getValue()).booleanValue()) {
                            str6.getClass();
                            Uri uri = Uri.parse(str6);
                            uri.getClass();
                            for (String str7 : uri.getQueryParameterNames()) {
                                StringBuilder sb = new StringBuilder();
                                List<String> queryParameters = uri.getQueryParameters(str7);
                                if (queryParameters.size() > 1) {
                                    ywb.g(ev6.y("Query parameter ", str7, " must only be present once in ", str6, ". To support repeated query parameters, use an array type for your argument and the pattern provided in your URI will be used to parse each query parameter instance."));
                                    return null;
                                }
                                String str8 = (String) bu1.z0(queryParameters);
                                if (str8 == null) {
                                    qa8Var.i = true;
                                    str8 = str7;
                                }
                                x2b x2bVar = qa8.r;
                                x2bVar.getClass();
                                str8.getClass();
                                Matcher matcher = x2bVar.a.matcher(str8);
                                matcher.getClass();
                                pa8 pa8Var = new pa8();
                                int i32 = 0;
                                for (ij7 ij7VarR = ep7.r(matcher, 0, str8); ij7VarR != null; ij7VarR = ij7VarR.c()) {
                                    cj7 cj7VarD = ij7VarR.c.d(1);
                                    cj7VarD.getClass();
                                    pa8Var.b.add(cj7VarD.a);
                                    if (ij7VarR.b().a > i32) {
                                        String strQuote = Pattern.quote(str8.substring(i32, ij7VarR.b().a));
                                        strQuote.getClass();
                                        sb.append(strQuote);
                                    }
                                    sb.append("([\\s\\S]+?)?");
                                    i32 = ij7VarR.b().b + 1;
                                }
                                if (i32 < str8.length()) {
                                    String strQuote2 = Pattern.quote(str8.substring(i32));
                                    strQuote2.getClass();
                                    sb.append(strQuote2);
                                }
                                sb.append("$");
                                pa8Var.a = qa8.h(sb.toString());
                                linkedHashMap.put(str7, pa8Var);
                            }
                        }
                        return linkedHashMap;
                    case 3:
                        String str9 = qa8Var.a;
                        if (str9 == null) {
                            return null;
                        }
                        Uri uri2 = Uri.parse(str9);
                        uri2.getClass();
                        if (uri2.getFragment() == null) {
                            return null;
                        }
                        ArrayList arrayList2 = new ArrayList();
                        Uri uri3 = Uri.parse(str9);
                        uri3.getClass();
                        String fragment = uri3.getFragment();
                        StringBuilder sb2 = new StringBuilder();
                        fragment.getClass();
                        qa8.a(fragment, arrayList2, sb2);
                        return new f09(arrayList2, sb2.toString());
                    case 4:
                        f09 f09Var = (f09) qa8Var.j.getValue();
                        return (f09Var == null || (list = (List) f09Var.a) == null) ? new ArrayList() : list;
                    case 5:
                        f09 f09Var2 = (f09) qa8Var.j.getValue();
                        if (f09Var2 != null) {
                            return (String) f09Var2.b;
                        }
                        return null;
                    case 6:
                        String str10 = (String) qa8Var.l.getValue();
                        if (str10 != null) {
                            return new x2b(str10, y2b.IGNORE_CASE);
                        }
                        return null;
                    default:
                        String str11 = qa8Var.n;
                        if (str11 != null) {
                            return new x2b(str11);
                        }
                        return null;
                }
            }
        });
        if (str != null) {
            StringBuilder sb = new StringBuilder("^");
            if (!q.a.matcher(str).find()) {
                String strPattern = s.a.pattern();
                strPattern.getClass();
                sb.append(strPattern);
            }
            Pattern patternCompile = Pattern.compile("(\\?|#|$)");
            patternCompile.getClass();
            Matcher matcher = patternCompile.matcher(str);
            matcher.getClass();
            ij7 ij7VarR = ep7.r(matcher, 0, str);
            if (ij7VarR != null) {
                a(str.substring(0, ij7VarR.b().a), arrayList, sb);
                this.p = (t.a.matcher(sb).find() || u.a.matcher(sb).find()) ? false : true;
                sb.append("($|(\\?(.)*)|(#(.)*))");
            }
            this.e = h(sb.toString());
        }
        if (str3 == null) {
            return;
        }
        Pattern patternCompile2 = Pattern.compile("^[\\s\\S]+/[\\s\\S]+$");
        patternCompile2.getClass();
        if (!patternCompile2.matcher(str3).matches()) {
            ywb.g(ev6.x("The given mimeType ", str3, " does not match to required \"type/subtype\" format"));
            throw null;
        }
        Pattern patternCompile3 = Pattern.compile("/");
        patternCompile3.getClass();
        muc.m0(0);
        Matcher matcher2 = patternCompile3.matcher(str3);
        if (matcher2.find()) {
            ArrayList arrayList2 = new ArrayList(10);
            int iEnd = 0;
            do {
                arrayList2.add(str3.subSequence(iEnd, matcher2.start()).toString());
                iEnd = matcher2.end();
            } while (matcher2.find());
            arrayList2.add(str3.subSequence(iEnd, str3.length()).toString());
            listQ = arrayList2;
        } else {
            listQ = d46.Q(str3.toString());
        }
        if (listQ.isEmpty()) {
            listG1 = ey3.a;
        } else {
            ListIterator listIterator = listQ.listIterator(listQ.size());
            while (listIterator.hasPrevious()) {
                if (((String) listIterator.previous()).length() != 0) {
                    listG1 = bu1.g1(listQ, listIterator.nextIndex() + 1);
                    break;
                }
            }
            listG1 = ey3.a;
        }
        this.n = tuc.L(ev6.y("^(", (String) listG1.get(0), "|[*]+)/(", (String) listG1.get(1), "|[*]+)$"), "*|[*]", "[\\s\\S]");
    }

    public static void a(String str, ArrayList arrayList, StringBuilder sb) {
        x2b x2bVar = r;
        x2bVar.getClass();
        Matcher matcher = x2bVar.a.matcher(str);
        matcher.getClass();
        int i = 0;
        for (ij7 ij7VarR = ep7.r(matcher, 0, str); ij7VarR != null; ij7VarR = ij7VarR.c()) {
            cj7 cj7VarD = ij7VarR.c.d(1);
            cj7VarD.getClass();
            arrayList.add(cj7VarD.a);
            if (ij7VarR.b().a > i) {
                String strQuote = Pattern.quote(str.substring(i, ij7VarR.b().a));
                strQuote.getClass();
                sb.append(strQuote);
            }
            String strPattern = u.a.pattern();
            strPattern.getClass();
            sb.append(strPattern);
            i = ij7VarR.b().b + 1;
        }
        if (i < str.length()) {
            String strQuote2 = Pattern.quote(str.substring(i));
            strQuote2.getClass();
            sb.append(strQuote2);
        }
    }

    public static void g(Bundle bundle, String str, String str2, aa8 aa8Var) {
        if (aa8Var == null) {
            str.getClass();
            bundle.putString(str, str2);
        } else {
            wb8 wb8Var = aa8Var.a;
            str.getClass();
            wb8Var.e(bundle, str, wb8Var.c(str2));
        }
    }

    public static String h(String str) {
        return (muc.Q(str, "\\Q", false) && muc.Q(str, "\\E", false)) ? tuc.L(str, ".*", "\\E.*\\Q") : muc.Q(str, "\\.\\*", false) ? tuc.L(str, "\\.\\*", ".*") : str;
    }

    public final int b(Uri uri) {
        String str;
        if (uri == null || (str = this.a) == null) {
            return 0;
        }
        List<String> pathSegments = uri.getPathSegments();
        Uri uri2 = Uri.parse(str);
        uri2.getClass();
        return bu1.C0(pathSegments, uri2.getPathSegments()).size();
    }

    public final ArrayList c() {
        Collection collectionValues = ((Map) this.h.getValue()).values();
        ArrayList arrayList = new ArrayList();
        Iterator it2 = collectionValues.iterator();
        while (it2.hasNext()) {
            bu1.n0(((pa8) it2.next()).b, arrayList);
        }
        return bu1.Q0((List) this.k.getValue(), bu1.Q0(arrayList, this.d));
    }

    public final boolean e(ij7 ij7Var, Bundle bundle, LinkedHashMap linkedHashMap) {
        ArrayList arrayList = this.d;
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
        int i = 0;
        for (Object obj : arrayList) {
            int i2 = i + 1;
            String strDecode = null;
            if (i < 0) {
                d46.i0();
                throw null;
            }
            String str = (String) obj;
            cj7 cj7VarD = ij7Var.c.d(i2);
            if (cj7VarD != null) {
                strDecode = Uri.decode(cj7VarD.a);
                strDecode.getClass();
            }
            if (strDecode == null) {
                strDecode = "";
            }
            try {
                g(bundle, str, strDecode, (aa8) linkedHashMap.get(str));
                arrayList2.add(c1e.a);
                i = i2;
            } catch (IllegalArgumentException unused) {
                return false;
            }
        }
        return true;
    }

    public final boolean equals(Object obj) {
        if (obj != null && (obj instanceof qa8)) {
            qa8 qa8Var = (qa8) obj;
            if (g76.L(this.a, qa8Var.a) && g76.L(this.b, qa8Var.b) && g76.L(this.c, qa8Var.c)) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00cd  */
    /* JADX WARN: Type inference failed for: r14v2 */
    /* JADX WARN: Type inference failed for: r14v3, types: [int] */
    /* JADX WARN: Type inference failed for: r14v9 */
    /* JADX WARN: Type inference failed for: r22v0, types: [java.util.LinkedHashMap] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean f(android.net.Uri r20, android.os.Bundle r21, java.util.LinkedHashMap r22) {
        /*
            Method dump skipped, instruction units count: 384
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qa8.f(android.net.Uri, android.os.Bundle, java.util.LinkedHashMap):boolean");
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (str != null ? str.hashCode() : 0) * 31;
        String str2 = this.b;
        int iHashCode2 = (iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31;
        String str3 = this.c;
        return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
    }

    public final Bundle d(Uri uri, LinkedHashMap linkedHashMap) {
        ij7 ij7VarB;
        ij7 ij7VarB2;
        String strDecode;
        uri.getClass();
        x2b x2bVar = (x2b) this.f.getValue();
        if (x2bVar != null && (ij7VarB = x2bVar.b(uri.toString())) != null) {
            Bundle bundleE = xz5.E((f09[]) Arrays.copyOf(new f09[0], 0));
            if (e(ij7VarB, bundleE, linkedHashMap) && (!((Boolean) this.g.getValue()).booleanValue() || f(uri, bundleE, linkedHashMap))) {
                String fragment = uri.getFragment();
                x2b x2bVar2 = (x2b) this.m.getValue();
                if (x2bVar2 != null && (ij7VarB2 = x2bVar2.b(String.valueOf(fragment))) != null) {
                    List list = (List) this.k.getValue();
                    ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
                    int i = 0;
                    for (Object obj : list) {
                        int i2 = i + 1;
                        if (i >= 0) {
                            String str = (String) obj;
                            cj7 cj7VarD = ij7VarB2.c.d(i2);
                            if (cj7VarD != null) {
                                strDecode = Uri.decode(cj7VarD.a);
                                strDecode.getClass();
                            } else {
                                strDecode = null;
                            }
                            if (strDecode == null) {
                                strDecode = PdtluglzAX.bXCGMnB;
                            }
                            try {
                                g(bundleE, str, strDecode, (aa8) linkedHashMap.get(str));
                                arrayList.add(c1e.a);
                                i = i2;
                            } catch (IllegalArgumentException unused) {
                            }
                        } else {
                            d46.i0();
                            throw null;
                        }
                    }
                }
                if (fo7.N(linkedHashMap, new oa8(0, bundleE)).isEmpty()) {
                    return bundleE;
                }
            }
        }
        return null;
    }
}
