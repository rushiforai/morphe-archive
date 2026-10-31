package e10;

/* loaded from: classes4.dex */
public final class n1 {

    /* renamed from: a, reason: collision with root package name */
    public final int f51689a;

    /* renamed from: b, reason: collision with root package name */
    public final int f51690b;

    /* renamed from: c, reason: collision with root package name */
    public final int f51691c;

    /* renamed from: d, reason: collision with root package name */
    public final int f51692d;

    /* renamed from: e, reason: collision with root package name */
    public final int f51693e;

    /* renamed from: f, reason: collision with root package name */
    public final float f51694f;

    /* renamed from: g, reason: collision with root package name */
    public final float f51695g;

    /* renamed from: h, reason: collision with root package name */
    public final int f51696h;

    /* renamed from: i, reason: collision with root package name */
    public final int f51697i;

    /* renamed from: j, reason: collision with root package name */
    public final int f51698j;

    /* renamed from: k, reason: collision with root package name */
    public final int f51699k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f51700l;

    public n1(int i5, int i11, int i12, int i13, int i14, float f11, float f12, int i15, int i16) {
        this.f51689a = i5;
        this.f51690b = i11;
        this.f51691c = i12;
        this.f51692d = i13;
        this.f51693e = i14;
        this.f51694f = f11;
        this.f51695g = f12;
        this.f51696h = i15;
        this.f51697i = i16;
        if (i11 != 0 && i13 != 0) {
            i12 = i11;
        }
        this.f51698j = i12;
        this.f51699k = i12;
        this.f51700l = i11 != 0 && i5 == 0;
    }

    public final int a() {
        return this.f51698j;
    }

    public final int b() {
        return this.f51690b;
    }

    public final int c() {
        return this.f51693e;
    }

    public final int d() {
        return this.f51696h;
    }

    public final int e() {
        return this.f51692d;
    }

    public final int f() {
        return this.f51697i;
    }

    public final float g() {
        return this.f51695g;
    }

    public final float h() {
        return this.f51694f;
    }

    public final int i() {
        return this.f51691c;
    }

    public final int j() {
        return this.f51689a;
    }

    public final String toString() {
        String hexString = Integer.toHexString(this.f51690b);
        String hexString2 = Integer.toHexString(this.f51691c);
        String hexString3 = Integer.toHexString(this.f51692d);
        String hexString4 = Integer.toHexString(this.f51693e);
        String hexString5 = Integer.toHexString(this.f51699k);
        String hexString6 = Integer.toHexString(this.f51698j);
        StringBuilder sb2 = new StringBuilder("PopupMenuStyleConfig(rowGapPx=");
        sb2.append(this.f51689a);
        sb2.append(", cardBackgroundColor=");
        sb2.append(hexString);
        sb2.append(", rowColor=");
        b.c0.D(sb2, hexString2, ", headerColor=", hexString3, ", dividerColor=");
        sb2.append(hexString4);
        sb2.append(", outerRadiusPx=");
        sb2.append(this.f51694f);
        sb2.append(", middleRadiusPx=");
        sb2.append(this.f51695g);
        sb2.append(", notificationColor=");
        sb2.append(hexString5);
        sb2.append(", arrowColor=");
        sb2.append(hexString6);
        sb2.append(", showNotificationGutter=");
        sb2.append(this.f51700l);
        sb2.append(")");
        return sb2.toString();
    }
}
