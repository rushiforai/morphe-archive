package vz;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final float f93388a;

    /* renamed from: b, reason: collision with root package name */
    public final float f93389b;

    /* renamed from: c, reason: collision with root package name */
    public final float f93390c;

    public a(float f11, float f12, float f13) {
        int iC = uz.a.c(f11, f12, f13);
        uz.a aVarA = uz.a.a(iC);
        float fN = (float) v4.a.n(iC);
        this.f93388a = aVarA.f91790a;
        this.f93389b = aVarA.f91791b;
        this.f93390c = fN;
    }

    public static a a(int i5) {
        uz.a aVarA = uz.a.a(i5);
        return new a(aVarA.f91790a, aVarA.f91791b, (float) v4.a.n(i5));
    }

    public final int b() {
        return uz.a.c(this.f93388a, this.f93389b, this.f93390c);
    }
}
