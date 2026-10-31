package a5;

import android.graphics.Rect;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import com.android.launcher3.dragndrop.DragLayer;
import com.stripe.android.stripe3ds2.views.InformationZoneView;
import com.teslacoilsw.launcher.EditShortcutFloatingView;

/* loaded from: classes2.dex */
public final /* synthetic */ class d0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f268a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ View f269b;

    public /* synthetic */ d0(View view, int i5) {
        this.f268a = i5;
        this.f269b = view;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5 = this.f268a;
        View view = this.f269b;
        switch (i5) {
            case 0:
                ((InputMethodManager) view.getContext().getSystemService("input_method")).showSoftInput(view, 0);
                break;
            case 1:
                int i11 = EditShortcutFloatingView.f45599v;
                view.animate().scaleX(1.0f).scaleY(1.0f).setInterpolator(zx.d.f98805a).setDuration(150L).start();
                break;
            case 2:
                view.requestFocus();
                break;
            case 3:
                ((InputMethodManager) view.getContext().getSystemService(InputMethodManager.class)).showSoftInput(view, 1);
                break;
            case 4:
                int i12 = DragLayer.E;
                view.setVisibility(0);
                break;
            default:
                int i13 = InformationZoneView.f45259l;
                Rect rect = new Rect(0, 0, view.getWidth(), view.getHeight());
                view.getHitRect(rect);
                view.requestRectangleOnScreen(rect, false);
                break;
        }
    }
}
