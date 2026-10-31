package com.fyber.inneractive.sdk.flow.endcard;

import android.view.View;
import android.view.ViewGroup;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.flow.y0;
import com.fyber.inneractive.sdk.util.IAlog;
import org.json.JSONArray;

/* loaded from: classes3.dex */
public abstract class b implements n {

    /* renamed from: a, reason: collision with root package name */
    public final String f28055a = IAlog.a(this);

    /* renamed from: b, reason: collision with root package name */
    public JSONArray f28056b = null;

    /* renamed from: c, reason: collision with root package name */
    public final y0 f28057c;

    /* renamed from: d, reason: collision with root package name */
    public n f28058d;

    /* renamed from: e, reason: collision with root package name */
    public int f28059e;

    /* renamed from: f, reason: collision with root package name */
    public int f28060f;

    public b(int i5, y0 y0Var) {
        this.f28057c = y0Var;
        this.f28060f = i5;
    }

    public abstract void a(ViewGroup viewGroup, com.fyber.inneractive.sdk.player.ui.b bVar);

    public void a(JSONArray jSONArray) {
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.n
    public final View b() {
        return f().b();
    }

    public abstract n c();

    public com.fyber.inneractive.sdk.player.ui.c d() {
        com.fyber.inneractive.sdk.config.global.features.v vVar = this.f28057c.f28459g;
        com.fyber.inneractive.sdk.player.ui.c cVar = new com.fyber.inneractive.sdk.player.ui.c();
        cVar.f30669a = l();
        cVar.f30674f = i();
        boolean zB = b(vVar);
        Integer numValueOf = Integer.valueOf(a(vVar));
        if (zB) {
            cVar.f30672d = numValueOf;
        }
        return cVar;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.n
    public void destroy() {
        e();
        n nVar = this.f28058d;
        if (nVar != null) {
            nVar.destroy();
            this.f28058d = null;
        }
    }

    public void e() {
        a();
    }

    public final n f() {
        if (this.f28058d == null) {
            this.f28058d = c();
        }
        return this.f28058d;
    }

    public abstract com.fyber.inneractive.sdk.util.g g();

    public abstract l h();

    public abstract com.fyber.inneractive.sdk.model.vast.i i();

    public boolean j() {
        return false;
    }

    public boolean k() {
        return false;
    }

    public abstract boolean l();

    public void m() {
        IAlog.a("%s loading success for %s", i(), this.f28055a);
    }

    public static boolean b(com.fyber.inneractive.sdk.config.global.features.v vVar) {
        if (vVar != null) {
            Boolean boolC = vVar.c("shouldEnableEndCardAutoClick");
            if (boolC != null ? boolC.booleanValue() : false) {
                return true;
            }
        }
        return false;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.n
    public final void a() {
        n nVar = this.f28058d;
        if (nVar != null) {
            nVar.a();
        }
    }

    public void a(InneractiveInfrastructureError inneractiveInfrastructureError) {
        IAlog.a("%s loading failed for %s", inneractiveInfrastructureError.getCause(), i(), this.f28055a);
    }

    public static int a(com.fyber.inneractive.sdk.config.global.features.v vVar) {
        if (vVar != null) {
            Integer numA = vVar.a("autoClickDelay");
            int iIntValue = numA != null ? numA.intValue() : 3;
            if (iIntValue >= 0 && iIntValue <= 10) {
                return iIntValue;
            }
        }
        return 3;
    }
}
