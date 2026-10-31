package k50;

import java.util.Map;
import java.util.Set;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;
import o50.f0;
import o50.o;
import o50.s;
import t70.r1;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final f0 f71123a;

    /* renamed from: b, reason: collision with root package name */
    public final s f71124b;

    /* renamed from: c, reason: collision with root package name */
    public final o f71125c;

    /* renamed from: d, reason: collision with root package name */
    public final r50.c f71126d;

    /* renamed from: e, reason: collision with root package name */
    public final r1 f71127e;

    /* renamed from: f, reason: collision with root package name */
    public final s50.d f71128f;

    /* renamed from: g, reason: collision with root package name */
    public final Set f71129g;

    public d(f0 f0Var, s method, o oVar, r50.c cVar, r1 executionContext, s50.d attributes) {
        Set setKeySet;
        Intrinsics.g(method, "method");
        Intrinsics.g(executionContext, "executionContext");
        Intrinsics.g(attributes, "attributes");
        this.f71123a = f0Var;
        this.f71124b = method;
        this.f71125c = oVar;
        this.f71126d = cVar;
        this.f71127e = executionContext;
        this.f71128f = attributes;
        Map map = (Map) attributes.d(f50.h.f54327a);
        this.f71129g = (map == null || (setKeySet = map.keySet()) == null) ? EmptySet.f71734a : setKeySet;
    }

    public final String toString() {
        return "HttpRequestData(url=" + this.f71123a + ", method=" + this.f71124b + ')';
    }
}
