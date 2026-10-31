package com.bytedance.sdk.component.lud.zb.sya;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.bytedance.sdk.component.lud.jc;
import com.bytedance.sdk.component.lud.pmi;
import com.bytedance.sdk.component.lud.ry;
import com.bytedance.sdk.component.lud.syc;
import com.bytedance.sdk.component.lud.zb.sya.sya;
import com.bytedance.sdk.component.utils.dy;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.util.Collection;
import java.util.Iterator;

/* loaded from: classes2.dex */
public class zb implements syc {
    private volatile lt ycx;

    private zb() {
    }

    public static syc ycx(Context context, ry ryVar) {
        zb zbVar = new zb();
        zbVar.zb(context, ryVar);
        return zbVar;
    }

    private void zb(Context context, ry ryVar) {
        if (this.ycx != null) {
            Log.w("ImageLoader", "already init!");
        }
        if (ryVar == null) {
            ryVar = lud.ycx(context);
        }
        this.ycx = new lt(context, ryVar);
    }

    @Override // com.bytedance.sdk.component.lud.syc
    public jc ycx(String str) {
        return new sya.zb(this.ycx).sya(str);
    }

    @Override // com.bytedance.sdk.component.lud.syc
    public InputStream ycx(String str, String str2) throws NoSuchAlgorithmException {
        byte[] bArrYcx;
        if (this.ycx != null) {
            if (TextUtils.isEmpty(str2)) {
                if (TextUtils.isEmpty(str)) {
                    return null;
                }
                str2 = dy.ycx(str);
            }
            pmi pmiVarSya = this.ycx.sya();
            if (pmiVarSya != null && (bArrYcx = pmiVarSya.ycx(str2)) != null) {
                return new ByteArrayInputStream(bArrYcx);
            }
            Collection<com.bytedance.sdk.component.lud.sya> collectionDj = this.ycx.dj();
            if (collectionDj != null) {
                Iterator<com.bytedance.sdk.component.lud.sya> it = collectionDj.iterator();
                while (it.hasNext()) {
                    InputStream inputStreamYcx = it.next().ycx(str2);
                    if (inputStreamYcx != null) {
                        return inputStreamYcx;
                    }
                }
            }
        }
        return null;
    }

    @Override // com.bytedance.sdk.component.lud.syc
    public boolean ycx(String str, String str2, String str3) throws NoSuchAlgorithmException {
        if (this.ycx == null || TextUtils.isEmpty(str3)) {
            return false;
        }
        if (TextUtils.isEmpty(str2)) {
            if (TextUtils.isEmpty(str)) {
                return false;
            }
            str2 = dy.ycx(str);
        }
        com.bytedance.sdk.component.lud.sya syaVarYcx = this.ycx.ycx(str3);
        if (syaVarYcx != null) {
            return syaVarYcx.zb(str2);
        }
        return false;
    }
}
