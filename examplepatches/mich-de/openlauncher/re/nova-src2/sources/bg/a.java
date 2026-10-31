package bg;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final int f17861a;

    /* renamed from: b, reason: collision with root package name */
    public final String f17862b;

    /* renamed from: c, reason: collision with root package name */
    public final String f17863c;

    public a(int i5, String message, String str) {
        Intrinsics.g(message, "message");
        this.f17861a = i5;
        this.f17862b = message;
        this.f17863c = str;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f17861a == aVar.f17861a && Intrinsics.b(this.f17862b, aVar.f17862b) && this.f17863c.equals(aVar.f17863c);
    }
}
