package com.fyber.inneractive.sdk.flow.endcard;

import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.flow.x0;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: d, reason: collision with root package name */
    public static final String f28069d = IAlog.a(h.class);

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.config.r f28070a;

    /* renamed from: b, reason: collision with root package name */
    public final int f28071b;

    /* renamed from: c, reason: collision with root package name */
    public final x0 f28072c;

    public h(x0 x0Var) {
        this.f28072c = x0Var;
        com.fyber.inneractive.sdk.config.r rVar = IAConfigManager.Q.f27761u.f27936b;
        this.f28070a = rVar;
        this.f28071b = rVar.a("vast_endcard_x_delay", 5, 0);
    }

    public final void a(m mVar) {
        b bVar;
        com.fyber.inneractive.sdk.model.vast.o oVar;
        if (mVar.f28113a.size() < 1) {
            return;
        }
        b bVarA = mVar.a();
        com.fyber.inneractive.sdk.model.vast.i iVar = com.fyber.inneractive.sdk.model.vast.i.FMP_End_Card;
        Iterator it = mVar.f28113a.iterator();
        while (true) {
            if (!it.hasNext()) {
                bVar = null;
                break;
            } else {
                bVar = (b) it.next();
                if (bVar.i() == iVar) {
                    break;
                }
            }
        }
        if (this.f28072c.f28444a >= 0) {
            if (bVarA == null) {
                IAlog.a("%sapplyEndcardTimeUnderPolicy was called with a null endcard", f28069d);
                return;
            } else {
                IAlog.a("%s: applying endcard time under skip/close policy", f28069d);
                bVarA.f28060f = this.f28072c.f28445b;
                return;
            }
        }
        if (bVarA != null && bVarA.i() != com.fyber.inneractive.sdk.model.vast.i.FMP_End_Card && bVarA.i() != com.fyber.inneractive.sdk.model.vast.i.Default_End_Card && bVarA.l() && (oVar = bVarA.f28057c.f28457e.f28573f) != null && oVar.f28625d && bVar != null && bVar.l()) {
            a(bVarA, bVar.l());
            a(bVar, true, bVarA.k());
        } else if (bVarA == bVar || bVarA == null || bVarA.g() == com.fyber.inneractive.sdk.util.g.DEFAULT_ENDCARD) {
            a(bVarA, false, false);
        } else {
            a(bVarA, false);
        }
    }

    public final void a(b bVar, boolean z11) {
        int iB;
        if (bVar == null) {
            IAlog.a("%sapplyVastCompanionEndCardTime was called with a null endcard", f28069d);
            return;
        }
        if (bVar.k()) {
            if (z11) {
                iB = this.f28070a.b("d_e_pl_dl_pl", this.f28071b, 0);
            } else {
                iB = this.f28070a.b("d_e_pl", this.f28071b, 0);
            }
        } else if (z11) {
            iB = this.f28070a.b("d_e_npl_dl_npl", this.f28071b, 0);
        } else {
            iB = this.f28070a.b("d_e_npl", this.f28071b, 0);
        }
        bVar.f28060f = iB;
    }

    public final void a(b bVar, boolean z11, boolean z12) {
        int iB;
        if (bVar == null) {
            IAlog.a("%sapplyNonVastCompanionEndCardTime was called with a null endcard", IAlog.a(this));
            return;
        }
        if (!z11) {
            iB = this.f28070a.b("d_e_def", this.f28071b, 0);
        } else if (z12) {
            iB = this.f28070a.b("d_e_pl_dl_dl", this.f28071b, 0);
        } else {
            iB = this.f28070a.b("d_e_npl_dl_dl", this.f28071b, 0);
        }
        bVar.f28060f = iB;
    }
}
