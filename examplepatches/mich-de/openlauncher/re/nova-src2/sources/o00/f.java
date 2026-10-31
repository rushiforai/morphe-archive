package o00;

import com.teslacoilsw.launcher.ai.NovaAiSettingsActivity;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import l1.d1;
import p1.e1;
import tx.b3;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78878a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e1 f78879b;

    public /* synthetic */ f(e1 e1Var, int i5) {
        this.f78878a = i5;
        this.f78879b = e1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f78878a;
        e1 e1Var = this.f78879b;
        switch (i5) {
            case 0:
                List list = j.f78916a;
                e1Var.setValue(Boolean.valueOf(!((Boolean) e1Var.getValue()).booleanValue()));
                break;
            case 1:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 2:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 3:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 4:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 5:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 6:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 7:
                List list2 = p00.k.f81339a;
                e1Var.setValue(Boolean.FALSE);
                break;
            case 8:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 9:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 10:
                e1Var.setValue(Integer.valueOf(((Number) e1Var.getValue()).intValue() + 1));
                break;
            case 11:
                e1Var.setValue(null);
                break;
            case 12:
                zy.c cVar = zy.c.f98823a;
                zy.c.i("rewards_merch_teaser_tap", null);
                yx.b bVar = yx.b.f97678a;
                yx.b.g("rewards_merch_teaser_tap", null);
                e1Var.setValue(Boolean.valueOf(!((Boolean) e1Var.getValue()).booleanValue()));
                break;
            case 13:
                e1Var.setValue(null);
                break;
            case 14:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 15:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 16:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 17:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 18:
                e1Var.setValue(Boolean.valueOf(!((Boolean) e1Var.getValue()).booleanValue()));
                break;
            case 19:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 20:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 21:
                if (e1Var != null) {
                    break;
                }
                break;
            case 22:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 23:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 24:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 25:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 26:
                NovaAiSettingsActivity.h0(e1Var, true);
                break;
            case 27:
                d1 d1Var = NovaAiSettingsActivity.f45697u;
                e1Var.setValue(b3.f89665b);
                break;
            case 28:
                d1 d1Var2 = NovaAiSettingsActivity.f45697u;
                e1Var.setValue(Boolean.TRUE);
                break;
            default:
                d1 d1Var3 = NovaAiSettingsActivity.f45697u;
                e1Var.setValue(Boolean.FALSE);
                break;
        }
        return Unit.f71706a;
    }
}
