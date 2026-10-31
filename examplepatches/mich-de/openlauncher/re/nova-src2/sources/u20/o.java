package u20;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import android.view.ViewPropertyAnimator;
import android.widget.ImageButton;
import com.teslacoilsw.launcher.theme.PickerActivity;

/* loaded from: classes4.dex */
public final class o extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ViewPropertyAnimator f90490a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ImageButton f90491b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ View f90492c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ View f90493d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ View f90494e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ View f90495f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ PickerActivity f90496g;

    public o(PickerActivity pickerActivity, ViewPropertyAnimator viewPropertyAnimator, ImageButton imageButton, View view, View view2, View view3, View view4) {
        this.f90496g = pickerActivity;
        this.f90490a = viewPropertyAnimator;
        this.f90491b = imageButton;
        this.f90492c = view;
        this.f90493d = view2;
        this.f90494e = view3;
        this.f90495f = view4;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        this.f90490a.cancel();
        PickerActivity pickerActivity = this.f90496g;
        pickerActivity.f46311r = null;
        pickerActivity.f46313t.setLayerType(0, null);
        pickerActivity.f46314u.setLayerType(0, null);
        pickerActivity.f46310q.removeView(pickerActivity.f46313t);
        pickerActivity.f46310q.removeView(pickerActivity.f46314u);
        pickerActivity.f46310q.removeView(this.f90491b);
        pickerActivity.f46313t = null;
        pickerActivity.f46314u = null;
        this.f90492c.setAlpha(1.0f);
        this.f90493d.setVisibility(4);
        this.f90494e.setVisibility(0);
        this.f90495f.setTranslationY(0.0f);
        pickerActivity.f46312s.setVisibility(0);
        pickerActivity.f46312s = null;
        pickerActivity.f46311r = null;
    }
}
