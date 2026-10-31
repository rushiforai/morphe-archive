package n30;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public static final a f77776b = new a(-1);

    /* renamed from: a, reason: collision with root package name */
    public final int f77777a;

    public a(int i5) {
        this.f77777a = i5;
    }

    public static final a b(c cVar, int i5) {
        return cVar.f() ? new a(i5) : new a(i5 * 2);
    }

    public final float a() {
        return this.f77777a / 2.0f;
    }

    public final int c(c cVar) {
        boolean zF = cVar.f();
        int i5 = this.f77777a;
        return zF ? i5 : i5 / 2;
    }

    public final String d() {
        int i5 = this.f77777a;
        if (i5 == -1) {
            return "-1";
        }
        return a2.c.h((i5 + 2) / 2, i5 % 2 == 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : ".5");
    }

    public final boolean equals(Object obj) {
        a aVar = obj instanceof a ? (a) obj : null;
        return aVar != null && this.f77777a == aVar.f77777a;
    }

    public final String toString() {
        int i5 = this.f77777a;
        if (i5 == -1) {
            return "-1";
        }
        return a2.c.h(i5 / 2, i5 % 2 == 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : ".5");
    }
}
