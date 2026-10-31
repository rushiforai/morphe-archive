package hb;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.util.DisplayMetrics;
import android.view.WindowManager;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.android.launcher3.WallpaperCropActivity;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes2.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final e f59600a;

    /* renamed from: b, reason: collision with root package name */
    public final int f59601b;

    /* renamed from: c, reason: collision with root package name */
    public final int f59602c;

    /* renamed from: d, reason: collision with root package name */
    public final int f59603d;

    /* renamed from: e, reason: collision with root package name */
    public final k9.b f59604e;

    /* renamed from: f, reason: collision with root package name */
    public final int f59605f;

    /* renamed from: g, reason: collision with root package name */
    public final Rect f59606g = new Rect();

    /* renamed from: h, reason: collision with root package name */
    public final BitmapFactory.Options f59607h;

    public d(WallpaperCropActivity wallpaperCropActivity, a aVar) {
        new Rect();
        z4.c cVar = ib.c.E;
        DisplayMetrics displayMetrics = new DisplayMetrics();
        ((WindowManager) wallpaperCropActivity.getSystemService("window")).getDefaultDisplay().getMetrics(displayMetrics);
        this.f59603d = (displayMetrics.heightPixels > 2048 || displayMetrics.widthPixels > 2048) ? EventBridgeChannel.QUEUE_CAPACITY : 256;
        this.f59605f = aVar.f59594c;
        e eVar = aVar.f59592a;
        this.f59600a = eVar;
        if (eVar != null) {
            int width = eVar.getWidth();
            this.f59601b = width;
            int height = eVar.getHeight();
            this.f59602c = height;
            BitmapFactory.Options options = new BitmapFactory.Options();
            this.f59607h = options;
            Bitmap.Config config = Bitmap.Config.ARGB_8888;
            options.inPreferredConfig = config;
            options.inPreferQualityOverSpeed = true;
            options.inTempStorage = new byte[ReaderJsonLexerKt.BATCH_SIZE];
            int iMin = Math.min(1024, 1024);
            Bitmap bitmap = aVar.f59593b;
            if (bitmap == null) {
                bitmap = null;
            } else {
                float fMax = iMin / Math.max(bitmap.getWidth(), bitmap.getHeight());
                if (fMax <= 0.5d) {
                    int iRound = Math.round(bitmap.getWidth() * fMax);
                    int iRound2 = Math.round(bitmap.getHeight() * fMax);
                    if (iRound != bitmap.getWidth() || iRound2 != bitmap.getHeight()) {
                        Bitmap.Config config2 = bitmap.getConfig();
                        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(iRound, iRound2, config2 == null ? config : config2);
                        Canvas canvas = new Canvas(bitmapCreateBitmap);
                        canvas.scale(fMax, fMax);
                        canvas.drawBitmap(bitmap, 0.0f, 0.0f, new Paint(6));
                        bitmap.recycle();
                        bitmap = bitmapCreateBitmap;
                    }
                }
                if (bitmap != null && bitmap.getConfig() == null) {
                    Bitmap bitmapCopy = bitmap.copy(config, false);
                    bitmap.recycle();
                    bitmap = bitmapCopy;
                }
            }
            if (bitmap.getWidth() > 2048 || bitmap.getHeight() > 2048) {
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("BitmapRegionTileSource");
                bVar.n("Failed to create preview of apropriate size! in: %dx%d, out: %dx%d", Integer.valueOf(width), Integer.valueOf(height), Integer.valueOf(bitmap.getWidth()), Integer.valueOf(bitmap.getHeight()));
            } else {
                k9.b bVar2 = new k9.b();
                bVar2.o = bitmap;
                this.f59604e = bVar2;
            }
        }
    }

    public final Bitmap a(int i5, int i11, int i12, Bitmap bitmap) {
        int i13 = this.f59603d;
        int i14 = i13 << i5;
        Rect rect = this.f59606g;
        rect.set(i11, i12, i11 + i14, i14 + i12);
        if (bitmap == null) {
            bitmap = Bitmap.createBitmap(i13, i13, Bitmap.Config.ARGB_8888);
        }
        BitmapFactory.Options options = this.f59607h;
        options.inSampleSize = 1 << i5;
        options.inBitmap = bitmap;
        try {
            Bitmap bitmapC = this.f59600a.c(rect, options);
            Bitmap bitmap2 = options.inBitmap;
            if (bitmap2 != bitmapC && bitmap2 != null) {
                options.inBitmap = null;
            }
            if (bitmapC == null) {
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("BitmapRegionTileSource");
                bVar.n("fail in decoding region", new Object[0]);
            }
            return bitmapC;
        } catch (Throwable th2) {
            Bitmap bitmap3 = options.inBitmap;
            if (bitmap3 != bitmap && bitmap3 != null) {
                options.inBitmap = null;
            }
            throw th2;
        }
    }
}
