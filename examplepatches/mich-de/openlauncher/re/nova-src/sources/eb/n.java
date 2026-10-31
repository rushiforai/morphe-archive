package eb;

/* loaded from: classes2.dex */
public enum n {
    f52503b(new int[]{16842916}),
    f52504c(new int[]{16842916, 16842920}),
    f52505d(new int[]{16842917}),
    f52506e(new int[]{16842917, 16842920}),
    f52507f(new int[]{16842918}),
    f52508g(new int[]{16842915});


    /* renamed from: a, reason: collision with root package name */
    public final int[] f52510a;

    n(int[] iArr) {
        this.f52510a = iArr;
    }

    public static n a(boolean z11, boolean z12, boolean z13) {
        return (z11 && z12) ? f52508g : (z11 && z13) ? f52504c : z11 ? f52503b : z12 ? f52507f : z13 ? f52506e : f52505d;
    }
}
