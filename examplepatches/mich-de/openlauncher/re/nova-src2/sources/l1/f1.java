package l1;

import java.util.UUID;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class f1 extends Lambda implements Function0 {

    /* renamed from: k, reason: collision with root package name */
    public static final f1 f73274k;

    /* renamed from: l, reason: collision with root package name */
    public static final f1 f73275l;

    /* renamed from: m, reason: collision with root package name */
    public static final f1 f73276m;
    public static final f1 n;
    public static final f1 o;

    /* renamed from: p, reason: collision with root package name */
    public static final f1 f73277p;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73278j;

    static {
        int i5 = 0;
        f73274k = new f1(i5, 0);
        f73275l = new f1(i5, 1);
        f73276m = new f1(i5, 2);
        n = new f1(i5, 3);
        o = new f1(i5, 4);
        f73277p = new f1(i5, 5);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f1(float f11) {
        super(0);
        this.f73278j = 6;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f73278j) {
            case 0:
                return Boolean.TRUE;
            case 1:
                return new y3.f(48);
            case 2:
                return Boolean.FALSE;
            case 3:
                return UUID.randomUUID();
            case 4:
                return new o5();
            case 5:
                return Boolean.FALSE;
            case 6:
                return Unit.f71706a;
            case 7:
                return Float.valueOf(0.0f > 0.01f ? 1.0f : 0.0f);
            default:
                return new o9(-3.4028235E38f, 0.0f, 0.0f);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ f1(int i5, int i11) {
        super(i5);
        this.f73278j = i11;
    }
}
