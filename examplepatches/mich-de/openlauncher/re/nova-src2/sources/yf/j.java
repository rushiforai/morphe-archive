package yf;

import ai.y0;
import android.graphics.SurfaceTexture;
import android.opengl.GLES20;
import android.opengl.GLSurfaceView;
import android.opengl.Matrix;
import android.util.Log;
import com.google.android.exoplayer2.util.GlUtil$GlException;
import java.nio.Buffer;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import s90.s0;

/* loaded from: classes3.dex */
public final class j implements GLSurfaceView.Renderer, c {

    /* renamed from: a, reason: collision with root package name */
    public final i f97282a;

    /* renamed from: d, reason: collision with root package name */
    public final float[] f97285d;

    /* renamed from: e, reason: collision with root package name */
    public final float[] f97286e;

    /* renamed from: f, reason: collision with root package name */
    public final float[] f97287f;

    /* renamed from: g, reason: collision with root package name */
    public float f97288g;

    /* renamed from: h, reason: collision with root package name */
    public float f97289h;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ k f97292k;

    /* renamed from: b, reason: collision with root package name */
    public final float[] f97283b = new float[16];

    /* renamed from: c, reason: collision with root package name */
    public final float[] f97284c = new float[16];

    /* renamed from: i, reason: collision with root package name */
    public final float[] f97290i = new float[16];

    /* renamed from: j, reason: collision with root package name */
    public final float[] f97291j = new float[16];

    public j(k kVar, i iVar) {
        this.f97292k = kVar;
        float[] fArr = new float[16];
        this.f97285d = fArr;
        float[] fArr2 = new float[16];
        this.f97286e = fArr2;
        float[] fArr3 = new float[16];
        this.f97287f = fArr3;
        this.f97282a = iVar;
        Matrix.setIdentityM(fArr, 0);
        Matrix.setIdentityM(fArr2, 0);
        Matrix.setIdentityM(fArr3, 0);
        this.f97289h = 3.1415927f;
    }

    @Override // yf.c
    public final synchronized void a(float[] fArr, float f11) {
        float[] fArr2 = this.f97285d;
        System.arraycopy(fArr, 0, fArr2, 0, fArr2.length);
        float f12 = -f11;
        this.f97289h = f12;
        Matrix.setRotateM(this.f97286e, 0, -this.f97288g, (float) Math.cos(f12), (float) Math.sin(this.f97289h), 0.0f);
    }

    @Override // android.opengl.GLSurfaceView.Renderer
    public final void onDrawFrame(GL10 gl10) {
        Object objT;
        Object objT2;
        Object objT3;
        float[] fArr;
        synchronized (this) {
            Matrix.multiplyMM(this.f97291j, 0, this.f97285d, 0, this.f97287f, 0);
            Matrix.multiplyMM(this.f97290i, 0, this.f97286e, 0, this.f97291j, 0);
        }
        Matrix.multiplyMM(this.f97284c, 0, this.f97283b, 0, this.f97290i, 0);
        i iVar = this.f97282a;
        float[] fArr2 = this.f97284c;
        GLES20.glClear(ReaderJsonLexerKt.BATCH_SIZE);
        try {
            wf.a.f();
        } catch (GlUtil$GlException e3) {
            wf.a.p("SceneRenderer", "Failed to draw a frame", e3);
        }
        if (iVar.f97270a.compareAndSet(true, false)) {
            SurfaceTexture surfaceTexture = iVar.f97279j;
            surfaceTexture.getClass();
            surfaceTexture.updateTexImage();
            try {
                wf.a.f();
            } catch (GlUtil$GlException e11) {
                wf.a.p("SceneRenderer", "Failed to draw a frame", e11);
            }
            if (iVar.f97271b.compareAndSet(true, false)) {
                Matrix.setIdentityM(iVar.f97276g, 0);
            }
            long timestamp = iVar.f97279j.getTimestamp();
            fk.l lVar = iVar.f97274e;
            synchronized (lVar) {
                objT = lVar.t(timestamp, false);
            }
            Long l9 = (Long) objT;
            if (l9 != null) {
                y0 y0Var = iVar.f97273d;
                float[] fArr3 = iVar.f97276g;
                long jLongValue = l9.longValue();
                fk.l lVar2 = (fk.l) y0Var.f13477e;
                synchronized (lVar2) {
                    objT3 = lVar2.t(jLongValue, true);
                }
                float[] fArr4 = (float[]) objT3;
                if (fArr4 != null) {
                    float[] fArr5 = (float[]) y0Var.f13476d;
                    float f11 = fArr4[0];
                    float f12 = -fArr4[1];
                    float f13 = -fArr4[2];
                    float length = Matrix.length(f11, f12, f13);
                    if (length != 0.0f) {
                        fArr = fArr3;
                        Matrix.setRotateM(fArr5, 0, (float) Math.toDegrees(length), f11 / length, f12 / length, f13 / length);
                    } else {
                        fArr = fArr3;
                        Matrix.setIdentityM(fArr5, 0);
                    }
                    if (!y0Var.f13474b) {
                        y0.i((float[]) y0Var.f13475c, (float[]) y0Var.f13476d);
                        y0Var.f13474b = true;
                    }
                    Matrix.multiplyMM(fArr, 0, (float[]) y0Var.f13475c, 0, (float[]) y0Var.f13476d, 0);
                }
            }
            fk.l lVar3 = iVar.f97275f;
            synchronized (lVar3) {
                objT2 = lVar3.t(timestamp, true);
            }
            f fVar = (f) objT2;
            if (fVar != null) {
                g gVar = iVar.f97272c;
                gVar.getClass();
                if (g.b(fVar)) {
                    gVar.f97261a = fVar.f97256c;
                    fk.l lVar4 = fVar.f97254a.f97253a[0];
                    fk.l lVar5 = new fk.l();
                    float[] fArr6 = (float[]) lVar4.f55201c;
                    lVar5.f55199a = fArr6.length / 3;
                    lVar5.f55201c = wf.a.m(fArr6);
                    lVar5.f55202d = wf.a.m((float[]) lVar4.f55202d);
                    int i5 = lVar4.f55200b;
                    if (i5 == 1) {
                        lVar5.f55200b = 5;
                    } else if (i5 != 2) {
                        lVar5.f55200b = 4;
                    } else {
                        lVar5.f55200b = 6;
                    }
                    gVar.f97262b = lVar5;
                    if (!fVar.f97257d) {
                        fk.l lVar6 = fVar.f97255b.f97253a[0];
                        float[] fArr7 = (float[]) lVar6.f55201c;
                        int length2 = fArr7.length;
                        wf.a.m(fArr7);
                        wf.a.m((float[]) lVar6.f55202d);
                    }
                }
            }
        }
        Matrix.multiplyMM(iVar.f97277h, 0, fArr2, 0, iVar.f97276g, 0);
        g gVar2 = iVar.f97272c;
        int i11 = iVar.f97278i;
        float[] fArr8 = iVar.f97277h;
        fk.l lVar7 = gVar2.f97262b;
        if (lVar7 == null) {
            return;
        }
        int i12 = gVar2.f97261a;
        GLES20.glUniformMatrix3fv(gVar2.f97265e, 1, false, i12 == 1 ? g.f97259j : i12 == 2 ? g.f97260k : g.f97258i, 0);
        GLES20.glUniformMatrix4fv(gVar2.f97264d, 1, false, fArr8, 0);
        GLES20.glActiveTexture(33984);
        GLES20.glBindTexture(36197, i11);
        GLES20.glUniform1i(gVar2.f97268h, 0);
        try {
            wf.a.f();
        } catch (GlUtil$GlException e12) {
            Log.e("ProjectionRenderer", "Failed to bind uniforms", e12);
        }
        GLES20.glVertexAttribPointer(gVar2.f97266f, 3, 5126, false, 12, (Buffer) lVar7.f55201c);
        try {
            wf.a.f();
        } catch (GlUtil$GlException e13) {
            Log.e("ProjectionRenderer", "Failed to load position data", e13);
        }
        GLES20.glVertexAttribPointer(gVar2.f97267g, 2, 5126, false, 8, (Buffer) lVar7.f55202d);
        try {
            wf.a.f();
        } catch (GlUtil$GlException e14) {
            Log.e("ProjectionRenderer", "Failed to load texture data", e14);
        }
        GLES20.glDrawArrays(lVar7.f55200b, 0, lVar7.f55199a);
        try {
            wf.a.f();
        } catch (GlUtil$GlException e15) {
            Log.e("ProjectionRenderer", "Failed to render", e15);
        }
    }

    @Override // android.opengl.GLSurfaceView.Renderer
    public final void onSurfaceChanged(GL10 gl10, int i5, int i11) {
        GLES20.glViewport(0, 0, i5, i11);
        float f11 = i5 / i11;
        Matrix.perspectiveM(this.f97283b, 0, f11 > 1.0f ? (float) (Math.toDegrees(Math.atan(Math.tan(Math.toRadians(45.0d)) / f11)) * 2.0d) : 90.0f, f11, 0.1f, 100.0f);
    }

    @Override // android.opengl.GLSurfaceView.Renderer
    public final synchronized void onSurfaceCreated(GL10 gl10, EGLConfig eGLConfig) {
        k kVar = this.f97292k;
        kVar.f97297e.post(new s0(13, kVar, this.f97282a.b()));
    }
}
