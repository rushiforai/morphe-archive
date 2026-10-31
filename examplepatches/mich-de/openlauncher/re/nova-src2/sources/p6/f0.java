package p6;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class f0 {

    /* renamed from: a, reason: collision with root package name */
    public final z0 f82161a;

    /* renamed from: b, reason: collision with root package name */
    public final String f82162b;

    /* renamed from: c, reason: collision with root package name */
    public final LinkedHashMap f82163c = new LinkedHashMap();

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f82164d = new ArrayList();

    /* renamed from: e, reason: collision with root package name */
    public final LinkedHashMap f82165e = new LinkedHashMap();

    public f0(z0 z0Var, String str) {
        this.f82161a = z0Var;
        this.f82162b = str;
    }

    public e0 a() {
        e0 e0VarB = b();
        e0VarB.getClass();
        LinkedHashMap linkedHashMap = e0VarB.f82156e;
        for (Map.Entry entry : this.f82163c.entrySet()) {
            String argumentName = (String) entry.getKey();
            h argument = (h) entry.getValue();
            Intrinsics.g(argumentName, "argumentName");
            Intrinsics.g(argument, "argument");
            linkedHashMap.put(argumentName, argument);
        }
        Iterator it = this.f82164d.iterator();
        while (it.hasNext()) {
            z navDeepLink = (z) it.next();
            Intrinsics.g(navDeepLink, "navDeepLink");
            ArrayList arrayListR = j.r(linkedHashMap, new c0(navDeepLink, 0));
            if (!arrayListR.isEmpty()) {
                throw new IllegalArgumentException(("Deep link " + navDeepLink.f82300a + " can't be used to open destination " + e0VarB + ".\nFollowing required arguments are missing: " + arrayListR).toString());
            }
            e0VarB.f82154c.add(navDeepLink);
        }
        Iterator it2 = this.f82165e.entrySet().iterator();
        if (it2.hasNext()) {
            Map.Entry entry2 = (Map.Entry) it2.next();
            ((Number) entry2.getKey()).intValue();
            if (entry2.getValue() != null) {
                throw new ClassCastException();
            }
            Intrinsics.g(null, "action");
            throw null;
        }
        String str = this.f82162b;
        if (str != null) {
            if (r70.k.U0(str)) {
                throw new IllegalArgumentException("Cannot have an empty route");
            }
            String uriPattern = "android-app://androidx.navigation/".concat(str);
            Intrinsics.g(uriPattern, "uriPattern");
            ArrayList arrayListR2 = j.r(linkedHashMap, new c0(new z(uriPattern), 1));
            if (!arrayListR2.isEmpty()) {
                throw new IllegalArgumentException(("Cannot set route \"" + str + "\" for destination " + e0VarB + ". Following required arguments are missing: " + arrayListR2).toString());
            }
            e0VarB.f82159h = LazyKt.a(new d0(uriPattern, 0));
            e0VarB.f82157f = uriPattern.hashCode();
            e0VarB.f82158g = str;
        }
        return e0VarB;
    }

    public e0 b() {
        return this.f82161a.a();
    }
}
