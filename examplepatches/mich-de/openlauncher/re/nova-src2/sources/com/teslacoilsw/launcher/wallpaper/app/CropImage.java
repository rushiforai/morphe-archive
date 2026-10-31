package com.teslacoilsw.launcher.wallpaper.app;

import a5.a1;
import a5.s0;
import ab.e0;
import ai.r4;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.webkit.MimeTypeMap;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Toast;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.android.launcher3.WallpaperCropActivity;
import com.teslacoilsw.launcher.wallpaper.app.CropImage;
import com.teslacoilsw.launcher.wallpaper.ui.GLRootView;
import com.teslacoilsw.launcher.widget.AlphaOptimizedFrameLayout;
import com.teslacoilsw.launcher.widget.AlphaOptimizedImageView;
import com.teslacoilsw.launcher.widget.AlphaOptimizedLinearLayout;
import com.teslacoilsw.launcher.widget.MaterialProgressBar;
import com.vungle.ads.internal.protos.Sdk;
import e30.h;
import fl.l;
import h30.a;
import h30.i;
import h30.j;
import h30.k;
import i30.e;
import i30.f;
import i30.u;
import j30.c;
import j30.g;
import ja.d;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Stack;
import java.util.WeakHashMap;
import m.m;
import tm.o;
import v9.b;

/* loaded from: classes4.dex */
public class CropImage extends m {
    public static final /* synthetic */ int Q = 0;
    public boolean A;
    public MaterialProgressBar B;
    public g C;
    public g D;
    public g E;
    public j F;
    public int G;
    public int H;
    public int I;
    public int J;
    public int K;
    public int L;
    public h M;
    public HashSet N;
    public b O;
    public boolean P;
    public GLRootView o;

    /* renamed from: p, reason: collision with root package name */
    public e30.j f46371p;

    /* renamed from: q, reason: collision with root package name */
    public AlertDialog f46372q;

    /* renamed from: r, reason: collision with root package name */
    public final r4 f46373r;

    /* renamed from: s, reason: collision with root package name */
    public final IntentFilter f46374s;

    /* renamed from: t, reason: collision with root package name */
    public int f46375t;

    /* renamed from: u, reason: collision with root package name */
    public f f46376u;

    /* renamed from: v, reason: collision with root package name */
    public e30.f f46377v;

    /* renamed from: w, reason: collision with root package name */
    public Bitmap f46378w;

    /* renamed from: x, reason: collision with root package name */
    public d f46379x;

    /* renamed from: y, reason: collision with root package name */
    public BitmapRegionDecoder f46380y;

    /* renamed from: z, reason: collision with root package name */
    public Bitmap f46381z;

    public CropImage() {
        new HashMap();
        this.f46372q = null;
        this.f46373r = new r4(this, 2);
        this.f46374s = new IntentFilter("android.intent.action.MEDIA_MOUNTED");
        this.f46375t = 0;
        this.A = false;
        this.M = h.f52111c;
        this.P = false;
    }

    public static Bitmap Z(CropImage cropImage, Rect rect) {
        Bitmap bitmapDecodeRegion;
        int i5;
        f30.f.a(rect.width() > 0 && rect.height() > 0);
        Bundle extras = cropImage.getIntent().getExtras();
        int iWidth = rect.width();
        int iHeight = rect.height();
        int i11 = cropImage.K;
        if (i11 == -1 || (i5 = cropImage.L) == -1) {
            float f11 = iWidth;
            float f12 = iHeight;
            float fMax = Math.max(f11 / extras.getInt("outputX"), f12 / extras.getInt("outputY"));
            iWidth = (int) (f11 / fMax);
            iHeight = (int) (f12 / fMax);
            cropImage.K = iWidth;
            cropImage.L = iHeight;
        } else if (i11 != 0 && i5 != 0) {
            iWidth = i11;
            iHeight = i5;
        }
        if (iWidth * iHeight > 5000000) {
            float fSqrt = (float) Math.sqrt((5000000 / iWidth) / iHeight);
            mc0.d.f76206a.n("scale down the cropped image: %s", Float.valueOf(fSqrt));
            iWidth = Math.round(iWidth * fSqrt);
            iHeight = Math.round(fSqrt * iHeight);
        }
        Rect rect2 = new Rect(0, 0, iWidth, iHeight);
        float fWidth = iWidth / rect.width();
        float fHeight = iHeight / rect.height();
        if (extras == null) {
            if (fWidth > 1.0f) {
                fWidth = 1.0f;
            }
            if (fHeight > 1.0f) {
                fHeight = 1.0f;
            }
        }
        int iRound = Math.round(rect.width() * fWidth);
        int iRound2 = Math.round(rect.height() * fHeight);
        rect2.set(Math.round((iWidth - iRound) / 2.0f), Math.round((iHeight - iRound2) / 2.0f), Math.round((iRound + iWidth) / 2.0f), Math.round((iRound2 + iHeight) / 2.0f));
        Bitmap bitmap = cropImage.f46381z;
        if (bitmap != null) {
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(iWidth, iHeight, Bitmap.Config.ARGB_8888);
            new Canvas(bitmapCreateBitmap).drawBitmap(bitmap, rect, rect2, (Paint) null);
            return bitmapCreateBitmap;
        }
        if (!cropImage.A) {
            int i12 = cropImage.F.f59083g;
            f fVar = cropImage.f46376u;
            int i13 = 360 - i12;
            l0(rect, fVar.f61286m, fVar.n, i13);
            l0(rect2, iWidth, iHeight, i13);
            Bitmap bitmapCreateBitmap2 = Bitmap.createBitmap(iWidth, iHeight, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmapCreateBitmap2);
            k0(canvas, iWidth, iHeight, i12);
            canvas.drawBitmap(cropImage.f46378w, rect, rect2, new Paint(2));
            return bitmapCreateBitmap2;
        }
        int i14 = cropImage.F.f59083g;
        f fVar2 = cropImage.f46376u;
        int i15 = 360 - i14;
        l0(rect, fVar2.f61286m, fVar2.n, i15);
        l0(rect2, iWidth, iHeight, i15);
        BitmapFactory.Options options = new BitmapFactory.Options();
        int iA = ic.b.A(Math.max(fWidth, fHeight));
        options.inSampleSize = iA;
        if (rect.width() / iA == rect2.width() && rect.height() / iA == rect2.height() && iWidth == rect2.width() && iHeight == rect2.height() && i14 == 0) {
            synchronized (cropImage.f46380y) {
                bitmapDecodeRegion = cropImage.f46380y.decodeRegion(rect, options);
            }
            return bitmapDecodeRegion;
        }
        Bitmap bitmapCreateBitmap3 = Bitmap.createBitmap(iWidth, iHeight, Bitmap.Config.ARGB_8888);
        Canvas canvas2 = new Canvas(bitmapCreateBitmap3);
        k0(canvas2, iWidth, iHeight, i14);
        a0(canvas2, cropImage.f46380y, rect, rect2, iA, EventBridgeChannel.QUEUE_CAPACITY);
        return bitmapCreateBitmap3;
    }

    public static void a0(Canvas canvas, BitmapRegionDecoder bitmapRegionDecoder, Rect rect, Rect rect2, int i5, int i11) {
        boolean z11;
        int i12;
        Bitmap bitmapDecodeRegion;
        int i13 = i11 * i5;
        Rect rect3 = new Rect();
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inPreferredConfig = Bitmap.Config.ARGB_8888;
        options.inSampleSize = i5;
        int iSave = canvas.save();
        canvas.translate(rect2.left, rect2.top);
        float f11 = i5;
        canvas.scale((rect2.width() * f11) / rect.width(), (f11 * rect2.height()) / rect.height());
        Paint paint = new Paint(2);
        int i14 = rect.left;
        int i15 = 0;
        loop0: while (true) {
            if (i14 >= rect.right) {
                z11 = false;
                break;
            }
            int i16 = rect.top;
            int i17 = 0;
            while (i16 < rect.bottom) {
                int i18 = i16 + i13;
                rect3.set(i14, i16, i14 + i13, i18);
                if (rect3.intersect(rect)) {
                    synchronized (bitmapRegionDecoder) {
                        bitmapDecodeRegion = bitmapRegionDecoder.decodeRegion(rect3, options);
                    }
                    if (bitmapDecodeRegion == null) {
                        mc0.d.f76206a.n("decodeFailed %s %s %s", rect, rect2, Integer.valueOf(i13));
                        z11 = true;
                        break loop0;
                    } else {
                        i12 = i18;
                        canvas.drawBitmap(bitmapDecodeRegion, i15, i17, paint);
                        bitmapDecodeRegion.recycle();
                    }
                } else {
                    i12 = i18;
                }
                i17 += i11;
                i16 = i12;
            }
            i14 += i13;
            i15 += i11;
        }
        canvas.restoreToCount(iSave);
        if (z11 && i11 == 512) {
            int iMin = Math.min(rect.width(), rect.height()) / ((int) Math.ceil(Math.min(rect.width(), rect.height()) / 512.0f));
            canvas.drawColor(0, PorterDuff.Mode.CLEAR);
            a0(canvas, bitmapRegionDecoder, rect, rect2, i5, iMin);
        }
    }

    public static void k0(Canvas canvas, int i5, int i11, int i12) {
        canvas.translate(i5 / 2, i11 / 2);
        canvas.rotate(i12);
        if (((i12 / 90) & 1) == 0) {
            canvas.translate((-i5) / 2, (-i11) / 2);
        } else {
            canvas.translate((-i11) / 2, (-i5) / 2);
        }
    }

    public static void l0(Rect rect, int i5, int i11, int i12) {
        if (i12 == 0 || i12 == 360) {
            return;
        }
        int iWidth = rect.width();
        int iHeight = rect.height();
        if (i12 == 90) {
            int i13 = rect.left;
            rect.top = i13;
            int i14 = i11 - rect.bottom;
            rect.left = i14;
            rect.right = i14 + iHeight;
            rect.bottom = i13 + iWidth;
            return;
        }
        if (i12 == 180) {
            int i15 = i5 - rect.right;
            rect.left = i15;
            int i16 = i11 - rect.bottom;
            rect.top = i16;
            rect.right = i15 + iWidth;
            rect.bottom = i16 + iHeight;
            return;
        }
        if (i12 != 270) {
            throw new AssertionError();
        }
        int i17 = rect.top;
        rect.left = i17;
        int i18 = i5 - rect.right;
        rect.top = i18;
        rect.right = i17 + iHeight;
        rect.bottom = i18 + iWidth;
    }

    public static boolean m0(g gVar, Bitmap bitmap, Bitmap.CompressFormat compressFormat, OutputStream outputStream) {
        c cVar = new c();
        cVar.f68882b = false;
        long[] jArr = f30.f.f54304a;
        outputStream.getClass();
        cVar.f68881a = outputStream;
        gVar.c(new cm.f(cVar, 10));
        try {
            bitmap.compress(compressFormat, 90, outputStream);
            return !gVar.f68890e;
        } finally {
            gVar.c(null);
            f30.f.c(outputStream);
        }
    }

    public final c00.d b0() {
        c00.d dVar;
        o oVarH0 = o.h0(this);
        synchronized (oVarH0) {
            try {
                if (((c00.d) oVarH0.f89494c) == null) {
                    c00.d dVar2 = new c00.d((Context) oVarH0.f89493b);
                    oVarH0.f89494c = dVar2;
                    dVar2.t();
                }
                dVar = (c00.d) oVarH0.f89494c;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return dVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0025  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String c0() {
        String stringExtra = getIntent().getStringExtra("outputFormat");
        if (stringExtra == null) {
            j jVar = this.F;
            if (jVar != null) {
                String str = jVar.f59078b;
                stringExtra = (str.contains("png") || str.contains("gif")) ? "PNG" : "JPEG";
            }
        }
        String lowerCase = stringExtra.toLowerCase(Locale.ENGLISH);
        return (lowerCase.equals("png") || lowerCase.equals("gif")) ? "png" : "jpg";
    }

    public final synchronized e30.j d0() {
        try {
            if (this.f46371p == null) {
                e30.j jVar = new e30.j();
                jVar.f52117a = false;
                jVar.f52118b = new Stack();
                this.f46371p = jVar;
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return this.f46371p;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:20:0x009c  */
    /* JADX WARN: Type inference failed for: r1v4, types: [h30.h] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void e0() {
        i iVarA;
        j jVar;
        i iVar;
        String str;
        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            Bitmap bitmap = (Bitmap) extras.getParcelable("icon");
            this.f46381z = bitmap;
            if (bitmap != null) {
                d dVar = new d(bitmap, Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE);
                this.f46379x = dVar;
                o0(dVar.f69283b, dVar.f69284c);
                this.f46376u.u(this.f46379x, 0);
                this.f46376u.r();
                this.f46375t = 1;
                return;
            }
        }
        this.f46377v.sendEmptyMessageDelayed(6, 300L);
        Uri data = getIntent().getData();
        c00.d dVarB0 = b0();
        String type = getIntent().getType();
        j jVarA = null;
        if (data == null) {
            dVarB0.getClass();
        } else {
            for (k kVar : ((LinkedHashMap) dVarB0.f19045c).values()) {
                kVar.getClass();
                if ("file".equals(data.getScheme())) {
                    String type2 = MimeTypeMap.getSingleton().getMimeTypeFromExtension(MimeTypeMap.getFileExtensionFromUrl(data.toString()).toLowerCase(Locale.ENGLISH));
                    if (type2 == null) {
                        type2 = kVar.f59085a.getContentResolver().getType(data);
                        if (type2 == null) {
                            type2 = "image/*";
                        }
                    }
                    if (type != null && (!"image/*".equals(type) || !type2.startsWith("image/"))) {
                        type2 = type;
                    }
                    if (type2.startsWith("image/")) {
                        String str2 = "/uri/" + URLEncoder.encode(data.toString()) + "/" + URLEncoder.encode(type2);
                        synchronized (i.class) {
                            try {
                                String[] strArrC = i.c(str2);
                                iVarA = i.f59070e;
                                for (String str3 : strArrC) {
                                    iVarA = iVarA.a(str3);
                                }
                            } finally {
                            }
                        }
                    } else {
                        iVarA = null;
                    }
                    if (iVarA != null) {
                        break;
                    }
                }
            }
        }
        iVarA = null;
        if (iVarA == null) {
            mc0.d.f76206a.n("cannot get path for: %s, or no data given", data);
        } else {
            synchronized (i.class) {
                WeakReference weakReference = iVarA.f59073c;
                jVar = weakReference == null ? null : (h30.h) weakReference.get();
            }
            if (jVar != null) {
                jVarA = jVar;
            } else {
                LinkedHashMap linkedHashMap = (LinkedHashMap) dVarB0.f19045c;
                i iVar2 = i.f59070e;
                if (iVarA == iVar2) {
                    str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                } else {
                    synchronized (i.class) {
                        if (iVarA == iVar2) {
                            throw new IllegalStateException();
                        }
                        iVar = iVarA;
                        while (true) {
                            i iVar3 = iVar.f59071a;
                            if (iVar3 == i.f59070e) {
                                break;
                            } else {
                                iVar = iVar3;
                            }
                        }
                    }
                    str = iVar.f59072b;
                }
                k kVar2 = (k) linkedHashMap.get(str);
                if (kVar2 == null) {
                    mc0.d.f76206a.n("cannot find media source for path: %s", iVarA);
                } else {
                    try {
                        jVarA = kVar2.a(iVarA);
                    } catch (Throwable th2) {
                        mc0.d.f76206a.p(th2, "exception in creating media object: %s", iVarA);
                    }
                }
            }
            jVarA = jVarA;
        }
        this.F = jVarA;
        if (jVarA == null) {
            return;
        }
        if (!this.P) {
            int i5 = "file".equals(jVarA.f59077a.getScheme()) ? 548 : 544;
            String str4 = jVarA.f59078b;
            if (str4 != null) {
                String lowerCase = str4.toLowerCase(Locale.ENGLISH);
                if (lowerCase.startsWith("image/") && !lowerCase.equals("image/gif") && !lowerCase.endsWith("bmp")) {
                    i5 |= 64;
                }
            }
            if ((i5 & 64) != 0) {
                l lVarK0 = o.h0(this).k0();
                j jVar2 = this.F;
                int i11 = 1;
                e30.i iVar4 = new e30.i(i11);
                iVar4.f52116b = jVar2;
                this.C = lVarK0.C(iVar4, new e30.g(this, i11));
                return;
            }
        }
        l lVarK02 = o.h0(this).k0();
        j jVar3 = this.F;
        e30.i iVar5 = new e30.i(0);
        iVar5.f52116b = jVar3;
        this.D = lVarK02.C(iVar5, new e30.g(this, 2));
    }

    public final void f0(Bundle bundle) {
        super.onCreate(bundle);
        t2.c.z(this);
        Window window = getWindow();
        if (getResources().getConfiguration().orientation == 1) {
            window.clearFlags(1024);
        } else {
            window.addFlags(1024);
        }
        getWindow().setBackgroundDrawable(null);
    }

    public final void g0() {
        super.onPause();
        this.o.onPause();
        this.o.a();
        try {
            e30.j jVarD0 = d0();
            if (jVarD0.f52117a) {
                jVarD0.f52117a = false;
                if (!((Stack) jVarD0.f52118b).isEmpty()) {
                    jVarD0.j();
                    throw null;
                }
            }
            c00.d dVarB0 = b0();
            int i5 = dVarB0.f19044b - 1;
            dVarB0.f19044b = i5;
            if (i5 == 0) {
                Iterator it = ((LinkedHashMap) dVarB0.f19045c).values().iterator();
                while (it.hasNext()) {
                    ((k) it.next()).getClass();
                }
            }
            this.o.e();
            a aVar = j.f59075i;
            synchronized (aVar) {
                aVar.f59040a.clear();
            }
            a aVar2 = j.f59076j;
            synchronized (aVar2) {
                aVar2.f59040a.clear();
            }
        } catch (Throwable th2) {
            this.o.e();
            throw th2;
        }
    }

    public final void h0() {
        super.onResume();
        this.o.a();
        try {
            e30.j jVarD0 = d0();
            if (!jVarD0.f52117a) {
                jVarD0.f52117a = true;
                if (!((Stack) jVarD0.f52118b).isEmpty()) {
                    jVarD0.j();
                    throw null;
                }
            }
            c00.d dVarB0 = b0();
            int i5 = dVarB0.f19044b + 1;
            dVarB0.f19044b = i5;
            if (i5 == 1) {
                Iterator it = ((LinkedHashMap) dVarB0.f19045c).values().iterator();
                while (it.hasNext()) {
                    ((k) it.next()).getClass();
                }
            }
            this.o.e();
            this.o.onResume();
        } catch (Throwable th2) {
            this.o.e();
            throw th2;
        }
    }

    public final void i0() {
        RectF rectF;
        Bundle extras = getIntent().getExtras();
        f fVar = this.f46376u;
        e eVar = fVar.f61283j;
        if (eVar.f() == 1) {
            rectF = null;
        } else {
            RectF rectF2 = eVar.f61273g;
            float f11 = rectF2.left;
            float f12 = fVar.f61286m;
            float f13 = rectF2.top;
            float f14 = fVar.n;
            rectF = new RectF(f11 * f12, f13 * f14, rectF2.right * f12, rectF2.bottom * f14);
        }
        if (rectF == null) {
            return;
        }
        this.f46375t = 2;
        if (extras != null) {
            extras.getBoolean("set-as-wallpaper", true);
        }
        this.B.setVisibility(0);
        this.o.setEnabled(false);
        this.O.f92262g.setEnabled(false);
        this.O.f92264i.setAlpha(0.5f);
        this.E = o.h0(this).k0().C(new c10.a(this, rectF, false, 9), new e30.g(this, 0));
    }

    public final void j0(Bundle bundle) {
        this.o.a();
        try {
            super.onSaveInstanceState(bundle);
            Stack stack = (Stack) d0().f52118b;
            Parcelable[] parcelableArr = new Parcelable[stack.size()];
            Iterator it = stack.iterator();
            if (!it.hasNext()) {
                bundle.putParcelableArray("activity-state", parcelableArr);
            } else {
                if (it.next() != null) {
                    throw new ClassCastException();
                }
                new Bundle();
                throw null;
            }
        } finally {
            this.o.e();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0096  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void n0(h hVar) {
        int iMax;
        int i5;
        float fMax;
        f fVar;
        this.M = hVar;
        int iOrdinal = hVar.ordinal();
        float fMin = 0.0f;
        if (iOrdinal == 0) {
            iMax = this.G;
            i5 = this.H;
        } else {
            if (iOrdinal != 1) {
                fMax = 1.0f;
                if (iOrdinal == 2) {
                    iMax = this.I;
                    int i11 = this.J;
                    fMax = Math.max(Math.max(this.G, this.H) / i11, 1.0f);
                    i5 = i11;
                    fMin = Math.min(this.G, this.H) / iMax;
                } else if (iOrdinal == 3) {
                    iMax = Math.max(this.G, this.H);
                    fMin = Math.min(this.G, this.H) / Math.max(this.G, this.H);
                    i5 = iMax;
                } else {
                    if (iOrdinal != 4) {
                        throw new RuntimeException("Invalid crop mode " + hVar);
                    }
                    iMax = -1;
                    i5 = -1;
                }
                float f11 = hVar != h.f52113e ? -1.0f : iMax / i5;
                this.L = i5;
                this.K = iMax;
                fVar = this.f46376u;
                fVar.f61280g = f11;
                fVar.f61281h = fMin;
                fVar.f61282i = fMax;
                if (fVar.f61283j.f() == 0) {
                    this.f46376u.r();
                    this.f46376u.h();
                }
                invalidateOptionsMenu();
            }
            iMax = this.H;
            i5 = this.G;
        }
        fMax = 0.0f;
        if (hVar != h.f52113e) {
        }
        this.L = i5;
        this.K = iMax;
        fVar = this.f46376u;
        fVar.f61280g = f11;
        fVar.f61281h = fMin;
        fVar.f61282i = fMax;
        if (fVar.f61283j.f() == 0) {
        }
        invalidateOptionsMenu();
    }

    public final void o0(int i5, int i11) {
        this.f46376u.r();
        int iMax = Math.max(this.G, this.H);
        HashSet hashSet = this.N;
        h hVar = h.f52109a;
        if (hashSet.contains(hVar) && i5 == this.G && i11 == this.H) {
            n0(hVar);
        } else {
            HashSet hashSet2 = this.N;
            h hVar2 = h.f52110b;
            if (hashSet2.contains(hVar2) && i5 == this.H && i11 == this.G) {
                n0(hVar2);
            } else {
                HashSet hashSet3 = this.N;
                h hVar3 = h.f52112d;
                if (hashSet3.contains(hVar3) && i5 == iMax && i11 == iMax) {
                    n0(hVar3);
                } else {
                    HashSet hashSet4 = this.N;
                    h hVar4 = h.f52111c;
                    if (hashSet4.contains(hVar4)) {
                        n0(hVar4);
                    } else if (this.N.contains(hVar3)) {
                        n0(hVar3);
                    }
                }
            }
        }
        this.f46377v.sendEmptyMessage(5);
    }

    @Override // androidx.fragment.app.m0, g.o, android.app.Activity
    public final void onActivityResult(int i5, int i11, Intent intent) {
        super.onActivityResult(i5, i11, intent);
        this.o.a();
        try {
            d0().j();
            throw null;
        } catch (Throwable th2) {
            this.o.e();
            throw th2;
        }
    }

    @Override // g.o, android.app.Activity
    public final void onBackPressed() {
        finish();
    }

    @Override // m.m, g.o, android.app.Activity, android.content.ComponentCallbacks
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        Iterator it = ((Stack) this.f46371p.f52118b).iterator();
        if (it.hasNext()) {
            throw u4.e(it);
        }
        invalidateOptionsMenu();
        Window window = getWindow();
        if (getResources().getConfiguration().orientation == 1) {
            window.clearFlags(1024);
        } else {
            window.addFlags(1024);
        }
    }

    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        f0(bundle);
        getWindow().setStatusBarColor(getColor(2131100420));
        String[] stringArray = null;
        final int i5 = 0;
        View viewInflate = getLayoutInflater().inflate(2131623969, (ViewGroup) null, false);
        int i11 = 2131427625;
        AlphaOptimizedFrameLayout alphaOptimizedFrameLayout = (AlphaOptimizedFrameLayout) e0.x(2131427625, viewInflate);
        if (alphaOptimizedFrameLayout != null) {
            i11 = 2131427786;
            AlphaOptimizedImageView alphaOptimizedImageView = (AlphaOptimizedImageView) e0.x(2131427786, viewInflate);
            if (alphaOptimizedImageView != null) {
                i11 = 2131427789;
                LinearLayout linearLayout = (LinearLayout) e0.x(2131427789, viewInflate);
                if (linearLayout != null) {
                    i11 = 2131427790;
                    AlphaOptimizedImageView alphaOptimizedImageView2 = (AlphaOptimizedImageView) e0.x(2131427790, viewInflate);
                    if (alphaOptimizedImageView2 != null) {
                        i11 = 2131427792;
                        AlphaOptimizedImageView alphaOptimizedImageView3 = (AlphaOptimizedImageView) e0.x(2131427792, viewInflate);
                        if (alphaOptimizedImageView3 != null) {
                            i11 = 2131427894;
                            AlphaOptimizedFrameLayout alphaOptimizedFrameLayout2 = (AlphaOptimizedFrameLayout) e0.x(2131427894, viewInflate);
                            if (alphaOptimizedFrameLayout2 != null) {
                                i11 = 2131428283;
                                MaterialProgressBar materialProgressBar = (MaterialProgressBar) e0.x(2131428283, viewInflate);
                                if (materialProgressBar != null) {
                                    i11 = 2131429060;
                                    AlphaOptimizedLinearLayout alphaOptimizedLinearLayout = (AlphaOptimizedLinearLayout) e0.x(2131429060, viewInflate);
                                    if (alphaOptimizedLinearLayout != null) {
                                        i11 = 2131429063;
                                        View viewX = e0.x(2131429063, viewInflate);
                                        if (viewX != null) {
                                            RelativeLayout relativeLayout = (RelativeLayout) viewInflate;
                                            this.O = new b(relativeLayout, alphaOptimizedFrameLayout, alphaOptimizedImageView, linearLayout, alphaOptimizedImageView2, alphaOptimizedImageView3, alphaOptimizedFrameLayout2, materialProgressBar, alphaOptimizedLinearLayout, viewX);
                                            setContentView(relativeLayout);
                                            this.o = (GLRootView) findViewById(2131428098);
                                            TypedValue typedValue = new TypedValue();
                                            char c11 = 1;
                                            char c12 = 1;
                                            int iComplexToDimensionPixelSize = getTheme().resolveAttribute(16843499, typedValue, true) ? TypedValue.complexToDimensionPixelSize(typedValue.data, getResources().getDisplayMetrics()) : 0;
                                            AlphaOptimizedLinearLayout alphaOptimizedLinearLayout2 = this.O.f92264i;
                                            e30.c cVar = new e30.c(iComplexToDimensionPixelSize, i5);
                                            WeakHashMap weakHashMap = a1.f250a;
                                            s0.l(alphaOptimizedLinearLayout2, cVar);
                                            this.O.f92261f.setOnClickListener(new View.OnClickListener(this) { // from class: e30.d

                                                /* renamed from: b, reason: collision with root package name */
                                                public final /* synthetic */ CropImage f52102b;

                                                {
                                                    this.f52102b = this;
                                                }

                                                @Override // android.view.View.OnClickListener
                                                public final void onClick(View view) {
                                                    int i12 = i5;
                                                    h hVar = h.f52112d;
                                                    h hVar2 = h.f52113e;
                                                    CropImage cropImage = this.f52102b;
                                                    switch (i12) {
                                                        case 0:
                                                            int i13 = CropImage.Q;
                                                            cropImage.n0(hVar);
                                                            cropImage.O.f92258c.setColorFilter(cropImage.M == hVar2 ? -1 : -9934744);
                                                            cropImage.O.f92261f.setColorFilter(cropImage.M != hVar ? -9934744 : -1);
                                                            break;
                                                        case 1:
                                                            int i14 = CropImage.Q;
                                                            cropImage.n0(hVar2);
                                                            cropImage.O.f92258c.setColorFilter(cropImage.M == hVar2 ? -1 : -9934744);
                                                            cropImage.O.f92261f.setColorFilter(cropImage.M != hVar ? -9934744 : -1);
                                                            break;
                                                        case 2:
                                                            if (cropImage.O.f92259d.getVisibility() == 8) {
                                                                cropImage.O.f92259d.setVisibility(0);
                                                                cropImage.O.f92260e.setColorFilter(-16738680);
                                                                cropImage.O.f92258c.setColorFilter(cropImage.M == hVar2 ? -1 : -9934744);
                                                                cropImage.O.f92261f.setColorFilter(cropImage.M != hVar ? -9934744 : -1);
                                                                break;
                                                            } else {
                                                                cropImage.O.f92259d.setVisibility(8);
                                                                cropImage.O.f92260e.setColorFilter(-1);
                                                                break;
                                                            }
                                                        case 3:
                                                            int i15 = CropImage.Q;
                                                            cropImage.setResult(0);
                                                            cropImage.finish();
                                                            break;
                                                        default:
                                                            int i16 = CropImage.Q;
                                                            cropImage.i0();
                                                            break;
                                                    }
                                                }
                                            });
                                            AlphaOptimizedImageView alphaOptimizedImageView4 = this.O.f92258c;
                                            final char c13 = c12 == true ? 1 : 0;
                                            alphaOptimizedImageView4.setOnClickListener(new View.OnClickListener(this) { // from class: e30.d

                                                /* renamed from: b, reason: collision with root package name */
                                                public final /* synthetic */ CropImage f52102b;

                                                {
                                                    this.f52102b = this;
                                                }

                                                @Override // android.view.View.OnClickListener
                                                public final void onClick(View view) {
                                                    int i12 = c13;
                                                    h hVar = h.f52112d;
                                                    h hVar2 = h.f52113e;
                                                    CropImage cropImage = this.f52102b;
                                                    switch (i12) {
                                                        case 0:
                                                            int i13 = CropImage.Q;
                                                            cropImage.n0(hVar);
                                                            cropImage.O.f92258c.setColorFilter(cropImage.M == hVar2 ? -1 : -9934744);
                                                            cropImage.O.f92261f.setColorFilter(cropImage.M != hVar ? -9934744 : -1);
                                                            break;
                                                        case 1:
                                                            int i14 = CropImage.Q;
                                                            cropImage.n0(hVar2);
                                                            cropImage.O.f92258c.setColorFilter(cropImage.M == hVar2 ? -1 : -9934744);
                                                            cropImage.O.f92261f.setColorFilter(cropImage.M != hVar ? -9934744 : -1);
                                                            break;
                                                        case 2:
                                                            if (cropImage.O.f92259d.getVisibility() == 8) {
                                                                cropImage.O.f92259d.setVisibility(0);
                                                                cropImage.O.f92260e.setColorFilter(-16738680);
                                                                cropImage.O.f92258c.setColorFilter(cropImage.M == hVar2 ? -1 : -9934744);
                                                                cropImage.O.f92261f.setColorFilter(cropImage.M != hVar ? -9934744 : -1);
                                                                break;
                                                            } else {
                                                                cropImage.O.f92259d.setVisibility(8);
                                                                cropImage.O.f92260e.setColorFilter(-1);
                                                                break;
                                                            }
                                                        case 3:
                                                            int i15 = CropImage.Q;
                                                            cropImage.setResult(0);
                                                            cropImage.finish();
                                                            break;
                                                        default:
                                                            int i16 = CropImage.Q;
                                                            cropImage.i0();
                                                            break;
                                                    }
                                                }
                                            });
                                            final int i12 = 2;
                                            this.O.f92260e.setOnClickListener(new View.OnClickListener(this) { // from class: e30.d

                                                /* renamed from: b, reason: collision with root package name */
                                                public final /* synthetic */ CropImage f52102b;

                                                {
                                                    this.f52102b = this;
                                                }

                                                @Override // android.view.View.OnClickListener
                                                public final void onClick(View view) {
                                                    int i122 = i12;
                                                    h hVar = h.f52112d;
                                                    h hVar2 = h.f52113e;
                                                    CropImage cropImage = this.f52102b;
                                                    switch (i122) {
                                                        case 0:
                                                            int i13 = CropImage.Q;
                                                            cropImage.n0(hVar);
                                                            cropImage.O.f92258c.setColorFilter(cropImage.M == hVar2 ? -1 : -9934744);
                                                            cropImage.O.f92261f.setColorFilter(cropImage.M != hVar ? -9934744 : -1);
                                                            break;
                                                        case 1:
                                                            int i14 = CropImage.Q;
                                                            cropImage.n0(hVar2);
                                                            cropImage.O.f92258c.setColorFilter(cropImage.M == hVar2 ? -1 : -9934744);
                                                            cropImage.O.f92261f.setColorFilter(cropImage.M != hVar ? -9934744 : -1);
                                                            break;
                                                        case 2:
                                                            if (cropImage.O.f92259d.getVisibility() == 8) {
                                                                cropImage.O.f92259d.setVisibility(0);
                                                                cropImage.O.f92260e.setColorFilter(-16738680);
                                                                cropImage.O.f92258c.setColorFilter(cropImage.M == hVar2 ? -1 : -9934744);
                                                                cropImage.O.f92261f.setColorFilter(cropImage.M != hVar ? -9934744 : -1);
                                                                break;
                                                            } else {
                                                                cropImage.O.f92259d.setVisibility(8);
                                                                cropImage.O.f92260e.setColorFilter(-1);
                                                                break;
                                                            }
                                                        case 3:
                                                            int i15 = CropImage.Q;
                                                            cropImage.setResult(0);
                                                            cropImage.finish();
                                                            break;
                                                        default:
                                                            int i16 = CropImage.Q;
                                                            cropImage.i0();
                                                            break;
                                                    }
                                                }
                                            });
                                            this.O.f92258c.setOnLongClickListener(new View.OnLongClickListener(this) { // from class: e30.e

                                                /* renamed from: b, reason: collision with root package name */
                                                public final /* synthetic */ CropImage f52104b;

                                                {
                                                    this.f52104b = this;
                                                }

                                                @Override // android.view.View.OnLongClickListener
                                                public final boolean onLongClick(View view) {
                                                    int i13 = i5;
                                                    CropImage cropImage = this.f52104b;
                                                    switch (i13) {
                                                        case 0:
                                                            int i14 = CropImage.Q;
                                                            Toast.makeText(cropImage.getApplicationContext(), cropImage.getString(2132017695), 0).show();
                                                            break;
                                                        default:
                                                            int i15 = CropImage.Q;
                                                            Toast.makeText(cropImage.getApplicationContext(), cropImage.getString(2132017696), 0).show();
                                                            break;
                                                    }
                                                    return true;
                                                }
                                            });
                                            AlphaOptimizedImageView alphaOptimizedImageView5 = this.O.f92261f;
                                            final char c14 = c11 == true ? 1 : 0;
                                            alphaOptimizedImageView5.setOnLongClickListener(new View.OnLongClickListener(this) { // from class: e30.e

                                                /* renamed from: b, reason: collision with root package name */
                                                public final /* synthetic */ CropImage f52104b;

                                                {
                                                    this.f52104b = this;
                                                }

                                                @Override // android.view.View.OnLongClickListener
                                                public final boolean onLongClick(View view) {
                                                    int i13 = c14;
                                                    CropImage cropImage = this.f52104b;
                                                    switch (i13) {
                                                        case 0:
                                                            int i14 = CropImage.Q;
                                                            Toast.makeText(cropImage.getApplicationContext(), cropImage.getString(2132017695), 0).show();
                                                            break;
                                                        default:
                                                            int i15 = CropImage.Q;
                                                            Toast.makeText(cropImage.getApplicationContext(), cropImage.getString(2132017696), 0).show();
                                                            break;
                                                    }
                                                    return true;
                                                }
                                            });
                                            this.B = this.O.f92263h;
                                            f fVar = new f();
                                            fVar.f61280g = -1.0f;
                                            fVar.f61281h = 0.0f;
                                            fVar.f61282i = 0.0f;
                                            fVar.f61285l = new i30.d(fVar);
                                            fVar.f61286m = -1;
                                            fVar.n = -1;
                                            i30.k kVar = new i30.k();
                                            kVar.f61316a = 1.0f;
                                            kVar.f61317b = 0;
                                            fVar.f61287p = kVar;
                                            fVar.o = this;
                                            u uVar = new u(this);
                                            fVar.f61284k = uVar;
                                            e eVar = new e(fVar);
                                            fVar.f61283j = eVar;
                                            fVar.a(uVar);
                                            fVar.a(eVar);
                                            eVar.q(1);
                                            kVar.f61317b = -3355444;
                                            long[] jArr = f30.f.f54304a;
                                            kVar.f61316a = 3.0f;
                                            this.f46376u = fVar;
                                            GLRootView gLRootView = this.o;
                                            f fVar2 = gLRootView.f46388c;
                                            if (fVar2 != fVar) {
                                                if (fVar2 != null) {
                                                    if (gLRootView.f46396k) {
                                                        long jUptimeMillis = SystemClock.uptimeMillis();
                                                        MotionEvent motionEventObtain = MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0);
                                                        gLRootView.f46388c.b(motionEventObtain);
                                                        motionEventObtain.recycle();
                                                        gLRootView.f46396k = false;
                                                    }
                                                    f fVar3 = gLRootView.f46388c;
                                                    f30.f.a(fVar3.f61321c == null && fVar3.f61320b != null);
                                                    fVar3.k();
                                                    WeakHashMap weakHashMap2 = i30.a.f61245h;
                                                    synchronized (weakHashMap2) {
                                                        try {
                                                            Iterator it = weakHashMap2.keySet().iterator();
                                                            while (it.hasNext()) {
                                                                ((i30.a) it.next()).a();
                                                            }
                                                        } finally {
                                                        }
                                                    }
                                                }
                                                gLRootView.f46388c = fVar;
                                                f30.f.a(fVar.f61321c == null && fVar.f61320b == null);
                                                fVar.j(gLRootView);
                                                gLRootView.c();
                                            }
                                            final int i13 = 3;
                                            this.O.f92257b.setOnClickListener(new View.OnClickListener(this) { // from class: e30.d

                                                /* renamed from: b, reason: collision with root package name */
                                                public final /* synthetic */ CropImage f52102b;

                                                {
                                                    this.f52102b = this;
                                                }

                                                @Override // android.view.View.OnClickListener
                                                public final void onClick(View view) {
                                                    int i122 = i13;
                                                    h hVar = h.f52112d;
                                                    h hVar2 = h.f52113e;
                                                    CropImage cropImage = this.f52102b;
                                                    switch (i122) {
                                                        case 0:
                                                            int i132 = CropImage.Q;
                                                            cropImage.n0(hVar);
                                                            cropImage.O.f92258c.setColorFilter(cropImage.M == hVar2 ? -1 : -9934744);
                                                            cropImage.O.f92261f.setColorFilter(cropImage.M != hVar ? -9934744 : -1);
                                                            break;
                                                        case 1:
                                                            int i14 = CropImage.Q;
                                                            cropImage.n0(hVar2);
                                                            cropImage.O.f92258c.setColorFilter(cropImage.M == hVar2 ? -1 : -9934744);
                                                            cropImage.O.f92261f.setColorFilter(cropImage.M != hVar ? -9934744 : -1);
                                                            break;
                                                        case 2:
                                                            if (cropImage.O.f92259d.getVisibility() == 8) {
                                                                cropImage.O.f92259d.setVisibility(0);
                                                                cropImage.O.f92260e.setColorFilter(-16738680);
                                                                cropImage.O.f92258c.setColorFilter(cropImage.M == hVar2 ? -1 : -9934744);
                                                                cropImage.O.f92261f.setColorFilter(cropImage.M != hVar ? -9934744 : -1);
                                                                break;
                                                            } else {
                                                                cropImage.O.f92259d.setVisibility(8);
                                                                cropImage.O.f92260e.setColorFilter(-1);
                                                                break;
                                                            }
                                                        case 3:
                                                            int i15 = CropImage.Q;
                                                            cropImage.setResult(0);
                                                            cropImage.finish();
                                                            break;
                                                        default:
                                                            int i16 = CropImage.Q;
                                                            cropImage.i0();
                                                            break;
                                                    }
                                                }
                                            });
                                            final int i14 = 4;
                                            this.O.f92262g.setOnClickListener(new View.OnClickListener(this) { // from class: e30.d

                                                /* renamed from: b, reason: collision with root package name */
                                                public final /* synthetic */ CropImage f52102b;

                                                {
                                                    this.f52102b = this;
                                                }

                                                @Override // android.view.View.OnClickListener
                                                public final void onClick(View view) {
                                                    int i122 = i14;
                                                    h hVar = h.f52112d;
                                                    h hVar2 = h.f52113e;
                                                    CropImage cropImage = this.f52102b;
                                                    switch (i122) {
                                                        case 0:
                                                            int i132 = CropImage.Q;
                                                            cropImage.n0(hVar);
                                                            cropImage.O.f92258c.setColorFilter(cropImage.M == hVar2 ? -1 : -9934744);
                                                            cropImage.O.f92261f.setColorFilter(cropImage.M != hVar ? -9934744 : -1);
                                                            break;
                                                        case 1:
                                                            int i142 = CropImage.Q;
                                                            cropImage.n0(hVar2);
                                                            cropImage.O.f92258c.setColorFilter(cropImage.M == hVar2 ? -1 : -9934744);
                                                            cropImage.O.f92261f.setColorFilter(cropImage.M != hVar ? -9934744 : -1);
                                                            break;
                                                        case 2:
                                                            if (cropImage.O.f92259d.getVisibility() == 8) {
                                                                cropImage.O.f92259d.setVisibility(0);
                                                                cropImage.O.f92260e.setColorFilter(-16738680);
                                                                cropImage.O.f92258c.setColorFilter(cropImage.M == hVar2 ? -1 : -9934744);
                                                                cropImage.O.f92261f.setColorFilter(cropImage.M != hVar ? -9934744 : -1);
                                                                break;
                                                            } else {
                                                                cropImage.O.f92259d.setVisibility(8);
                                                                cropImage.O.f92260e.setColorFilter(-1);
                                                                break;
                                                            }
                                                        case 3:
                                                            int i15 = CropImage.Q;
                                                            cropImage.setResult(0);
                                                            cropImage.finish();
                                                            break;
                                                        default:
                                                            int i16 = CropImage.Q;
                                                            cropImage.i0();
                                                            break;
                                                    }
                                                }
                                            });
                                            this.f46377v = new e30.f(this, this.o);
                                            Bundle extras = getIntent().getExtras();
                                            if (extras == null) {
                                                this.I = 0;
                                                this.J = 0;
                                                this.G = 0;
                                                this.H = 0;
                                            } else {
                                                extras.getString("actionBarTitle");
                                                this.I = extras.getInt("outputX", 0);
                                                this.J = extras.getInt("outputY", 0);
                                                this.G = extras.getInt("viewportX", 0);
                                                this.H = extras.getInt("viewportY", 0);
                                                stringArray = extras.getStringArray("cropModes");
                                            }
                                            if (this.I == 0 || this.J == 0) {
                                                Point pointA0 = WallpaperCropActivity.a0(getResources(), getWindowManager());
                                                this.I = pointA0.x;
                                                this.J = pointA0.y;
                                            }
                                            if (this.G == 0 || this.H == 0) {
                                                DisplayMetrics displayMetrics = new DisplayMetrics();
                                                getWindowManager().getDefaultDisplay().getRealMetrics(displayMetrics);
                                                this.H = Math.max(displayMetrics.widthPixels, displayMetrics.heightPixels);
                                                this.G = Math.min(displayMetrics.widthPixels, displayMetrics.heightPixels);
                                            }
                                            this.N = new HashSet();
                                            if (stringArray == null) {
                                                for (h hVar : h.values()) {
                                                    if (hVar != h.f52113e) {
                                                        this.N.add(hVar);
                                                    }
                                                }
                                            } else {
                                                for (String str : stringArray) {
                                                    this.N.add(h.valueOf(str));
                                                }
                                            }
                                            HashSet hashSet = this.N;
                                            h hVar2 = h.f52111c;
                                            if (hashSet.contains(hVar2)) {
                                                n0(hVar2);
                                                return;
                                            } else {
                                                n0((h) this.N.toArray()[0]);
                                                return;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(i11)));
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public final void onDestroy() {
        super.onDestroy();
        this.o.a();
        try {
            Stack stack = (Stack) d0().f52118b;
            if (stack.isEmpty()) {
                stack.clear();
            } else {
                if (stack.pop() != null) {
                    throw new ClassCastException();
                }
                throw null;
            }
        } finally {
            this.o.e();
        }
    }

    @Override // android.app.Activity
    public final boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 16908332) {
            return true;
        }
        finish();
        return true;
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public final void onPause() {
        boolean z11;
        boolean z12;
        boolean z13;
        g0();
        g gVar = this.C;
        if (gVar != null) {
            synchronized (gVar) {
                z13 = gVar.f68891f;
            }
            if (!z13) {
                gVar.a();
                gVar.b();
                this.B.setVisibility(8);
            }
        }
        g gVar2 = this.D;
        if (gVar2 != null) {
            synchronized (gVar2) {
                z12 = gVar2.f68891f;
            }
            if (!z12) {
                gVar2.a();
                gVar2.b();
                this.B.setVisibility(8);
            }
        }
        g gVar3 = this.E;
        if (gVar3 != null) {
            synchronized (gVar3) {
                z11 = gVar3.f68891f;
            }
            if (!z11) {
                gVar3.a();
                gVar3.b();
                this.B.setVisibility(8);
            }
        }
        GLRootView gLRootView = this.o;
        gLRootView.a();
        try {
            this.f46376u.s();
        } finally {
            gLRootView.e();
        }
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public final void onResume() {
        h0();
        if (this.f46375t == 0) {
            e0();
        }
        if (this.f46375t == 2) {
            i0();
        }
        GLRootView gLRootView = this.o;
        gLRootView.a();
        try {
            this.f46376u.t();
        } finally {
            gLRootView.e();
        }
    }

    @Override // g.o, n4.i, android.app.Activity
    public final void onSaveInstanceState(Bundle bundle) {
        j0(bundle);
        bundle.putInt("state", this.f46375t);
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public final void onStart() {
        super.onStart();
        if (getExternalCacheDir() == null) {
            this.f46372q = new AlertDialog.Builder(this).setIcon(17301543).setTitle("No Storage").setMessage("No external storage available.").setNegativeButton(17039360, new e30.b()).setOnCancelListener(new e30.a(this, 0)).show();
            registerReceiver(this.f46373r, this.f46374s);
        }
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public final void onStop() {
        super.onStop();
        if (this.f46372q != null) {
            unregisterReceiver(this.f46373r);
            this.f46372q.dismiss();
            this.f46372q = null;
        }
    }

    @Override // m.m, g.o, android.app.Activity
    public final void setContentView(int i5) {
        super.setContentView(i5);
        this.o = (GLRootView) findViewById(2131428098);
    }
}
