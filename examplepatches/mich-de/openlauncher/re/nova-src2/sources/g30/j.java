package g30;

import android.app.WallpaperColors;
import android.app.WallpaperManager;
import android.content.Context;
import android.graphics.Color;
import android.os.Build;
import android.util.Log;
import java.lang.reflect.Method;
import java.util.ArrayList;

/* loaded from: classes.dex */
public class j extends f {

    /* renamed from: c, reason: collision with root package name */
    public final WallpaperManager f57042c;

    /* renamed from: d, reason: collision with root package name */
    public final Method f57043d;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f57044e = new ArrayList();

    /* renamed from: f, reason: collision with root package name */
    public boolean f57045f = false;

    /* renamed from: g, reason: collision with root package name */
    public final i f57046g = new i(this, 0);

    public j(Context context) {
        this.f57042c = (WallpaperManager) context.getSystemService(WallpaperManager.class);
        try {
            this.f57043d = bh.a.h().getDeclaredMethod("getColorHints", null);
        } catch (Exception e3) {
            Log.e("WMCompatVOMR1", "getColorHints not available", e3);
        }
    }

    @Override // g30.f
    public final void a(d dVar) {
        WallpaperManager wallpaperManager;
        this.f57044e.add(dVar);
        if (this.f57045f || (wallpaperManager = this.f57042c) == null) {
            return;
        }
        try {
            wallpaperManager.addOnColorsChangedListener(this.f57046g, null);
            this.f57045f = true;
        } catch (Exception e3) {
            mc0.d.b(e3);
        }
    }

    @Override // g30.f
    public final c c() {
        WallpaperManager wallpaperManager = this.f57042c;
        if (wallpaperManager == null) {
            return null;
        }
        try {
            return g(wallpaperManager.getWallpaperColors(1));
        } catch (Exception e3) {
            mc0.d.b(e3);
            return null;
        }
    }

    @Override // g30.f
    public final void e(d dVar) {
        ArrayList arrayList = this.f57044e;
        arrayList.remove(dVar);
        if (this.f57045f && arrayList.isEmpty()) {
            this.f57042c.removeOnColorsChangedListener(this.f57046g);
            this.f57045f = false;
        }
    }

    /* JADX WARN: Can't wrap try/catch for region: R(13:(3:48|5|(2:50|6))|(2:52|7)|16|(1:18)(1:19)|(1:21)(1:22)|(1:24)(1:25)|26|(2:32|(2:36|37))|46|38|(1:40)|44|45) */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x0077, code lost:
    
        r8 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x0078, code lost:
    
        android.util.Log.e("WMCompatVOMR1", "error calling color hints", r8);
     */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0020  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0025  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0028  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0030  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0035  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x006c A[Catch: Exception -> 0x0077, TRY_LEAVE, TryCatch #0 {Exception -> 0x0077, blocks: (B:38:0x0068, B:40:0x006c), top: B:46:0x0068 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final c g(WallpaperColors wallpaperColors) {
        Color primaryColor;
        Color secondaryColor;
        Color tertiaryColor;
        int argb;
        Method method;
        float f11;
        if (wallpaperColors == null) {
            return null;
        }
        try {
            primaryColor = wallpaperColors.getPrimaryColor();
            try {
                secondaryColor = wallpaperColors.getSecondaryColor();
            } catch (Exception e3) {
                e = e3;
                secondaryColor = null;
            }
        } catch (Exception e11) {
            e = e11;
            primaryColor = null;
            secondaryColor = null;
        }
        try {
            tertiaryColor = wallpaperColors.getTertiaryColor();
        } catch (Exception e12) {
            e = e12;
            mc0.d.b(e);
            tertiaryColor = null;
            int iIntValue = 0;
            if (primaryColor == null) {
            }
            if (secondaryColor == null) {
            }
            if (tertiaryColor == null) {
            }
            if (Build.VERSION.SDK_INT < 31) {
                float[] fArr = new float[3];
                Color.colorToHSV(argb, fArr);
                f11 = fArr[0];
                if (f11 >= 20.0f) {
                }
                return new c(0, 0, 0, 0);
            }
            method = this.f57043d;
            if (method != null) {
            }
            return new c(argb, argb, argb, iIntValue);
        }
        int iIntValue2 = 0;
        argb = primaryColor == null ? primaryColor.toArgb() : 0;
        int argb2 = secondaryColor == null ? secondaryColor.toArgb() : 0;
        int argb3 = tertiaryColor == null ? tertiaryColor.toArgb() : 0;
        if (Build.VERSION.SDK_INT < 31 && "samsung".equalsIgnoreCase(Build.MANUFACTURER) && this.f57042c.getWallpaperInfo() != null) {
            float[] fArr2 = new float[3];
            Color.colorToHSV(argb, fArr2);
            f11 = fArr2[0];
            if (f11 >= 20.0f || f11 > 300.0f) {
                return new c(0, 0, 0, 0);
            }
        }
        method = this.f57043d;
        if (method != null) {
            iIntValue2 = ((Integer) method.invoke(wallpaperColors, null)).intValue();
        }
        return new c(argb, argb2, argb3, iIntValue2);
    }
}
