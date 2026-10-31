package i30;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import com.teslacoilsw.launcher.wallpaper.app.CropImage;

/* loaded from: classes4.dex */
public final class p extends x {

    /* renamed from: q, reason: collision with root package name */
    public final Context f61328q;

    /* renamed from: r, reason: collision with root package name */
    public final int f61329r;

    public p(CropImage cropImage) {
        super(0);
        long[] jArr = f30.f.f54304a;
        cropImage.getClass();
        this.f61328q = cropImage;
        this.f61329r = 2131231222;
        this.f61370k = false;
    }

    @Override // i30.x
    public final void k(Bitmap bitmap) {
        if (a.f61246i.get() != null) {
            return;
        }
        bitmap.recycle();
    }

    @Override // i30.x
    public final Bitmap l() {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inPreferredConfig = Bitmap.Config.ARGB_8888;
        return BitmapFactory.decodeResource(this.f61328q.getResources(), this.f61329r, options);
    }
}
