package b0;

import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class m extends Lambda implements Function2 {

    /* renamed from: k, reason: collision with root package name */
    public static final m f16178k;

    /* renamed from: l, reason: collision with root package name */
    public static final m f16179l;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f16180j;

    static {
        int i5 = 2;
        f16178k = new m(i5, 0);
        f16179l = new m(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m(int i5, int i11) {
        super(i5);
        this.f16180j = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f16180j) {
            case 0:
                long j11 = ((y3.m) obj).f96611a;
                long j12 = ((y3.m) obj2).f96611a;
                long j13 = 1;
                return c0.f.h(0.0f, 400.0f, new y3.m((j13 & 4294967295L) | (j13 << 32)), 1);
            default:
                r0 r0Var = (r0) obj2;
                return Boolean.valueOf(((r0) obj) == r0Var && r0Var == r0.f16220c);
        }
    }
}
