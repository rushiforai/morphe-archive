package com.teslacoilsw.launcher.wallpaper.compat;

import aa.g;
import android.app.WallpaperInfo;
import android.app.WallpaperManager;
import android.app.job.JobParameters;
import android.app.job.JobService;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import b.c0;
import java.io.IOException;

/* loaded from: classes4.dex */
public class WallpaperManagerCompatVL$ColorExtractionService extends JobService implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public HandlerThread f46382a;

    /* renamed from: b, reason: collision with root package name */
    public Handler f46383b;

    /* renamed from: c, reason: collision with root package name */
    public g f46384c;

    /* renamed from: d, reason: collision with root package name */
    public JobParameters f46385d = null;

    @Override // android.app.Service
    public final void onCreate() {
        super.onCreate();
        HandlerThread handlerThread = new HandlerThread("ColorExtractionService");
        this.f46382a = handlerThread;
        handlerThread.start();
        this.f46383b = new Handler(this.f46382a.getLooper());
        this.f46384c = new g(20);
    }

    @Override // android.app.Service
    public final void onDestroy() {
        super.onDestroy();
        this.f46382a.quit();
    }

    @Override // android.app.job.JobService
    public final boolean onStartJob(JobParameters jobParameters) {
        if (this.f46385d != null) {
            return false;
        }
        this.f46385d = jobParameters;
        this.f46383b.post(this);
        return true;
    }

    @Override // android.app.job.JobService
    public final boolean onStopJob(JobParameters jobParameters) {
        this.f46383b.removeCallbacksAndMessages(null);
        return true;
    }

    /* JADX WARN: Can't wrap try/catch for region: R(12:0|2|(1:4)(19:85|6|75|7|(4:9|10|73|11)(1:16)|17|77|18|83|19|(2:71|49)|53|(3:55|(1:57)(1:58)|59)|60|(1:62)|79|63|67|68)|5|(0)|60|(0)|79|63|67|68|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x0143, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0144, code lost:
    
        mc0.d.b(r0);
     */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00ae A[Catch: SecurityException -> 0x00a7, NullPointerException -> 0x00aa, IOException -> 0x00ac, TRY_LEAVE, TryCatch #12 {IOException -> 0x00ac, NullPointerException -> 0x00aa, SecurityException -> 0x00a7, blocks: (B:40:0x00ae, B:33:0x00a3), top: B:81:0x00a3 }] */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0110  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x009e A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00bd A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() throws Throwable {
        Drawable drawable;
        Bitmap bitmapCreateBitmap;
        Drawable drawable2;
        ParcelFileDescriptor parcelFileDescriptor;
        Throwable th2;
        Bitmap bitmap;
        BitmapRegionDecoder bitmapRegionDecoderNewInstance;
        JobParameters jobParameters = this.f46385d;
        Bitmap bitmapDecodeRegion = null;
        this.f46385d = null;
        int wallpaperId = ((WallpaperManager) getSystemService(WallpaperManager.class)).getWallpaperId(1);
        WallpaperManager wallpaperManager = WallpaperManager.getInstance(this);
        WallpaperInfo wallpaperInfo = wallpaperManager.getWallpaperInfo();
        if (wallpaperInfo == null) {
            try {
                ParcelFileDescriptor wallpaperFile = wallpaperManager.getWallpaperFile(1);
                try {
                    bitmapRegionDecoderNewInstance = BitmapRegionDecoder.newInstance(wallpaperFile.getFileDescriptor(), false);
                    int width = bitmapRegionDecoderNewInstance.getWidth() * bitmapRegionDecoderNewInstance.getHeight();
                    BitmapFactory.Options options = new BitmapFactory.Options();
                    if (width > 12544) {
                        parcelFileDescriptor = wallpaperFile;
                        try {
                            options.inSampleSize = (int) Math.pow(2.0d, Math.floor(Math.log(width / 12544.0d) / (Math.log(2.0d) * 2.0d)));
                        } catch (Throwable th3) {
                            th = th3;
                            th2 = th;
                            bitmap = null;
                            if (parcelFileDescriptor != null) {
                                throw th2;
                            }
                            try {
                                parcelFileDescriptor.close();
                                throw th2;
                            } catch (Throwable th4) {
                                try {
                                    th2.addSuppressed(th4);
                                    throw th2;
                                } catch (IOException e3) {
                                    e = e3;
                                    bitmapDecodeRegion = bitmap;
                                    Log.e("WMCompatVL", "Fetching partial bitmap failed, trying old method", e);
                                    if (bitmapDecodeRegion == null) {
                                    }
                                    bitmapCreateBitmap = bitmapDecodeRegion;
                                    drawable2 = null;
                                    if (drawable2 != null) {
                                    }
                                    String strH = c0.h(wallpaperId, "1,");
                                    if (bitmapCreateBitmap != null) {
                                    }
                                    sendBroadcast(new Intent("com.android.launcher3.uioverrides.dynamicui.WallpaperManagerCompatVL.EXTRACTION_COMPLETE").setPackage(getPackageName()).putExtra("wallpaper_parsed_colors", strH));
                                    jobFinished(jobParameters, false);
                                } catch (NullPointerException e11) {
                                    e = e11;
                                    bitmapDecodeRegion = bitmap;
                                    Log.e("WMCompatVL", "Fetching partial bitmap failed, trying old method", e);
                                    if (bitmapDecodeRegion == null) {
                                    }
                                    bitmapCreateBitmap = bitmapDecodeRegion;
                                    drawable2 = null;
                                    if (drawable2 != null) {
                                    }
                                    String strH2 = c0.h(wallpaperId, "1,");
                                    if (bitmapCreateBitmap != null) {
                                    }
                                    sendBroadcast(new Intent("com.android.launcher3.uioverrides.dynamicui.WallpaperManagerCompatVL.EXTRACTION_COMPLETE").setPackage(getPackageName()).putExtra("wallpaper_parsed_colors", strH2));
                                    jobFinished(jobParameters, false);
                                } catch (SecurityException e12) {
                                    e = e12;
                                    bitmapDecodeRegion = bitmap;
                                    Log.e("WMCompatVL", "Fetching partial bitmap failed, trying old method", e);
                                    if (bitmapDecodeRegion == null) {
                                    }
                                    bitmapCreateBitmap = bitmapDecodeRegion;
                                    drawable2 = null;
                                    if (drawable2 != null) {
                                    }
                                    String strH22 = c0.h(wallpaperId, "1,");
                                    if (bitmapCreateBitmap != null) {
                                    }
                                    sendBroadcast(new Intent("com.android.launcher3.uioverrides.dynamicui.WallpaperManagerCompatVL.EXTRACTION_COMPLETE").setPackage(getPackageName()).putExtra("wallpaper_parsed_colors", strH22));
                                    jobFinished(jobParameters, false);
                                }
                            }
                        }
                    } else {
                        parcelFileDescriptor = wallpaperFile;
                    }
                    bitmapDecodeRegion = bitmapRegionDecoderNewInstance.decodeRegion(new Rect(0, 0, bitmapRegionDecoderNewInstance.getWidth(), bitmapRegionDecoderNewInstance.getHeight()), options);
                } catch (Throwable th5) {
                    th = th5;
                    parcelFileDescriptor = wallpaperFile;
                }
                try {
                    bitmapRegionDecoderNewInstance.recycle();
                    try {
                        parcelFileDescriptor.close();
                    } catch (IOException e13) {
                        e = e13;
                        Log.e("WMCompatVL", "Fetching partial bitmap failed, trying old method", e);
                        if (bitmapDecodeRegion == null) {
                        }
                        bitmapCreateBitmap = bitmapDecodeRegion;
                        drawable2 = null;
                        if (drawable2 != null) {
                        }
                        String strH222 = c0.h(wallpaperId, "1,");
                        if (bitmapCreateBitmap != null) {
                        }
                        sendBroadcast(new Intent("com.android.launcher3.uioverrides.dynamicui.WallpaperManagerCompatVL.EXTRACTION_COMPLETE").setPackage(getPackageName()).putExtra("wallpaper_parsed_colors", strH222));
                        jobFinished(jobParameters, false);
                    } catch (NullPointerException e14) {
                        e = e14;
                        Log.e("WMCompatVL", "Fetching partial bitmap failed, trying old method", e);
                        if (bitmapDecodeRegion == null) {
                        }
                        bitmapCreateBitmap = bitmapDecodeRegion;
                        drawable2 = null;
                        if (drawable2 != null) {
                        }
                        String strH2222 = c0.h(wallpaperId, "1,");
                        if (bitmapCreateBitmap != null) {
                        }
                        sendBroadcast(new Intent("com.android.launcher3.uioverrides.dynamicui.WallpaperManagerCompatVL.EXTRACTION_COMPLETE").setPackage(getPackageName()).putExtra("wallpaper_parsed_colors", strH2222));
                        jobFinished(jobParameters, false);
                    } catch (SecurityException e15) {
                        e = e15;
                        Log.e("WMCompatVL", "Fetching partial bitmap failed, trying old method", e);
                        if (bitmapDecodeRegion == null) {
                        }
                        bitmapCreateBitmap = bitmapDecodeRegion;
                        drawable2 = null;
                        if (drawable2 != null) {
                        }
                        String strH22222 = c0.h(wallpaperId, "1,");
                        if (bitmapCreateBitmap != null) {
                        }
                        sendBroadcast(new Intent("com.android.launcher3.uioverrides.dynamicui.WallpaperManagerCompatVL.EXTRACTION_COMPLETE").setPackage(getPackageName()).putExtra("wallpaper_parsed_colors", strH22222));
                        jobFinished(jobParameters, false);
                    }
                } catch (Throwable th6) {
                    bitmap = bitmapDecodeRegion;
                    th2 = th6;
                    if (parcelFileDescriptor != null) {
                    }
                }
            } catch (IOException | NullPointerException | SecurityException e16) {
                e = e16;
                bitmapDecodeRegion = null;
            }
            if (bitmapDecodeRegion == null) {
                try {
                    drawable = wallpaperManager.getDrawable();
                } catch (SecurityException e17) {
                    Log.e("WMCompatVL", "Fetching WallpaperDrawable failed", e17);
                }
            }
            bitmapCreateBitmap = bitmapDecodeRegion;
            drawable2 = null;
            if (drawable2 != null) {
                int intrinsicHeight = drawable2.getIntrinsicHeight() * drawable2.getIntrinsicWidth();
                double dSqrt = intrinsicHeight > 12544 ? Math.sqrt(12544.0d / intrinsicHeight) : 1.0d;
                bitmapCreateBitmap = Bitmap.createBitmap((int) (drawable2.getIntrinsicWidth() * dSqrt), (int) (drawable2.getIntrinsicHeight() * dSqrt), Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(bitmapCreateBitmap);
                drawable2.setBounds(0, 0, bitmapCreateBitmap.getWidth(), bitmapCreateBitmap.getHeight());
                drawable2.draw(canvas);
            }
            String strH222222 = c0.h(wallpaperId, "1,");
            if (bitmapCreateBitmap != null) {
                strH222222 = strH222222 + "," + this.f46384c.a(bitmapCreateBitmap, 12544);
            }
            sendBroadcast(new Intent("com.android.launcher3.uioverrides.dynamicui.WallpaperManagerCompatVL.EXTRACTION_COMPLETE").setPackage(getPackageName()).putExtra("wallpaper_parsed_colors", strH222222));
            jobFinished(jobParameters, false);
        }
        drawable = wallpaperInfo.loadThumbnail(getPackageManager());
        Bitmap bitmap2 = bitmapDecodeRegion;
        drawable2 = drawable;
        bitmapCreateBitmap = bitmap2;
        if (drawable2 != null) {
        }
        String strH2222222 = c0.h(wallpaperId, "1,");
        if (bitmapCreateBitmap != null) {
        }
        sendBroadcast(new Intent("com.android.launcher3.uioverrides.dynamicui.WallpaperManagerCompatVL.EXTRACTION_COMPLETE").setPackage(getPackageName()).putExtra("wallpaper_parsed_colors", strH2222222));
        jobFinished(jobParameters, false);
    }
}
