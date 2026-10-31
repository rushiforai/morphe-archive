package com.bytedance.sdk.openadsdk.utils;

import a5.k;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.widget.ImageView;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public class av implements com.bytedance.sdk.component.lud.dy {
    private final WeakReference<ImageView> ycx;

    public av(ImageView imageView) {
        this.ycx = new WeakReference<>(imageView);
    }

    @Override // com.bytedance.sdk.component.lud.dy
    public void ycx(com.bytedance.sdk.component.lud.ea eaVar) {
        ImageView imageView = this.ycx.get();
        if (imageView == null) {
            return;
        }
        try {
            Object objZb = eaVar.zb();
            if (objZb instanceof Bitmap) {
                imageView.setImageBitmap((Bitmap) objZb);
                return;
            }
            if (!(objZb instanceof Drawable)) {
                imageView.setVisibility(8);
                return;
            }
            if (Build.VERSION.SDK_INT >= 28 && k.u((Drawable) objZb)) {
                k.i((Drawable) objZb).start();
            }
            imageView.setImageDrawable((Drawable) objZb);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "aO8rkCqxaMCFZthciDKhJFfsLJYI", "VOAegAC/bNST", 45);
            imageView.setVisibility(8);
        }
    }

    @Override // com.bytedance.sdk.component.lud.dy
    public void ycx(int i5, String str, Throwable th2) {
        ImageView imageView = this.ycx.get();
        if (imageView == null) {
            return;
        }
        imageView.setVisibility(8);
    }
}
