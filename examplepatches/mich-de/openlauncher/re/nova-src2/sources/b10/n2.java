package b10;

import com.teslacoilsw.launcher.onboarding.WhatsNewActivity;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class n2 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16807a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ WhatsNewActivity f16808b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ x1.e f16809c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f16810d;

    public /* synthetic */ n2(WhatsNewActivity whatsNewActivity, x1.e eVar, int i5, int i11) {
        this.f16807a = i11;
        this.f16808b = whatsNewActivity;
        this.f16809c = eVar;
        this.f16810d = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f16807a;
        int i11 = this.f16810d;
        x1.e eVar = this.f16809c;
        WhatsNewActivity whatsNewActivity = this.f16808b;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        int i12 = WhatsNewActivity.f45941r;
        switch (i5) {
            case 0:
                whatsNewActivity.f0(eVar, oVar, p1.a0.l(i11 | 1));
                break;
            default:
                whatsNewActivity.e0(eVar, oVar, p1.a0.l(i11 | 1));
                break;
        }
        return Unit.f71706a;
    }
}
