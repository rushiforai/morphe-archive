package e30;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapRegionDecoder;
import com.teslacoilsw.launcher.wallpaper.app.CropImage;

/* loaded from: classes4.dex */
public final class g implements j30.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52107a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ CropImage f52108b;

    public /* synthetic */ g(CropImage cropImage, int i5) {
        this.f52107a = i5;
        this.f52108b = cropImage;
    }

    @Override // j30.a
    public final void b(j30.g gVar) {
        switch (this.f52107a) {
            case 0:
                this.f52108b.E = null;
                if (!gVar.f68890e) {
                    Intent intent = (Intent) gVar.b();
                    if (intent == null) {
                        this.f52108b.f46377v.sendEmptyMessage(4);
                        break;
                    } else {
                        f fVar = this.f52108b.f46377v;
                        fVar.sendMessage(fVar.obtainMessage(3, intent));
                        break;
                    }
                }
                break;
            case 1:
                this.f52108b.C = null;
                BitmapRegionDecoder bitmapRegionDecoder = (BitmapRegionDecoder) gVar.b();
                if (!gVar.f68890e) {
                    f fVar2 = this.f52108b.f46377v;
                    fVar2.sendMessage(fVar2.obtainMessage(1, bitmapRegionDecoder));
                    break;
                } else if (bitmapRegionDecoder != null) {
                    bitmapRegionDecoder.recycle();
                    break;
                }
                break;
            default:
                this.f52108b.D = null;
                Bitmap bitmap = (Bitmap) gVar.b();
                if (!gVar.f68890e) {
                    f fVar3 = this.f52108b.f46377v;
                    fVar3.sendMessage(fVar3.obtainMessage(2, bitmap));
                    break;
                } else if (bitmap != null) {
                    bitmap.recycle();
                    break;
                }
                break;
        }
    }
}
