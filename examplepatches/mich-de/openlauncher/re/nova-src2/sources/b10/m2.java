package b10;

import com.teslacoilsw.launcher.onboarding.WhatsNewActivity;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class m2 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16798a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ WhatsNewActivity f16799b;

    public /* synthetic */ m2(WhatsNewActivity whatsNewActivity, int i5, int i11) {
        this.f16798a = i11;
        this.f16799b = whatsNewActivity;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f16798a;
        WhatsNewActivity whatsNewActivity = this.f16799b;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        int i11 = WhatsNewActivity.f45941r;
        switch (i5) {
            case 0:
                whatsNewActivity.d0(oVar, p1.a0.l(1));
                break;
            case 1:
                whatsNewActivity.Z(oVar, p1.a0.l(1));
                break;
            default:
                whatsNewActivity.a0(oVar, p1.a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
