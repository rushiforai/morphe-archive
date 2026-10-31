package e10;

import android.view.MotionEvent;
import android.view.View;
import com.teslacoilsw.launcher.preferences.IconLayoutSettingsActivity;
import com.teslacoilsw.launcher.widget.SneezeGuardView;

/* loaded from: classes4.dex */
public final /* synthetic */ class y0 implements View.OnTouchListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51876a;

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        switch (this.f51876a) {
            case 0:
                int i5 = IconLayoutSettingsActivity.B;
                return true;
            default:
                int i11 = SneezeGuardView.f46485a;
            case 1:
                return true;
        }
    }
}
