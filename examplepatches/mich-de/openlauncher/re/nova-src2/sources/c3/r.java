package c3;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class r extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final r f19410k;

    /* renamed from: l, reason: collision with root package name */
    public static final r f19411l;

    /* renamed from: m, reason: collision with root package name */
    public static final r f19412m;
    public static final r n;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19413j;

    static {
        int i5 = 1;
        f19410k = new r(i5, 0);
        f19411l = new r(i5, 1);
        f19412m = new r(i5, 2);
        n = new r(i5, 3);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r(int i5, int i11) {
        super(i5);
        this.f19413j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f19413j) {
            case 0:
                return Unit.f71706a;
            case 1:
                return Boolean.FALSE;
            case 2:
                return Boolean.valueOf(t0.a(obj));
            default:
                return Unit.f71706a;
        }
    }
}
