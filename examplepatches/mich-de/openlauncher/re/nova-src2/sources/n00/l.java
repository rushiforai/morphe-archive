package n00;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import p1.a0;

/* loaded from: classes4.dex */
public final /* synthetic */ class l implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77573a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f77574b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f77575c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function0 f77576d;

    public /* synthetic */ l(boolean z11, Function0 function0, Function0 function02, int i5, int i11) {
        this.f77573a = i11;
        this.f77574b = z11;
        this.f77575c = function0;
        this.f77576d = function02;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f77573a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                r.a(this.f77574b, this.f77575c, this.f77576d, oVar, a0.l(1));
                break;
            default:
                ux.g.a(this.f77574b, this.f77575c, this.f77576d, oVar, a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
