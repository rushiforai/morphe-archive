package tx;

import com.teslacoilsw.launcher.ai.NovaAiSettingsActivity;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class u2 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f90025a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ NovaAiSettingsActivity f90026b;

    public /* synthetic */ u2(NovaAiSettingsActivity novaAiSettingsActivity, int i5, int i11) {
        this.f90025a = i11;
        this.f90026b = novaAiSettingsActivity;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f90025a;
        NovaAiSettingsActivity novaAiSettingsActivity = this.f90026b;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        l1.d1 d1Var = NovaAiSettingsActivity.f45697u;
        switch (i5) {
            case 0:
                novaAiSettingsActivity.Z(oVar, p1.a0.l(1));
                break;
            case 1:
                novaAiSettingsActivity.g0(oVar, p1.a0.l(1));
                break;
            case 2:
                novaAiSettingsActivity.e0(oVar, p1.a0.l(1));
                break;
            case 3:
                novaAiSettingsActivity.f0(oVar, p1.a0.l(1));
                break;
            case 4:
                novaAiSettingsActivity.f0(oVar, p1.a0.l(1));
                break;
            case 5:
                novaAiSettingsActivity.c0(oVar, p1.a0.l(1));
                break;
            case 6:
                novaAiSettingsActivity.d0(oVar, p1.a0.l(1));
                break;
            default:
                novaAiSettingsActivity.b0(oVar, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
