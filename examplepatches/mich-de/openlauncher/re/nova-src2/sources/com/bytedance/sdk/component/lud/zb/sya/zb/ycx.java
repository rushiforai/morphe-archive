package com.bytedance.sdk.component.lud.zb.sya.zb;

import android.graphics.ImageDecoder;
import android.graphics.drawable.Drawable;
import android.os.Build;
import com.bytedance.sdk.component.lud.zb.sya.lt;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.ul;
import com.bytedance.sdk.openadsdk.oty.sya;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: com.bytedance.sdk.component.lud.zb.sya.zb.ycx$ycx, reason: collision with other inner class name */
    public interface InterfaceC0041ycx {
        void ycx();

        void ycx(Drawable drawable);

        void ycx(byte[] bArr);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(byte[] bArr, lt ltVar, InterfaceC0041ycx interfaceC0041ycx) {
        FileOutputStream fileOutputStream = null;
        try {
            File fileYcx = ul.ycx(ltVar.ycx(), "P_GIF_CACHE", "P_U_GIF_FILE");
            FileOutputStream fileOutputStream2 = new FileOutputStream(fileYcx);
            try {
                fileOutputStream2.write(bArr, 0, bArr.length);
                if (Build.VERSION.SDK_INT >= 28) {
                    Drawable drawableDecodeDrawable = ImageDecoder.decodeDrawable(ImageDecoder.createSource(fileYcx));
                    if (interfaceC0041ycx != null) {
                        interfaceC0041ycx.ycx(drawableDecodeDrawable);
                    }
                } else if (interfaceC0041ycx != null) {
                    interfaceC0041ycx.ycx(bArr);
                }
                try {
                    fileOutputStream2.close();
                } catch (Throwable th2) {
                    sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6ApkACzbcI=", "a88KtA21ZMaUT/NYihC1JE/KKJYMuGzV", "V+EskSKyYMqBXt5SgjWyKUzvL5kGnnDhiUbS", 115);
                }
            } catch (Throwable th3) {
                th = th3;
                fileOutputStream = fileOutputStream2;
                try {
                    sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6ApkACzbcI=", "a88KtA21ZMaUT/NYihC1JE/KKJYMuGzV", "V+EskSKyYMqBXt5SgjWyKUzvL5kGnnDhiUbS", 108);
                    htf.ycx("PAGGifDefaultDecoder", "Gif  getSourceByFile fail : ", th);
                    if (interfaceC0041ycx != null) {
                        interfaceC0041ycx.ycx();
                    }
                } finally {
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (Throwable th4) {
                            sya.ycx(th4, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6ApkACzbcI=", "a88KtA21ZMaUT/NYihC1JE/KKJYMuGzV", "V+EskSKyYMqBXt5SgjWyKUzvL5kGnnDhiUbS", 115);
                        }
                    }
                }
            }
        } catch (Throwable th5) {
            th = th5;
        }
    }

    public void ycx(byte[] bArr, lt ltVar, InterfaceC0041ycx interfaceC0041ycx) {
        if (Build.VERSION.SDK_INT <= 30) {
            ycx(bArr, interfaceC0041ycx, ltVar);
        } else {
            ycx(bArr, interfaceC0041ycx);
        }
    }

    public void ycx(byte[] bArr, InterfaceC0041ycx interfaceC0041ycx) {
        ByteBuffer byteBufferWrap = ByteBuffer.wrap(bArr);
        if (Build.VERSION.SDK_INT < 28) {
            if (interfaceC0041ycx != null) {
                interfaceC0041ycx.ycx(bArr);
                return;
            }
            return;
        }
        try {
            Drawable drawableDecodeDrawable = ImageDecoder.decodeDrawable(ImageDecoder.createSource(byteBufferWrap));
            if (interfaceC0041ycx != null) {
                interfaceC0041ycx.ycx(drawableDecodeDrawable);
            }
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6ApkACzbcI=", "a88KtA21ZMaUT/NYihC1JE/KKJYMuGzV", "V+EskSKyYMqBXt5SgjWyKUzvL5kG", 47);
            htf.sya("PAGGifDefaultDecoder", th2.getMessage());
            if (interfaceC0041ycx != null) {
                interfaceC0041ycx.ycx();
            }
        }
    }

    private void ycx(final byte[] bArr, final InterfaceC0041ycx interfaceC0041ycx, final lt ltVar) {
        try {
            ltVar.fby().submit(new Runnable() { // from class: com.bytedance.sdk.component.lud.zb.sya.zb.ycx.1
                @Override // java.lang.Runnable
                public void run() {
                    ycx.this.zb(bArr, ltVar, interfaceC0041ycx);
                }
            });
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE4UcoS9eoD2UDbtlws5D2UmJA64pV6ApkACzbcI=", "a88KtA21ZMaUT/NYihC1JE/KKJYMuGzV", "V+EskSKyYMqBXt5SgjWyKUzvL5kGmmbVoXr+Dtw=", 70);
            htf.sya("PAGGifDefaultDecoder", th2.getMessage());
            if (interfaceC0041ycx != null) {
                interfaceC0041ycx.ycx();
            }
        }
    }
}
