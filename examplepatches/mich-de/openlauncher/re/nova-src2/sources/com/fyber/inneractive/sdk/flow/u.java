package com.fyber.inneractive.sdk.flow;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.external.InneractiveVideoError;
import com.fyber.inneractive.sdk.util.IAlog;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class u extends k implements com.fyber.inneractive.sdk.player.s {

    /* renamed from: m, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.t f28391m;
    public String n;
    public final t o = new t(this);

    @Override // com.fyber.inneractive.sdk.flow.k, com.fyber.inneractive.sdk.interfaces.b
    public final void a() throws JSONException {
        com.fyber.inneractive.sdk.model.vast.b bVar;
        if (this.f28391m != null) {
            com.fyber.inneractive.sdk.response.e eVar = this.f28165b;
            this.f28391m.a((eVar == null || (bVar = ((com.fyber.inneractive.sdk.response.g) eVar).N) == null) ? null : bVar.f28571d.size() == 0 ? new InneractiveVideoError(InneractiveVideoError.Error.ERROR_FAILED_PLAYING_ALL_MEDIA_FILES, null) : new InneractiveVideoError(InneractiveVideoError.Error.ERROR_FAILED_PLAYING_MEDIA_FILE, null), null, true);
        }
        IAlog.a("%s: IAAdContentLoaderImpl : cancel load ad content retry task", IAlog.a(this));
        com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(this.f28175l);
        this.f28174k.a();
        super.a();
    }

    @Override // com.fyber.inneractive.sdk.flow.k, com.fyber.inneractive.sdk.interfaces.c
    public final void cancel() {
        IAlog.a("%s: IAAdContentLoaderImpl : cancel load ad content retry task", IAlog.a(this));
        com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(this.f28175l);
        this.f28174k.a();
    }

    @Override // com.fyber.inneractive.sdk.flow.k
    public final String e() {
        return "send_failed_vast_creatives";
    }

    @Override // com.fyber.inneractive.sdk.flow.k
    public final void g() {
        IAlog.a(IAlog.a(this) + "start called", new Object[0]);
        a(this.f28170g, (com.fyber.inneractive.sdk.response.g) this.f28165b, this.f28164a, this);
    }

    public final com.fyber.inneractive.sdk.player.ui.remote.g i() {
        com.fyber.inneractive.sdk.player.a aVar;
        com.fyber.inneractive.sdk.player.ui.remote.g gVar;
        com.fyber.inneractive.sdk.player.t tVar = this.f28391m;
        if (tVar == null || (aVar = tVar.f30657f) == null || (gVar = ((com.fyber.inneractive.sdk.player.n) aVar).f30643v) == null) {
            return null;
        }
        return gVar;
    }

    public final void a(Exception exc, String str, boolean z11) {
        HashMap map = new HashMap();
        map.put(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, str);
        if (exc != null) {
            map.put("exception", exc.getMessage());
        }
        if (i() != null) {
            i().f30730a.a();
        }
        com.fyber.inneractive.sdk.network.events.a.a(com.fyber.inneractive.sdk.network.t.VAST_ERROR_DVC_FAILURE, com.fyber.inneractive.sdk.network.events.b.TEMPLATE_ERROR.name(), this.n, this.f28164a, this.f28165b, map, Boolean.valueOf(z11));
    }

    public final void a(com.fyber.inneractive.sdk.config.global.r rVar, com.fyber.inneractive.sdk.response.g gVar, InneractiveAdRequest inneractiveAdRequest, com.fyber.inneractive.sdk.player.s sVar) {
        com.fyber.inneractive.sdk.model.vast.b bVar;
        un.c cVarA;
        String str;
        com.fyber.inneractive.sdk.network.t tVar;
        com.fyber.inneractive.sdk.model.vast.b bVar2;
        InneractiveAdRequest inneractiveAdRequest2 = this.f28164a;
        com.fyber.inneractive.sdk.config.x0 selectedUnitConfig = inneractiveAdRequest2 == null ? this.f28169f : inneractiveAdRequest2.getSelectedUnitConfig();
        if (selectedUnitConfig == null && gVar != null) {
            selectedUnitConfig = com.fyber.inneractive.sdk.config.a.a(gVar.f31054m);
        }
        com.google.android.gms.internal.consent_sdk.v vVar = null;
        com.fyber.inneractive.sdk.model.vast.b bVar3 = gVar == null ? null : gVar.N;
        if (bVar3 != null && bVar3.f28571d.size() < bVar3.f28576i) {
            bVar3.f28571d.clear();
            bVar3.f28574g.clear();
            bVar3.f28571d.addAll(bVar3.f28578k);
            bVar3.f28574g.addAll(bVar3.f28579l);
        }
        t0 t0Var = new t0(selectedUnitConfig, rVar, gVar, inneractiveAdRequest);
        this.f28166c = t0Var;
        com.fyber.inneractive.sdk.player.t tVar2 = new com.fyber.inneractive.sdk.player.t(gVar, inneractiveAdRequest, t0Var, sVar);
        this.f28391m = tVar2;
        t0 t0Var2 = (t0) this.f28166c;
        t0Var2.f28389i = tVar2;
        t0Var2.f28442f = this.f28171h;
        this.n = bVar3 != null ? bVar3.n : null;
        tVar2.f30656e = null;
        if (gVar != null && (bVar2 = gVar.N) != null) {
            tVar2.f30656e = (com.fyber.inneractive.sdk.model.vast.r) bVar2.f28571d.poll();
        }
        if (tVar2.f30656e == null) {
            InneractiveVideoError.Error playerError = new InneractiveVideoError(InneractiveVideoError.Error.ERROR_FAILED_PLAYING_ALL_MEDIA_FILES).getPlayerError();
            int i5 = com.fyber.inneractive.sdk.player.r.f30651a[playerError.ordinal()];
            if (i5 == 1) {
                tVar = com.fyber.inneractive.sdk.network.t.VAST_ERROR_NO_MEDIA_FILES;
            } else if (i5 == 2) {
                tVar = com.fyber.inneractive.sdk.network.t.VAST_ERROR_FAILED_PLAYING_MEDIA_FILE;
            } else if (i5 == 3) {
                tVar = com.fyber.inneractive.sdk.network.t.VAST_ERROR_FAILED_PLAYING_ALL_MEDIA_FILES;
            } else if (i5 == 4) {
                tVar = com.fyber.inneractive.sdk.network.t.VAST_ERROR_PRE_BUFFER_TIMEOUT;
            } else if (i5 != 5) {
                IAlog.a("IAReportError, Does not know player error " + playerError.getErrorString(), new Object[0]);
                tVar = com.fyber.inneractive.sdk.network.t.VAST_UNKNOWN_PLAYER_ERROR;
            } else {
                tVar = com.fyber.inneractive.sdk.network.t.VAST_ERROR_BUFFER_TIMEOUT;
            }
            InneractiveAdRequest inneractiveAdRequest3 = tVar2.f30653b;
            com.fyber.inneractive.sdk.response.g gVar2 = tVar2.f30654c;
            JSONArray jSONArrayB = tVar2.f30659h.b();
            com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(gVar2);
            wVar.f28819b = tVar;
            wVar.f28818a = inneractiveAdRequest3;
            wVar.f28821d = jSONArrayB;
            wVar.a((String) null);
            sVar.a(new InneractiveInfrastructureError(InneractiveErrorCode.SDK_INTERNAL_ERROR, i.VAST_NO_MEDIA_FILES));
        } else {
            try {
                tVar2.f30657f = tVar2.f30652a.a();
            } catch (Throwable th2) {
                tVar2.f30655d.a(new InneractiveInfrastructureError(InneractiveErrorCode.SDK_INTERNAL_ERROR, i.COULD_NOT_CREATE_FLOW_MANAGER, th2));
            }
            com.fyber.inneractive.sdk.player.a aVar = tVar2.f30657f;
            if (aVar != null) {
                com.fyber.inneractive.sdk.player.n nVar = (com.fyber.inneractive.sdk.player.n) aVar;
                com.fyber.inneractive.sdk.measurement.e eVar = nVar.f30582d;
                if (eVar != null) {
                    com.fyber.inneractive.sdk.measurement.f fVar = new com.fyber.inneractive.sdk.measurement.f();
                    ArrayList arrayList = nVar.f30638q.f28572e;
                    t0 t0Var3 = nVar.f30580b;
                    try {
                        try {
                            un.e eVar2 = un.e.VIDEO;
                            un.g gVar3 = un.g.UNSPECIFIED;
                            un.h hVar = un.h.NATIVE;
                            cVarA = un.c.a(eVar2, gVar3, hVar, hVar);
                        } catch (Throwable th3) {
                            fVar.a(th3);
                            cVarA = null;
                        }
                        ArrayList arrayListA = fVar.a(arrayList);
                        un.i iVar = eVar.f28506e;
                        if (iVar != null && (str = eVar.f28503b) != null) {
                            try {
                                x7.f.j(arrayListA, "VerificationScriptResources is null");
                                vVar = new com.google.android.gms.internal.consent_sdk.v(iVar, null, str, arrayListA, un.d.NATIVE);
                            } catch (Throwable th4) {
                                fVar.a(th4);
                            }
                        }
                        un.k kVarB = un.b.b(cVarA, vVar);
                        fVar.f28511a = kVarB;
                        fVar.f28512b = un.a.a(kVarB);
                        fVar.f28513c = vn.b.a(fVar.f28511a);
                        fVar.f28511a.e();
                        fVar.f28516f = t0Var3;
                    } catch (Throwable th5) {
                        fVar.a(th5);
                    }
                    nVar.f30583e = fVar;
                    nVar.f30584f = new com.fyber.inneractive.sdk.player.p(fVar);
                }
                if (nVar.f30583e == null && (bVar = nVar.f30638q) != null) {
                    Iterator it = bVar.f28572e.iterator();
                    while (it.hasNext()) {
                        com.fyber.inneractive.sdk.measurement.h hVar2 = (com.fyber.inneractive.sdk.measurement.h) it.next();
                        com.fyber.inneractive.sdk.measurement.i iVar2 = com.fyber.inneractive.sdk.measurement.i.ERROR_DURING_RESOURCE_LOAD;
                        com.fyber.inneractive.sdk.model.vast.x xVar = com.fyber.inneractive.sdk.model.vast.x.EVENT_VERIFICATION_NOT_EXECUTED;
                        com.fyber.inneractive.sdk.player.n.a(new com.fyber.inneractive.sdk.measurement.g(hVar2.a(xVar), iVar2), xVar);
                    }
                }
            }
            tVar2.a();
        }
        if (TextUtils.isEmpty(this.n)) {
            return;
        }
        IAConfigManager.Q.f27759s.a(new com.fyber.inneractive.sdk.network.v0(this.o, com.fyber.inneractive.sdk.util.o.f31210a, new com.fyber.inneractive.sdk.cache.m(this.n)));
    }

    @Override // com.fyber.inneractive.sdk.player.s
    public final void a(InneractiveInfrastructureError inneractiveInfrastructureError) throws JSONException {
        com.fyber.inneractive.sdk.util.r.f31215a.execute(new e(new f(this.f28165b, this.f28164a, "send_failed_vast_creatives", this.f28170g.b()), inneractiveInfrastructureError));
        b(inneractiveInfrastructureError);
    }
}
