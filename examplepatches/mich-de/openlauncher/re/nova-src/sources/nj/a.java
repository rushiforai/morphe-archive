package nj;

import android.app.Dialog;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Build;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;

/* loaded from: classes3.dex */
public final class a implements View.OnTouchListener {

    /* renamed from: a, reason: collision with root package name */
    public final Dialog f78351a;

    /* renamed from: b, reason: collision with root package name */
    public final int f78352b;

    /* renamed from: c, reason: collision with root package name */
    public final int f78353c;

    /* renamed from: d, reason: collision with root package name */
    public final int f78354d;

    public a(Dialog dialog, Rect rect) {
        this.f78351a = dialog;
        this.f78352b = rect.left;
        this.f78353c = rect.top;
        this.f78354d = ViewConfiguration.get(dialog.getContext()).getScaledWindowTouchSlop();
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        View viewFindViewById = view.findViewById(16908290);
        int left = viewFindViewById.getLeft() + this.f78352b;
        int width = viewFindViewById.getWidth() + left;
        if (new RectF(left, viewFindViewById.getTop() + this.f78353c, width, viewFindViewById.getHeight() + r4).contains(motionEvent.getX(), motionEvent.getY())) {
            return false;
        }
        MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent);
        if (motionEvent.getAction() == 1) {
            motionEventObtain.setAction(4);
        }
        if (Build.VERSION.SDK_INT < 28) {
            motionEventObtain.setAction(0);
            int i5 = this.f78354d;
            motionEventObtain.setLocation((-i5) - 1, (-i5) - 1);
        }
        view.performClick();
        return this.f78351a.onTouchEvent(motionEventObtain);
    }
}
