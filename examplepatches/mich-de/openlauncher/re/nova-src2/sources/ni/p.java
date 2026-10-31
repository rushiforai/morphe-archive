package ni;

import ads_mobile_sdk.mu0;
import android.os.Bundle;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class p {

    /* renamed from: a, reason: collision with root package name */
    public final String f78299a;

    /* renamed from: c, reason: collision with root package name */
    public String f78301c;

    /* renamed from: i, reason: collision with root package name */
    public String f78307i;

    /* renamed from: b, reason: collision with root package name */
    public final LinkedHashSet f78300b = new LinkedHashSet();

    /* renamed from: d, reason: collision with root package name */
    public final LinkedHashMap f78302d = new LinkedHashMap();

    /* renamed from: e, reason: collision with root package name */
    public Bundle f78303e = new Bundle();

    /* renamed from: f, reason: collision with root package name */
    public final HashSet f78304f = new HashSet();

    /* renamed from: g, reason: collision with root package name */
    public final HashSet f78305g = new HashSet();

    /* renamed from: h, reason: collision with root package name */
    public final LinkedHashMap f78306h = new LinkedHashMap();

    public p(String str) {
        this.f78299a = str;
    }

    public abstract p a();

    public final p b(Bundle extraBundle) {
        Intrinsics.g(extraBundle, "extraBundle");
        Bundle bundleDeepCopy = extraBundle.deepCopy();
        Intrinsics.d(bundleDeepCopy);
        this.f78303e = bundleDeepCopy;
        return a();
    }

    public final p c(Set neighboringContentUrls) {
        Intrinsics.g(neighboringContentUrls, "neighboringContentUrls");
        HashSet hashSet = this.f78305g;
        hashSet.clear();
        Iterator it = neighboringContentUrls.iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            if (str.length() == 0) {
                mu0.c("Neighboring content URL should not be empty.", null);
            } else {
                hashSet.add(str);
            }
        }
        return a();
    }
}
