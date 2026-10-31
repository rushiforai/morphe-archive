package i3;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class b extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final b f61223k;

    /* renamed from: l, reason: collision with root package name */
    public static final b f61224l;

    /* renamed from: m, reason: collision with root package name */
    public static final b f61225m;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f61226j;

    static {
        int i5 = 1;
        f61223k = new b(i5, 0);
        f61224l = new b(i5, 1);
        f61225m = new b(i5, 2);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(int i5, int i11) {
        super(i5);
        this.f61226j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f61226j) {
            case 0:
                ((Number) obj).longValue();
                return Unit.f71706a;
            case 1:
                return Integer.valueOf(((i) obj).f61242b);
            default:
                return Integer.valueOf(((i) obj).f61243c.c());
        }
    }
}
