package tx;

import com.teslacoilsw.launcher.ai.NovaAiSettingsActivity;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class w2 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f90044a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ NovaAiSettingsActivity f90045b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f90046c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f90047d;

    public /* synthetic */ w2(NovaAiSettingsActivity novaAiSettingsActivity, Function0 function0, int i5, int i11) {
        this.f90044a = i11;
        this.f90045b = novaAiSettingsActivity;
        this.f90046c = function0;
        this.f90047d = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f90044a;
        int i11 = this.f90047d;
        Function0 function0 = this.f90046c;
        NovaAiSettingsActivity novaAiSettingsActivity = this.f90045b;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).intValue();
        l1.d1 d1Var = NovaAiSettingsActivity.f45697u;
        switch (i5) {
            case 0:
                novaAiSettingsActivity.j0(function0, oVar, p1.a0.l(i11 | 1));
                break;
            default:
                novaAiSettingsActivity.a0(function0, oVar, p1.a0.l(i11 | 1));
                break;
        }
        return Unit.f71706a;
    }
}
