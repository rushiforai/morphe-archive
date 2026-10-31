package o50;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class s {

    /* renamed from: b, reason: collision with root package name */
    public static final s f79583b;

    /* renamed from: c, reason: collision with root package name */
    public static final s f79584c;

    /* renamed from: d, reason: collision with root package name */
    public static final s f79585d;

    /* renamed from: e, reason: collision with root package name */
    public static final s f79586e;

    /* renamed from: f, reason: collision with root package name */
    public static final List f79587f;

    /* renamed from: a, reason: collision with root package name */
    public final String f79588a;

    static {
        s sVar = new s("GET");
        f79583b = sVar;
        s sVar2 = new s("POST");
        f79584c = sVar2;
        s sVar3 = new s("PUT");
        s sVar4 = new s("PATCH");
        s sVar5 = new s("DELETE");
        s sVar6 = new s("HEAD");
        f79585d = sVar6;
        s sVar7 = new s("OPTIONS");
        f79586e = sVar7;
        f79587f = ul.b.Q(sVar, sVar2, sVar3, sVar4, sVar5, sVar6, sVar7);
    }

    public s(String str) {
        this.f79588a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof s) && Intrinsics.b(this.f79588a, ((s) obj).f79588a);
    }

    public final int hashCode() {
        return this.f79588a.hashCode();
    }

    public final String toString() {
        return this.f79588a;
    }
}
