package c4;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import kotlin.reflect.KProperty;

/* loaded from: classes2.dex */
public final class d extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final d f19570k;

    /* renamed from: l, reason: collision with root package name */
    public static final d f19571l;

    /* renamed from: m, reason: collision with root package name */
    public static final d f19572m;
    public static final d n;
    public static final d o;

    /* renamed from: p, reason: collision with root package name */
    public static final d f19573p;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19574j;

    static {
        int i5 = 1;
        f19570k = new d(i5, 0);
        f19571l = new d(i5, 1);
        f19572m = new d(i5, 2);
        n = new d(i5, 3);
        o = new d(i5, 4);
        f19573p = new d(i5, 5);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(int i5, int i11) {
        super(i5);
        this.f19574j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f19574j) {
            case 0:
                KProperty[] kPropertyArr = j3.y.f68878a;
                j3.a0 a0Var = j3.w.f68872w;
                Unit unit = Unit.f71706a;
                ((j3.k) ((j3.b0) obj)).f(a0Var, unit);
                break;
            case 1:
                ((Number) obj).longValue();
                break;
            case 2:
                break;
            case 3:
                KProperty[] kPropertyArr2 = j3.y.f68878a;
                j3.a0 a0Var2 = j3.w.f68871v;
                Unit unit2 = Unit.f71706a;
                ((j3.k) ((j3.b0) obj)).f(a0Var2, unit2);
                break;
            case 4:
                break;
            default:
                d0 d0Var = (d0) obj;
                if (d0Var.isAttachedToWindow()) {
                    d0Var.g();
                }
                break;
        }
        return Unit.f71706a;
    }
}
