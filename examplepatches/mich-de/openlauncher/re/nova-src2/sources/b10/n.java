package b10;

import com.teslacoilsw.launcher.onboarding.FirstRunActivityCompose;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class n implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16800a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ FirstRunActivityCompose f16801b;

    public /* synthetic */ n(FirstRunActivityCompose firstRunActivityCompose, int i5) {
        this.f16800a = i5;
        this.f16801b = firstRunActivityCompose;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f16800a;
        FirstRunActivityCompose firstRunActivityCompose = this.f16801b;
        switch (i5) {
            case 0:
                int i11 = FirstRunActivityCompose.f45937s;
                if (!firstRunActivityCompose.isFinishing() && !firstRunActivityCompose.isDestroyed()) {
                    px.c.f83110a.d(firstRunActivityCompose);
                    break;
                } else {
                    break;
                }
                break;
            case 1:
                int i12 = FirstRunActivityCompose.f45937s;
                firstRunActivityCompose.j0(false);
                break;
            default:
                int i13 = FirstRunActivityCompose.f45937s;
                firstRunActivityCompose.j0(true);
                break;
        }
        return Unit.f71706a;
    }
}
