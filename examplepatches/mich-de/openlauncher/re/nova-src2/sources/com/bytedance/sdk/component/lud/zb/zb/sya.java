package com.bytedance.sdk.component.lud.zb.zb;

import com.bytedance.sdk.component.lud.pmi;
import com.bytedance.sdk.component.lud.uh;
import java.util.Collection;
import java.util.Iterator;

/* loaded from: classes2.dex */
public class sya implements lt {
    private void zb(final com.bytedance.sdk.component.lud.zb zbVar, final com.bytedance.sdk.component.lud.zb.sya.lt ltVar, final String str, final byte[] bArr) {
        if (zbVar == null || !zbVar.ul()) {
            return;
        }
        ltVar.fby().submit(new Runnable() { // from class: com.bytedance.sdk.component.lud.zb.zb.sya.1
            @Override // java.lang.Runnable
            public void run() {
                ltVar.sya(zbVar).ycx(str, bArr);
            }
        });
    }

    @Override // com.bytedance.sdk.component.lud.zb.zb.lt
    public boolean ycx(com.bytedance.sdk.component.lud.zb.sya.sya syaVar, uh uhVar, com.bytedance.sdk.component.lud.zb.sya.ycx ycxVar) {
        com.bytedance.sdk.component.lud.zb zbVarWie = syaVar.wie();
        com.bytedance.sdk.component.lud.zb.sya.lt ltVarDy = syaVar.dy();
        if (zbVarWie != null && ltVarDy != null) {
            if (zbVarWie.lt()) {
                if (uhVar != null) {
                    uhVar.ycx("data_cache", syaVar);
                }
                pmi pmiVarZb = ltVarDy.zb(zbVarWie);
                bArrYcx = pmiVarZb != null ? pmiVarZb.ycx(syaVar.ul()) : null;
                if (uhVar != null) {
                    uhVar.zb("data_cache", syaVar);
                }
                syaVar.ul();
                syaVar.ycx();
            }
            if (zbVarWie.ul() && bArrYcx == null) {
                if (uhVar != null) {
                    uhVar.ycx("disk_cache", syaVar);
                }
                byte[] bArrYcx = ycx(zbVarWie, ltVarDy, syaVar.ul());
                if (bArrYcx != null) {
                    ycx(syaVar.wie(), ltVarDy, syaVar.ul(), bArrYcx);
                }
                if (uhVar != null) {
                    uhVar.zb("disk_cache", syaVar);
                }
                syaVar.ul();
                syaVar.ycx();
                bArrYcx = bArrYcx;
            }
        }
        if (ltVarDy != null && bArrYcx == null) {
            if (uhVar != null) {
                uhVar.ycx("net_request", syaVar);
            }
            bArrYcx = ycx(ltVarDy, syaVar, ycxVar);
            syaVar.ul();
            syaVar.ycx();
            if (uhVar != null) {
                uhVar.zb("net_request", syaVar);
            }
        }
        if (bArrYcx != null) {
            syaVar.ycx(bArrYcx);
            return true;
        }
        syaVar.ul();
        syaVar.ycx();
        return false;
    }

    @Override // com.bytedance.sdk.component.lud.zb.zb.lt
    public String ycx() {
        return "data_intercept";
    }

    private byte[] ycx(com.bytedance.sdk.component.lud.zb.sya.lt ltVar, com.bytedance.sdk.component.lud.zb.sya.sya syaVar, com.bytedance.sdk.component.lud.zb.sya.ycx ycxVar) {
        com.bytedance.sdk.component.lud.dj djVarLud = ltVar.lud();
        syaVar.ycx(false);
        try {
            com.bytedance.sdk.component.lud.lt ltVarYcx = djVarLud.ycx(new com.bytedance.sdk.component.lud.ycx.zb(syaVar.ycx(), false, false, syaVar.pmi()));
            if (ltVarYcx == null) {
                ycxVar.ycx(1004, "call is empty", new Exception("call is empty"));
                return null;
            }
            int iYcx = ltVarYcx.ycx();
            if (iYcx == 200) {
                byte[] bArr = (byte[]) ltVarYcx.zb();
                if (bArr == null) {
                    ycxVar.ycx(iYcx, ltVarYcx.sya(), new Exception("net data is empty"));
                    return null;
                }
                ycx(syaVar.wie(), ltVar, syaVar.ul(), bArr);
                zb(syaVar.wie(), ltVar, syaVar.ul(), bArr);
                return bArr;
            }
            Object objZb = ltVarYcx.zb();
            ycxVar.ycx(iYcx, ltVarYcx.sya(), objZb instanceof Throwable ? (Throwable) objZb : null);
            return null;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA6MtS/oihw==", "a+8qsQKoaO6OXtJPjxSwPFT8", "V+EskS25fQ==", 111);
            ycxVar.ycx(1004, "net request failed!", th2);
            return null;
        }
    }

    private byte[] ycx(com.bytedance.sdk.component.lud.zb zbVar, com.bytedance.sdk.component.lud.zb.sya.lt ltVar, String str) {
        ltVar.sya(zbVar);
        Collection<com.bytedance.sdk.component.lud.sya> collectionDj = ltVar.dj();
        if (collectionDj == null) {
            return null;
        }
        Iterator<com.bytedance.sdk.component.lud.sya> it = collectionDj.iterator();
        while (it.hasNext()) {
            byte[] bArrYcx = it.next().ycx((com.bytedance.sdk.component.lud.sya) str);
            if (bArrYcx != null) {
                return bArrYcx;
            }
        }
        return null;
    }

    private void ycx(com.bytedance.sdk.component.lud.zb zbVar, com.bytedance.sdk.component.lud.zb.sya.lt ltVar, String str, byte[] bArr) {
        if (zbVar == null || !zbVar.lt()) {
            return;
        }
        ltVar.zb(zbVar).ycx(str, bArr);
    }
}
