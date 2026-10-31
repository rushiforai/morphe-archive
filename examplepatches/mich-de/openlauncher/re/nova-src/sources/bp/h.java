package bp;

import java.io.Serializable;

/* loaded from: classes4.dex */
public final class h implements Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final h f18390b = new h("EC");

    /* renamed from: c, reason: collision with root package name */
    public static final h f18391c = new h("RSA");

    /* renamed from: d, reason: collision with root package name */
    public static final h f18392d = new h("oct");

    /* renamed from: e, reason: collision with root package name */
    public static final h f18393e = new h("OKP");

    /* renamed from: a, reason: collision with root package name */
    public final String f18394a;

    public h(String str) {
        if (str == null) {
            throw new IllegalArgumentException("The key type value must not be null");
        }
        this.f18394a = str;
    }

    public static h a(String str) {
        if (str == null) {
            throw new IllegalArgumentException("The key type to parse must not be null");
        }
        h hVar = f18390b;
        if (str.equals(hVar.f18394a)) {
            return hVar;
        }
        h hVar2 = f18391c;
        if (str.equals(hVar2.f18394a)) {
            return hVar2;
        }
        h hVar3 = f18392d;
        if (str.equals(hVar3.f18394a)) {
            return hVar3;
        }
        h hVar4 = f18393e;
        return str.equals(hVar4.f18394a) ? hVar4 : new h(str);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof h) {
            return this.f18394a.equals(((h) obj).f18394a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f18394a.hashCode();
    }

    public final String toString() {
        return this.f18394a;
    }
}
