package h10;

import android.content.Intent;
import android.net.Uri;
import android.view.View;
import com.teslacoilsw.launcher.preferences.fragments.SettingsIntegrations;

/* loaded from: classes4.dex */
public final /* synthetic */ class r0 implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58969a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f58970b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f58971c;

    public /* synthetic */ r0(int i5, SettingsIntegrations settingsIntegrations) {
        this.f58970b = i5;
        this.f58971c = settingsIntegrations;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f58969a) {
            case 0:
                SettingsIntegrations settingsIntegrations = (SettingsIntegrations) this.f58971c;
                Intent intent = new Intent("android.intent.action.VIEW");
                if (this.f58970b >= 2) {
                    intent.setClassName("com.teslacoilsw.launcherclientproxy", "com.teslacoilsw.tesladirect.ChangeLogDialog");
                } else {
                    intent.setData(Uri.parse("https://novalauncher.com/nowcompanion#changelog"));
                }
                intent.addFlags(276824064);
                try {
                    settingsIntegrations.requireActivity().startActivity(intent);
                    break;
                } catch (Exception e3) {
                    e3.printStackTrace();
                    com.google.android.gms.internal.consent_sdk.k0.x(settingsIntegrations.getActivity(), settingsIntegrations.getString(2132017222), 0).show();
                    return;
                }
            default:
                uf.h hVar = (uf.h) this.f58971c;
                uf.m mVar = hVar.f91133d;
                int i5 = hVar.f91132c;
                int i11 = this.f58970b;
                if (i11 != i5) {
                    float f11 = hVar.f91131b[i11];
                    fe.l1 l1Var = mVar.f91151b0;
                    if (l1Var != null) {
                        fe.a0 a0Var = (fe.a0) l1Var;
                        a0Var.s0();
                        fe.g1 g1Var = new fe.g1(f11, a0Var.f54691j0.n.f54798b);
                        a0Var.s0();
                        if (!a0Var.f54691j0.n.equals(g1Var)) {
                            fe.f1 f1VarE = a0Var.f54691j0.e(g1Var);
                            a0Var.H++;
                            a0Var.f54692k.f54816h.a(4, g1Var).b();
                            a0Var.q0(f1VarE, 0, 1, false, false, 5, -9223372036854775807L, -1, false);
                        }
                    }
                }
                mVar.f91168k.dismiss();
                break;
        }
    }

    public /* synthetic */ r0(uf.h hVar, int i5) {
        this.f58971c = hVar;
        this.f58970b = i5;
    }
}
