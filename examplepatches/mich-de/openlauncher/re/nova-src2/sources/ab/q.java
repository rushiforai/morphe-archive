package ab;

import android.appwidget.AppWidgetHostView;
import android.appwidget.AppWidgetProviderInfo;
import android.content.Context;
import android.graphics.PointF;
import android.graphics.Rect;
import android.view.KeyEvent;
import android.view.View;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import mx.j0;
import o9.v2;

/* loaded from: classes.dex */
public abstract class q extends AppWidgetHostView implements x9.p, v2 {

    /* renamed from: a, reason: collision with root package name */
    public float f750a;

    /* renamed from: b, reason: collision with root package name */
    public final PointF f751b;

    /* renamed from: c, reason: collision with root package name */
    public final PointF f752c;

    /* renamed from: d, reason: collision with root package name */
    public final PointF f753d;

    /* renamed from: e, reason: collision with root package name */
    public final PointF f754e;

    /* renamed from: f, reason: collision with root package name */
    public float f755f;

    /* renamed from: g, reason: collision with root package name */
    public final Rect f756g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f757h;

    /* renamed from: i, reason: collision with root package name */
    public final za.d f758i;

    public q(Context context) {
        super(context);
        this.f750a = 1.0f;
        this.f751b = new PointF(0.0f, 0.0f);
        this.f752c = new PointF(0.0f, 0.0f);
        this.f753d = new PointF(0.0f, 0.0f);
        this.f754e = new PointF(0.0f, 0.0f);
        this.f755f = 1.0f;
        this.f756g = new Rect();
        this.f758i = (za.d) za.d.p(context);
    }

    @Override // o9.v2
    public final float b() {
        return this.f755f;
    }

    @Override // o9.v2
    public final View c() {
        return this;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void clearChildFocus(View view) {
        super.clearChildFocus(view);
        setSelected(false);
    }

    @Override // x9.p
    public final void d(Rect rect) {
        int measuredWidth = (int) (getMeasuredWidth() * this.f750a);
        int measuredHeight = (int) (getMeasuredHeight() * this.f750a);
        j0 j0VarP = this.f758i.P();
        Rect rect2 = this.f756g;
        f(j0VarP, rect2);
        rect.set(rect2.left, rect2.top, measuredWidth - rect2.right, measuredHeight - rect2.bottom);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (!this.f757h || keyEvent.getKeyCode() != 111 || keyEvent.getAction() != 1) {
            return super.dispatchKeyEvent(keyEvent);
        }
        this.f757h = false;
        requestFocus();
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchUnhandledMove(View view, int i5) {
        return this.f757h;
    }

    public final void f(j0 j0Var, Rect rect) {
        if (!j0Var.q()) {
            rect.setEmpty();
            return;
        }
        AppWidgetProviderInfo appWidgetInfo = getAppWidgetInfo();
        if (appWidgetInfo == null) {
            rect.set(j0Var.f77131a.f80286u);
        } else {
            AppWidgetHostView.getDefaultPaddingForWidget(getContext(), appWidgetInfo.provider, rect);
        }
    }

    public final void g(float f11) {
        this.f750a = f11;
        super.setScaleX(f11 * this.f755f);
        super.setScaleY(this.f750a * this.f755f);
    }

    @Override // android.view.ViewGroup
    public final int getDescendantFocusability() {
        if (this.f757h) {
            return SQLiteDatabase.OPEN_SHAREDCACHE;
        }
        return 393216;
    }

    @Override // o9.v2
    public final void h(float f11) {
        this.f755f = f11;
        super.setScaleX(this.f750a * f11);
        super.setScaleY(this.f750a * this.f755f);
    }

    @Override // o9.v2
    public final void i(float f11, float f12) {
        this.f753d.set(f11, f12);
        r();
    }

    @Override // o9.v2
    public final void j(float f11, float f12) {
        this.f754e.set(f11, f12);
        r();
    }

    @Override // x9.p
    public final int m() {
        return 1;
    }

    @Override // o9.v2
    public final void o(PointF pointF) {
        pointF.set(this.f754e);
    }

    @Override // android.view.View
    public final void onFocusChanged(boolean z11, int i5, Rect rect) {
        if (z11) {
            this.f757h = false;
            setSelected(false);
        }
        super.onFocusChanged(z11, i5, rect);
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public final boolean onKeyDown(int i5, KeyEvent keyEvent) {
        if (this.f757h || i5 != 66) {
            return super.onKeyDown(i5, keyEvent);
        }
        keyEvent.startTracking();
        return true;
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public final boolean onKeyUp(int i5, KeyEvent keyEvent) {
        if (keyEvent.isTracking() && !this.f757h && i5 == 66) {
            this.f757h = true;
            ArrayList<View> focusables = getFocusables(2);
            focusables.remove(this);
            int size = focusables.size();
            if (size != 0) {
                if (size != 1 || !q()) {
                    focusables.get(0).requestFocus();
                    return true;
                }
                focusables.get(0).performClick();
                this.f757h = false;
                return true;
            }
            this.f757h = false;
        }
        return super.onKeyUp(i5, keyEvent);
    }

    @Override // o9.v2
    public final void p(PointF pointF) {
        pointF.set(this.f753d);
    }

    public abstract boolean q();

    public final void r() {
        PointF pointF = this.f753d;
        float f11 = pointF.x;
        PointF pointF2 = this.f754e;
        float f12 = f11 + pointF2.x;
        PointF pointF3 = this.f751b;
        float f13 = f12 + pointF3.x;
        PointF pointF4 = this.f752c;
        super.setTranslationX(f13 + pointF4.x);
        super.setTranslationY(pointF.y + pointF2.y + pointF3.y + pointF4.y);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestChildFocus(View view, View view2) {
        super.requestChildFocus(view, view2);
        setSelected(this.f757h && view2 != null);
        if (view2 != null) {
            view2.setFocusableInTouchMode(false);
        }
    }
}
