package r3;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class b extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final b f85392k;

    /* renamed from: l, reason: collision with root package name */
    public static final b f85393l;

    /* renamed from: m, reason: collision with root package name */
    public static final b f85394m;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f85395j;

    static {
        int i5 = 1;
        f85392k = new b(i5, 0);
        f85393l = new b(i5, 1);
        f85394m = new b(i5, 2);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(int i5, int i11) {
        super(i5);
        this.f85395j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final /* synthetic */ Object invoke(Object obj) {
        switch (this.f85395j) {
            case 0:
                float[] fArr = ((i2.h0) obj).f61121a;
                break;
            case 1:
                break;
            default:
                int i5 = ((l) obj).f85451a;
                break;
        }
        return Unit.f71706a;
    }
}
