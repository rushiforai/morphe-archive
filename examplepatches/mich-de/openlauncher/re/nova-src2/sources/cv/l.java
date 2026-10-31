package cv;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class l implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f48014a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f48015b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f48016c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ x f48017d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function1 f48018e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f48019f;

    public /* synthetic */ l(String str, boolean z11, x xVar, Function1 function1, int i5, int i11) {
        this.f48014a = i11;
        this.f48015b = str;
        this.f48016c = z11;
        this.f48017d = xVar;
        this.f48018e = function1;
        this.f48019f = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f48014a) {
            case 0:
                ((Integer) obj2).getClass();
                android.support.v4.media.session.b.h(this.f48015b, this.f48016c, this.f48017d, this.f48018e, (p1.o) obj, p1.a0.l(this.f48019f | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                android.support.v4.media.session.b.f(this.f48015b, this.f48016c, this.f48017d, this.f48018e, (p1.o) obj, p1.a0.l(this.f48019f | 1));
                break;
        }
        return Unit.f71706a;
    }
}
