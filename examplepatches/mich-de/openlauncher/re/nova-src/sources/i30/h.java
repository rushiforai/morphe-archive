package i30;

import javax.microedition.khronos.opengles.GL11;

/* loaded from: classes4.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final GL11 f61292a;

    /* renamed from: b, reason: collision with root package name */
    public int f61293b = 7681;

    /* renamed from: c, reason: collision with root package name */
    public float f61294c = 1.0f;

    /* renamed from: d, reason: collision with root package name */
    public int f61295d = 3553;

    /* renamed from: e, reason: collision with root package name */
    public boolean f61296e = true;

    /* renamed from: f, reason: collision with root package name */
    public float f61297f = 1.0f;

    public h(GL11 gl11) {
        this.f61292a = gl11;
        gl11.glDisable(2896);
        gl11.glEnable(3024);
        gl11.glEnableClientState(32884);
        gl11.glEnableClientState(32888);
        gl11.glEnable(3553);
        gl11.glTexEnvf(8960, 8704, 7681.0f);
        gl11.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        gl11.glClearStencil(0);
        gl11.glEnable(3042);
        gl11.glBlendFunc(1, 771);
        gl11.glPixelStorei(3317, 2);
    }

    public final void a(boolean z11) {
        if (this.f61296e == z11) {
            return;
        }
        this.f61296e = z11;
        GL11 gl11 = this.f61292a;
        if (z11) {
            gl11.glEnable(3042);
        } else {
            gl11.glDisable(3042);
        }
    }

    public final void b(float f11, int i5) {
        long[] jArr = f30.f.f54304a;
        int i11 = i5 >>> 24;
        a(i11 != 255 || f11 < 0.95f);
        this.f61294c = -1.0f;
        int i12 = this.f61295d;
        GL11 gl11 = this.f61292a;
        if (i12 != 0) {
            if (i12 != 0) {
                gl11.glDisable(i12);
            }
            this.f61295d = 0;
        }
        float f12 = (((i11 * f11) * 65535.0f) / 255.0f) / 255.0f;
        gl11.glColor4x(Math.round(((i5 >> 16) & 255) * f12), Math.round(((i5 >> 8) & 255) * f12), Math.round((i5 & 255) * f12), Math.round(f12 * 255.0f));
    }

    public final void c(int i5) {
        if (this.f61293b == i5) {
            return;
        }
        this.f61293b = i5;
        this.f61292a.glTexEnvf(8960, 8704, i5);
    }

    public final void d(float f11) {
        if (this.f61294c == f11) {
            return;
        }
        this.f61294c = f11;
        GL11 gl11 = this.f61292a;
        if (f11 >= 0.95f) {
            gl11.glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
            c(7681);
        } else {
            gl11.glColor4f(f11, f11, f11, f11);
            c(8448);
        }
    }
}
