package bu;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import ps.f0;

/* loaded from: classes4.dex */
public final /* synthetic */ class w implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18603a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f18604b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f18605c;

    public /* synthetic */ w(boolean z11, int i5, Function0 function0) {
        this.f18603a = 3;
        this.f18605c = function0;
        this.f18604b = z11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f18603a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                a0.c(this.f18604b, this.f18605c, oVar, p1.a0.l(1));
                break;
            case 1:
                android.support.v4.media.session.b.e(this.f18604b, this.f18605c, oVar, p1.a0.l(1));
                break;
            case 2:
                android.support.v4.media.session.b.j(this.f18604b, this.f18605c, oVar, p1.a0.l(1));
                break;
            default:
                f0.f(this.f18604b, this.f18605c, oVar, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ w(boolean z11, Function0 function0, int i5, int i11) {
        this.f18603a = i11;
        this.f18604b = z11;
        this.f18605c = function0;
    }
}
