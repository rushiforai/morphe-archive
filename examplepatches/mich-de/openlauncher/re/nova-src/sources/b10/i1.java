package b10;

import android.content.Context;
import android.content.Intent;
import com.amplitude.core.events.Plan;
import com.teslacoilsw.launcher.onboarding.NovaPaywallActivity;

/* loaded from: classes4.dex */
public final class i1 {
    public static b2 a(String str) {
        int iHashCode = str.hashCode();
        if (iHashCode != -361517853) {
            if (iHashCode != -74203354) {
                if (iHashCode == 270940796 && str.equals("disabled")) {
                    return b2.f16586d;
                }
            } else if (str.equals("after_settings")) {
                return b2.f16585c;
            }
        } else if (str.equals("before_settings")) {
            return b2.f16584b;
        }
        return b2.f16584b;
    }

    public static Intent b(Context context, String str, String str2, boolean z11) {
        Intent intent = new Intent(context, (Class<?>) NovaPaywallActivity.class);
        intent.addFlags(268435456);
        if (str != null) {
            intent.putExtra("preselect_tier", str);
        }
        intent.putExtra(Plan.AMP_PLAN_SOURCE, str2);
        if (z11) {
            intent.putExtra("ai_mode", true);
        }
        return intent;
    }
}
