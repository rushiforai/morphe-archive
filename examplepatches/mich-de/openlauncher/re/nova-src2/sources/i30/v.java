package i30;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Rect;

/* loaded from: classes4.dex */
public final class v implements q {

    /* renamed from: a, reason: collision with root package name */
    public b f61358a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f61359b;

    /* renamed from: c, reason: collision with root package name */
    public BitmapRegionDecoder f61360c;

    /* renamed from: d, reason: collision with root package name */
    public int f61361d;

    /* renamed from: e, reason: collision with root package name */
    public int f61362e;

    /* renamed from: f, reason: collision with root package name */
    public int f61363f;

    @Override // i30.q
    public final int a() {
        return this.f61363f;
    }

    @Override // i30.q
    public final Bitmap b(int i5, int i11, int i12, h30.a aVar) {
        int i13 = 1 << i5;
        int i14 = 254 << i5;
        Rect rect = new Rect(i11 - i13, i12 - i13, i11 + i14 + i13, i12 + i14 + i13);
        synchronized (this) {
            try {
                BitmapRegionDecoder bitmapRegionDecoder = this.f61360c;
                if (bitmapRegionDecoder == null) {
                    return null;
                }
                boolean zContains = new Rect(0, 0, this.f61361d, this.f61362e).contains(rect);
                Bitmap bitmapA = aVar == null ? null : aVar.a();
                if (bitmapA == null) {
                    bitmapA = Bitmap.createBitmap(256, 256, Bitmap.Config.ARGB_8888);
                } else if (!zContains) {
                    bitmapA.eraseColor(0);
                }
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inPreferredConfig = Bitmap.Config.ARGB_8888;
                options.inPreferQualityOverSpeed = true;
                options.inSampleSize = i13;
                options.inBitmap = bitmapA;
                try {
                    synchronized (bitmapRegionDecoder) {
                        bitmapA = bitmapRegionDecoder.decodeRegion(rect, options);
                    }
                    if (bitmapA == null) {
                        mc0.d.f76206a.n("fail in decoding region", new Object[0]);
                    }
                    return bitmapA;
                } finally {
                    Bitmap bitmap = options.inBitmap;
                    if (bitmap != bitmapA && bitmap != null) {
                        if (aVar != null) {
                            aVar.b(bitmap);
                        }
                        options.inBitmap = null;
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // i30.q
    public final int c() {
        return this.f61362e;
    }

    @Override // i30.q
    public final b d() {
        return this.f61358a;
    }

    @Override // i30.q
    public final int e() {
        return this.f61361d;
    }
}
