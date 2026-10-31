package com.bytedance.sdk.openadsdk.htf.ycx;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.widget.ImageView;
import com.bytedance.sdk.component.lud.dy;
import com.bytedance.sdk.component.lud.ea;
import com.bytedance.sdk.component.lud.fby;
import com.bytedance.sdk.component.lud.jc;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.jc.dj;
import com.bytedance.sdk.openadsdk.utils.dc;
import java.util.Map;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: com.bytedance.sdk.openadsdk.htf.ycx.ycx$ycx, reason: collision with other inner class name */
    public interface InterfaceC0103ycx {
        void ycx(int i5, String str, Throwable th2);

        void ycx(String str, zb zbVar);
    }

    public void ycx(com.bytedance.sdk.openadsdk.htf.ycx ycxVar, final InterfaceC0103ycx interfaceC0103ycx, int i5, int i11, ImageView.ScaleType scaleType, String str, final int i12, tn tnVar) {
        jc jcVarYcx = dj.ycx(ycxVar.ycx).ycx(ycxVar.f26835zb).ycx(i5).zb(i11).lud(dc.lt(pmi.ycx())).dj(dc.dj(pmi.ycx())).zb(str).ycx(scaleType).ycx(!TextUtils.isEmpty(str));
        if (i12 > 0) {
            jcVarYcx.sya(2).ycx(new fby() { // from class: com.bytedance.sdk.openadsdk.htf.ycx.ycx.1
                @Override // com.bytedance.sdk.component.lud.fby
                public Bitmap ycx(Bitmap bitmap) {
                    return com.bytedance.sdk.component.adexpress.dj.ycx.ycx(pmi.ycx(), bitmap, i12);
                }
            });
        } else {
            jcVarYcx.sya(1);
        }
        jcVarYcx.ycx(new com.bytedance.sdk.openadsdk.jc.zb(tnVar, ycxVar.ycx, new dy() { // from class: com.bytedance.sdk.openadsdk.htf.ycx.ycx.2
            @Override // com.bytedance.sdk.component.lud.dy
            public void ycx(ea eaVar) {
                ycx.this.ycx(eaVar, interfaceC0103ycx);
            }

            @Override // com.bytedance.sdk.component.lud.dy
            public void ycx(int i13, String str2, Throwable th2) {
                ycx.this.ycx(i13, str2, th2, interfaceC0103ycx);
            }
        }));
    }

    public void ycx(ea eaVar, InterfaceC0103ycx interfaceC0103ycx) {
        if (interfaceC0103ycx != null) {
            Object objZb = eaVar.zb();
            int iYcx = ycx(eaVar);
            if (objZb instanceof Drawable) {
                interfaceC0103ycx.ycx(eaVar.ycx(), new zb((Drawable) objZb, iYcx));
                return;
            }
            if (objZb instanceof byte[]) {
                interfaceC0103ycx.ycx(eaVar.ycx(), new zb((byte[]) objZb, iYcx));
                return;
            }
            if (objZb instanceof Bitmap) {
                interfaceC0103ycx.ycx(eaVar.ycx(), new zb((Bitmap) objZb, eaVar.sya() instanceof Bitmap ? (Bitmap) eaVar.sya() : null, iYcx));
            } else {
                interfaceC0103ycx.ycx(0, "not bitmap or gif result!", null);
            }
        }
    }

    private int ycx(ea eaVar) {
        Object obj;
        Map<String, String> mapDj = eaVar.dj();
        if (mapDj == null || (obj = mapDj.get("image_size")) == null || !(obj instanceof Integer)) {
            return 0;
        }
        return ((Integer) obj).intValue();
    }

    public void ycx(int i5, String str, Throwable th2, InterfaceC0103ycx interfaceC0103ycx) {
        if (interfaceC0103ycx != null) {
            interfaceC0103ycx.ycx(i5, str, th2);
        }
    }
}
