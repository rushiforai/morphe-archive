package hb;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import com.android.launcher3.WallpaperCropActivity;
import fl.l;
import gu.j;
import java.io.BufferedInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

/* loaded from: classes2.dex */
public final class c extends a {

    /* renamed from: e, reason: collision with root package name */
    public final WallpaperCropActivity f59598e;

    /* renamed from: f, reason: collision with root package name */
    public final Uri f59599f;

    public c(WallpaperCropActivity wallpaperCropActivity, Uri uri) {
        this.f59598e = wallpaperCropActivity;
        this.f59599f = uri;
    }

    @Override // hb.a
    public final e a() throws IOException {
        l lVar;
        try {
            BufferedInputStream bufferedInputStreamE = e();
            j jVarH = j.h(bufferedInputStreamE);
            i9.a.a(bufferedInputStreamE);
            if (jVarH != null) {
                return jVarH;
            }
            BufferedInputStream bufferedInputStreamE2 = e();
            Bitmap bitmapDecodeStream = BitmapFactory.decodeStream(bufferedInputStreamE2);
            if (bitmapDecodeStream != null) {
                lVar = new l(10, (byte) 0);
                lVar.f55376d = bitmapDecodeStream;
            } else {
                lVar = null;
            }
            i9.a.a(bufferedInputStreamE2);
            return lVar;
        } catch (FileNotFoundException e3) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("BitmapRegionTileSource");
            bVar.p(e3, "Failed to load URI %s", this.f59599f);
            return null;
        }
    }

    @Override // hb.a
    public final Bitmap c(BitmapFactory.Options options) throws IOException {
        try {
            BufferedInputStream bufferedInputStreamE = e();
            Bitmap bitmapDecodeStream = BitmapFactory.decodeStream(bufferedInputStreamE, null, options);
            i9.a.a(bufferedInputStreamE);
            return bitmapDecodeStream;
        } catch (FileNotFoundException e3) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("BitmapRegionTileSource");
            bVar.p(e3, "Failed to load URI %s", this.f59599f);
            return null;
        }
    }

    @Override // hb.a
    public final boolean d(j9.c cVar) throws IOException {
        BufferedInputStream bufferedInputStreamE;
        try {
            bufferedInputStreamE = e();
        } catch (Throwable th2) {
            th = th2;
            bufferedInputStreamE = null;
        }
        try {
            cVar.e(bufferedInputStreamE);
            i9.a.a(bufferedInputStreamE);
            return true;
        } catch (Throwable th3) {
            th = th3;
            try {
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("BitmapRegionTileSource");
                bVar.p(th, "Failed to read EXIF for URI %s", this.f59599f);
                i9.a.a(bufferedInputStreamE);
                return false;
            } finally {
                i9.a.a(bufferedInputStreamE);
            }
        }
    }

    public final BufferedInputStream e() {
        return new BufferedInputStream(this.f59598e.getContentResolver().openInputStream(this.f59599f));
    }
}
