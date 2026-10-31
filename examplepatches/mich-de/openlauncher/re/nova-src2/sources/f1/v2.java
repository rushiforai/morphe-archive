package f1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final /* synthetic */ class v2 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54046a = 2;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f54047b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f54048c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ long f54049d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f54050e;

    public /* synthetic */ v2(int i5, long j11, String str, boolean z11) {
        this.f54050e = str;
        this.f54049d = j11;
        this.f54048c = z11;
        this.f54047b = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f54046a) {
            case 0:
                ((Integer) obj2).intValue();
                androidx.compose.material.a.b(this.f54049d, (Function0) this.f54050e, this.f54048c, (p1.o) obj, p1.a0.l(this.f54047b | 1));
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(1);
                hv.k2.a(this.f54047b, this.f54048c, this.f54049d, (Function0) this.f54050e, (p1.o) obj, iL);
                break;
            default:
                ((Integer) obj2).getClass();
                kw.n0.d((String) this.f54050e, this.f54049d, this.f54048c, (p1.o) obj, p1.a0.l(this.f54047b | 1));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ v2(int i5, boolean z11, long j11, Function0 function0, int i11) {
        this.f54047b = i5;
        this.f54048c = z11;
        this.f54049d = j11;
        this.f54050e = function0;
    }

    public /* synthetic */ v2(long j11, Function0 function0, boolean z11, int i5) {
        this.f54049d = j11;
        this.f54050e = function0;
        this.f54048c = z11;
        this.f54047b = i5;
    }
}
