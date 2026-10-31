package f10;

import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class n implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54198a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ FancyPrefView f54199b;

    public /* synthetic */ n(FancyPrefView fancyPrefView, int i5) {
        this.f54198a = i5;
        this.f54199b = fancyPrefView;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = this.f54198a;
        FancyPrefView fancyPrefView = this.f54199b;
        switch (i5) {
            case 0:
                int i11 = FancyPrefView.J;
                fancyPrefView.E(obj);
                break;
            default:
                int i12 = FancyPrefView.J;
                fancyPrefView.setEnabled(((Boolean) obj).booleanValue());
                break;
        }
        return Unit.f71706a;
    }
}
