package p6;

import android.net.Uri;
import android.os.Bundle;
import io.sentry.w3;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class z {

    /* renamed from: m, reason: collision with root package name */
    public static final Pattern f82299m = Pattern.compile("^[a-zA-Z]+[+\\w\\-.]*:");
    public static final Pattern n = Pattern.compile("\\{(.+?)\\}");

    /* renamed from: a, reason: collision with root package name */
    public final String f82300a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f82301b;

    /* renamed from: c, reason: collision with root package name */
    public final String f82302c;

    /* renamed from: d, reason: collision with root package name */
    public final a70.d f82303d;

    /* renamed from: e, reason: collision with root package name */
    public final a70.d f82304e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f82305f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f82306g;

    /* renamed from: h, reason: collision with root package name */
    public final Object f82307h;

    /* renamed from: i, reason: collision with root package name */
    public final Object f82308i;

    /* renamed from: j, reason: collision with root package name */
    public final Object f82309j;

    /* renamed from: k, reason: collision with root package name */
    public final a70.d f82310k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f82311l;

    public z(String str) {
        this.f82300a = str;
        ArrayList arrayList = new ArrayList();
        this.f82301b = arrayList;
        this.f82303d = LazyKt.a(new x(this, 6));
        this.f82304e = LazyKt.a(new x(this, 4));
        LazyThreadSafetyMode lazyThreadSafetyMode = LazyThreadSafetyMode.f71681c;
        this.f82305f = LazyKt.b(lazyThreadSafetyMode, new x(this, 7));
        this.f82307h = LazyKt.b(lazyThreadSafetyMode, new x(this, 1));
        this.f82308i = LazyKt.b(lazyThreadSafetyMode, new x(this, 0));
        this.f82309j = LazyKt.b(lazyThreadSafetyMode, new x(this, 3));
        this.f82310k = LazyKt.a(new x(this, 2));
        LazyKt.a(new x(this, 5));
        StringBuilder sb2 = new StringBuilder("^");
        if (!f82299m.matcher(str).find()) {
            sb2.append("http[s]?://");
        }
        Matcher matcher = Pattern.compile("(\\?|\\#|$)").matcher(str);
        matcher.find();
        String strSubstring = str.substring(0, matcher.start());
        Intrinsics.f(strSubstring, "substring(...)");
        a(strSubstring, arrayList, sb2);
        this.f82311l = (r70.k.K0(sb2, w3.DEFAULT_PROPAGATION_TARGETS, false) || r70.k.K0(sb2, "([^/]+?)", false)) ? false : true;
        sb2.append("($|(\\?(.)*)|(\\#(.)*))");
        String string = sb2.toString();
        Intrinsics.f(string, "uriRegex.toString()");
        this.f82302c = r70.j.F0(string, w3.DEFAULT_PROPAGATION_TARGETS, "\\E.*\\Q", false);
    }

    public static void a(String str, ArrayList arrayList, StringBuilder sb2) {
        Matcher matcher = n.matcher(str);
        int iEnd = 0;
        while (matcher.find()) {
            String strGroup = matcher.group(1);
            Intrinsics.e(strGroup, "null cannot be cast to non-null type kotlin.String");
            arrayList.add(strGroup);
            if (matcher.start() > iEnd) {
                String strSubstring = str.substring(iEnd, matcher.start());
                Intrinsics.f(strSubstring, "substring(...)");
                sb2.append(Pattern.quote(strSubstring));
            }
            sb2.append("([^/]*?|)");
            iEnd = matcher.end();
        }
        if (iEnd < str.length()) {
            String strSubstring2 = str.substring(iEnd);
            Intrinsics.f(strSubstring2, "substring(...)");
            sb2.append(Pattern.quote(strSubstring2));
        }
    }

    public static void g(Bundle bundle, String key, String str, h hVar) {
        if (hVar == null) {
            bundle.putString(key, str);
            return;
        }
        x0 x0Var = hVar.f82173a;
        Intrinsics.g(key, "key");
        x0Var.e(bundle, key, x0Var.d(str));
    }

    public final int b(Uri uri) {
        if (uri == null) {
            return 0;
        }
        List<String> requestedPathSegments = uri.getPathSegments();
        List<String> uriPathSegments = Uri.parse(this.f82300a).getPathSegments();
        Intrinsics.f(requestedPathSegments, "requestedPathSegments");
        Intrinsics.f(uriPathSegments, "uriPathSegments");
        return b70.g.c1(requestedPathSegments, uriPathSegments).size();
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, kotlin.Lazy] */
    /* JADX WARN: Type inference failed for: r1v1, types: [java.lang.Object, kotlin.Lazy] */
    public final ArrayList c() {
        Collection collectionValues = ((Map) this.f82305f.getValue()).values();
        ArrayList arrayList = new ArrayList();
        Iterator it = collectionValues.iterator();
        while (it.hasNext()) {
            b70.d.z0(((w) it.next()).f82282b, arrayList);
        }
        return b70.g.t1((List) this.f82308i.getValue(), b70.g.t1(arrayList, this.f82301b));
    }

    /* JADX WARN: Type inference failed for: r0v17, types: [java.lang.Object, kotlin.Lazy] */
    public final Bundle d(Uri deepLink, LinkedHashMap arguments) {
        Intrinsics.g(deepLink, "deepLink");
        Intrinsics.g(arguments, "arguments");
        Pattern pattern = (Pattern) this.f82303d.getValue();
        Matcher matcher = pattern != null ? pattern.matcher(deepLink.toString()) : null;
        if (matcher != null && matcher.matches()) {
            Bundle bundle = new Bundle();
            if (e(matcher, bundle, arguments) && (!((Boolean) this.f82304e.getValue()).booleanValue() || f(deepLink, bundle, arguments))) {
                String fragment = deepLink.getFragment();
                Pattern pattern2 = (Pattern) this.f82310k.getValue();
                Matcher matcher2 = pattern2 != null ? pattern2.matcher(String.valueOf(fragment)) : null;
                if (matcher2 != null && matcher2.matches()) {
                    List list = (List) this.f82308i.getValue();
                    ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
                    int i5 = 0;
                    for (Object obj : list) {
                        int i11 = i5 + 1;
                        if (i5 < 0) {
                            ul.b.e0();
                            throw null;
                        }
                        String str = (String) obj;
                        String value = Uri.decode(matcher2.group(i11));
                        h hVar = (h) arguments.get(str);
                        try {
                            Intrinsics.f(value, "value");
                            g(bundle, str, value, hVar);
                            arrayList.add(Unit.f71706a);
                            i5 = i11;
                        } catch (IllegalArgumentException unused) {
                        }
                    }
                }
                if (j.r(arguments, new y(0, bundle)).isEmpty()) {
                    return bundle;
                }
            }
        }
        return null;
    }

    public final boolean e(Matcher matcher, Bundle bundle, Map map) {
        ArrayList arrayList = this.f82301b;
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        int i5 = 0;
        while (it.hasNext()) {
            Object next = it.next();
            int i11 = i5 + 1;
            if (i5 < 0) {
                ul.b.e0();
                throw null;
            }
            String str = (String) next;
            String value = Uri.decode(matcher.group(i11));
            h hVar = (h) map.get(str);
            try {
                Intrinsics.f(value, "value");
                g(bundle, str, value, hVar);
                arrayList2.add(Unit.f71706a);
                i5 = i11;
            } catch (IllegalArgumentException unused) {
                return false;
            }
        }
        return true;
    }

    public final boolean equals(Object obj) {
        if (obj == null || !(obj instanceof z)) {
            return false;
        }
        return this.f82300a.equals(((z) obj).f82300a);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v0, types: [java.lang.Object, kotlin.Lazy] */
    public final boolean f(Uri uri, Bundle bundle, Map map) {
        int i5;
        Object objValueOf;
        boolean z11;
        Object obj;
        String query;
        for (Map.Entry entry : ((Map) this.f82305f.getValue()).entrySet()) {
            String str = (String) entry.getKey();
            w wVar = (w) entry.getValue();
            List<String> inputParams = uri.getQueryParameters(str);
            if (this.f82306g && (query = uri.getQuery()) != null && !query.equals(uri.toString())) {
                inputParams = ul.b.P(query);
            }
            Intrinsics.f(inputParams, "inputParams");
            int i11 = 0;
            Bundle bundleA = w.b.a(new Pair[0]);
            Iterator it = wVar.f82282b.iterator();
            while (true) {
                if (it.hasNext()) {
                    String str2 = (String) it.next();
                    h hVar = (h) map.get(str2);
                    x0 x0Var = hVar != null ? hVar.f82173a : null;
                    if ((x0Var instanceof q0) && !hVar.f82175c) {
                        switch (((q0) x0Var).f82241l) {
                            case 0:
                                obj = new boolean[0];
                                break;
                            case 1:
                                obj = new float[0];
                                break;
                            case 2:
                                obj = new int[0];
                                break;
                            case 3:
                                obj = new long[0];
                                break;
                            default:
                                obj = new String[0];
                                break;
                        }
                        x0Var.e(bundleA, str2, obj);
                    }
                } else {
                    for (String str3 : inputParams) {
                        String str4 = wVar.f82281a;
                        Matcher matcher = str4 != null ? Pattern.compile(str4, 32).matcher(str3) : null;
                        if (matcher == null || !matcher.matches()) {
                            return i11;
                        }
                        ArrayList arrayList = wVar.f82282b;
                        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
                        Iterator it2 = arrayList.iterator();
                        int i12 = i11;
                        while (it2.hasNext()) {
                            Object next = it2.next();
                            int i13 = i12 + 1;
                            if (i12 < 0) {
                                ul.b.e0();
                                throw null;
                            }
                            String str5 = (String) next;
                            String strGroup = matcher.group(i13);
                            if (strGroup == null) {
                                strGroup = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                            }
                            h hVar2 = (h) map.get(str5);
                            try {
                                if (bundleA.containsKey(str5)) {
                                    if (bundleA.containsKey(str5)) {
                                        if (hVar2 != null) {
                                            x0 x0Var2 = hVar2.f82173a;
                                            i5 = i11;
                                            Object objA = x0Var2.a(str5, bundleA);
                                            if (!bundleA.containsKey(str5)) {
                                                throw new IllegalArgumentException("There is no previous value in this bundle.");
                                            }
                                            x0Var2.e(bundleA, str5, x0Var2.c(objA, strGroup));
                                        } else {
                                            i5 = i11;
                                        }
                                        z11 = i5;
                                    } else {
                                        i5 = i11;
                                        z11 = 1;
                                    }
                                    try {
                                        objValueOf = Boolean.valueOf(z11);
                                    } catch (IllegalArgumentException unused) {
                                        objValueOf = Unit.f71706a;
                                        arrayList2.add(objValueOf);
                                        i12 = i13;
                                        i11 = i5;
                                    }
                                } else {
                                    g(bundleA, str5, strGroup, hVar2);
                                    objValueOf = Unit.f71706a;
                                    i5 = i11;
                                }
                            } catch (IllegalArgumentException unused2) {
                                i5 = i11;
                            }
                            arrayList2.add(objValueOf);
                            i12 = i13;
                            i11 = i5;
                        }
                    }
                    bundle.putAll(bundleA);
                }
            }
        }
        return true;
    }

    public final int hashCode() {
        return this.f82300a.hashCode() * 961;
    }
}
