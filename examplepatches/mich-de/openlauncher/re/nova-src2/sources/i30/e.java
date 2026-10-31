package i30;

import android.graphics.PointF;
import android.graphics.RectF;
import android.view.MotionEvent;
import com.teslacoilsw.launcher.wallpaper.app.CropImage;
import h6.c1;
import javax.microedition.khronos.opengles.GL11;

/* loaded from: classes4.dex */
public final class e extends n {

    /* renamed from: j, reason: collision with root package name */
    public final p f61276j;

    /* renamed from: l, reason: collision with root package name */
    public float f61278l;

    /* renamed from: m, reason: collision with root package name */
    public float f61279m;
    public final /* synthetic */ f n;

    /* renamed from: g, reason: collision with root package name */
    public final RectF f61273g = new RectF(0.25f, 0.25f, 0.75f, 0.75f);

    /* renamed from: h, reason: collision with root package name */
    public final RectF f61274h = new RectF();

    /* renamed from: i, reason: collision with root package name */
    public final PointF f61275i = new PointF();

    /* renamed from: k, reason: collision with root package name */
    public int f61277k = 0;

    public e(f fVar) {
        this.n = fVar;
        CropImage cropImage = fVar.o;
        cropImage.getClass();
        this.f61276j = new p(cropImage);
    }

    @Override // i30.n
    public final boolean m(MotionEvent motionEvent) {
        f fVar = this.n;
        d dVar = fVar.f61285l;
        int action = motionEvent.getAction();
        RectF rectF = this.f61273g;
        if (action == 0) {
            this.f61278l = motionEvent.getX();
            this.f61279m = motionEvent.getY();
            RectF rectF2 = this.f61274h;
            dVar.c(rectF, rectF2);
            float x11 = motionEvent.getX();
            float y11 = motionEvent.getY();
            float f11 = rectF2.left;
            if (x11 <= f11 + 30.0f || x11 >= rectF2.right - 30.0f || y11 <= rectF2.top + 30.0f || y11 >= rectF2.bottom - 30.0f) {
                boolean z11 = rectF2.top - 30.0f <= y11 && y11 <= rectF2.bottom + 30.0f;
                boolean z12 = f11 - 30.0f <= x11 && x11 <= rectF2.right + 30.0f;
                if (z11) {
                    boolean z13 = Math.abs(x11 - f11) <= 30.0f;
                    boolean z14 = Math.abs(x11 - rectF2.right) <= 30.0f;
                    if (z13 && z14) {
                        z13 = Math.abs(x11 - rectF2.left) < Math.abs(x11 - rectF2.right);
                        z14 = !z13;
                    }
                    if (z13) {
                        this.f61277k |= 1;
                    }
                    if (z14) {
                        this.f61277k |= 4;
                    }
                    if (fVar.f61280g != -1.0f && z12) {
                        this.f61277k = (y11 > (rectF2.top + rectF2.bottom) / 2.0f ? 8 : 2) | this.f61277k;
                    }
                }
                if (z12) {
                    boolean z15 = Math.abs(y11 - rectF2.top) <= 30.0f;
                    boolean z16 = Math.abs(y11 - rectF2.bottom) <= 30.0f;
                    if (z15 && z16) {
                        z15 = Math.abs(y11 - rectF2.top) < Math.abs(y11 - rectF2.bottom);
                        z16 = !z15;
                    }
                    if (z15) {
                        this.f61277k |= 2;
                    }
                    if (z16) {
                        this.f61277k |= 8;
                    }
                    if (fVar.f61280g != -1.0f && z11) {
                        this.f61277k |= x11 <= (rectF2.left + rectF2.right) / 2.0f ? 1 : 4;
                    }
                }
            } else {
                this.f61277k = 16;
            }
            h();
            return true;
        }
        if (action != 1) {
            if (action == 2) {
                float f12 = dVar.f61265f;
                float x12 = ((motionEvent.getX() - this.f61278l) / f12) / fVar.f61286m;
                float y12 = ((motionEvent.getY() - this.f61279m) / f12) / fVar.n;
                this.f61278l = motionEvent.getX();
                float y13 = motionEvent.getY();
                this.f61279m = y13;
                if ((16 & this.f61277k) != 0) {
                    float fB = f30.f.b(x12, -rectF.left, 1.0f - rectF.right);
                    float fB2 = f30.f.b(y12, -rectF.top, 1.0f - rectF.bottom);
                    rectF.top += fB2;
                    rectF.bottom += fB2;
                    rectF.left += fB;
                    rectF.right += fB;
                } else {
                    float f13 = this.f61278l;
                    PointF pointF = this.f61275i;
                    pointF.set(f13, y13);
                    float f14 = dVar.f61265f;
                    float f15 = pointF.x;
                    f fVar2 = dVar.f61272m;
                    pointF.x = f30.f.b((c1.f(fVar2.g(), 0.5f, f15, f14) + dVar.f61263d) / fVar2.f61286m, 0.0f, 1.0f);
                    pointF.y = f30.f.b((c1.f(fVar2.e(), 0.5f, pointF.y, f14) + dVar.f61264e) / fVar2.n, 0.0f, 1.0f);
                    float f16 = 16.0f / fVar.f61286m;
                    float f17 = rectF.left + f16;
                    float f18 = rectF.right - f16;
                    float f19 = 16.0f / fVar.n;
                    float f21 = rectF.top + f19;
                    float f22 = rectF.bottom - f19;
                    if ((this.f61277k & 4) != 0) {
                        rectF.right = f30.f.b(pointF.x, f17, 1.0f);
                    }
                    if ((this.f61277k & 1) != 0) {
                        rectF.left = f30.f.b(pointF.x, 0.0f, f18);
                    }
                    if ((this.f61277k & 2) != 0) {
                        rectF.top = f30.f.b(pointF.y, 0.0f, f22);
                    }
                    if ((this.f61277k & 8) != 0) {
                        rectF.bottom = f30.f.b(pointF.y, f21, 1.0f);
                    }
                    float f23 = fVar.f61280g;
                    if (f23 != -1.0f) {
                        float f24 = (f23 * fVar.n) / fVar.f61286m;
                        if (rectF.width() / rectF.height() > f24) {
                            float fWidth = rectF.width() / f24;
                            if ((this.f61277k & 8) != 0) {
                                rectF.bottom = f30.f.b(rectF.top + fWidth, f21, 1.0f);
                            } else {
                                rectF.top = f30.f.b(rectF.bottom - fWidth, 0.0f, f22);
                            }
                        } else {
                            float fHeight = rectF.height() * f24;
                            if ((this.f61277k & 1) != 0) {
                                rectF.left = f30.f.b(rectF.right - fHeight, 0.0f, f18);
                            } else {
                                rectF.right = f30.f.b(rectF.left + fHeight, f17, 1.0f);
                            }
                        }
                        if (rectF.width() / rectF.height() > f24) {
                            float fHeight2 = rectF.height() * f24;
                            if ((this.f61277k & 1) != 0) {
                                rectF.left = f30.f.b(rectF.right - fHeight2, 0.0f, f18);
                            } else {
                                rectF.right = f30.f.b(rectF.left + fHeight2, f17, 1.0f);
                            }
                        } else {
                            float fWidth2 = rectF.width() / f24;
                            if ((this.f61277k & 8) != 0) {
                                rectF.bottom = f30.f.b(rectF.top + fWidth2, f21, 1.0f);
                            } else {
                                rectF.top = f30.f.b(rectF.bottom - fWidth2, 0.0f, f22);
                            }
                        }
                    }
                }
                h();
                return true;
            }
            if (action != 3) {
                return true;
            }
        }
        this.f61277k = 0;
        f fVar3 = dVar.f61272m;
        d dVar2 = fVar3.f61285l;
        RectF rectF3 = new RectF();
        dVar2.c(rectF, rectF3);
        int iG = fVar3.g();
        int iE = fVar3.e();
        float fWidth3 = rectF3.width() / iG;
        float fHeight3 = rectF3.height() / iE;
        if (fWidth3 < 0.4f || fWidth3 >= 0.8f || fHeight3 < 0.4f || fHeight3 >= 0.8f || rectF3.left < 64.0f || rectF3.right >= iG - 64 || rectF3.top < 64.0f || rectF3.bottom >= iE - 64) {
            dVar.f61266g = dVar.f61263d;
            dVar.f61267h = dVar.f61264e;
            dVar.f61268i = dVar.f61265f;
            dVar.a(rectF);
            dVar.f61260a = -1L;
        }
        h();
        return true;
    }

    @Override // i30.n
    public final void p(i iVar) {
        f fVar = this.n;
        d dVar = fVar.f61285l;
        RectF rectF = this.f61273g;
        RectF rectF2 = this.f61274h;
        dVar.c(rectF, rectF2);
        GL11 gl11 = iVar.f61299a;
        gl11.glLineWidth(3.0f);
        gl11.glEnable(2848);
        gl11.glEnable(2960);
        gl11.glClear(1024);
        gl11.glStencilOp(7680, 7680, 7681);
        gl11.glStencilFunc(519, 1, 1);
        if (fVar.f61281h == 0.0f || fVar.f61282i == 0.0f) {
            iVar.f(rectF2.left, rectF2.top, rectF2.width(), rectF2.height(), 0);
            iVar.c(rectF2.left, rectF2.top, rectF2.width(), rectF2.height(), fVar.f61287p);
        } else {
            float fWidth = rectF2.width() * fVar.f61281h;
            float fHeight = rectF2.height() * fVar.f61282i;
            float fCenterX = rectF2.centerX();
            float fCenterY = rectF2.centerY();
            float f11 = fWidth / 2.0f;
            float f12 = fCenterX - f11;
            float f13 = fHeight / 2.0f;
            float f14 = fCenterY - f13;
            iVar.f(f12, f14, fWidth, fHeight, 0);
            iVar.c(f12, f14, fWidth, fHeight, fVar.f61287p);
            iVar.c(rectF2.left, rectF2.top, rectF2.width(), rectF2.height(), fVar.f61287p);
            gl11.glStencilFunc(517, 1, 1);
            gl11.glStencilOp(7680, 7680, 7681);
            float f15 = fCenterX - f13;
            float f16 = fCenterY - f11;
            iVar.c(f15, f16, fHeight, fWidth, fVar.f61287p);
            iVar.f(f15, f16, fHeight, fWidth, 0);
            iVar.f(rectF2.left, rectF2.top, rectF2.width(), rectF2.height(), Integer.MIN_VALUE);
        }
        gl11.glStencilFunc(517, 1, 1);
        gl11.glStencilOp(7680, 7680, 7680);
        iVar.f(0.0f, 0.0f, g(), e(), -1610612736);
        gl11.glDisable(2960);
        float f17 = (rectF2.top + rectF2.bottom) / 2.0f;
        float f18 = rectF2.left;
        float f19 = rectF2.right;
        float f21 = (f18 + f19) / 2.0f;
        int i5 = this.f61277k;
        boolean z11 = i5 == 0;
        int i11 = i5 & 4;
        p pVar = this.f61276j;
        if (i11 != 0 || z11) {
            iVar.d(pVar, Math.round(f19 - (pVar.e() / 2)), Math.round(f17 - (pVar.b() / 2)), pVar.e(), pVar.b(), iVar.f61305g);
        }
        if ((this.f61277k & 1) != 0 || z11) {
            iVar.d(pVar, Math.round(rectF2.left - (pVar.e() / 2)), Math.round(f17 - (pVar.b() / 2)), pVar.e(), pVar.b(), iVar.f61305g);
        }
        if ((this.f61277k & 2) != 0 || z11) {
            iVar.d(pVar, Math.round(f21 - (pVar.e() / 2)), Math.round(rectF2.top - (pVar.b() / 2)), pVar.e(), pVar.b(), iVar.f61305g);
        }
        if ((this.f61277k & 8) != 0 || z11) {
            iVar.d(pVar, Math.round(f21 - (pVar.e() / 2)), Math.round(rectF2.bottom - (pVar.b() / 2)), pVar.e(), pVar.b(), iVar.f61305g);
        }
    }
}
