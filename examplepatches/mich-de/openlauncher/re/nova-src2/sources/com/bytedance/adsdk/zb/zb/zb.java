package com.bytedance.adsdk.zb.zb;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.Base64;
import android.view.View;
import com.bytedance.adsdk.zb.dj;
import com.bytedance.adsdk.zb.jc;
import com.bytedance.adsdk.zb.lt.lt;
import java.io.IOException;
import java.util.Map;

/* loaded from: classes2.dex */
public class zb {
    private static final Object ycx = new Object();

    /* renamed from: dj, reason: collision with root package name */
    private dj f23277dj;
    private final Map<String, jc> lud;
    private final String sya;

    /* renamed from: zb, reason: collision with root package name */
    private final Context f23278zb;

    public zb(Drawable.Callback callback, String str, dj djVar, Map<String, jc> map) {
        if (TextUtils.isEmpty(str) || str.charAt(str.length() - 1) == '/') {
            this.sya = str;
        } else {
            this.sya = str.concat("/");
        }
        this.lud = map;
        ycx(djVar);
        if (callback instanceof View) {
            this.f23278zb = ((View) callback).getContext().getApplicationContext();
        } else {
            this.f23278zb = null;
        }
    }

    private Bitmap zb(String str, Bitmap bitmap) {
        synchronized (ycx) {
            this.lud.get(str).ycx(bitmap);
        }
        return bitmap;
    }

    public void ycx(dj djVar) {
        this.f23277dj = djVar;
    }

    public Bitmap ycx(String str, Bitmap bitmap) {
        if (bitmap != null) {
            Bitmap bitmapEa = this.lud.get(str).ea();
            zb(str, bitmap);
            return bitmapEa;
        }
        jc jcVar = this.lud.get(str);
        Bitmap bitmapEa2 = jcVar.ea();
        jcVar.ycx(null);
        return bitmapEa2;
    }

    public Bitmap ycx(String str) {
        jc jcVar = this.lud.get(str);
        if (jcVar == null) {
            return null;
        }
        Bitmap bitmapEa = jcVar.ea();
        if (bitmapEa != null) {
            return bitmapEa;
        }
        dj djVar = this.f23277dj;
        if (djVar != null) {
            return djVar.ycx(jcVar);
        }
        Context context = this.f23278zb;
        if (context == null) {
            return null;
        }
        String strJw = jcVar.jw();
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inScaled = true;
        options.inDensity = 160;
        if (strJw.startsWith("data:") && strJw.indexOf("base64,") > 0) {
            try {
                byte[] bArrDecode = Base64.decode(strJw.substring(strJw.indexOf(44) + 1), 0);
                return zb(str, BitmapFactory.decodeByteArray(bArrDecode, 0, bArrDecode.length, options));
            } catch (IllegalArgumentException unused) {
                return null;
            }
        }
        try {
            if (!TextUtils.isEmpty(this.sya)) {
                try {
                    Bitmap bitmapDecodeStream = BitmapFactory.decodeStream(context.getAssets().open(this.sya + strJw), null, options);
                    if (bitmapDecodeStream == null) {
                        return null;
                    }
                    return zb(str, lt.ycx(bitmapDecodeStream, jcVar.ycx(), jcVar.zb()));
                } catch (IllegalArgumentException unused2) {
                    return null;
                }
            }
            throw new IllegalStateException("You must set an images folder before loading an image. Set it with LottieComposition#setImagesFolder or LottieDrawable#setImagesFolder");
        } catch (IOException unused3) {
            return null;
        }
    }

    public boolean ycx(Context context) {
        return (context == null && this.f23278zb == null) || this.f23278zb.equals(context);
    }
}
