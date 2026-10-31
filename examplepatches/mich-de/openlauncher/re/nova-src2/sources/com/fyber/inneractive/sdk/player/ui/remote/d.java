package com.fyber.inneractive.sdk.player.ui.remote;

import android.content.Context;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.fyber.inneractive.sdk.flow.t0;
import com.fyber.inneractive.sdk.network.t;
import com.fyber.inneractive.sdk.player.ui.n;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.g1;
import com.fyber.inneractive.sdk.util.r;
import com.fyber.inneractive.sdk.util.v;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class d implements com.fyber.inneractive.sdk.web.remoteui.a, a {

    /* renamed from: a, reason: collision with root package name */
    public com.fyber.inneractive.sdk.web.remoteui.a f30702a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.web.remoteui.b f30703b;

    /* renamed from: c, reason: collision with root package name */
    public final t0 f30704c;

    /* renamed from: d, reason: collision with root package name */
    public final e f30705d;

    /* renamed from: e, reason: collision with root package name */
    public n f30706e;

    /* renamed from: f, reason: collision with root package name */
    public final String f30707f;

    /* renamed from: i, reason: collision with root package name */
    public boolean f30710i;

    /* renamed from: j, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.g f30711j;

    /* renamed from: g, reason: collision with root package name */
    public boolean f30708g = false;

    /* renamed from: h, reason: collision with root package name */
    public boolean f30709h = false;

    /* renamed from: k, reason: collision with root package name */
    public final b f30712k = new b(this);

    /* renamed from: l, reason: collision with root package name */
    public final c f30713l = new c(this);

    /* renamed from: m, reason: collision with root package name */
    public boolean f30714m = false;
    public boolean n = false;

    public d(Context context, t0 t0Var, String str) {
        this.f30704c = t0Var;
        this.f30707f = str;
        com.fyber.inneractive.sdk.web.remoteui.b bVar = new com.fyber.inneractive.sdk.web.remoteui.b();
        this.f30703b = bVar;
        this.f30705d = new e(this);
        bVar.setCommandHandler(this);
        bVar.setResultFailureListener(this);
        bVar.setCommandHandler(this);
        this.f30711j = new com.fyber.inneractive.sdk.flow.g(context, true, t0Var != null ? t0Var.f28437a : null, b(), null);
    }

    @Override // com.fyber.inneractive.sdk.web.remoteui.a
    public final void a(com.fyber.inneractive.sdk.network.events.b bVar, String str, boolean z11, HashMap map) {
        HashMap map2;
        IAlog.a("%s : cancel UI load timeout task", "RemoteUIWebviewController");
        r.f31216b.removeCallbacks(this.f30712k);
        String str2 = (map == null || !map.containsKey("failedURL")) ? this.f30707f : (String) map.get("failedURL");
        if (z11) {
            if (b() != null) {
                b().I = false;
            }
            a();
            t tVar = t.VAST_ERROR_DVC_FAILURE;
            t0 t0Var = this.f30704c;
            com.fyber.inneractive.sdk.network.events.a.a(tVar, bVar, t0Var != null ? t0Var.f28437a : null, b(), str, str2, Boolean.valueOf(this.f30710i));
            map2 = map;
        } else {
            t tVar2 = t.VAST_ERROR_DVC_FAILURE;
            String strName = bVar.name();
            t0 t0Var2 = this.f30704c;
            map2 = map;
            com.fyber.inneractive.sdk.network.events.a.a(tVar2, strName, str2, t0Var2 != null ? t0Var2.f28437a : null, b(), map2, Boolean.valueOf(this.f30710i));
        }
        com.fyber.inneractive.sdk.web.remoteui.a aVar = this.f30702a;
        if (aVar != null) {
            aVar.a(bVar, str, z11, map2);
        }
    }

    public final com.fyber.inneractive.sdk.response.e b() {
        t0 t0Var = this.f30704c;
        if (t0Var != null) {
            return t0Var.f28438b;
        }
        return null;
    }

    public final void a() {
        this.f30709h = true;
        this.f30706e = null;
        e eVar = this.f30705d;
        eVar.f30716b.clear();
        eVar.f30715a = null;
        IAlog.a("%s : cancel UI load timeout task", "RemoteUIWebviewController");
        r.f31216b.removeCallbacks(this.f30712k);
        this.f30703b.setVisibility(8);
        this.f30703b.setUiReady(false);
        v.a(this.f30703b);
        this.f30703b.destroy();
        this.f30711j = null;
    }

    @Override // com.fyber.inneractive.sdk.player.ui.remote.a
    public final void a(String str, HashMap map) throws JSONException {
        g1 lastClickedLocation;
        e eVar;
        d dVar;
        com.fyber.inneractive.sdk.flow.g gVar;
        lastClickedLocation = this.f30703b.getLastClickedLocation();
        eVar = this.f30705d;
        eVar.getClass();
        str.getClass();
        switch (str) {
            case "clickSkip":
                eVar.a(6, lastClickedLocation);
                break;
            case "expandCollapseClick":
                eVar.a(5, lastClickedLocation);
                break;
            case "appInfoClick":
                eVar.a(10, lastClickedLocation);
                break;
            case "shouldSkipUpdateUi.true":
                d dVar2 = eVar.f30715a;
                if (dVar2 != null) {
                    dVar2.f30714m = true;
                    break;
                }
                break;
            case "onGeneralError":
                d dVar3 = eVar.f30715a;
                if (dVar3 != null) {
                    dVar3.a(com.fyber.inneractive.sdk.network.events.b.TEMPLATE_GENERAL_ERROR, (String) map.get("error"), InneractiveMediationDefs.SHOW_HOUSE_AD_YES.equalsIgnoreCase((String) map.get("shouldFailUi")), map);
                    break;
                }
                break;
            case "ctaClick":
                eVar.a(3, lastClickedLocation);
                break;
            case "isSkipEnabled.false":
                d dVar4 = eVar.f30715a;
                if (dVar4 != null) {
                    dVar4.n = false;
                    break;
                }
                break;
            case "clickMuteUnmute":
                eVar.a(1, lastClickedLocation);
                break;
            case "DOMLoaded":
                String str2 = eVar.f30717c ? "FyberRemoteUiBridge.setMute()" : "FyberRemoteUiBridge.setUnmute()";
                d dVar5 = eVar.f30715a;
                if (dVar5 != null) {
                    dVar5.f30703b.a(str2);
                }
                Iterator it = eVar.f30716b.keySet().iterator();
                while (it.hasNext()) {
                    String str3 = (String) eVar.f30716b.get((String) it.next());
                    if (!TextUtils.isEmpty(str3) && (dVar = eVar.f30715a) != null) {
                        dVar.f30703b.a(str3);
                    }
                }
                eVar.f30716b.clear();
                d dVar6 = eVar.f30715a;
                if (dVar6 != null) {
                    IAlog.a("%s : remote UI loaded successfully", "RemoteUIWebviewController");
                    IAlog.a("%s : cancel UI load timeout task", "RemoteUIWebviewController");
                    r.f31216b.removeCallbacks(dVar6.f30712k);
                    dVar6.f30708g = false;
                    dVar6.f30703b.setUiReady(true);
                    if (dVar6.b() != null) {
                        dVar6.b().I = true;
                    }
                    dVar6.f30703b.setVisibility(0);
                    break;
                }
                break;
            case "adIdentifierClick":
                d dVar7 = eVar.f30715a;
                if (dVar7 != null && (gVar = dVar7.f30711j) != null) {
                    gVar.a();
                    break;
                }
                break;
            case "shouldSkipUpdateUi.false":
                d dVar8 = eVar.f30715a;
                if (dVar8 != null) {
                    dVar8.f30714m = false;
                    break;
                }
                break;
            case "isSkipEnabled.true":
                d dVar9 = eVar.f30715a;
                if (dVar9 != null) {
                    dVar9.n = true;
                    break;
                }
                break;
            case "onVideoClick":
                eVar.a(7, lastClickedLocation);
                break;
            case "onResourceError":
                d dVar10 = eVar.f30715a;
                if (dVar10 != null) {
                    dVar10.a(com.fyber.inneractive.sdk.network.events.b.TEMPLATE_RESOURCE_ERROR, (String) map.get("error"), true, map);
                    break;
                }
                break;
            default:
                IAlog.a("%s: unknown command: %s", "RemoteUiCommandHandler", str);
                break;
        }
        d dVar11 = eVar.f30715a;
        if (dVar11 != null) {
            dVar11.f30703b.a("FyberRemoteUiBridge.nativeCallComplete()");
        }
    }
}
