package com.bytedance.sdk.openadsdk.dj.ycx.ycx;

import android.content.Context;
import com.bytedance.sdk.component.utils.pmi;
import com.bytedance.sdk.openadsdk.utils.yzp;
import dy.d;
import fc.a;
import fc.b;
import fc.c;
import fc.e;
import fc.h;
import java.util.concurrent.ExecutorService;
import p7.u;

/* loaded from: classes2.dex */
public class ul {
    private static volatile a ycx;

    public static void ycx(final Context context) {
        c cVar = new c("ads") { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.ul.1
            @Override // fc.c
            public boolean ycx() {
                return pmi.ycx(context);
            }
        };
        cVar.ycx(jw.class, new ycx());
        cVar.ycx(ea.class, new ok());
        cVar.ycx(ry.class, new xkz());
        cVar.ycx(sya.zb().f26754zb);
        cVar.sya(sya.zb().f26751dj);
        final com.bytedance.sdk.component.fby.zb.ul ulVarOk = yzp.ok();
        if (ulVarOk != null) {
            cVar.ycx(Math.max(2, ulVarOk.ycx() / 2));
        }
        cVar.ycx(sya.zb().lud);
        cVar.dj(sya.zb().f26753lt);
        cVar.ycx(new b() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.ul.2
            @Override // fc.b
            public ExecutorService ycx() {
                return yzp.ea();
            }
        });
        cVar.ycx(new e() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.ul.3
            @Override // fc.e
            public byte[] ycx(byte[] bArr) {
                return com.bytedance.sdk.component.dj.zb.zb(bArr, lud.ycx());
            }

            @Override // fc.e
            public byte[] zb(byte[] bArr) {
                return com.bytedance.sdk.component.dj.zb.ycx(bArr, lud.ycx());
            }
        });
        if (context != null) {
            Context applicationContext = context.getApplicationContext();
            if (applicationContext != null) {
                u.f82383a = applicationContext;
            } else {
                u.f82383a = context;
            }
        }
        ycx = new gc.e(context, cVar);
    }

    public static void ycx(com.bytedance.sdk.openadsdk.dj.ycx ycxVar) {
        ycx(new jw(ycxVar));
    }

    public static void ycx(h hVar) {
        gc.b bVar;
        if (ycx == null || hVar == null) {
            return;
        }
        gc.e eVar = (gc.e) ycx;
        eVar.getClass();
        if (vh.a.f92766b && (bVar = (gc.b) eVar.f57348c.get(hVar.getClass())) != null) {
            if (!eVar.f57352g) {
                hVar.toString();
                eVar.g(hVar);
                return;
            }
            if (eVar.f57347b.jw()) {
                eVar.g(hVar);
            } else {
                eVar.f57351f.sendMessage(eVar.f57351f.obtainMessage(1000, hVar));
            }
            d dVar = bVar.f57337j;
            if (dVar != null) {
                dVar.f(1, 1);
            }
        }
    }

    public static boolean ycx() {
        return ycx != null;
    }
}
