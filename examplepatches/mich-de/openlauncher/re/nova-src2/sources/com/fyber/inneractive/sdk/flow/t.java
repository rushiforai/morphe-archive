package com.fyber.inneractive.sdk.flow;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.util.IAlog;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class t implements com.fyber.inneractive.sdk.network.f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ u f28388a;

    public t(u uVar) {
        this.f28388a = uVar;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) {
        String str = (String) obj;
        IAlog.a("IAVideoContentLoader : Remote ui template callback onNetworkResult from cache: %s", Boolean.valueOf(z11));
        if (exc instanceof com.fyber.inneractive.sdk.network.g) {
            return;
        }
        u uVar = this.f28388a;
        uVar.getClass();
        if (TextUtils.isEmpty(str) && z11) {
            uVar.a(exc, "Fetched cached template is ".concat(str == null ? AbstractJsonLexerKt.NULL : "empty"), true);
            return;
        }
        com.fyber.inneractive.sdk.player.ui.remote.g gVarI = uVar.i();
        if (gVarI == null) {
            uVar.a(null, "Flow Manager is null", z11);
            return;
        }
        if (TextUtils.isEmpty(str)) {
            boolean z12 = gVarI.f30730a.f30710i;
            StringBuilder sb2 = new StringBuilder("Unknown error while receiving template: templateContent is: ");
            sb2.append(TextUtils.isEmpty(str) ? "null or empty" : "not null and not empty");
            sb2.append(" isFromCache: ");
            sb2.append(z12);
            uVar.a(exc, sb2.toString(), z12);
            return;
        }
        com.fyber.inneractive.sdk.player.ui.remote.d dVar = gVarI.f30730a;
        dVar.f30710i = z11;
        IAlog.a("%s : schedule UI load timeout task with delay: %d", "RemoteUIWebviewController", 10000);
        com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(dVar.f30712k, 10000);
        try {
            dVar.f30703b.loadData(str, "text/html", "UTF-8");
        } catch (Throwable th2) {
            IAlog.a("%s : cancel UI load timeout task", "RemoteUIWebviewController");
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(dVar.f30712k);
            dVar.a(com.fyber.inneractive.sdk.network.events.b.WEB_VIEW_CRASH_ERROR, fq.c.f(th2, new StringBuilder("Unable load data: ")), true, null);
        }
    }
}
