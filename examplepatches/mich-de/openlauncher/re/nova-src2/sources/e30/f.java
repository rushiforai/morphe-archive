package e30;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Message;
import android.widget.Toast;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.teslacoilsw.launcher.wallpaper.app.CropImage;
import com.teslacoilsw.launcher.wallpaper.ui.GLRootView;
import i30.l;
import i30.v;

/* loaded from: classes4.dex */
public final class f extends Handler {

    /* renamed from: a, reason: collision with root package name */
    public final l f52105a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ CropImage f52106b;

    public f(CropImage cropImage, l lVar) {
        this.f52106b = cropImage;
        long[] jArr = f30.f.f54304a;
        lVar.getClass();
        this.f52105a = lVar;
    }

    @Override // android.os.Handler
    public final void dispatchMessage(Message message) {
        l lVar = this.f52105a;
        ((GLRootView) lVar).a();
        try {
            super.dispatchMessage(message);
        } finally {
            ((GLRootView) lVar).e();
        }
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        int i5 = message.what;
        CropImage cropImage = this.f52106b;
        switch (i5) {
            case 1:
                cropImage.f46377v.removeMessages(6);
                BitmapRegionDecoder bitmapRegionDecoder = (BitmapRegionDecoder) message.obj;
                if (bitmapRegionDecoder != null) {
                    cropImage.f46380y = bitmapRegionDecoder;
                    cropImage.A = true;
                    cropImage.f46375t = 1;
                    BitmapFactory.Options options = new BitmapFactory.Options();
                    int width = bitmapRegionDecoder.getWidth();
                    int height = bitmapRegionDecoder.getHeight();
                    int iCeil = (int) Math.ceil(Math.sqrt((width * height) / 480000));
                    options.inSampleSize = iCeil <= 8 ? f30.f.e(iCeil) : 8 * ((iCeil + 7) / 8);
                    Bitmap bitmapDecodeRegion = bitmapRegionDecoder.decodeRegion(new Rect(0, 0, width, height), options);
                    cropImage.f46378w = bitmapDecodeRegion;
                    if (bitmapDecodeRegion != null) {
                        i30.f fVar = cropImage.f46376u;
                        v vVar = new v();
                        long[] jArr = f30.f.f54304a;
                        i30.b bVar = new i30.b(bitmapDecodeRegion);
                        i30.b bVar2 = vVar.f61358a;
                        if (bVar2 != null && vVar.f61359b) {
                            i30.c cVar = bVar2.f61257d;
                            if (cVar != null) {
                                cVar.a();
                                if (cVar.f61371l != null) {
                                    cVar.g();
                                }
                                bVar2.f61257d = null;
                            }
                            Bitmap bitmap = bVar2.f61256c;
                            if (bitmap != null) {
                                h30.j.f59076j.b(bitmap);
                                bVar2.f61256c = null;
                            }
                        }
                        vVar.f61358a = bVar;
                        vVar.f61359b = true;
                        vVar.f61360c = bitmapRegionDecoder;
                        int width2 = bitmapRegionDecoder.getWidth();
                        vVar.f61361d = width2;
                        vVar.f61362e = bitmapRegionDecoder.getHeight();
                        float f11 = width2 / vVar.f61358a.f61254a;
                        int i11 = 0;
                        while (i11 < 31 && (1 << i11) < f11) {
                            i11++;
                        }
                        vVar.f61363f = Math.max(0, i11);
                        fVar.u(vVar, cropImage.F.f59083g);
                        cropImage.o0(width, height);
                        break;
                    } else {
                        cropImage.P = true;
                        cropImage.e0();
                        break;
                    }
                } else {
                    Toast.makeText(cropImage.getApplicationContext(), 2132017866, 0).show();
                    cropImage.finish();
                    break;
                }
                break;
            case 2:
                cropImage.f46377v.removeMessages(6);
                cropImage.B.setVisibility(8);
                Bitmap bitmap2 = (Bitmap) message.obj;
                if (bitmap2 != null) {
                    cropImage.A = false;
                    cropImage.f46375t = 1;
                    cropImage.f46378w = bitmap2;
                    new BitmapFactory.Options();
                    cropImage.f46376u.u(new ja.d(bitmap2, EventBridgeChannel.QUEUE_CAPACITY), cropImage.F.f59083g);
                    cropImage.f46376u.r();
                    cropImage.o0(cropImage.f46378w.getWidth(), cropImage.f46378w.getHeight());
                    break;
                } else {
                    Toast.makeText(cropImage.getApplicationContext(), 2132017866, 0).show();
                    cropImage.finish();
                    break;
                }
            case 3:
                cropImage.f46377v.removeMessages(6);
                try {
                    cropImage.B.setVisibility(8);
                } catch (IllegalArgumentException e3) {
                    e3.printStackTrace();
                }
                cropImage.setResult(-1, (Intent) message.obj);
                cropImage.finish();
                break;
            case 4:
                cropImage.f46377v.removeMessages(6);
                cropImage.B.setVisibility(8);
                cropImage.setResult(0);
                Toast.makeText(cropImage.getApplicationContext(), cropImage.getString(2132019443), 1).show();
                cropImage.finish();
                break;
            case 5:
                cropImage.B.setVisibility(8);
                cropImage.f46377v.removeMessages(6);
                cropImage.O.f92264i.setAlpha(1.0f);
                break;
            case 6:
                cropImage.B.setVisibility(0);
                cropImage.O.f92264i.setAlpha(0.5f);
                break;
        }
    }
}
