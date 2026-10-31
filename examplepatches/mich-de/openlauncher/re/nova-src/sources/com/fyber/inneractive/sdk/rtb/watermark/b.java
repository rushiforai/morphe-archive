package com.fyber.inneractive.sdk.rtb.watermark;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.util.Base64;
import android.widget.ImageView;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public ImageView f31092a;

    public b(Context context, String str) {
        Bitmap bitmapDecodeByteArray;
        ImageView imageView = null;
        try {
            byte[] bArrDecode = Base64.decode(str, 0);
            bitmapDecodeByteArray = BitmapFactory.decodeByteArray(bArrDecode, 0, bArrDecode.length);
        } catch (Throwable th2) {
            th = th2;
            bitmapDecodeByteArray = null;
        }
        try {
            if (bitmapDecodeByteArray == null) {
                IAlog.a("Failed to decode watermark: Invalid image data", new Object[0]);
            } else {
                ImageView imageView2 = new ImageView(context);
                BitmapDrawable bitmapDrawable = new BitmapDrawable(context.getResources(), bitmapDecodeByteArray);
                Shader.TileMode tileMode = Shader.TileMode.REPEAT;
                bitmapDrawable.setTileModeXY(tileMode, tileMode);
                bitmapDrawable.setTargetDensity(context.getResources().getDisplayMetrics());
                imageView2.setBackground(bitmapDrawable);
                imageView2.setId(R.id.ia_ext_watermark);
                imageView = imageView2;
            }
        } catch (Throwable th3) {
            th = th3;
            if (bitmapDecodeByteArray != null) {
                bitmapDecodeByteArray.recycle();
            }
            IAlog.a("%s Error occurred when trying to create external watermark", th, "InneractiveWatermark");
            this.f31092a = imageView;
        }
        this.f31092a = imageView;
    }
}
