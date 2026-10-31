package yf;

import ai.y0;
import android.graphics.SurfaceTexture;
import android.media.MediaFormat;
import android.opengl.EGL14;
import android.opengl.GLES20;
import com.google.android.exoplayer2.util.GlUtil$GlException;
import fe.k0;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;
import ps.v;

/* loaded from: classes3.dex */
public final class i implements xf.i, a {

    /* renamed from: i, reason: collision with root package name */
    public int f97278i;

    /* renamed from: j, reason: collision with root package name */
    public SurfaceTexture f97279j;

    /* renamed from: l, reason: collision with root package name */
    public byte[] f97281l;

    /* renamed from: a, reason: collision with root package name */
    public final AtomicBoolean f97270a = new AtomicBoolean();

    /* renamed from: b, reason: collision with root package name */
    public final AtomicBoolean f97271b = new AtomicBoolean(true);

    /* renamed from: c, reason: collision with root package name */
    public final g f97272c = new g();

    /* renamed from: d, reason: collision with root package name */
    public final y0 f97273d = new y0(9);

    /* renamed from: e, reason: collision with root package name */
    public final fk.l f97274e = new fk.l();

    /* renamed from: f, reason: collision with root package name */
    public final fk.l f97275f = new fk.l();

    /* renamed from: g, reason: collision with root package name */
    public final float[] f97276g = new float[16];

    /* renamed from: h, reason: collision with root package name */
    public final float[] f97277h = new float[16];

    /* renamed from: k, reason: collision with root package name */
    public int f97280k = -1;

    @Override // xf.i
    public final void a(long j11, long j12, k0 k0Var, MediaFormat mediaFormat) {
        int i5;
        ArrayList arrayListV;
        int iA;
        this.f97274e.a(j12, Long.valueOf(j11));
        byte[] bArr = k0Var.f54891v;
        int i11 = k0Var.f54892w;
        byte[] bArr2 = this.f97281l;
        int i12 = this.f97280k;
        this.f97281l = bArr;
        if (i11 == -1) {
            i11 = 0;
        }
        this.f97280k = i11;
        if (i12 == i11 && Arrays.equals(bArr2, bArr)) {
            return;
        }
        byte[] bArr3 = this.f97281l;
        f fVar = null;
        if (bArr3 != null) {
            int i13 = this.f97280k;
            com.google.android.gms.internal.consent_sdk.a aVar = new com.google.android.gms.internal.consent_sdk.a(bArr3);
            try {
                aVar.Z(4);
                iA = aVar.A();
                aVar.Y(0);
            } catch (ArrayIndexOutOfBoundsException unused) {
            }
            if (iA == 1886547818) {
                aVar.Z(8);
                int i14 = aVar.f31984b;
                int i15 = aVar.f31985c;
                while (i14 < i15) {
                    int iA2 = aVar.A() + i14;
                    if (iA2 > i14 && iA2 <= i15) {
                        int iA3 = aVar.A();
                        if (iA3 != 2037673328 && iA3 != 1836279920) {
                            aVar.Y(iA2);
                            i14 = iA2;
                        }
                        aVar.X(iA2);
                        arrayListV = v.v(aVar);
                        break;
                    }
                    break;
                }
                arrayListV = null;
            } else {
                arrayListV = v.v(aVar);
            }
            if (arrayListV != null) {
                int size = arrayListV.size();
                if (size == 1) {
                    e eVar = (e) arrayListV.get(0);
                    fVar = new f(eVar, eVar, i13);
                } else if (size == 2) {
                    fVar = new f((e) arrayListV.get(0), (e) arrayListV.get(1), i13);
                }
            }
        }
        if (fVar == null || !g.b(fVar)) {
            int i16 = this.f97280k;
            float radians = (float) Math.toRadians(180.0f);
            float radians2 = (float) Math.toRadians(360.0f);
            float f11 = radians / 36;
            float f12 = radians2 / 72;
            float[] fArr = new float[15984];
            float[] fArr2 = new float[10656];
            int i17 = 0;
            int i18 = 0;
            int i19 = 0;
            for (int i21 = 36; i17 < i21; i21 = 36) {
                float f13 = radians / 2.0f;
                float f14 = (i17 * f11) - f13;
                int i22 = i17 + 1;
                float f15 = (i22 * f11) - f13;
                int i23 = 0;
                while (i23 < 73) {
                    float f16 = f15;
                    float f17 = radians;
                    float f18 = radians2;
                    int i24 = i18;
                    int i25 = i19;
                    int i26 = 0;
                    int i27 = 2;
                    while (i26 < i27) {
                        float f19 = i26 == 0 ? f14 : f16;
                        int i28 = i22;
                        float f21 = i23 * f12;
                        float f22 = f14;
                        float f23 = f11;
                        double d5 = 50.0f;
                        double d11 = (f21 + 3.1415927f) - (f18 / 2.0f);
                        double d12 = f19;
                        fArr[i24] = -((float) (Math.cos(d12) * Math.sin(d11) * d5));
                        fArr[i24 + 1] = (float) (Math.sin(d12) * d5);
                        int i29 = i24 + 3;
                        fArr[i24 + 2] = (float) (Math.cos(d12) * Math.cos(d11) * d5);
                        fArr2[i25] = f21 / f18;
                        int i31 = i25 + 2;
                        fArr2[i25 + 1] = ((i17 + i26) * f23) / f17;
                        if ((i23 == 0 && i26 == 0) || (i23 == 72 && i26 == 1)) {
                            System.arraycopy(fArr, i24, fArr, i29, 3);
                            i24 += 6;
                            i5 = 2;
                            System.arraycopy(fArr2, i25, fArr2, i31, 2);
                            i25 += 4;
                        } else {
                            i5 = 2;
                            i24 = i29;
                            i25 = i31;
                        }
                        i26++;
                        i27 = i5;
                        i22 = i28;
                        f14 = f22;
                        f11 = f23;
                    }
                    i23++;
                    i18 = i24;
                    i19 = i25;
                    f15 = f16;
                    radians = f17;
                    radians2 = f18;
                    i22 = i22;
                    f11 = f11;
                }
                i17 = i22;
            }
            e eVar2 = new e(new fk.l(0, 1, fArr, fArr2));
            fVar = new f(eVar2, eVar2, i16);
        }
        this.f97275f.a(j12, fVar);
    }

    public final SurfaceTexture b() {
        try {
            GLES20.glClearColor(0.5f, 0.5f, 0.5f, 1.0f);
            wf.a.f();
            this.f97272c.a();
            wf.a.f();
            wf.a.g("No current context", !wf.v.a(EGL14.eglGetCurrentContext(), EGL14.EGL_NO_CONTEXT));
            int[] iArr = new int[1];
            GLES20.glGenTextures(1, iArr, 0);
            wf.a.f();
            int i5 = iArr[0];
            GLES20.glBindTexture(36197, i5);
            wf.a.f();
            GLES20.glTexParameteri(36197, 10240, 9729);
            wf.a.f();
            GLES20.glTexParameteri(36197, 10241, 9729);
            wf.a.f();
            GLES20.glTexParameteri(36197, 10242, 33071);
            wf.a.f();
            GLES20.glTexParameteri(36197, 10243, 33071);
            wf.a.f();
            this.f97278i = i5;
        } catch (GlUtil$GlException e3) {
            wf.a.p("SceneRenderer", "Failed to initialize the renderer", e3);
        }
        SurfaceTexture surfaceTexture = new SurfaceTexture(this.f97278i);
        this.f97279j = surfaceTexture;
        surfaceTexture.setOnFrameAvailableListener(new SurfaceTexture.OnFrameAvailableListener() { // from class: yf.h
            @Override // android.graphics.SurfaceTexture.OnFrameAvailableListener
            public final void onFrameAvailable(SurfaceTexture surfaceTexture2) {
                this.f97269a.f97270a.set(true);
            }
        });
        return this.f97279j;
    }

    @Override // yf.a
    public final void c(long j11, float[] fArr) {
        ((fk.l) this.f97273d.f13477e).a(j11, fArr);
    }

    @Override // yf.a
    public final void d() {
        this.f97274e.d();
        y0 y0Var = this.f97273d;
        ((fk.l) y0Var.f13477e).d();
        y0Var.f13474b = false;
        this.f97271b.set(true);
    }
}
