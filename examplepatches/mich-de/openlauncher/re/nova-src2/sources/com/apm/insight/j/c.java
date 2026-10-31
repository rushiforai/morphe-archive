package com.apm.insight.j;

import android.os.Handler;
import android.text.TextUtils;
import com.apm.insight.e;

/* loaded from: classes.dex */
public final class c extends a {
    public c(Handler handler) {
        super(handler, 15000L);
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (e.c().b()) {
            return;
        }
        String strD = e.a().d();
        if (TextUtils.isEmpty(strD) || "0".equals(strD)) {
            a(b());
            com.apm.insight.a.a((Object) "[DeviceIdTask] did is null, continue check.");
        } else {
            e.c().a(strD);
            com.apm.insight.a.a((Object) "[DeviceIdTask] did is ".concat(String.valueOf(strD)));
        }
    }
}
