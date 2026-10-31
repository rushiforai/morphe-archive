package com.bytedance.sdk.openadsdk.utils;

import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;
import com.bytedance.sdk.openadsdk.htf.ycx.ycx;
import java.util.Objects;

/* loaded from: classes2.dex */
public class pmi {

    public interface ycx {
        void ycx();

        void ycx(com.bytedance.sdk.openadsdk.htf.ycx.zb zbVar);
    }

    public static void ycx(com.bytedance.sdk.openadsdk.htf.ycx ycxVar, int i5, int i11, ycx ycxVar2, String str) {
        ycx(ycxVar, i5, i11, ycxVar2, str, 0);
    }

    public static void ycx(com.bytedance.sdk.openadsdk.htf.ycx ycxVar, int i5, int i11, final ycx ycxVar2, String str, int i12) {
        Objects.toString(ycxVar);
        com.bytedance.sdk.openadsdk.htf.zb.zb().dj().ycx(ycxVar, new ycx.InterfaceC0103ycx() { // from class: com.bytedance.sdk.openadsdk.utils.pmi.1
            @Override // com.bytedance.sdk.openadsdk.htf.ycx.ycx.InterfaceC0103ycx
            public void ycx(String str2, com.bytedance.sdk.openadsdk.htf.ycx.zb zbVar) {
                ycx ycxVar3;
                if (zbVar.lud() && (ycxVar3 = ycxVar2) != null) {
                    ycxVar3.ycx(zbVar);
                    return;
                }
                ycx ycxVar4 = ycxVar2;
                if (ycxVar4 != null) {
                    ycxVar4.ycx();
                }
            }

            @Override // com.bytedance.sdk.openadsdk.htf.ycx.ycx.InterfaceC0103ycx
            public void ycx(int i13, String str2, Throwable th2) {
                ycx ycxVar3 = ycxVar2;
                if (ycxVar3 != null) {
                    ycxVar3.ycx();
                }
            }
        }, i5, i11, ImageView.ScaleType.CENTER_INSIDE, str, i12, null);
    }

    public static Drawable ycx(byte[] bArr, int i5) {
        if (bArr != null && bArr.length > 0) {
            try {
                return new BitmapDrawable(BitmapFactory.decodeByteArray(bArr, 0, bArr.length));
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "cuMskgaecNOFWf9YgAGlOg==", "Wfc5kBCIZuOSS8Bcjh2l", 81);
                return new ColorDrawable(0);
            }
        }
        return new ColorDrawable(0);
    }
}
