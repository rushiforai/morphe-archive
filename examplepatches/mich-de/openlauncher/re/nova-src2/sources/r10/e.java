package r10;

import com.teslacoilsw.launcher.quicksearchbar.NovaSearchEditText;
import com.teslacoilsw.launcher.search.AppSearchFloatingView;
import com.teslacoilsw.launcher.widget.AlphaOptimizedEditText;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class e implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85130a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AppSearchFloatingView f85131b;

    public /* synthetic */ e(AppSearchFloatingView appSearchFloatingView, int i5) {
        this.f85130a = i5;
        this.f85131b = appSearchFloatingView;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = this.f85130a;
        AppSearchFloatingView appSearchFloatingView = this.f85131b;
        switch (i5) {
            case 0:
                String str = (String) obj;
                g gVar = AppSearchFloatingView.f46165m;
                ((AlphaOptimizedEditText) appSearchFloatingView.V().f92299d).setText(str);
                ((AlphaOptimizedEditText) appSearchFloatingView.V().f92299d).setSelection(str.length());
                break;
            default:
                CharSequence charSequence = (CharSequence) obj;
                g gVar2 = AppSearchFloatingView.f46165m;
                NovaSearchEditText novaSearchEditText = (NovaSearchEditText) appSearchFloatingView.V().f92300e;
                if (charSequence == null || r70.k.U0(charSequence)) {
                    novaSearchEditText.d(false);
                } else {
                    novaSearchEditText.d(true);
                    novaSearchEditText.e(charSequence);
                }
                break;
        }
        return Unit.f71706a;
    }
}
