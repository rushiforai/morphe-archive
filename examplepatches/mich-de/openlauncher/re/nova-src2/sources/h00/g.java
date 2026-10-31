package h00;

import com.teslacoilsw.launcher.ai.NovaAiSettingsActivity;
import java.util.regex.Pattern;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class g implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58787a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e1 f58788b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e1 f58789c;

    public /* synthetic */ g(e1 e1Var, e1 e1Var2, int i5) {
        this.f58787a = i5;
        this.f58788b = e1Var;
        this.f58789c = e1Var2;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f58787a;
        e1 e1Var = this.f58789c;
        e1 e1Var2 = this.f58788b;
        switch (i5) {
            case 0:
                Pattern pattern = p.f58832a;
                e1Var2.setValue(null);
                e1Var.setValue(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                break;
            case 1:
                if (!((Boolean) e1Var2.getValue()).booleanValue()) {
                    e1Var.setValue(Boolean.TRUE);
                }
                break;
            case 2:
                e1Var2.setValue(Boolean.FALSE);
                e1Var.setValue(Boolean.TRUE);
                break;
            case 3:
                if (!NovaAiSettingsActivity.i0(e1Var2)) {
                    NovaAiSettingsActivity.h0(e1Var, false);
                }
                break;
            default:
                e1Var2.setValue(Boolean.TRUE);
                e1Var.setValue(Boolean.FALSE);
                break;
        }
        return Unit.f71706a;
    }
}
