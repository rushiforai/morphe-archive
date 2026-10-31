package i30;

import android.graphics.Bitmap;
import android.opengl.GLUtils;
import java.util.HashMap;
import java.util.WeakHashMap;
import javax.microedition.khronos.opengles.GL11;

/* loaded from: classes4.dex */
public abstract class x extends a {

    /* renamed from: m, reason: collision with root package name */
    public static final HashMap f61367m = new HashMap();
    public static final w n = new w();
    public static final int[] o = new int[1];

    /* renamed from: p, reason: collision with root package name */
    public static final float[] f61368p = new float[4];

    /* renamed from: j, reason: collision with root package name */
    public boolean f61369j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f61370k;

    /* renamed from: l, reason: collision with root package name */
    public Bitmap f61371l;

    public x(int i5) {
        this.f61249c = -1;
        this.f61250d = -1;
        this.f61253g = null;
        this.f61247a = 0;
        this.f61248b = 0;
        WeakHashMap weakHashMap = a.f61245h;
        synchronized (weakHashMap) {
            weakHashMap.put(this, null);
        }
        this.f61369j = true;
        this.f61370k = true;
    }

    public static Bitmap i(boolean z11, Bitmap.Config config, int i5) {
        w wVar = n;
        wVar.f61364a = z11;
        wVar.f61365b = config;
        wVar.f61366c = i5;
        HashMap map = f61367m;
        Bitmap bitmap = (Bitmap) map.get(wVar);
        if (bitmap != null) {
            return bitmap;
        }
        Bitmap bitmapCreateBitmap = z11 ? Bitmap.createBitmap(1, i5, config) : Bitmap.createBitmap(i5, 1, config);
        map.put(wVar.clone(), bitmapCreateBitmap);
        return bitmapCreateBitmap;
    }

    @Override // i30.a
    public final int b() {
        if (this.f61249c == -1) {
            h();
        }
        return this.f61250d;
    }

    @Override // i30.a
    public final int e() {
        if (this.f61249c == -1) {
            h();
        }
        return this.f61249c;
    }

    public final void g() {
        f30.f.a(this.f61371l != null);
        k(this.f61371l);
        this.f61371l = null;
    }

    public final Bitmap h() {
        if (this.f61371l == null) {
            Bitmap bitmapL = l();
            this.f61371l = bitmapL;
            int i5 = 0 * 2;
            int width = bitmapL.getWidth() + i5;
            int height = this.f61371l.getHeight() + i5;
            if (this.f61249c == -1) {
                f(width, height);
            }
        }
        return this.f61371l;
    }

    public final boolean j() {
        return this.f61248b == 1 && this.f61369j;
    }

    public abstract void k(Bitmap bitmap);

    public abstract Bitmap l();

    public final void m(i iVar) {
        char c11;
        Bitmap.Config config;
        if (this.f61248b == 1) {
            if (this.f61369j) {
                return;
            }
            Bitmap bitmapH = h();
            int internalFormat = GLUtils.getInternalFormat(bitmapH);
            int type = GLUtils.getType(bitmapH);
            iVar.f61299a.glBindTexture(3553, this.f61247a);
            GLUtils.texSubImage2D(3553, 0, 0, 0, bitmapH, internalFormat, type);
            g();
            this.f61369j = true;
            return;
        }
        GL11 gl11 = iVar.f61299a;
        Bitmap bitmapH2 = h();
        if (bitmapH2 == null) {
            this.f61248b = -1;
            throw new RuntimeException("Texture load fail, no bitmap");
        }
        try {
            int width = bitmapH2.getWidth();
            int height = bitmapH2.getHeight();
            int iD = d();
            int iC = c();
            f30.f.a(width <= iD && height <= iC);
            float[] fArr = f61368p;
            fArr[0] = 0;
            fArr[1] = 0 + height;
            fArr[2] = width;
            fArr[3] = -height;
            int[] iArr = o;
            synchronized (j.class) {
                int i5 = 1;
                while (true) {
                    int i11 = i5 - 1;
                    if (i5 <= 0) {
                        break;
                    }
                    int i12 = j.f61312a;
                    j.f61312a = i12 + 1;
                    iArr[i11] = i12;
                    i5 = i11;
                }
            }
            int[] iArr2 = o;
            gl11.glBindTexture(3553, iArr2[0]);
            gl11.glTexParameterfv(3553, 35741, f61368p, 0);
            gl11.glTexParameteri(3553, 10242, 33071);
            gl11.glTexParameteri(3553, 10243, 33071);
            gl11.glTexParameterf(3553, 10241, 9729.0f);
            gl11.glTexParameterf(3553, 10240, 9729.0f);
            if (width == iD && height == iC) {
                GLUtils.texImage2D(3553, 0, bitmapH2, 0);
                c11 = 0;
            } else {
                int internalFormat2 = GLUtils.getInternalFormat(bitmapH2);
                int type2 = GLUtils.getType(bitmapH2);
                Bitmap.Config config2 = bitmapH2.getConfig();
                gl11.glTexImage2D(3553, 0, internalFormat2, iD, iC, 0, internalFormat2, type2, null);
                c11 = 0;
                GLUtils.texSubImage2D(3553, 0, 0, 0, bitmapH2, internalFormat2, type2);
                if (0 + width < iD) {
                    int i13 = 0 + width;
                    config = config2;
                    GLUtils.texSubImage2D(3553, 0, i13, 0, i(true, config2, iC), internalFormat2, type2);
                } else {
                    config = config2;
                }
                if (0 + height < iC) {
                    GLUtils.texSubImage2D(3553, 0, 0, 0 + height, i(false, config, iD), internalFormat2, type2);
                }
            }
            g();
            this.f61253g = iVar;
            this.f61247a = iArr2[c11];
            this.f61248b = 1;
            this.f61369j = true;
        } catch (Throwable th2) {
            g();
            throw th2;
        }
    }
}
