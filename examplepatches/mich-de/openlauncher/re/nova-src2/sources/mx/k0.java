package mx;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Process;
import android.os.UserHandle;
import com.android.launcher3.icons.BitmapInfo;
import com.teslacoilsw.launcher.icon.NovaIconSource;
import com.teslacoilsw.launcher.icon.UriIconSource;
import com.teslacoilsw.launcher.launcher3.NovaBitmapInfo;
import e10.s2;
import e10.y2;
import e10.z2;
import java.io.IOException;
import java.util.WeakHashMap;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;

/* loaded from: classes.dex */
public final class k0 extends aa.g0 {
    public static final WeakHashMap A;

    /* renamed from: z, reason: collision with root package name */
    public static final ComponentName f77184z = new ComponentName("com.teslacoilsw.launcher", ":LAUNCHER_ACTION_APP_DRAWER");

    /* renamed from: s, reason: collision with root package name */
    public final fz.d f77185s;

    /* renamed from: t, reason: collision with root package name */
    public final boolean f77186t;

    /* renamed from: u, reason: collision with root package name */
    public final e10.q f77187u;

    /* renamed from: v, reason: collision with root package name */
    public final boolean f77188v;

    /* renamed from: w, reason: collision with root package name */
    public final PackageManager f77189w;

    /* renamed from: x, reason: collision with root package name */
    public final aa.g f77190x;

    /* renamed from: y, reason: collision with root package name */
    public final fz.f0 f77191y;

    static {
        new ComponentName("com.teslacoilsw.launcher", ":LAUNCHER_ACTION_APP_DRAWER_NIGHT");
        A = new WeakHashMap();
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public k0(Context context, int i5, int i11, fz.d dVar, boolean z11, e10.q qVar, boolean z12, int i12, int i13) {
        i5 = (i13 & 2) != 0 ? context.getResources().getDisplayMetrics().densityDpi : i5;
        i11 = (i13 & 4) != 0 ? bh.g.M(context, 48) : i11;
        dVar = (i13 & 8) != 0 ? (fz.d) y2.f51877a.i().l() : dVar;
        z11 = (i13 & 16) != 0 ? ((Boolean) y2.f51877a.E0().l()).booleanValue() : z11;
        qVar = (i13 & 32) != 0 ? (e10.q) y2.f51877a.h().l() : qVar;
        if ((i13 & 64) != 0) {
            y2.f51877a.getClass();
            s2 s2Var = y2.D1;
            KProperty kProperty = y2.f51881b[129];
            s2Var.getClass();
            z12 = ((Boolean) s2Var.l()).booleanValue();
        }
        super(context, i5, i11, (i13 & 128) != 0 ? -1 : i12);
        this.f77185s = dVar;
        this.f77186t = z11;
        this.f77187u = qVar;
        this.f77188v = z12;
        this.f77189w = context.getApplicationContext().getPackageManager();
        aa.g gVar = new aa.g(45);
        gVar.f588f = true;
        this.f77190x = gVar;
        this.f77191y = new fz.f0(context, i11);
        dy.k kVar = fz.e.f56218a;
        fz.e.i(context);
    }

    public static final Drawable P(Cursor cursor, k0 k0Var) throws IllegalArgumentException {
        int columnIndexOrThrow = cursor.getColumnIndexOrThrow("icon");
        int columnIndex = cursor.getColumnIndex("color");
        int columnIndexOrThrow2 = cursor.getColumnIndexOrThrow("adaptivefg");
        if (!cursor.moveToFirst()) {
            return null;
        }
        byte[] blob = cursor.getBlob(columnIndexOrThrow);
        Bitmap bitmapDecodeByteArray = BitmapFactory.decodeByteArray(blob, 0, blob.length);
        Bitmap bitmapDecodeByteArray2 = cursor.getBlob(columnIndexOrThrow2) != null ? BitmapFactory.decodeByteArray(blob, 0, blob.length) : null;
        return bitmapDecodeByteArray2 != null ? new com.teslacoilsw.launcher.icon.a(new aa.n(bitmapDecodeByteArray, 0, false), new aa.n(bitmapDecodeByteArray2, 0, false), k0Var.f77185s) : new aa.n(bitmapDecodeByteArray, cursor.isNull(columnIndex) ? 0 : cursor.getInt(columnIndex), false);
    }

    public final BitmapInfo K(Intent.ShortcutIconResource shortcutIconResource, boolean z11) throws Resources.NotFoundException, PackageManager.NameNotFoundException {
        Drawable drawableForDensity;
        if (z11) {
            return f(shortcutIconResource);
        }
        try {
            Resources resourcesForApplication = this.f77189w.getResourcesForApplication(shortcutIconResource.packageName);
            drawableForDensity = resourcesForApplication.getDrawableForDensity(resourcesForApplication.getIdentifier(shortcutIconResource.resourceName, null, null), this.f550g);
        } catch (Exception unused) {
        }
        if (drawableForDensity == null) {
            return null;
        }
        jz.j jVar = new jz.j(drawableForDensity);
        jVar.g();
        return d(jVar, Process.myUserHandle(), false);
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00aa A[Catch: Exception -> 0x00c3, TryCatch #3 {Exception -> 0x00c3, blocks: (B:3:0x0001, B:6:0x000b, B:8:0x001c, B:10:0x002d, B:12:0x0042, B:15:0x005d, B:41:0x00aa, B:44:0x00b0, B:48:0x00bd, B:47:0x00b9, B:22:0x0066, B:23:0x0069, B:27:0x0072, B:30:0x009a, B:37:0x00a3, B:38:0x00a6, B:34:0x00a0, B:14:0x0059, B:19:0x0063, B:29:0x0096, B:25:0x006c), top: B:58:0x0001, inners: #0, #1, #2, #4, #5 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final BitmapInfo M(NovaIconSource novaIconSource, UserHandle userHandle, boolean z11, boolean z12) throws IOException {
        Cursor cursorQuery;
        Drawable drawableP;
        try {
            boolean z13 = novaIconSource instanceof UriIconSource;
            Context context = this.f545b;
            if (z13 && Intrinsics.b(((UriIconSource) novaIconSource).f45774b.getScheme(), "content") && Intrinsics.b(((UriIconSource) novaIconSource).f45774b.getAuthority(), "com.teslacoilsw.launcher.settings") && Intrinsics.b(b70.g.Y0(((UriIconSource) novaIconSource).f45774b.getPathSegments()), "customIcons")) {
                cursorQuery = context.getContentResolver().query(((UriIconSource) novaIconSource).f45774b, new String[]{"icon", "color", "adaptivefg"}, null, null, null);
                if (cursorQuery != null) {
                    try {
                        drawableP = P(cursorQuery, this);
                        cursorQuery.close();
                    } finally {
                    }
                } else {
                    drawableP = null;
                }
                if (drawableP == null) {
                }
            } else {
                try {
                    drawableP = novaIconSource.d(context);
                } catch (Exception unused) {
                    cursorQuery = context.getContentResolver().query(Uri.parse("content://com.teslacoilsw.launcher.settings/customIcons"), new String[]{"icon", "adaptivefg", "flags"}, "source = ?", new String[]{novaIconSource.b()}, null);
                    if (cursorQuery != null) {
                        try {
                            drawableP = P(cursorQuery, this);
                            cursorQuery.close();
                        } finally {
                            try {
                                throw th;
                            } finally {
                            }
                        }
                    }
                }
                if (drawableP == null) {
                    if ((drawableP instanceof jz.i) && !z11) {
                        ((jz.i) drawableP).l();
                    }
                    if (!z12) {
                        userHandle = Process.myUserHandle();
                    }
                    return d(drawableP, userHandle, true);
                }
            }
        } catch (Exception unused2) {
        }
        return null;
    }

    @Override // aa.c
    public final NovaBitmapInfo a(Bitmap bitmap, BitmapInfo bitmapInfo) {
        aa.a aVar = new aa.a(this, bitmap, bitmapInfo);
        int i5 = this.f551h;
        return new NovaBitmapInfo(aa.f.a(i5, i5, aVar), bitmapInfo == null ? 0 : bitmapInfo.f21152b, false, false, bitmapInfo != null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:27:0x003c  */
    /* JADX WARN: Type inference failed for: r1v0, types: [android.graphics.drawable.Drawable] */
    /* JADX WARN: Type inference failed for: r1v14, types: [android.graphics.drawable.Drawable, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r8v0, types: [fz.f0] */
    @Override // aa.c
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Drawable s(Drawable drawable, float[] fArr, boolean[] zArr) {
        boolean z11;
        aa.n iVar;
        float fD;
        aa.n nVar;
        ?? r12 = drawable;
        if (zArr != null) {
            zArr[0] = false;
        }
        boolean z12 = r12 instanceof jz.h;
        jz.h hVar = z12 ? (jz.h) r12 : null;
        boolean z13 = hVar != null && hVar.c();
        jz.h hVar2 = z12 ? (jz.h) r12 : null;
        if (hVar2 != null ? hVar2.d() : true) {
            e10.q qVar = e10.q.f51750c;
            e10.q qVar2 = this.f77187u;
            z11 = qVar2 == qVar || (!z13 && qVar2 == e10.q.f51749b);
        }
        boolean z14 = r12 instanceof AdaptiveIconDrawable;
        boolean z15 = this.f77188v;
        if (z14) {
            ?? B0 = z2.B0(r12, this.f77185s);
            Intrinsics.e(B0, "null cannot be cast to non-null type com.teslacoilsw.launcher.icon.NovaAdaptiveIconDrawable");
            fD = ((com.teslacoilsw.launcher.icon.a) B0).k().d();
            nVar = B0;
            nVar = B0;
            if (z15 && zArr != null) {
                zArr[0] = true;
                nVar = B0;
            }
        } else if (r12 instanceof com.teslacoilsw.launcher.icon.a) {
            fD = ((com.teslacoilsw.launcher.icon.a) r12).k().d();
            nVar = r12;
            nVar = r12;
            if (z15 && zArr != null) {
                zArr[0] = true;
                nVar = r12;
            }
        } else {
            float f11 = 1.0f;
            ?? r82 = this.f77191y;
            int i5 = this.f551h;
            if (z11) {
                Bitmap bitmapA = z2.A(r12, i5, i5);
                if (bitmapA.getWidth() > i5 || bitmapA.getHeight() > i5) {
                    bitmapA = x7.f.v(bitmapA, i5);
                }
                bitmapA.setDensity(0);
                Pair pairB = r82.b(bitmapA);
                Bitmap bitmap = (Bitmap) pairB.f71683a;
                fz.v vVar = (fz.v) pairB.f71684b;
                boolean z16 = zArr != null && z15;
                boolean z17 = vVar.f56375i && z13;
                dy.k kVar = fz.e.f56218a;
                Bitmap bitmapJ = fz.e.j(this.f77185s, bitmap, this.f551h, vVar, z16, z17);
                Intrinsics.d(bitmapJ);
                iVar = z13 ? new jz.i(bitmapJ, 14) : new aa.n(bitmapJ, 0, false);
            } else {
                iVar = r12;
                if (this.f77186t) {
                    fz.v vVarC = r82.c(r12);
                    f11 = vVarC.f56367a;
                    iVar = r12;
                    if (!z15) {
                        iVar = r12;
                        if (vVarC.f56373g) {
                            Bitmap bitmapA2 = z2.A(r12, i5, i5);
                            int width = bitmapA2.getWidth();
                            int height = bitmapA2.getHeight();
                            Bitmap.Config config = bitmapA2.getConfig();
                            Intrinsics.d(config);
                            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(width, height, config);
                            int width2 = bitmapA2.getWidth();
                            int height2 = bitmapA2.getHeight();
                            int[] iArr = new int[256];
                            for (int i11 = 0; i11 < 256; i11++) {
                                int iPow = (int) ((Math.pow(i11 / 255.0d, 3.0303030303030303d) * 255.0d) + 0.5d);
                                if (iPow > 255) {
                                    iPow = 255;
                                }
                                iArr[i11] = iPow;
                            }
                            for (int i12 = 0; i12 < width2; i12++) {
                                for (int i13 = 0; i13 < height2; i13++) {
                                    int pixel = bitmapA2.getPixel(i12, i13);
                                    bitmapCreateBitmap.setPixel(i12, i13, Color.argb(iArr[Color.alpha(pixel)], Color.red(pixel), Color.green(pixel), Color.blue(pixel)));
                                }
                            }
                            iVar = new aa.n(bitmapCreateBitmap, 0, false);
                        }
                    } else if (zArr != null) {
                        zArr[0] = vVarC.f56372f;
                        iVar = r12;
                    }
                }
            }
            fD = f11;
            nVar = iVar;
        }
        fArr[0] = fD;
        return nVar;
    }
}
