package i30;

import android.graphics.Bitmap;
import javax.microedition.khronos.opengles.GL11;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final int f61254a;

    /* renamed from: b, reason: collision with root package name */
    public final int f61255b;

    /* renamed from: c, reason: collision with root package name */
    public Bitmap f61256c;

    /* renamed from: d, reason: collision with root package name */
    public c f61257d;

    /* renamed from: e, reason: collision with root package name */
    public long f61258e = -1;

    public b(Bitmap bitmap) {
        this.f61254a = bitmap.getWidth();
        this.f61255b = bitmap.getHeight();
        this.f61256c = bitmap;
    }

    public final void a(i iVar, int i5, int i11, int i12, int i13) {
        if (this.f61256c == null) {
            if (this.f61258e == -1) {
                this.f61258e = -2L;
            }
            iVar.f(i5, i11, i12, i13, -14540254);
            return;
        }
        if (this.f61257d == null) {
            this.f61257d = new c(this.f61256c);
        }
        if (this.f61258e == -2) {
            this.f61258e = mk.v.f76490c;
        }
        if (!b()) {
            a aVar = this.f61257d;
            aVar.getClass();
            iVar.d(aVar, i5, i11, i12, i13, iVar.f61305g);
            return;
        }
        c cVar = this.f61257d;
        float fB = f30.f.b(1.0f - ((mk.v.f76490c - this.f61258e) / 180.0f), 0.0f, 1.0f);
        float f11 = iVar.f61305g;
        h hVar = iVar.f61304f;
        if (fB <= 0.01f) {
            iVar.d(cVar, i5, i11, i12, i13, f11);
            return;
        }
        if (fB >= 1.0f) {
            iVar.f(i5, i11, i12, i13, -14540254);
            return;
        }
        hVar.a(iVar.o && (!cVar.f61370k || f11 < 0.95f));
        GL11 gl11 = iVar.f61299a;
        if (iVar.a(cVar)) {
            float f12 = (1.0f - fB) * f11;
            hVar.c(34160);
            float f13 = 34 * ((((f11 * fB) / (1.0f - f12)) * 255) / 65025.0f);
            float[] fArr = iVar.f61303e;
            fArr[0] = f13;
            fArr[1] = f13;
            fArr[2] = f13;
            fArr[3] = f12;
            gl11.glTexEnvfv(8960, 8705, fArr, 0);
            gl11.glTexEnvf(8960, 34161, 34165.0f);
            gl11.glTexEnvf(8960, 34162, 34165.0f);
            gl11.glTexEnvf(8960, 34177, 34166.0f);
            gl11.glTexEnvf(8960, 34193, 768.0f);
            gl11.glTexEnvf(8960, 34185, 34166.0f);
            gl11.glTexEnvf(8960, 34201, 770.0f);
            gl11.glTexEnvf(8960, 34178, 34166.0f);
            gl11.glTexEnvf(8960, 34194, 770.0f);
            gl11.glTexEnvf(8960, 34186, 34166.0f);
            gl11.glTexEnvf(8960, 34202, 770.0f);
            iVar.b(cVar, i5, i11, i12, i13);
            hVar.c(7681);
        }
    }

    public final boolean b() {
        if (this.f61258e < 0) {
            return false;
        }
        if (mk.v.f76490c - this.f61258e < 180) {
            return true;
        }
        this.f61258e = -3L;
        return false;
    }
}
