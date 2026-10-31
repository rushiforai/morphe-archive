package n8;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class b extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final b f77974k;

    /* renamed from: l, reason: collision with root package name */
    public static final b f77975l;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f77976j;

    static {
        int i5 = 1;
        f77974k = new b(i5, 0);
        f77975l = new b(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(int i5, int i11) {
        super(i5);
        this.f77976j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f77976j) {
            case 0:
                return Unit.f71706a;
            default:
                return (h) obj;
        }
    }
}
