package b;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.widget.CheckBox;
import com.stripe.android.financialconnections.lite.FinancialConnectionsSheetLiteActivity;
import com.teslacoilsw.launcher.ai.NovaAiChatActivity;
import com.teslacoilsw.launcher.drawer.drawergroups.DrawerTabSetupActivity;
import com.teslacoilsw.launcher.preferences.fragments.SettingsLookFeel;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.coroutines.Continuation;

/* loaded from: classes2.dex */
public final /* synthetic */ class z9 implements DialogInterface.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16039a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f16040b;

    public /* synthetic */ z9(Object obj, int i5) {
        this.f16039a = i5;
        this.f16040b = obj;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i5) {
        int i11 = this.f16039a;
        Continuation continuation = null;
        Object obj = this.f16040b;
        switch (i11) {
            case 0:
                ((AtomicInteger) obj).set(i5);
                break;
            case 1:
                Intent intent = new Intent("android.settings.APPLICATION_DEVELOPMENT_SETTINGS");
                intent.addFlags(268468224);
                ((SettingsLookFeel) obj).startActivity(intent);
                break;
            case 2:
                c9.q(e10.a3.f51435a.f51545a, "ignore_bad_home_intent", true);
                ((v9.h0) obj).f92358e.setVisibility(8);
                break;
            case 3:
                com.vungle.ads.internal.presenter.w.a((com.vungle.ads.internal.presenter.w) obj, dialogInterface, i5);
                break;
            case 4:
                ((FinancialConnectionsSheetLiteActivity) obj).finish();
                break;
            case 5:
                NovaAiChatActivity novaAiChatActivity = (NovaAiChatActivity) obj;
                int i12 = NovaAiChatActivity.C;
                t70.m0.t(h6.g1.e(novaAiChatActivity), null, null, new tx.y(novaAiChatActivity, continuation, 2), 3);
                break;
            case 6:
                DrawerTabSetupActivity.RemoveDialogFragment removeDialogFragment = (DrawerTabSetupActivity.RemoveDialogFragment) obj;
                uy.d0 d0Var = uy.d0.f91699e;
                d0Var.d(removeDialogFragment.requireActivity().getContentResolver(), d0Var.h(removeDialogFragment.f45742a));
                break;
            case 7:
                Context context = (Context) obj;
                Intent intent2 = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS");
                intent2.setData(Uri.fromParts("package", context.getPackageName(), null));
                context.startActivity(intent2);
                break;
            default:
                if (((CheckBox) obj).isChecked()) {
                    e10.y2.f51877a.getClass();
                    e10.y2.x1().i(wy.h.f94899c);
                    break;
                }
                break;
        }
    }
}
