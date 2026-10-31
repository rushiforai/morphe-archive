package r3;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class c extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final c f85401k;

    /* renamed from: l, reason: collision with root package name */
    public static final c f85402l;

    /* renamed from: m, reason: collision with root package name */
    public static final c f85403m;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f85404j;

    static {
        int i5 = 1;
        f85401k = new c(i5, 0);
        f85402l = new c(i5, 1);
        f85403m = new c(i5, 2);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c(int i5, int i11) {
        super(i5);
        this.f85404j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final /* synthetic */ Object invoke(Object obj) {
        switch (this.f85404j) {
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
