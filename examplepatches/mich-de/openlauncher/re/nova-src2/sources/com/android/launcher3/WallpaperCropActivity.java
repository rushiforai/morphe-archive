package com.android.launcher3;

import ah.h;
import android.app.WallpaperManager;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.view.Display;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.WindowManager;
import androidx.appcompat.widget.Toolbar;
import cl.l0;
import com.google.android.gms.internal.consent_sdk.e0;
import d9.f;
import e10.g3;
import e10.y2;
import h6.c1;
import i9.a;
import j9.c;
import java.io.BufferedInputStream;
import java.io.InputStream;
import k30.e;
import l30.o;
import m.m;
import mc0.b;
import mc0.d;
import mk.w;
import o9.h3;
import o9.i3;
import o9.k3;

/* loaded from: classes2.dex */
public class WallpaperCropActivity extends m {

    /* renamed from: r, reason: collision with root package name */
    public static Point f20987r;
    public CropView o;

    /* renamed from: p, reason: collision with root package name */
    public View f20988p;

    /* renamed from: q, reason: collision with root package name */
    public int f20989q;

    public static Point a0(Resources resources, WindowManager windowManager) {
        int iMax;
        if (f20987r == null) {
            Point point = new Point();
            windowManager.getDefaultDisplay().getRealSize(point);
            int iMax2 = Math.max(point.x, point.y);
            int iMin = Math.min(point.x, point.y);
            if (resources.getConfiguration().smallestScreenWidthDp >= 720) {
                float f11 = iMax2;
                iMax = (int) ((((f11 / iMin) * 0.30769226f) + 1.0076923f) * f11);
            } else {
                iMax = Math.max((int) (iMin * 2.0f), iMax2);
            }
            f20987r = new Point(iMax, iMax2);
        }
        return f20987r;
    }

    public static RectF b0(int i5, int i11, int i12, int i13, boolean z11) {
        RectF rectF = new RectF();
        float f11 = i5;
        float f12 = i11;
        float f13 = i12;
        float f14 = i13;
        float f15 = f13 / f14;
        if (f11 / f12 <= f15) {
            rectF.left = 0.0f;
            rectF.right = f11;
            float f16 = (f12 - ((f14 / f13) * f11)) / 2.0f;
            rectF.top = f16;
            rectF.bottom = f12 - f16;
            return rectF;
        }
        rectF.top = 0.0f;
        rectF.bottom = f12;
        float f17 = c1.f(f15, f12, f11, 2.0f);
        rectF.left = f17;
        float f18 = f11 - f17;
        rectF.right = f18;
        if (z11) {
            rectF.right = f18 - f17;
            rectF.left = 0.0f;
        }
        return rectF;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v0, types: [android.content.res.Resources] */
    /* JADX WARN: Type inference failed for: r3v1 */
    /* JADX WARN: Type inference failed for: r3v11 */
    /* JADX WARN: Type inference failed for: r3v12 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v3 */
    /* JADX WARN: Type inference failed for: r3v8, types: [java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r4v0, types: [int] */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v12 */
    /* JADX WARN: Type inference failed for: r4v13 */
    /* JADX WARN: Type inference failed for: r4v2 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v7 */
    public static int c0(Resources resources, int i5, LauncherWallpaperPickerActivity launcherWallpaperPickerActivity, Uri uri) {
        InputStream inputStream;
        c cVar = new c();
        int i11 = 0;
        InputStream inputStream2 = null;
        try {
            try {
                try {
                    if (uri != null) {
                        InputStream inputStreamOpenInputStream = launcherWallpaperPickerActivity.getContentResolver().openInputStream(uri);
                        BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStreamOpenInputStream);
                        cVar.e(bufferedInputStream);
                        resources = inputStreamOpenInputStream;
                        i5 = bufferedInputStream;
                    } else {
                        InputStream inputStreamOpenRawResource = resources.openRawResource(i5);
                        BufferedInputStream bufferedInputStream2 = new BufferedInputStream(inputStreamOpenRawResource);
                        cVar.e(bufferedInputStream2);
                        resources = inputStreamOpenRawResource;
                        i5 = bufferedInputStream2;
                    }
                    inputStream2 = i5;
                    Integer numD = cVar.d(c.f69191l);
                    if (numD == null) {
                        a.a(inputStream2);
                        a.a(resources);
                        return 0;
                    }
                    short sShortValue = numD.shortValue();
                    if (sShortValue == 3) {
                        i11 = 180;
                    } else if (sShortValue == 6) {
                        i11 = 90;
                    } else if (sShortValue == 8) {
                        i11 = 270;
                    }
                    a.a(inputStream2);
                    a.a(resources);
                    return i11;
                } catch (Throwable th2) {
                    th = th2;
                    inputStream = inputStream2;
                    try {
                        b bVar = d.f76206a;
                        bVar.r("Launcher3.CropActivity");
                        bVar.p(th, "Getting exif data failed", new Object[0]);
                        return 0;
                    } finally {
                        a.a(inputStream);
                        a.a(inputStream2);
                    }
                }
            } catch (Throwable th3) {
                th = th3;
                inputStream2 = resources;
                inputStream = i5;
                b bVar2 = d.f76206a;
                bVar2.r("Launcher3.CropActivity");
                bVar2.p(th, "Getting exif data failed", new Object[0]);
                return 0;
            }
        } catch (Throwable th4) {
            th = th4;
            i5 = inputStream2;
            inputStream2 = resources;
            inputStream = i5;
            b bVar22 = d.f76206a;
            bVar22.r("Launcher3.CropActivity");
            bVar22.p(th, "Getting exif data failed", new Object[0]);
            return 0;
        }
    }

    public final void Z(Uri uri, k3 k3Var, int i5) {
        char c11;
        float fMin;
        Display defaultDisplay = getWindowManager().getDefaultDisplay();
        Point point = new Point();
        defaultDisplay.getSize(point);
        boolean z11 = point.x < point.y;
        Point pointA0 = a0(getResources(), getWindowManager());
        CropView cropView = this.o;
        RectF rectF = cropView.f20937q;
        cropView.a(rectF);
        float f11 = cropView.f20927e.f61503d;
        float f12 = (-rectF.left) / f11;
        float f13 = (-rectF.top) / f11;
        RectF rectF2 = new RectF(f12, f13, (cropView.getWidth() / f11) + f12, (cropView.getHeight() / f11) + f13);
        CropView cropView2 = this.o;
        cropView2.getClass();
        hb.d dVar = (hb.d) cropView2.f20927e.f61504e;
        Point point2 = new Point(dVar.f59601b, dVar.f59602c);
        int i11 = this.o.f20927e.f61502c;
        float width = r4.getWidth() / rectF2.width();
        Matrix matrix = new Matrix();
        matrix.setRotate(i11);
        float[] fArr = {point2.x, point2.y};
        matrix.mapPoints(fArr);
        fArr[0] = Math.abs(fArr[0]);
        fArr[1] = Math.abs(fArr[1]);
        rectF2.left = Math.max(0.0f, rectF2.left);
        rectF2.right = Math.min(fArr[0], rectF2.right);
        rectF2.top = Math.max(0.0f, rectF2.top);
        rectF2.bottom = Math.min(fArr[1], rectF2.bottom);
        int i12 = this.f20989q;
        if (i12 == 2131427785) {
            c11 = 1;
            fMin = fArr[0] - rectF2.right;
        } else {
            c11 = 1;
            if (i12 == 2131427784) {
                fMin = Math.min(fArr[0] - rectF2.right, rectF2.left) * 2.0f;
            } else {
                if (i12 != 2131427793) {
                    throw new RuntimeException("Invalid crop mode " + this.f20989q);
                }
                fMin = rectF2.left;
            }
        }
        float fMin2 = Math.min(fMin, (pointA0.x / width) - rectF2.width());
        float f14 = fMin2 >= rectF2.width() * 0.1f ? fMin2 : 0.0f;
        int i13 = this.f20989q;
        if (i13 == 2131427785) {
            rectF2.right += f14;
        } else if (i13 == 2131427784) {
            float f15 = f14 / 2.0f;
            rectF2.left -= f15;
            rectF2.right += f15;
        } else {
            if (i13 != 2131427793) {
                throw new RuntimeException("Invalid crop mode " + this.f20989q);
            }
            rectF2.left -= f14;
        }
        if (z11) {
            rectF2.bottom = (pointA0.y / width) + rectF2.top;
        } else {
            float fMin3 = Math.min(Math.min(fArr[c11] - rectF2.bottom, rectF2.top), ((pointA0.y / width) - rectF2.height()) / 2.0f);
            rectF2.top -= fMin3;
            rectF2.bottom += fMin3;
        }
        int iRound = Math.round(rectF2.width() * width);
        int iRound2 = Math.round(rectF2.height() * width);
        i3 i3Var = new i3(this, uri, rectF2, i11, iRound, iRound2, true, false, new o(this, iRound, iRound2), i5);
        if (k3Var != null) {
            i3Var.o = k3Var;
        }
        i3Var.execute(new Void[0]);
    }

    public void d0() {
        e0.d0(getWindow(), true, false);
        getWindow().getDecorView().setSystemUiVisibility(getWindow().getDecorView().getSystemUiVisibility() | 1792);
        setContentView(2131624449);
        setSupportActionBar((Toolbar) findViewById(2131429059));
        getSupportActionBar().n();
        getSupportActionBar().r(16);
        getSupportActionBar().w(2132020330);
        this.o = (CropView) findViewById(2131427783);
        Uri data = getIntent().getData();
        if (data == null) {
            b bVar = d.f76206a;
            bVar.r("Launcher3.CropActivity");
            bVar.d("No URI passed in intent, exiting WallpaperCropActivity", new Object[0]);
            finish();
            return;
        }
        View viewFindViewById = findViewById(2131428813);
        this.f20988p = viewFindViewById;
        viewFindViewById.setOnClickListener(new h(this, data, 1));
        if (!l0.J(data) || o4.a.a(this, "android.permission.READ_EXTERNAL_STORAGE") == 0) {
            e0();
        } else {
            requestPermissions(new String[]{"android.permission.WRITE_EXTERNAL_STORAGE"}, 0);
        }
    }

    public final void e0() {
        hb.c cVar = new hb.c(this, getIntent().getData());
        this.f20988p.setEnabled(false);
        g0(cVar, true, false, new w((Object) this, (Object) cVar, false, 7));
    }

    public final void f0(mb0.b bVar) throws Resources.NotFoundException {
        f fVar = new f(this);
        fVar.r(2132020330);
        CharSequence[] textArray = getResources().getTextArray(2130903115);
        if (fVar.f49046k != null) {
            throw new IllegalStateException("You cannot set items() when you're using a custom view.");
        }
        fVar.f49042g = textArray;
        fVar.L = 2;
        fVar.f49055v = new e(bVar, 11);
        fVar.p();
    }

    public void g0(hb.c cVar, boolean z11, boolean z12, Runnable runnable) {
        View viewFindViewById = findViewById(2131428283);
        h3 h3Var = new h3(this, cVar, viewFindViewById, this, z11, z12, runnable);
        viewFindViewById.postDelayed(new w(8, h3Var, viewFindViewById), 300L);
        h3Var.execute(new Void[0]);
    }

    public final void h0(int i5, int i11) {
        SharedPreferences sharedPreferences = getSharedPreferences(WallpaperCropActivity.class.getName(), 4);
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        if (i5 == 0 || i11 == 0) {
            editorEdit.remove("wallpaper.width");
            editorEdit.remove("wallpaper.height");
        } else {
            editorEdit.putInt("wallpaper.width", i5);
            editorEdit.putInt("wallpaper.height", i11);
        }
        editorEdit.apply();
        Resources resources = getResources();
        WindowManager windowManager = getWindowManager();
        WallpaperManager wallpaperManager = WallpaperManager.getInstance(this);
        Point pointA0 = a0(resources, windowManager);
        int i12 = sharedPreferences.getInt("wallpaper.width", -1);
        int i13 = sharedPreferences.getInt("wallpaper.height", -1);
        if (i12 == -1 || i13 == -1) {
            i12 = pointA0.x;
            i13 = pointA0.y;
        }
        try {
            if (i12 == wallpaperManager.getDesiredMinimumWidth() && i13 == wallpaperManager.getDesiredMinimumHeight()) {
                return;
            }
            wallpaperManager.suggestDesiredDimensions(i12, i13);
        } catch (IllegalStateException e3) {
            e3.printStackTrace();
        } catch (SecurityException e11) {
            e11.printStackTrace();
        } catch (Throwable th2) {
            th2.printStackTrace();
        }
    }

    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        int i5 = Build.VERSION.SDK_INT;
        if (i5 >= 30) {
            getWindow().getAttributes().layoutInDisplayCutoutMode = 3;
        } else if (i5 >= 28) {
            getWindow().getAttributes().layoutInDisplayCutoutMode = 1;
        }
        d0();
        y2.f51877a.getClass();
        setRequestedOrientation(((g3) y2.m1().l()).f51564b);
        this.f20989q = 2131427784;
    }

    @Override // android.app.Activity
    public final boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(2131755011, menu);
        return true;
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public final void onDestroy() {
        CropView cropView = this.o;
        if (cropView != null) {
            cropView.f20923a.queueEvent(cropView.f20928f);
        }
        super.onDestroy();
    }

    @Override // android.app.Activity
    public final boolean onOptionsItemSelected(MenuItem menuItem) {
        super.onOptionsItemSelected(menuItem);
        int itemId = menuItem.getItemId();
        if (itemId == 2131427785 || itemId == 2131427784 || itemId == 2131427793) {
            this.f20989q = itemId;
            menuItem.setChecked(true);
        } else if (itemId == 2131427832) {
            View viewFindViewById = findViewById(2131427831);
            viewFindViewById.setVisibility(viewFindViewById.getVisibility() == 0 ? 8 : 0);
        }
        return true;
    }

    @Override // android.app.Activity
    public final boolean onPrepareOptionsMenu(Menu menu) {
        super.onPrepareOptionsMenu(menu);
        MenuItem menuItemFindItem = menu.findItem(this.f20989q);
        if (menuItemFindItem != null) {
            menuItemFindItem.setChecked(true);
        }
        return true;
    }

    @Override // androidx.fragment.app.m0, g.o, android.app.Activity
    public void onRequestPermissionsResult(int i5, String[] strArr, int[] iArr) {
        if (i5 != 0) {
            super.onRequestPermissionsResult(i5, strArr, iArr);
        } else if (iArr.length < 1 || iArr[0] != 0) {
            finish();
        } else {
            e0();
        }
    }
}
