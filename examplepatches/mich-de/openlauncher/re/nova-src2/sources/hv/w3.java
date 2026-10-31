package hv;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class w3 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60647a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f60648b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f60649c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f60650d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function1 f60651e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ b2.t f60652f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f60653g;

    public /* synthetic */ w3(float f11, boolean z11, boolean z12, Function1 function1, b2.t tVar, int i5, int i11) {
        this.f60647a = i11;
        this.f60648b = f11;
        this.f60649c = z11;
        this.f60650d = z12;
        this.f60651e = function1;
        this.f60652f = tVar;
        this.f60653g = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f60647a) {
            case 0:
                ((Integer) obj2).getClass();
                g4.c(this.f60648b, this.f60649c, this.f60650d, this.f60651e, this.f60652f, (p1.o) obj, p1.a0.l(this.f60653g | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                g4.d(this.f60648b, this.f60649c, this.f60650d, this.f60651e, this.f60652f, (p1.o) obj, p1.a0.l(this.f60653g | 1));
                break;
        }
        return Unit.f71706a;
    }
}
