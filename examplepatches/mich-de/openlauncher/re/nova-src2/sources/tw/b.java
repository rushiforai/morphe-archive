package tw;

import b2.t;
import java.util.Map;
import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import m3.g;
import m3.g0;
import m3.p0;
import p1.a0;
import p1.o;

/* loaded from: classes4.dex */
public final /* synthetic */ class b implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f89612a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f89613b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p0 f89614c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ t f89615d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f89616e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f89617f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f89618g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f89619h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ CharSequence f89620i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Object f89621j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f89622k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Function f89623l;

    public /* synthetic */ b(String str, t tVar, Map map, long j11, p0 p0Var, boolean z11, g0 g0Var, int i5, Function0 function0, int i11, int i12) {
        this.f89620i = str;
        this.f89615d = tVar;
        this.f89621j = map;
        this.f89613b = j11;
        this.f89614c = p0Var;
        this.f89616e = z11;
        this.f89622k = g0Var;
        this.f89617f = i5;
        this.f89623l = function0;
        this.f89618g = i11;
        this.f89619h = i12;
    }

    /* JADX WARN: Type inference failed for: r6v1, types: [java.lang.Object, java.util.Map] */
    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f89612a) {
            case 0:
                ((Integer) obj2).getClass();
                f.b((String) this.f89620i, this.f89615d, (Map) this.f89621j, this.f89613b, this.f89614c, this.f89616e, (g0) this.f89622k, this.f89617f, (Function0) this.f89623l, (o) obj, a0.l(this.f89618g | 1), this.f89619h);
                break;
            default:
                ((Integer) obj2).getClass();
                f.a((g) this.f89620i, this.f89613b, this.f89614c, this.f89615d, this.f89621j, this.f89616e, this.f89617f, this.f89618g, (Function1) this.f89622k, (Function1) this.f89623l, (o) obj, a0.l(this.f89619h | 1));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ b(g gVar, long j11, p0 p0Var, t tVar, Map map, boolean z11, int i5, int i11, Function1 function1, Function1 function12, int i12) {
        this.f89620i = gVar;
        this.f89613b = j11;
        this.f89614c = p0Var;
        this.f89615d = tVar;
        this.f89621j = map;
        this.f89616e = z11;
        this.f89617f = i5;
        this.f89618g = i11;
        this.f89622k = function1;
        this.f89623l = function12;
        this.f89619h = i12;
    }
}
