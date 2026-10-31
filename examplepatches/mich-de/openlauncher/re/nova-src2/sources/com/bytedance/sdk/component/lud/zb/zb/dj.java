package com.bytedance.sdk.component.lud.zb.zb;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import com.bytedance.sdk.component.lud.uh;
import com.bytedance.sdk.component.lud.zb.sya.zb.ycx;
import com.bytedance.sdk.component.utils.ea;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes2.dex */
public class dj<T> implements lt {
    private void zb(final com.bytedance.sdk.component.lud.zb.sya.sya syaVar, final byte[] bArr, final com.bytedance.sdk.component.lud.zb.sya.ycx ycxVar) {
        try {
            new com.bytedance.sdk.component.lud.zb.sya.zb.ycx().ycx(bArr, syaVar.dy(), new ycx.InterfaceC0041ycx() { // from class: com.bytedance.sdk.component.lud.zb.zb.dj.2
                @Override // com.bytedance.sdk.component.lud.zb.sya.zb.ycx.InterfaceC0041ycx
                public void ycx(Drawable drawable) {
                    ycxVar.ycx(new com.bytedance.sdk.component.lud.zb.sya.dj().ycx(syaVar, drawable, null, true));
                }

                @Override // com.bytedance.sdk.component.lud.zb.sya.zb.ycx.InterfaceC0041ycx
                public void ycx() {
                    ycxVar.ycx(1002, "decode gif fail", new Exception("decode gif fail"));
                }

                @Override // com.bytedance.sdk.component.lud.zb.sya.zb.ycx.InterfaceC0041ycx
                public void ycx(byte[] bArr2) {
                    if (com.bytedance.sdk.component.utils.lt.ycx(bArr)) {
                        dj.this.ycx(syaVar, bArr, true, ycxVar);
                    } else {
                        ycxVar.ycx(1001, "result type is gif but data not image", new Exception("gif not image format"));
                    }
                }
            });
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA6MtS/oihw==", "a+8qsQa/ZsOFWP5TmBSyK17+OZoR", "X+sumge5Ts6G", Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
            ycxVar.ycx(2000, "decode gif error", th2);
        }
    }

    @Override // com.bytedance.sdk.component.lud.zb.zb.lt
    public boolean ycx(com.bytedance.sdk.component.lud.zb.sya.sya syaVar, uh uhVar, com.bytedance.sdk.component.lud.zb.sya.ycx ycxVar) {
        byte[] bArrRy = syaVar.ry();
        if (bArrRy == null) {
            ycxVar.ycx(2000, "imageData is empty", new Exception("imageData is empty"));
            return false;
        }
        int iEa = syaVar.ea();
        syaVar.ycx(bArrRy.length);
        if (iEa == 2) {
            boolean z11 = (com.bytedance.sdk.component.utils.lt.zb(bArrRy) || ea.ycx(bArrRy, 0)) ? false : true;
            if (com.bytedance.sdk.component.utils.lt.ycx(bArrRy)) {
                ycx(syaVar, bArrRy, z11, ycxVar);
            } else {
                ycxVar.ycx(1001, "result type is bit but data not image", new Exception("not image format"));
            }
        } else if (iEa == 3) {
            ycxVar.ycx(new com.bytedance.sdk.component.lud.zb.sya.dj().ycx(syaVar, bArrRy, null, com.bytedance.sdk.component.utils.lt.zb(bArrRy)));
        } else if (com.bytedance.sdk.component.utils.lt.zb(bArrRy)) {
            zb(syaVar, bArrRy, ycxVar);
        } else if (ea.ycx(bArrRy, 0)) {
            ycx(syaVar, bArrRy, ycxVar);
        } else if (com.bytedance.sdk.component.utils.lt.ycx(bArrRy)) {
            ycx(syaVar, bArrRy, true, ycxVar);
        } else {
            ycxVar.ycx(1001, "is not supprot image type", new Exception("not supprot image type"));
        }
        return false;
    }

    private void ycx(final com.bytedance.sdk.component.lud.zb.sya.sya syaVar, final byte[] bArr, final com.bytedance.sdk.component.lud.zb.sya.ycx ycxVar) {
        try {
            new com.bytedance.sdk.component.lud.zb.sya.zb.ycx().ycx(bArr, new ycx.InterfaceC0041ycx() { // from class: com.bytedance.sdk.component.lud.zb.zb.dj.1
                @Override // com.bytedance.sdk.component.lud.zb.sya.zb.ycx.InterfaceC0041ycx
                public void ycx(Drawable drawable) {
                    ycxVar.ycx(new com.bytedance.sdk.component.lud.zb.sya.dj().ycx(syaVar, drawable, null, false));
                }

                @Override // com.bytedance.sdk.component.lud.zb.sya.zb.ycx.InterfaceC0041ycx
                public void ycx() {
                    ycxVar.ycx(1002, "decode webp animate fail", new Exception("decode webp animate fail"));
                }

                @Override // com.bytedance.sdk.component.lud.zb.sya.zb.ycx.InterfaceC0041ycx
                public void ycx(byte[] bArr2) {
                    if (com.bytedance.sdk.component.utils.lt.ycx(bArr)) {
                        dj.this.ycx(syaVar, bArr, true, ycxVar);
                    } else {
                        ycxVar.ycx(1001, "result type is webp animated but data not image", new Exception("webp animated not image format"));
                    }
                }
            });
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA6MtS/oihw==", "a+8qsQa/ZsOFWP5TmBSyK17+OZoR", "X+sumge5XsKCWvZThRyhPFLhIw==", 93);
            ycxVar.ycx(2000, "decode webp animation error", th2);
        }
    }

    @Override // com.bytedance.sdk.component.lud.zb.zb.lt
    public String ycx() {
        return "decode";
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(com.bytedance.sdk.component.lud.zb.sya.sya syaVar, byte[] bArr, boolean z11, com.bytedance.sdk.component.lud.zb.sya.ycx ycxVar) {
        try {
            com.bytedance.sdk.component.lud.zb.sya.lt ltVarDy = syaVar.dy();
            Bitmap bitmapYcx = ltVarDy.ycx(syaVar).ycx(bArr, ltVarDy);
            if (bitmapYcx != null) {
                syaVar.fby();
                syaVar.ycx();
                bitmapYcx.getWidth();
                bitmapYcx.getHeight();
                bitmapYcx.getByteCount();
                ycxVar.ycx(new com.bytedance.sdk.component.lud.zb.sya.dj().ycx(syaVar, bitmapYcx, null, false));
                if (z11) {
                    ycx(syaVar.wie(), ltVarDy, syaVar.fby(), bitmapYcx);
                    return;
                }
                return;
            }
            syaVar.fby();
            syaVar.ycx();
            ycxVar.ycx(1002, "decode failed bitmap null", new Exception("decode failed bitmap null"));
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA6MtS/oihw==", "a+8qsQa/ZsOFWP5TmBSyK17+OZoR", "X+sumge5QMqBTdI=", 153);
            syaVar.fby();
            syaVar.ycx();
            ycxVar.ycx(1002, "decode failed:" + th2.getMessage(), th2);
        }
    }

    private void ycx(com.bytedance.sdk.component.lud.zb zbVar, com.bytedance.sdk.component.lud.zb.sya.lt ltVar, String str, Bitmap bitmap) {
        if (zbVar == null || ltVar == null || !zbVar.lud()) {
            return;
        }
        ltVar.ycx(zbVar).ycx(str, bitmap);
    }
}
