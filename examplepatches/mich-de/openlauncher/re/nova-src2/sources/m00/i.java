package m00;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class i implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75560a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f75561b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f75562c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f75563d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function1 f75564e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ boolean f75565f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ boolean f75566g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ boolean f75567h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ int f75568i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Object f75569j;

    public /* synthetic */ i(b2.t tVar, Object obj, String str, String str2, Function1 function1, boolean z11, boolean z12, boolean z13, int i5, int i11) {
        this.f75560a = i11;
        this.f75561b = tVar;
        this.f75569j = obj;
        this.f75562c = str;
        this.f75563d = str2;
        this.f75564e = function1;
        this.f75565f = z11;
        this.f75566g = z12;
        this.f75567h = z13;
        this.f75568i = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f75560a) {
            case 0:
                ((Integer) obj2).getClass();
                l.b(this.f75561b, (x1.e) this.f75569j, this.f75562c, this.f75563d, this.f75564e, this.f75565f, this.f75566g, this.f75567h, (p1.o) obj, p1.a0.l(this.f75568i | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                l0.c(this.f75561b, (y20.d) this.f75569j, this.f75562c, this.f75563d, this.f75564e, this.f75565f, this.f75566g, this.f75567h, (p1.o) obj, p1.a0.l(this.f75568i | 1));
                break;
        }
        return Unit.f71706a;
    }
}
