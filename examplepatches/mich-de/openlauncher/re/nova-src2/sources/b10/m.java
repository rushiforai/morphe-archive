package b10;

import com.teslacoilsw.launcher.onboarding.FirstRunActivityCompose;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class m implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16779a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ FirstRunActivityCompose f16780b;

    public /* synthetic */ m(FirstRunActivityCompose firstRunActivityCompose, int i5, int i11) {
        this.f16779a = i11;
        this.f16780b = firstRunActivityCompose;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f16779a;
        FirstRunActivityCompose firstRunActivityCompose = this.f16780b;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        int i11 = FirstRunActivityCompose.f45937s;
        switch (i5) {
            case 0:
                firstRunActivityCompose.g0(oVar, p1.a0.l(1));
                break;
            case 1:
                firstRunActivityCompose.c0(oVar, p1.a0.l(1));
                break;
            case 2:
                firstRunActivityCompose.d0(oVar, p1.a0.l(1));
                break;
            case 3:
                firstRunActivityCompose.b0(oVar, p1.a0.l(1));
                break;
            default:
                firstRunActivityCompose.f0(oVar, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
