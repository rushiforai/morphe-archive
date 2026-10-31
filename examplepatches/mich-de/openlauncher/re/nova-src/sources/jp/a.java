package jp;

import ep.i;
import java.lang.reflect.Type;
import java.util.Objects;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final Class f69629a;

    /* renamed from: b, reason: collision with root package name */
    public final Type f69630b;

    /* renamed from: c, reason: collision with root package name */
    public final int f69631c;

    public a(Type type) {
        Objects.requireNonNull(type);
        Type typeA = i.a(type);
        this.f69630b = typeA;
        this.f69629a = i.h(typeA);
        this.f69631c = typeA.hashCode();
    }

    public final boolean equals(Object obj) {
        if (obj instanceof a) {
            return i.e(this.f69630b, ((a) obj).f69630b);
        }
        return false;
    }

    public final int hashCode() {
        return this.f69631c;
    }

    public final String toString() {
        return i.k(this.f69630b);
    }
}
