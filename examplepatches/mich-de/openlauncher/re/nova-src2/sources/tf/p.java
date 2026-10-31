package tf;

import gf.x0;

/* loaded from: classes3.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final x0 f89119a;

    /* renamed from: b, reason: collision with root package name */
    public final int[] f89120b;

    public p(int i5, x0 x0Var, int[] iArr) {
        if (iArr.length == 0) {
            wf.a.p("ETSDefinition", "Empty tracks are not allowed", new IllegalArgumentException());
        }
        this.f89119a = x0Var;
        this.f89120b = iArr;
    }
}
