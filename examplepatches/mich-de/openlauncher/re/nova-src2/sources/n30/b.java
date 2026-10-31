package n30;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: b, reason: collision with root package name */
    public static final b f77778b = new b(-1);

    /* renamed from: c, reason: collision with root package name */
    public static final b f77779c = fg.a.l(1.0f);

    /* renamed from: a, reason: collision with root package name */
    public final int f77780a;

    public b(int i5) {
        this.f77780a = i5;
    }

    public static final b b(c cVar, int i5) {
        return cVar.f() ? new b(i5) : new b(i5 * 2);
    }

    public final float a() {
        int i5 = this.f77780a;
        if (i5 < 0) {
            return -1.0f;
        }
        return i5 / 2.0f;
    }

    public final int c(c cVar) {
        int i5 = this.f77780a;
        if (i5 < 0) {
            return -1;
        }
        return (cVar.f() || i5 == 1) ? i5 : i5 / 2;
    }

    public final boolean equals(Object obj) {
        b bVar = obj instanceof b ? (b) obj : null;
        return bVar != null && this.f77780a == bVar.f77780a;
    }

    public final String toString() {
        int i5 = this.f77780a;
        return a2.c.h(i5 / 2, i5 % 2 == 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : ".5");
    }
}
