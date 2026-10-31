package z2;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class j1 extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final j1 f98091k;

    /* renamed from: l, reason: collision with root package name */
    public static final j1 f98092l;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f98093j;

    static {
        int i5 = 1;
        f98091k = new j1(i5, 0);
        f98092l = new j1(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j1(int i5, int i11) {
        super(i5);
        this.f98093j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final /* bridge */ /* synthetic */ Object invoke(Object obj) {
        switch (this.f98093j) {
            case 0:
                break;
            default:
                break;
        }
        return Unit.f71706a;
    }
}
