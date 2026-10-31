package com.fyber.inneractive.sdk.flow;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.activities.InneractiveInternalBrowserActivity;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.g1;
import h6.c1;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class z implements com.fyber.inneractive.sdk.click.o {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ g1 f28460a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.util.g f28461b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.click.o f28462c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ b0 f28463d;

    public z(b0 b0Var, g1 g1Var, com.fyber.inneractive.sdk.util.g gVar, com.fyber.inneractive.sdk.click.o oVar) {
        this.f28463d = b0Var;
        this.f28460a = g1Var;
        this.f28461b = gVar;
        this.f28462c = oVar;
    }

    @Override // com.fyber.inneractive.sdk.click.o
    public final void a(com.fyber.inneractive.sdk.click.b bVar) throws JSONException {
        com.fyber.inneractive.sdk.click.j jVar;
        com.fyber.inneractive.sdk.click.q qVar;
        b0 b0Var = this.f28463d;
        b0Var.getClass();
        IAlog.a("%s super click result: %s", IAlog.a(b0Var), bVar);
        b0 b0Var2 = this.f28463d;
        if (b0Var2.f28037h == null) {
            IAlog.a("%s click handler is null. Probably cancelled", IAlog.a(b0Var2));
            return;
        }
        b0Var2.f28037h = null;
        b0Var2.f28038i = null;
        b0Var2.G();
        b0 b0Var3 = this.f28463d;
        g1 g1Var = this.f28460a;
        com.fyber.inneractive.sdk.util.g gVar = this.f28461b;
        b0Var3.getClass();
        com.fyber.inneractive.sdk.click.q qVar2 = bVar.f27697a;
        if (qVar2 == com.fyber.inneractive.sdk.click.q.OPEN_IN_EXTERNAL_APPLICATION || qVar2 == com.fyber.inneractive.sdk.click.q.OPEN_GOOGLE_STORE) {
            IAlog.a("InneractiveAdRendererImpl: handleOpenResult - opened in external application", new Object[0]);
            if (!bVar.f27702f.isEmpty() && (qVar = (jVar = (com.fyber.inneractive.sdk.click.j) c1.l(bVar.f27702f, 1)).f27721c) == com.fyber.inneractive.sdk.click.q.OPENED_IN_EXTERNAL_BROWSER) {
                b0Var3.a(jVar.f27719a, qVar);
            }
            if (b0Var3.f28032c != null) {
                b0Var3.F();
            }
        } else if (qVar2 == com.fyber.inneractive.sdk.click.q.OPENED_IN_INTERNAL_BROWSER) {
            IAlog.a("InneractiveAdRendererImpl: handleOpenResult - opened in internal browser", new Object[0]);
            b0Var3.f28033d = true;
            InneractiveInternalBrowserActivity.setInternalBrowserListener(b0Var3);
        } else if (qVar2 == com.fyber.inneractive.sdk.click.q.OPENED_USING_CHROME_NAVIGATE || qVar2 == com.fyber.inneractive.sdk.click.q.OPENED_IN_EXTERNAL_BROWSER) {
            IAlog.a("InneractiveAdRendererImpl: handleOpenResult - opened in external browser", new Object[0]);
            b0Var3.a(bVar.f27700d, bVar.f27697a);
            if (b0Var3.f28032c != null) {
                b0Var3.F();
            }
        }
        if (b0Var3.o() == com.fyber.inneractive.sdk.ignite.m.NONE || (!TextUtils.isEmpty(bVar.f27699c) && !bVar.f27699c.equals("IgniteGooglePlay"))) {
            b0Var3.b(bVar, g1Var, gVar);
        }
        com.fyber.inneractive.sdk.click.o oVar = this.f28462c;
        if (oVar != null) {
            oVar.a(bVar);
        }
    }
}
