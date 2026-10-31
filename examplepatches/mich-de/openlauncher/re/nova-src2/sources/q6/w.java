package q6;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;
import p1.a0;
import p6.h0;
import p6.l0;
import ps.j0;

/* loaded from: classes2.dex */
public final class w extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f83739j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ l0 f83740k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ h0 f83741l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ b2.t f83742m;
    public final /* synthetic */ b2.f n;
    public final /* synthetic */ Function1 o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ Function1 f83743p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ Function1 f83744q;

    /* renamed from: r, reason: collision with root package name */
    public final /* synthetic */ Function1 f83745r;

    /* renamed from: s, reason: collision with root package name */
    public final /* synthetic */ Function1 f83746s;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f83747t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ w(l0 l0Var, h0 h0Var, b2.t tVar, b2.f fVar, Function1 function1, Function1 function12, Function1 function13, Function1 function14, Function1 function15, int i5, int i11) {
        super(2);
        this.f83739j = i11;
        this.f83740k = l0Var;
        this.f83741l = h0Var;
        this.f83742m = tVar;
        this.n = fVar;
        this.o = function1;
        this.f83743p = function12;
        this.f83744q = function13;
        this.f83745r = function14;
        this.f83746s = function15;
        this.f83747t = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f83739j) {
            case 0:
                ((Number) obj2).intValue();
                j0.e(this.f83740k, this.f83741l, this.f83742m, this.n, this.o, this.f83743p, this.f83744q, this.f83745r, this.f83746s, (p1.o) obj, a0.l(this.f83747t | 1));
                break;
            case 1:
                ((Number) obj2).intValue();
                j0.e(this.f83740k, this.f83741l, this.f83742m, this.n, this.o, this.f83743p, this.f83744q, this.f83745r, this.f83746s, (p1.o) obj, a0.l(this.f83747t | 1));
                break;
            default:
                ((Number) obj2).intValue();
                j0.e(this.f83740k, this.f83741l, this.f83742m, this.n, this.o, this.f83743p, this.f83744q, this.f83745r, this.f83746s, (p1.o) obj, a0.l(this.f83747t | 1));
                break;
        }
        return Unit.f71706a;
    }
}
