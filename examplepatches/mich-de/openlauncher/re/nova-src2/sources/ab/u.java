package ab;

import android.appwidget.AppWidgetManager;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.GestureDetector;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RemoteViews;
import com.teslacoilsw.launcher.NovaLauncher;
import java.util.List;
import mx.j0;
import o9.n1;

/* loaded from: classes2.dex */
public final class u extends o implements View.OnClickListener, aa.c0 {
    public final Rect D;
    public View.OnClickListener E;
    public final ga.g F;
    public final int G;
    public final boolean H;
    public Drawable I;
    public Drawable J;
    public boolean K;
    public final TextPaint L;
    public StaticLayout M;
    public final Drawable N;
    public final GestureDetector O;

    public u(n1 n1Var, ga.g gVar, fz.d0 d0Var, boolean z11) throws SecurityException, IllegalArgumentException {
        super(new ContextThemeWrapper(n1Var, 2132084066));
        this.D = new Rect();
        this.O = new GestureDetector(getContext(), new t(this));
        this.F = gVar;
        this.G = gVar.f57312t;
        this.H = z11;
        NovaLauncher novaLauncher = (NovaLauncher) o9.k.Y(n1Var);
        TextPaint textPaint = new TextPaint();
        this.L = textPaint;
        textPaint.setColor(aa.p.b(getContext(), 16842806));
        textPaint.setTextSize(TypedValue.applyDimension(0, novaLauncher.f79934x.E, getResources().getDisplayMetrics()));
        setBackgroundResource(2131232048);
        Drawable drawableMutate = n1Var.getDrawable(2131232048).mutate();
        this.N = drawableMutate;
        drawableMutate.setAlpha(128);
        setWillNotDraw(false);
        super.updateAppWidget(null);
        this.E = ua.g.f90762b;
        ga.h hVar = gVar.f57316x;
        if (hVar != null) {
            n(hVar);
            return;
        }
        ga.h hVar2 = new ga.h(-1, gVar.o, gVar.f57311s.getPackageName());
        gVar.f57316x = hVar2;
        d0Var.D(this, hVar2);
    }

    public final void D() {
        Drawable drawable = this.I;
        if (drawable != null) {
            drawable.setLevel(Math.max(this.F.f57313u, 0));
        }
    }

    public final boolean E() {
        ga.g gVar = this.F;
        if (gVar.p0(2)) {
            return false;
        }
        return gVar.p0(4) || gVar.p0(1);
    }

    public final boolean F() {
        return this.G != this.F.f57312t;
    }

    @Override // ab.o, android.appwidget.AppWidgetHostView, android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) throws Resources.NotFoundException {
        boolean z11;
        super.dispatchDraw(canvas);
        this.N.draw(canvas);
        boolean z12 = this.K;
        Rect rect = this.D;
        if (z12) {
            j0 j0Var = ((n1) o9.k.Y(getContext())).f79934x;
            int paddingTop = getPaddingTop();
            int paddingBottom = getPaddingBottom();
            int paddingLeft = getPaddingLeft();
            int paddingRight = getPaddingRight();
            int dimensionPixelSize = getResources().getDimensionPixelSize(2131166331);
            int width = (getWidth() - paddingLeft) - paddingRight;
            int i5 = dimensionPixelSize * 2;
            int i11 = width - i5;
            int height = ((getHeight() - paddingTop) - paddingBottom) - i5;
            if (this.J == null) {
                int iMin = Math.min(j0Var.D, Math.min(i11, height));
                rect.set(0, 0, iMin, iMin);
                rect.offsetTo((getWidth() - rect.width()) / 2, (getHeight() - rect.height()) / 2);
                Drawable drawable = this.I;
                if (drawable != null) {
                    drawable.setBounds(rect);
                    z11 = false;
                }
                this.K = z11;
            } else {
                float fMax = Math.max(0, Math.min(i11, height));
                float f11 = fMax * 1.8f;
                float fMax2 = Math.max(i11, height);
                if (f11 > fMax2) {
                    fMax = fMax2 / 1.8f;
                }
                int iMin2 = (int) Math.min(fMax, j0Var.D);
                int height2 = (getHeight() - iMin2) / 2;
                this.M = null;
                if (i11 > 0) {
                    StaticLayout staticLayout = new StaticLayout(getResources().getText(2132017924), this.L, i11, Layout.Alignment.ALIGN_CENTER, 1.0f, 0.0f, true);
                    this.M = staticLayout;
                    int height3 = staticLayout.getHeight();
                    if ((iMin2 * 1.8f) + height3 + j0Var.F < height) {
                        height2 = (((getHeight() - height3) - j0Var.F) - iMin2) / 2;
                    } else {
                        this.M = null;
                    }
                }
                int i12 = height2;
                rect.set(0, 0, iMin2, iMin2);
                rect.offset((getWidth() - iMin2) / 2, i12);
                Drawable drawable2 = this.I;
                if (drawable2 != null) {
                    drawable2.setBounds(rect);
                }
                int i13 = paddingLeft + dimensionPixelSize;
                rect.left = i13;
                int i14 = (int) (iMin2 * 0.4f);
                rect.right = i13 + i14;
                int i15 = paddingTop + dimensionPixelSize;
                rect.top = i15;
                rect.bottom = i15 + i14;
                this.J.setBounds(rect);
                if (this.M != null) {
                    rect.left = i13;
                    rect.top = i12 + iMin2 + j0Var.F;
                }
            }
            z11 = false;
            this.K = z11;
        }
        Drawable drawable3 = this.J;
        if (drawable3 != null) {
            drawable3.draw(canvas);
        }
        Drawable drawable4 = this.I;
        if (drawable4 != null) {
            drawable4.draw(canvas);
        }
        if (this.M != null) {
            canvas.save();
            canvas.translate(rect.left, rect.top);
            this.M.draw(canvas);
            canvas.restore();
        }
    }

    @Override // android.appwidget.AppWidgetHostView
    public final View getDefaultView() {
        View viewInflate = LayoutInflater.from(getContext()).inflate(2131624055, (ViewGroup) this, false);
        viewInflate.setOnClickListener(this);
        D();
        invalidate();
        return viewInflate;
    }

    @Override // aa.c0
    public final void n(ga.f fVar) {
        Drawable drawable;
        Drawable drawable2 = this.I;
        if (drawable2 != null) {
            drawable2.setCallback(null);
            this.I = null;
        }
        if (fVar.f57304r.f21151a != null) {
            ga.g gVar = this.F;
            if (gVar.f57316x.f57320y == -1) {
                drawable = null;
            } else {
                Context context = getContext();
                drawable = context.getDrawable(((d0) e0.G(context).get(gVar.f57316x.f57320y)).f705c);
            }
            if (this.H) {
                if (drawable == null) {
                    aa.n nVarR0 = fVar.r0(getContext(), false);
                    nVarR0.j(true);
                    this.I = nVarR0;
                } else {
                    drawable.setColorFilter(aa.n.h(1.0f));
                    this.I = drawable;
                }
                this.J = null;
            } else if (E()) {
                if (drawable == null) {
                    drawable = fVar.r0(getContext(), false);
                }
                this.I = drawable;
                this.J = getResources().getDrawable(2131231796).mutate();
                float[] fArr = new float[3];
                Color.colorToHSV(fVar.f57304r.f21152b, fArr);
                fArr[1] = Math.min(fArr[1], 0.7f);
                fArr[2] = 1.0f;
                this.J.setColorFilter(Color.HSVToColor(fArr), PorterDuff.Mode.SRC_IN);
            } else {
                if (drawable == null) {
                    drawable = z9.d.m(getContext(), fVar);
                }
                this.I = drawable;
                this.J = null;
                D();
            }
            this.I.setCallback(this);
            this.K = true;
        }
        invalidate();
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        View.OnClickListener onClickListener = this.E;
        if (onClickListener != null) {
            onClickListener.onClick(this);
        }
    }

    @Override // ab.o, android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        if (this.O.onTouchEvent(motionEvent)) {
            return true;
        }
        return super.onInterceptTouchEvent(motionEvent);
    }

    @Override // ab.o, android.widget.FrameLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        this.N.setBounds(0, 0, getMeasuredWidth(), getMeasuredHeight());
    }

    @Override // android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        this.K = true;
    }

    @Override // ab.o, android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        return this.O.onTouchEvent(motionEvent);
    }

    @Override // android.view.View
    public final void setOnClickListener(View.OnClickListener onClickListener) {
        this.E = onClickListener;
    }

    @Override // ab.o, android.appwidget.AppWidgetHostView
    public final void updateAppWidget(RemoteViews remoteViews) {
        if (AppWidgetManager.getInstance(getContext()).getAppWidgetOptions(this.F.f57310r).getBoolean("appWidgetRestoreCompleted")) {
            super.updateAppWidget(remoteViews);
            A();
        }
    }

    @Override // ab.o, android.appwidget.AppWidgetHostView
    public final void updateAppWidgetSize(Bundle bundle, int i5, int i11, int i12, int i13) {
    }

    @Override // android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        return drawable == this.I || super.verifyDrawable(drawable);
    }

    @Override // android.appwidget.AppWidgetHostView
    public final void updateAppWidgetSize(Bundle bundle, List list) {
    }
}
