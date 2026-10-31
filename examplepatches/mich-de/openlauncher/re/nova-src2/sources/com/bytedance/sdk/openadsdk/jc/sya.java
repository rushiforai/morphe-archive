package com.bytedance.sdk.openadsdk.jc;

import a5.k;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.widget.ImageView;
import com.bytedance.sdk.component.lud.dy;
import com.bytedance.sdk.component.lud.ea;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.syc;
import com.bytedance.sdk.openadsdk.utils.yzp;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public class sya implements dy {
    private dy sya;
    private final WeakReference<ImageView> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final String f26855zb = "ImageLoaderToViewWrapper";

    private sya(ImageView imageView, dy dyVar) {
        this.ycx = new WeakReference<>(imageView);
        this.sya = dyVar;
    }

    public static dy ycx(tn tnVar, String str, ImageView imageView) {
        return new zb(tnVar, str, new sya(imageView));
    }

    public static dy ycx(tn tnVar, String str, ImageView imageView, dy dyVar) {
        return new zb(tnVar, str, new sya(imageView, dyVar));
    }

    private sya(ImageView imageView) {
        this.ycx = new WeakReference<>(imageView);
    }

    @Override // com.bytedance.sdk.component.lud.dy
    public void ycx(ea eaVar) {
        final ImageView imageView = this.ycx.get();
        if (imageView != null) {
            final Object objZb = eaVar.zb();
            if (objZb instanceof Bitmap) {
                if (yzp.lt()) {
                    imageView.setImageBitmap((Bitmap) objZb);
                } else {
                    syc.sya().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.jc.sya.1
                        @Override // java.lang.Runnable
                        public void run() {
                            imageView.setImageBitmap((Bitmap) objZb);
                        }
                    });
                }
                dy dyVar = this.sya;
                if (dyVar != null) {
                    dyVar.ycx(eaVar);
                    return;
                }
                return;
            }
            if (objZb instanceof Drawable) {
                if (yzp.lt()) {
                    ycx(objZb, imageView);
                } else {
                    syc.sya().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.jc.sya.2
                        @Override // java.lang.Runnable
                        public void run() {
                            sya.this.ycx(objZb, imageView);
                        }
                    });
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(Object obj, ImageView imageView) {
        if (Build.VERSION.SDK_INT >= 28 && k.v(obj)) {
            k.j(obj).start();
        }
        imageView.setImageDrawable((Drawable) obj);
    }

    @Override // com.bytedance.sdk.component.lud.dy
    public void ycx(int i5, String str, Throwable th2) {
        dy dyVar = this.sya;
        if (dyVar != null) {
            dyVar.ycx(i5, str, th2);
        }
    }
}
