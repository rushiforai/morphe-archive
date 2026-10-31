package k9;

import android.graphics.Bitmap;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import java.util.HashMap;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public abstract class h extends a {

    /* renamed from: m, reason: collision with root package name */
    public static final HashMap f71236m = new HashMap();
    public static final g n = new g();

    /* renamed from: j, reason: collision with root package name */
    public boolean f71237j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f71238k;

    /* renamed from: l, reason: collision with root package name */
    public Bitmap f71239l;

    public h() {
        this.f71210c = -1;
        this.f71211d = -1;
        this.f71214g = null;
        this.f71208a = 0;
        this.f71209b = 0;
        WeakHashMap weakHashMap = a.f71206h;
        synchronized (weakHashMap) {
            weakHashMap.put(this, null);
        }
        this.f71237j = true;
        this.f71238k = true;
    }

    public static Bitmap f(boolean z11, Bitmap.Config config, int i5) {
        g gVar = n;
        gVar.f71233a = z11;
        gVar.f71234b = config;
        gVar.f71235c = i5;
        HashMap map = f71236m;
        Bitmap bitmap = (Bitmap) map.get(gVar);
        if (bitmap != null) {
            return bitmap;
        }
        Bitmap bitmapCreateBitmap = z11 ? Bitmap.createBitmap(1, i5, config) : Bitmap.createBitmap(i5, 1, config);
        map.put(gVar.clone(), bitmapCreateBitmap);
        return bitmapCreateBitmap;
    }

    @Override // k9.a
    public final void c() {
        c cVar = this.f71214g;
        if (cVar != null && this.f71208a != -1) {
            e eVar = (e) cVar;
            if (this.f71209b == 1) {
                synchronized (eVar.f71227j) {
                    eVar.f71227j.b(this.f71208a);
                }
            }
            this.f71208a = -1;
        }
        this.f71209b = 0;
        this.f71214g = null;
        Bitmap bitmap = this.f71239l;
        if (bitmap != null) {
            h(bitmap);
            this.f71239l = null;
        }
    }

    public final Bitmap e() {
        if (this.f71239l == null) {
            Bitmap bitmapI = i();
            this.f71239l = bitmapI;
            int i5 = 0 * 2;
            int width = bitmapI.getWidth() + i5;
            int height = this.f71239l.getHeight() + i5;
            if (this.f71210c == -1) {
                d(width, height);
            }
        }
        return this.f71239l;
    }

    public final boolean g() {
        return this.f71209b == 1 && this.f71237j;
    }

    public abstract void h(Bitmap bitmap);

    public abstract Bitmap i();

    public final void j(c cVar) {
        h hVar = this;
        if (hVar.f71209b == 1) {
            if (hVar.f71237j) {
                return;
            }
            Bitmap bitmapE = hVar.e();
            ((e) cVar).h(hVar, 0, 0, bitmapE, GLUtils.getInternalFormat(bitmapE), GLUtils.getType(bitmapE));
            hVar.h(hVar.f71239l);
            hVar.f71239l = null;
            hVar.f71237j = true;
            return;
        }
        Bitmap bitmapE2 = hVar.e();
        if (bitmapE2 == null) {
            hVar.f71209b = -1;
            throw new RuntimeException("Texture load fail, no bitmap");
        }
        try {
            int width = bitmapE2.getWidth();
            int height = bitmapE2.getHeight();
            int iB = hVar.b();
            int iA = hVar.a();
            cVar.getClass();
            int[] iArr = e.f71217r.f71232a;
            GLES20.glGenTextures(1, iArr, 0);
            e.b();
            int i5 = iArr[0];
            hVar.f71208a = i5;
            GLES20.glBindTexture(3553, i5);
            e.b();
            GLES20.glTexParameteri(3553, 10242, 33071);
            GLES20.glTexParameteri(3553, 10243, 33071);
            GLES20.glTexParameterf(3553, 10241, 9729.0f);
            GLES20.glTexParameterf(3553, 10240, 9729.0f);
            if (width == iB && height == iA) {
                GLES20.glBindTexture(3553, hVar.f71208a);
                e.b();
                GLUtils.texImage2D(3553, 0, bitmapE2, 0);
            } else {
                int internalFormat = GLUtils.getInternalFormat(bitmapE2);
                int type = GLUtils.getType(bitmapE2);
                Bitmap.Config config = bitmapE2.getConfig();
                GLES20.glBindTexture(3553, hVar.f71208a);
                e.b();
                GLES20.glTexImage2D(3553, 0, internalFormat, hVar.b(), hVar.a(), 0, internalFormat, type, null);
                e eVar = (e) cVar;
                eVar.h(hVar, 0, 0, bitmapE2, internalFormat, type);
                int i11 = 0 + width;
                if (i11 < iB) {
                    try {
                        eVar.h(this, i11, 0, f(true, config, iA), internalFormat, type);
                    } catch (Throwable th2) {
                        th = th2;
                        hVar = this;
                        hVar.h(hVar.f71239l);
                        hVar.f71239l = null;
                        throw th;
                    }
                }
                int i12 = 0 + height;
                if (i12 < iA) {
                    hVar = this;
                    eVar.h(hVar, 0, i12, f(false, config, iB), internalFormat, type);
                } else {
                    hVar = this;
                }
            }
            hVar.h(hVar.f71239l);
            hVar.f71239l = null;
            hVar.f71214g = cVar;
            hVar.f71209b = 1;
            hVar.f71237j = true;
        } catch (Throwable th3) {
            th = th3;
        }
    }
}
