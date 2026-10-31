package ya;

import java.util.Arrays;

/* loaded from: classes.dex */
public final class b0 {

    /* renamed from: d, reason: collision with root package name */
    public static final ca.c f97108d = new ca.c("value", 9);

    /* renamed from: a, reason: collision with root package name */
    public final za.j f97109a;

    /* renamed from: b, reason: collision with root package name */
    public final a0[] f97110b;

    /* renamed from: c, reason: collision with root package name */
    public int f97111c = 0;

    public b0(za.j jVar, int i5) {
        this.f97109a = jVar;
        this.f97110b = new a0[i5];
        for (int i11 = 0; i11 < i5; i11++) {
            int i12 = 1 << i11;
            this.f97111c |= i12;
            this.f97110b[i11] = new a0(this, i12);
        }
    }

    public final String toString() {
        return Arrays.toString(this.f97110b);
    }
}
