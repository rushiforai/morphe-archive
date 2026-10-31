package p1;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public int f81379a;

    public a(int i5) {
        this.f81379a = i5;
    }

    public final boolean a() {
        return this.f81379a != Integer.MIN_VALUE;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(super.toString());
        sb2.append("{ location = ");
        return b.c0.o(sb2, this.f81379a, " }");
    }
}
