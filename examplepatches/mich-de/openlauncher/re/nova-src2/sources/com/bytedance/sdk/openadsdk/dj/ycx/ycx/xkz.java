package com.bytedance.sdk.openadsdk.dj.ycx.ycx;

import com.bytedance.sdk.component.utils.pmi;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.yzp;
import fc.d;
import fc.f;
import fc.i;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class xkz extends i {
    @Override // fc.i
    public String dj() {
        return "track_urls";
    }

    @Override // fc.i
    public int fby() {
        return sya.ycx().sya().f26758lt;
    }

    @Override // fc.i
    public long jc() {
        return sya.ycx().sya().fby;
    }

    @Override // fc.i
    public int jw() {
        return sya.ycx().sya().f26759ul;
    }

    @Override // fc.i
    public boolean lt() {
        return zb.zb();
    }

    @Override // fc.i
    public long lud() {
        return sya.ycx().sya().sya;
    }

    @Override // fc.i
    public d ul() {
        return zb.ycx();
    }

    @Override // fc.i
    public int zb() {
        return sya.ycx().sya().f26760zb;
    }

    @Override // fc.i
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public ry ycx(String str, byte[] bArr, int i5, int i11) {
        try {
            ry ryVar = new ry(str, new JSONObject(new String(bArr, StandardCharsets.UTF_8)));
            ryVar.ycx(i5);
            ryVar.zb(i11);
            return ryVar;
        } catch (Throwable unused) {
            return null;
        }
    }

    @Override // fc.i
    public void ycx(ArrayList<ry> arrayList, final f fVar) {
        if (!pmi.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx())) {
            fVar.o(arrayList, false);
            return;
        }
        Iterator<ry> it = arrayList.iterator();
        while (it.hasNext()) {
            final ry next = it.next();
            if (!com.bytedance.sdk.component.ul.sya.lt.ycx(next.jc())) {
                ArrayList arrayList2 = new ArrayList();
                arrayList2.add(next);
                fVar.o(arrayList2, true);
            } else if (next.lud() >= ycx(next.ea())) {
                ArrayList arrayList3 = new ArrayList();
                arrayList3.add(next);
                fVar.o(arrayList3, true);
            } else {
                yzp.ycx().submit(new Runnable() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.xkz.1
                    @Override // java.lang.Runnable
                    public void run() {
                        xkz.this.ycx(next, fVar);
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(ry ryVar, f fVar) {
        String strYcx = com.bytedance.sdk.openadsdk.oty.ycx.ycx(ryVar.jc(), ryVar.jw());
        com.bytedance.sdk.openadsdk.dj.ycx.sya syaVar = new com.bytedance.sdk.openadsdk.dj.ycx.sya();
        syaVar.ycx("User-Agent", oby.dj());
        syaVar.ycx("csj_client_source_from", "1");
        syaVar.ycx(strYcx);
        com.bytedance.sdk.component.lt.ycx.lud.dj djVarYcx = syaVar.ycx();
        com.bytedance.sdk.component.lt.ycx.lt.dj djVar = new com.bytedance.sdk.component.lt.ycx.lt.dj(ryVar.lt(), strYcx, ryVar.jw(), ryVar.fby(), ryVar.ea());
        djVar.zb(true);
        ArrayList arrayList = new ArrayList();
        arrayList.add(ryVar);
        if (djVarYcx != null && djVarYcx.ycx()) {
            fVar.o(arrayList, true);
            com.bytedance.sdk.openadsdk.dy.dj.ycx("track_link_result", false, new com.bytedance.sdk.openadsdk.dj.ycx.jw(true, djVar));
            return;
        }
        if (djVarYcx != null) {
            djVar.zb(djVarYcx.zb());
            djVar.sya(djVarYcx.sya());
        }
        if (ryVar.lud() >= ycx(ryVar.ea())) {
            fVar.o(arrayList, true);
            com.bytedance.sdk.openadsdk.dy.dj.ycx("track_link_result", false, new com.bytedance.sdk.openadsdk.dj.ycx.jw(false, djVar));
        } else {
            fVar.o(arrayList, false);
        }
    }

    @Override // fc.i
    public long ycx() {
        return sya.ycx().sya().ycx;
    }

    public int ycx(String str) {
        com.bytedance.sdk.openadsdk.dj.ycx.jc jcVarDfk = com.bytedance.sdk.openadsdk.core.settings.ea.zb().dfk();
        if (jcVarDfk == null) {
            return 3;
        }
        return jcVarDfk.ycx(str);
    }
}
