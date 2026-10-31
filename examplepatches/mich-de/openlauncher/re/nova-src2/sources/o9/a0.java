package o9;

import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import com.teslacoilsw.launcher.quicksearchbar.NovaSearchBarView;
import java.util.regex.Pattern;

/* loaded from: classes.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public final View f79743a;

    /* renamed from: b, reason: collision with root package name */
    public final View.OnLongClickListener f79744b;

    /* renamed from: c, reason: collision with root package name */
    public final float f79745c;

    /* renamed from: e, reason: collision with root package name */
    public boolean f79747e;

    /* renamed from: f, reason: collision with root package name */
    public z f79748f;

    /* renamed from: h, reason: collision with root package name */
    public z f79750h;

    /* renamed from: i, reason: collision with root package name */
    public final rz.a f79751i;

    /* renamed from: d, reason: collision with root package name */
    public float f79746d = 0.75f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f79749g = false;

    /* renamed from: j, reason: collision with root package name */
    public boolean f79752j = true;

    /* renamed from: k, reason: collision with root package name */
    public float f79753k = 0.0f;

    /* renamed from: l, reason: collision with root package name */
    public float f79754l = 0.0f;

    public a0(View view, View.OnLongClickListener onLongClickListener, rz.a aVar) {
        this.f79743a = view;
        this.f79744b = onLongClickListener;
        this.f79751i = aVar;
        this.f79745c = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
    }

    public final void a() {
        this.f79747e = false;
        z zVar = this.f79748f;
        View view = this.f79743a;
        if (zVar != null) {
            view.removeCallbacks(zVar);
            this.f79748f = null;
        }
        this.f79749g = false;
        z zVar2 = this.f79750h;
        if (zVar2 != null) {
            view.removeCallbacks(zVar2);
            this.f79750h = null;
        }
    }

    public final void b(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        int i5 = 0;
        View view = this.f79743a;
        if (action == 0) {
            this.f79753k = motionEvent.getX();
            this.f79754l = motionEvent.getY();
            a();
            c();
            if (this.f79751i != null) {
                e10.y2.f51877a.getClass();
                if ((e10.y2.d() && (view.getTag() instanceof ga.e)) || (view instanceof NovaSearchBarView)) {
                    this.f79749g = false;
                    if (this.f79750h == null) {
                        this.f79750h = new z(this, i5);
                    }
                    view.postDelayed(this.f79750h, ((long) (ViewConfiguration.getLongPressTimeout() * this.f79746d)) + 900);
                }
            }
            if (motionEvent.getToolType(0) == 2 && motionEvent.isButtonPressed(2)) {
                d();
                return;
            }
            return;
        }
        if (action != 1) {
            if (action == 2) {
                float x11 = motionEvent.getX();
                float y11 = motionEvent.getY();
                Pattern pattern = g3.f79846a;
                float f11 = this.f79745c;
                float f12 = -f11;
                if (x11 < f12 || y11 < f12 || x11 >= view.getWidth() + f11 || y11 >= view.getHeight() + f11 || (!this.f79752j && ph.a.o(this.f79753k, this.f79754l, motionEvent.getX(), motionEvent.getY()) > f11 * 2.0f)) {
                    a();
                    return;
                } else {
                    if (this.f79748f != null && motionEvent.getToolType(0) == 2 && motionEvent.isButtonPressed(2)) {
                        d();
                        return;
                    }
                    return;
                }
            }
            if (action != 3) {
                return;
            }
        }
        a();
    }

    public final void c() {
        this.f79747e = false;
        if (this.f79748f == null) {
            this.f79748f = new z(this, 1);
        }
        this.f79743a.postDelayed(this.f79748f, (long) (ViewConfiguration.getLongPressTimeout() * this.f79746d));
    }

    public final void d() {
        z zVar;
        View view = this.f79743a;
        if (view.getParent() == null || !view.hasWindowFocus()) {
            return;
        }
        boolean zIsPressed = view.isPressed();
        View.OnLongClickListener onLongClickListener = this.f79744b;
        if ((zIsPressed && onLongClickListener == null) || this.f79747e) {
            return;
        }
        if (onLongClickListener != null ? onLongClickListener.onLongClick(view) : view.performLongClick()) {
            Handler handler = view.getHandler();
            if (handler != null && (zVar = this.f79750h) != null && handler.hasCallbacks(zVar)) {
                view.getParent().requestDisallowInterceptTouchEvent(true);
            }
            view.setPressed(false);
            this.f79747e = true;
        }
        z zVar2 = this.f79748f;
        if (zVar2 != null) {
            view.removeCallbacks(zVar2);
            this.f79748f = null;
        }
    }
}
