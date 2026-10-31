package com.fyber.inneractive.sdk.player;

import android.content.Context;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.Skip;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.config.global.features.v;
import com.fyber.inneractive.sdk.config.w0;
import com.fyber.inneractive.sdk.config.y0;
import com.fyber.inneractive.sdk.external.InneractiveAdManager;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveVideoError;
import com.fyber.inneractive.sdk.flow.t0;
import com.fyber.inneractive.sdk.flow.x0;
import com.fyber.inneractive.sdk.model.vast.x;
import com.fyber.inneractive.sdk.network.u;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.player.enums.VideoClickOrigin;
import com.fyber.inneractive.sdk.util.IAlog;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public abstract class f implements com.fyber.inneractive.sdk.player.controller.p, com.fyber.inneractive.sdk.player.controller.o {

    /* renamed from: a, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.controller.q f30579a;

    /* renamed from: b, reason: collision with root package name */
    public t0 f30580b;

    /* renamed from: c, reason: collision with root package name */
    public InneractiveAdRequest f30581c;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.measurement.e f30582d;

    /* renamed from: e, reason: collision with root package name */
    public com.fyber.inneractive.sdk.measurement.f f30583e;

    /* renamed from: l, reason: collision with root package name */
    public q f30590l;

    /* renamed from: m, reason: collision with root package name */
    public int f30591m;
    public final x0 n;
    public com.fyber.inneractive.sdk.model.vast.r o;

    /* renamed from: f, reason: collision with root package name */
    public p f30584f = null;

    /* renamed from: g, reason: collision with root package name */
    public boolean f30585g = true;

    /* renamed from: h, reason: collision with root package name */
    public boolean f30586h = false;

    /* renamed from: i, reason: collision with root package name */
    public volatile boolean f30587i = false;

    /* renamed from: j, reason: collision with root package name */
    public boolean f30588j = false;

    /* renamed from: k, reason: collision with root package name */
    public int f30589k = 0;

    /* renamed from: p, reason: collision with root package name */
    public final c f30592p = new c(this);

    /* JADX WARN: Removed duplicated region for block: B:9:0x0032  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public f(Context context, com.fyber.inneractive.sdk.response.e eVar, com.fyber.inneractive.sdk.config.global.r rVar) {
        com.fyber.inneractive.sdk.player.controller.q aVar = null;
        if (rVar != null) {
            try {
                Boolean boolC = ((v) rVar.a(v.class)).c("use_fmp_cache_mechanism");
                boolean zBooleanValue = boolC != null ? boolC.booleanValue() : false;
                aVar = new com.fyber.inneractive.sdk.player.controller.f(context, zBooleanValue, rVar);
            } catch (Throwable th2) {
                if (IAlog.f31163a <= 3) {
                    IAlog.a("Failed creating exo player", new Object[0]);
                    th2.printStackTrace();
                }
            }
        }
        aVar = aVar == null ? new com.fyber.inneractive.sdk.player.controller.a(context) : aVar;
        this.f30579a = aVar;
        if (!aVar.f28923b.contains(this)) {
            aVar.f28923b.add(this);
        }
        com.fyber.inneractive.sdk.player.controller.q qVar = this.f30579a;
        if (!qVar.f28924c.contains(this)) {
            qVar.f28924c.add(this);
        }
        this.f30579a.f28927f = this.f30592p;
        this.n = new x0(eVar);
    }

    public abstract void a(InneractiveVideoError inneractiveVideoError, JSONObject jSONObject);

    @Override // com.fyber.inneractive.sdk.player.controller.p
    public final void a(com.fyber.inneractive.sdk.player.mediaplayer.o oVar) {
        IAlog.a("IMediaPlayerFlowManager: onPlayerError called with: %s", oVar.getMessage());
        a(new InneractiveVideoError(InneractiveVideoError.Error.ERROR_FAILED_PLAYING_MEDIA_FILE, oVar), new JSONObject());
        if (this.f30586h) {
            IAlog.a("IMediaPlayerFlowManager: onPlayerError video was prepared. This is a critical error. Aborting!", new Object[0]);
            a(new InneractiveVideoError(InneractiveVideoError.Error.ERROR_FAILED_PLAYING_ALL_MEDIA_FILES, oVar), new JSONObject());
        }
    }

    public abstract void a(com.fyber.inneractive.sdk.response.i iVar, VideoClickOrigin videoClickOrigin, x... xVarArr);

    @Override // com.fyber.inneractive.sdk.player.controller.p
    public final void c(boolean z11) {
        try {
            t0 t0Var = this.f30580b;
            com.fyber.inneractive.sdk.response.g gVar = t0Var != null ? (com.fyber.inneractive.sdk.response.g) t0Var.f28438b : null;
            u uVar = u.VAST_MEDIA_LOAD_RETRY_ATTEMPTED;
            InneractiveAdRequest inneractiveAdRequest = this.f30581c;
            t0 t0Var2 = this.f30580b;
            JSONArray jSONArrayB = t0Var2 == null ? null : t0Var2.f28439c.b();
            w wVar = new w(gVar);
            wVar.f28820c = uVar;
            wVar.f28818a = inneractiveAdRequest;
            wVar.f28821d = jSONArrayB;
            if (this.o != null && gVar != null) {
                wVar.f28823f.put(new com.fyber.inneractive.sdk.network.x().a(String.valueOf(z11), "waudio").a(this.o.f28637g, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL).a(this.o.f28635e, "bitrate").a(TextUtils.isEmpty(this.o.f28634d) ? "na" : this.o.f28634d, "mime").a(this.o.f28631a, "delivery").a(Integer.valueOf(this.f30589k), "media_file_index").a(this.f30579a.d(), "player").f28825a);
            }
            wVar.a((String) null);
        } catch (Exception unused) {
        }
    }

    public static boolean a(f fVar) {
        com.fyber.inneractive.sdk.response.e eVar;
        int iC = fVar.f30579a.c();
        com.fyber.inneractive.sdk.config.x0 x0Var = ((n) fVar).f30641t;
        t0 t0Var = fVar.f30580b;
        return a(iC, x0Var, (t0Var == null || (eVar = t0Var.f28438b) == null) ? -1 : ((com.fyber.inneractive.sdk.response.g) eVar).f31061v, fVar.n.a());
    }

    public static boolean a(int i5, com.fyber.inneractive.sdk.config.x0 x0Var, int i11, boolean z11) {
        UnitDisplayType unitDisplayType;
        if (x0Var != null && ((w0) x0Var).f27947e != null) {
            return false;
        }
        if (i11 == 1 || InneractiveAdManager.isCurrentUserAChild() || z11) {
            return true;
        }
        if (i5 <= 15999) {
            return false;
        }
        y0 y0Var = x0Var != null ? ((w0) x0Var).f27948f : null;
        return (y0Var == null || y0Var.f27961h == Skip.DEFAULT || (unitDisplayType = y0Var.f27963j) == UnitDisplayType.REWARDED || unitDisplayType == UnitDisplayType.NATIVE) ? false : true;
    }

    public final void a() {
        com.fyber.inneractive.sdk.measurement.f fVar = this.f30583e;
        if (fVar != null) {
            if (fVar.f28511a != null) {
                IAlog.a("%s destroy", "OMVideo");
                try {
                    fVar.f28511a.c();
                } catch (Throwable th2) {
                    fVar.a(th2);
                }
            }
            fVar.f28512b = null;
            fVar.f28511a = null;
            fVar.f28513c = null;
        }
    }

    public static boolean a(com.fyber.inneractive.sdk.config.global.r rVar, com.fyber.inneractive.sdk.ignite.m mVar) {
        mVar.getClass();
        if (mVar != com.fyber.inneractive.sdk.ignite.m.TRUE_SINGLE_TAP || !IAConfigManager.Q.F.n() || rVar == null || rVar.a(com.fyber.inneractive.sdk.config.global.features.o.class) == null) {
            return false;
        }
        Boolean boolC = ((com.fyber.inneractive.sdk.config.global.features.o) rVar.a(com.fyber.inneractive.sdk.config.global.features.o.class)).c("enable_app_info_button");
        return boolC != null ? boolC.booleanValue() : true;
    }
}
