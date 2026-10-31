package com.fyber.inneractive.sdk.flow.nativead.trackers;

import android.os.Handler;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.flow.w0;
import com.fyber.inneractive.sdk.network.z0;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.v;
import com.fyber.inneractive.sdk.web.m;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public w0 f28250a;

    /* renamed from: b, reason: collision with root package name */
    public b f28251b;

    public a(w0 w0Var) {
        this.f28250a = w0Var;
    }

    public final void a(c cVar) {
        Iterator it = this.f28250a.f28435w.iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            if (!TextUtils.isEmpty(str)) {
                IAlog.a("%sHitting URL: %s", IAlog.a(this), str);
                z0.b(str);
            }
        }
        b bVar = new b(this.f28250a.f28436x, cVar);
        this.f28251b = bVar;
        if (bVar.f28256d == null || bVar.f28255c == null) {
            IAlog.b("%sWas destroyed, create a new instance", b.f28252e);
        } else {
            bVar.a();
        }
    }

    public final void a() {
        b bVar = this.f28251b;
        if (bVar != null) {
            IAlog.a("%sDestroy called", b.f28252e);
            Handler handler = bVar.f28256d;
            if (handler != null) {
                handler.removeCallbacksAndMessages(null);
                bVar.f28256d = null;
            }
            m mVar = bVar.f28255c;
            if (mVar != null) {
                v.a(mVar);
                mVar.destroy();
                bVar.f28255c = null;
            }
            bVar.f28254b = null;
            this.f28251b = null;
        }
        this.f28250a = null;
    }
}
