package ads_mobile_sdk;

import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import b.fb;
import com.google.android.libraries.ads.mobile.sdk.common.AdActivity;

/* loaded from: classes2.dex */
public final class aa2 extends fb {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ea2 f913a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ od1 f914b;

    public aa2(ea2 ea2Var, od1 od1Var) {
        this.f913a = ea2Var;
        this.f914b = od1Var;
    }

    @Override // b.fb
    public final void a(AdActivity adActivity, LinearLayout linearLayout) {
        FrameLayout frameLayout = new FrameLayout(adActivity);
        frameLayout.setTag("layout");
        frameLayout.setBackgroundColor(-1);
        frameLayout.setLayoutParams(new LinearLayout.LayoutParams(-1, -1));
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
        ea2 ea2Var = this.f913a;
        String str = ea2Var.f2821l;
        layoutParams.gravity = str.equals("TOP") ? 49 : str.equals("BOTTOM") ? 81 : 17;
        int i5 = ea2Var.o;
        if (i5 > 0) {
            layoutParams.width = (int) TypedValue.applyDimension(1, i5, adActivity.getResources().getDisplayMetrics());
        }
        View view = this.f914b.f7841m;
        ViewParent parent = view.getParent();
        ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
        if (viewGroup != null) {
            viewGroup.removeAllViews();
        }
        frameLayout.addView(view, layoutParams);
        linearLayout.setBackgroundColor(-1);
        linearLayout.addView(frameLayout);
    }

    @Override // b.f4
    public final void onDestroy() {
        this.f914b.destroy();
    }
}
