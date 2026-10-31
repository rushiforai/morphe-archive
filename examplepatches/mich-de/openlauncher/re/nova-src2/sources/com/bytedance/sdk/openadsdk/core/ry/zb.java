package com.bytedance.sdk.openadsdk.core.ry;

import a5.k;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.ImageDecoder;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.TextUtils;
import android.widget.ImageView;
import com.bytedance.adsdk.ugeno.zb;
import com.bytedance.sdk.component.lud.dy;
import com.bytedance.sdk.component.lud.ea;
import com.bytedance.sdk.component.lud.jc;
import com.bytedance.sdk.component.lud.zb.sya.lud;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.ul;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.util.Map;

/* loaded from: classes2.dex */
public class zb implements com.bytedance.adsdk.ugeno.zb {

    public static class sya implements dy {

        /* renamed from: dj, reason: collision with root package name */
        private final int f26034dj;
        private final int sya;
        private final WeakReference<ImageView> ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final zb f26035zb;

        public sya(ImageView imageView, zb zbVar, int i5, int i11) {
            this.ycx = new WeakReference<>(imageView);
            this.f26035zb = zbVar;
            this.sya = i5;
            this.f26034dj = i11;
        }

        @Override // com.bytedance.sdk.component.lud.dy
        public void ycx(int i5, String str, Throwable th2) {
        }

        @Override // com.bytedance.sdk.component.lud.dy
        public void ycx(ea eaVar) {
            try {
                final ImageView imageView = this.ycx.get();
                if (imageView == null) {
                    return;
                }
                final Object objZb = eaVar.zb();
                if (objZb instanceof Drawable) {
                    yzp.ycx((Runnable) new com.bytedance.sdk.component.fby.zb.sya("load_draw_img") { // from class: com.bytedance.sdk.openadsdk.core.ry.zb.sya.1
                        @Override // java.lang.Runnable
                        public void run() {
                            if (Build.VERSION.SDK_INT >= 28 && k.v(objZb)) {
                                k.j(objZb).start();
                            }
                            imageView.setImageDrawable((Drawable) objZb);
                        }
                    });
                    return;
                }
                if (!(objZb instanceof byte[])) {
                    if (objZb instanceof Bitmap) {
                        yzp.ycx((Runnable) new com.bytedance.sdk.component.fby.zb.sya("ug_load_bitmap") { // from class: com.bytedance.sdk.openadsdk.core.ry.zb.sya.3
                            @Override // java.lang.Runnable
                            public void run() {
                                imageView.setImageBitmap((Bitmap) objZb);
                            }
                        });
                    }
                } else {
                    if (eaVar.lud()) {
                        if (Build.VERSION.SDK_INT <= 30) {
                            this.f26035zb.ycx((byte[]) objZb, imageView);
                            return;
                        } else {
                            this.f26035zb.ycx(imageView, (byte[]) objZb, this.sya, this.f26034dj);
                            return;
                        }
                    }
                    if (this.f26035zb.ycx((byte[]) objZb)) {
                        this.f26035zb.ycx(imageView, (byte[]) objZb, this.sya, this.f26034dj);
                        return;
                    }
                    final Bitmap bitmapYcx = new com.bytedance.sdk.component.lud.zb.sya.zb.zb(this.sya, this.f26034dj, imageView.getScaleType(), Bitmap.Config.RGB_565, this.sya, this.f26034dj).ycx((byte[]) objZb, new com.bytedance.sdk.component.lud.zb.sya.lt(pmi.ycx(), new lud.ycx().ycx(com.bytedance.sdk.openadsdk.jc.dj.zb()).ycx()));
                    if (bitmapYcx != null) {
                        yzp.ycx((Runnable) new com.bytedance.sdk.component.fby.zb.sya("load_static_img") { // from class: com.bytedance.sdk.openadsdk.core.ry.zb.sya.2
                            @Override // java.lang.Runnable
                            public void run() {
                                imageView.setImageBitmap(bitmapYcx);
                            }
                        });
                    }
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDQ==", "cuMskgaQZsaET8Vtnh62IV/rP9EqsWjAhWbYXIgUsgRS/TmQDbl77o1a2w==", "VOAegAC/bNST", 145);
                htf.sya("ImageLoaderProvider", th2.getMessage());
            }
        }
    }

    public interface ycx {
        void ycx(Drawable drawable);
    }

    private void zb(final ImageView imageView, byte[] bArr, int i5, int i11) {
        final Bitmap bitmapYcx = new com.bytedance.sdk.component.lud.zb.sya.zb.zb(i5, i11, imageView.getScaleType(), Bitmap.Config.ARGB_4444, i5, i11).ycx(bArr, new com.bytedance.sdk.component.lud.zb.sya.lt(pmi.ycx(), new lud.ycx().ycx(com.bytedance.sdk.openadsdk.jc.dj.zb()).ycx()));
        if (bitmapYcx != null) {
            yzp.ycx((Runnable) new com.bytedance.sdk.component.fby.zb.sya("loadStaticImage") { // from class: com.bytedance.sdk.openadsdk.core.ry.zb.2
                @Override // java.lang.Runnable
                public void run() {
                    imageView.setImageBitmap(bitmapYcx);
                }
            });
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb
    public void ycx(com.bytedance.adsdk.ugeno.core.ea eaVar, String str, ImageView imageView, int i5, int i11, zb.ycx ycxVar) {
        String strYcx = lud.ycx(str);
        jc jcVarSya = com.bytedance.sdk.openadsdk.jc.dj.ycx(strYcx).sya(1);
        ycx(eaVar, jcVarSya, strYcx);
        jcVarSya.ycx(new sya(imageView, this, i5, i11), 4);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Drawable zb(byte[] bArr) {
        FileOutputStream fileOutputStream;
        File fileYcx;
        try {
            fileYcx = ul.ycx(pmi.ycx(), "UGEN_GIF_CACHE", "TT_UGEN_GIF_FILE");
            fileOutputStream = new FileOutputStream(fileYcx);
        } catch (Throwable th2) {
            th = th2;
            fileOutputStream = null;
        }
        try {
            fileOutputStream.write(bArr, 0, bArr.length);
            if (Build.VERSION.SDK_INT >= 28) {
                Drawable drawableDecodeDrawable = ImageDecoder.decodeDrawable(ImageDecoder.createSource(fileYcx));
                try {
                    fileOutputStream.close();
                    return drawableDecodeDrawable;
                } catch (Throwable th3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDQ==", "cuMskgaQZsaET8Vtnh62IV/rPw==", "V+EskSKyYMqBXt5SgjWyKUzvL5kGnnDhiUbS", 267);
                    return drawableDecodeDrawable;
                }
            }
            BitmapDrawable bitmapDrawable = new BitmapDrawable(pmi.ycx().getResources(), BitmapFactory.decodeByteArray(bArr, 0, bArr.length));
            try {
                fileOutputStream.close();
                return bitmapDrawable;
            } catch (Throwable th4) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th4, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDQ==", "cuMskgaQZsaET8Vtnh62IV/rPw==", "V+EskSKyYMqBXt5SgjWyKUzvL5kGnnDhiUbS", 267);
                return bitmapDrawable;
            }
        } catch (Throwable th5) {
            th = th5;
            try {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDQ==", "cuMskgaQZsaET8Vtnh62IV/rPw==", "V+EskSKyYMqBXt5SgjWyKUzvL5kGnnDhiUbS", 260);
                htf.ycx("ImageLoaderProvider", "GifView  getSourceByFile fail : ", th);
                return null;
            } finally {
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (Throwable th6) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th6, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDQ==", "cuMskgaQZsaET8Vtnh62IV/rPw==", "V+EskSKyYMqBXt5SgjWyKUzvL5kGnnDhiUbS", 267);
                    }
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(final ImageView imageView, byte[] bArr, int i5, int i11) throws IOException {
        ByteBuffer byteBufferWrap = ByteBuffer.wrap(bArr);
        if (Build.VERSION.SDK_INT >= 28) {
            try {
                final Drawable drawableDecodeDrawable = ImageDecoder.decodeDrawable(ImageDecoder.createSource(byteBufferWrap));
                if (drawableDecodeDrawable != null) {
                    yzp.ycx((Runnable) new com.bytedance.sdk.component.fby.zb.sya("loadAnimatedDrawable") { // from class: com.bytedance.sdk.openadsdk.core.ry.zb.1
                        @Override // java.lang.Runnable
                        public void run() {
                            if (k.v(drawableDecodeDrawable)) {
                                k.j(drawableDecodeDrawable).start();
                            }
                            imageView.setImageDrawable(drawableDecodeDrawable);
                        }
                    });
                    return;
                }
                return;
            } catch (IOException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDQ==", "cuMskgaQZsaET8Vtnh62IV/rPw==", "V+EskSKyYMqBXtJZqAOhP1rsIZA=", 174);
                htf.sya("ImageLoaderProvider", e3.getMessage());
                return;
            }
        }
        zb(imageView, bArr, i5, i11);
    }

    /* renamed from: com.bytedance.sdk.openadsdk.core.ry.zb$zb, reason: collision with other inner class name */
    public static class C0080zb implements dy {
        private final WeakReference<zb.ycx> ycx;

        public C0080zb(zb.ycx ycxVar) {
            this.ycx = new WeakReference<>(ycxVar);
        }

        @Override // com.bytedance.sdk.component.lud.dy
        public void ycx(ea eaVar) {
            zb.ycx ycxVar = this.ycx.get();
            if (eaVar == null) {
                if (ycxVar != null) {
                    ycxVar.ycx(null);
                }
            } else if (ycxVar != null) {
                Object objZb = eaVar.zb();
                if (objZb instanceof Bitmap) {
                    ycxVar.ycx((Bitmap) objZb);
                    return;
                }
                if (eaVar.zb() instanceof byte[]) {
                    try {
                        ycxVar.ycx(BitmapFactory.decodeByteArray((byte[]) eaVar.zb(), 0, ((byte[]) eaVar.zb()).length));
                        return;
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDQ==", "cuMskgaQZsaET8Vtnh62IV/rP9EqsWjAhWbYXIgjpTtO4jk=", "VOAegAC/bNST", Sdk.SDKError.Reason.GENERATE_JSON_DATA_ERROR_VALUE);
                    }
                }
                ycxVar.ycx(null);
            }
        }

        @Override // com.bytedance.sdk.component.lud.dy
        public void ycx(int i5, String str, Throwable th2) {
            zb.ycx ycxVar = this.ycx.get();
            if (ycxVar != null) {
                ycxVar.ycx(null);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(byte[] bArr, final ImageView imageView) {
        try {
            ycx(bArr, new ycx() { // from class: com.bytedance.sdk.openadsdk.core.ry.zb.3
                @Override // com.bytedance.sdk.openadsdk.core.ry.zb.ycx
                public void ycx(final Drawable drawable) {
                    yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.ry.zb.3.1
                        @Override // java.lang.Runnable
                        public void run() {
                            if (Build.VERSION.SDK_INT >= 28 && k.v(drawable)) {
                                k.j(drawable).start();
                            }
                            imageView.setImageDrawable(drawable);
                        }
                    });
                }
            });
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDQ==", "cuMskgaQZsaET8Vtnh62IV/rPw==", "V+EskSKyYMqBXt5SgjWyKUzvL5kGmmbVoXr+Dtw=", Sdk.SDKError.Reason.MRAID_JS_DOES_NOT_EXIST_VALUE);
            htf.sya("ImageLoaderProvider", e3.getMessage());
        }
    }

    private void ycx(final byte[] bArr, final ycx ycxVar) {
        yzp.sya((Runnable) new com.bytedance.sdk.component.fby.zb.sya("pag_animation_drawable") { // from class: com.bytedance.sdk.openadsdk.core.ry.zb.4
            @Override // java.lang.Runnable
            public void run() {
                Drawable drawableZb = zb.this.zb(bArr);
                ycx ycxVar2 = ycxVar;
                if (ycxVar2 != null) {
                    ycxVar2.ycx(drawableZb);
                }
            }
        });
    }

    public boolean ycx(byte[] bArr) {
        return com.bytedance.sdk.component.utils.ea.ycx(bArr, 0);
    }

    @Override // com.bytedance.adsdk.ugeno.zb
    public void ycx(com.bytedance.adsdk.ugeno.core.ea eaVar, String str, zb.ycx ycxVar) {
        zb(eaVar, lud.ycx(str), ycxVar);
    }

    private void ycx(com.bytedance.adsdk.ugeno.core.ea eaVar, jc jcVar, String str) {
        Map<String, Object> mapZb;
        if (eaVar == null || (mapZb = eaVar.zb()) == null) {
            return;
        }
        Object obj = mapZb.get("image_info");
        if (obj instanceof Map) {
            jcVar.ycx((String) ((Map) obj).get(str));
        }
        String str2 = (String) mapZb.get("cache_dir");
        if (TextUtils.isEmpty(str2)) {
            return;
        }
        jcVar.zb(str2);
    }

    public void zb(com.bytedance.adsdk.ugeno.core.ea eaVar, String str, zb.ycx ycxVar) {
        jc jcVarSya = com.bytedance.sdk.openadsdk.jc.dj.ycx(str).sya(2);
        ycx(eaVar, jcVarSya, str);
        jcVarSya.ycx(new C0080zb(ycxVar), 4);
    }
}
