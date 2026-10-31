package l1;

import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import kotlin.reflect.KProperty;

/* loaded from: classes2.dex */
public final class x extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final x f74196k;

    /* renamed from: l, reason: collision with root package name */
    public static final x f74197l;

    /* renamed from: m, reason: collision with root package name */
    public static final x f74198m;
    public static final x n;
    public static final x o;

    /* renamed from: p, reason: collision with root package name */
    public static final x f74199p;

    /* renamed from: q, reason: collision with root package name */
    public static final x f74200q;

    /* renamed from: r, reason: collision with root package name */
    public static final x f74201r;

    /* renamed from: s, reason: collision with root package name */
    public static final x f74202s;

    /* renamed from: t, reason: collision with root package name */
    public static final x f74203t;

    /* renamed from: u, reason: collision with root package name */
    public static final x f74204u;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f74205j;

    static {
        int i5 = 1;
        f74196k = new x(i5, 0);
        f74197l = new x(i5, 1);
        f74198m = new x(i5, 2);
        n = new x(i5, 3);
        o = new x(i5, 4);
        f74199p = new x(i5, 5);
        f74200q = new x(i5, 6);
        f74201r = new x(i5, 7);
        f74202s = new x(i5, 8);
        f74203t = new x(i5, 9);
        f74204u = new x(i5, 10);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ x(int i5, int i11) {
        super(i5);
        this.f74205j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f74205j) {
            case 0:
                return Unit.f71706a;
            case 1:
                j3.y.j((j3.b0) obj, 0);
                return Unit.f71706a;
            case 2:
                j3.y.j((j3.b0) obj, 0);
                return Unit.f71706a;
            case 3:
                j3.y.l((j3.b0) obj);
                return Unit.f71706a;
            case 4:
                return Boolean.TRUE;
            case 5:
                KProperty[] kPropertyArr = j3.y.f68878a;
                j3.a0 a0Var = j3.w.f68872w;
                Unit unit = Unit.f71706a;
                ((j3.k) ((j3.b0) obj)).f(a0Var, unit);
                return unit;
            case 6:
                return Unit.f71706a;
            case 7:
                return Unit.f71706a;
            case 8:
                return Unit.f71706a;
            case 9:
                return Unit.f71706a;
            default:
                List list = (List) obj;
                return new o9(((Number) list.get(0)).floatValue(), ((Number) list.get(1)).floatValue(), ((Number) list.get(2)).floatValue());
        }
    }
}
