package ab;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import com.android.launcher3.LauncherWallpaperPickerActivity;
import com.android.launcher3.widget.WidgetsBottomSheet;
import com.android.launcher3.widget.picker.WidgetsFullSheet;
import com.stripe.android.view.CardNumberTextInputLayout;
import java.util.NoSuchElementException;

/* loaded from: classes2.dex */
public final class h0 implements View.OnLayoutChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f726a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f727b;

    public /* synthetic */ h0(Object obj, int i5) {
        this.f726a = i5;
        this.f727b = obj;
    }

    @Override // android.view.View.OnLayoutChangeListener
    public final void onLayoutChange(View view, int i5, int i11, int i12, int i13, int i14, int i15, int i16, int i17) {
        int i18 = this.f726a;
        Object obj = this.f727b;
        switch (i18) {
            case 0:
                WidgetsBottomSheet widgetsBottomSheet = (WidgetsBottomSheet) obj;
                widgetsBottomSheet.getClass();
                widgetsBottomSheet.removeOnLayoutChangeListener(this);
                return;
            case 1:
                WidgetsFullSheet widgetsFullSheet = (WidgetsFullSheet) obj;
                int i19 = WidgetsFullSheet.Q;
                widgetsFullSheet.getClass();
                widgetsFullSheet.removeOnLayoutChangeListener(this);
                return;
            case 2:
                throw null;
            case 3:
                LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = (LauncherWallpaperPickerActivity) obj;
                if (i12 - i5 <= 0 || i13 - i11 <= 0) {
                    return;
                }
                int i21 = launcherWallpaperPickerActivity.D;
                if (i21 >= 0 && i21 < launcherWallpaperPickerActivity.f20977v.getChildCount()) {
                    launcherWallpaperPickerActivity.f20976u.onClick(launcherWallpaperPickerActivity.f20977v.getChildAt(launcherWallpaperPickerActivity.D));
                    launcherWallpaperPickerActivity.p0(false);
                }
                view.removeOnLayoutChangeListener(this);
                return;
            default:
                view.removeOnLayoutChangeListener(this);
                CardNumberTextInputLayout cardNumberTextInputLayout = (CardNumberTextInputLayout) obj;
                View view2 = cardNumberTextInputLayout.C0;
                ViewParent parent = view2.getParent();
                ViewGroup viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
                if (viewGroup != null) {
                    viewGroup.removeView(view2);
                }
                if (cardNumberTextInputLayout.getChildCount() <= 0) {
                    throw new NoSuchElementException("Sequence is empty.");
                }
                View childAt = cardNumberTextInputLayout.getChildAt(0);
                if (childAt == null) {
                    throw new IndexOutOfBoundsException();
                }
                FrameLayout frameLayout = (FrameLayout) childAt;
                frameLayout.addView(view2);
                ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
                if (layoutParams == null) {
                    throw new NullPointerException("null cannot be cast to non-null type android.widget.FrameLayout.LayoutParams");
                }
                FrameLayout.LayoutParams layoutParams2 = (FrameLayout.LayoutParams) layoutParams;
                layoutParams2.setMarginStart(frameLayout.getWidth() - cardNumberTextInputLayout.getResources().getDimensionPixelSize(2131166447));
                layoutParams2.topMargin = cardNumberTextInputLayout.getResources().getDimensionPixelSize(2131166448);
                view2.setLayoutParams(layoutParams2);
                return;
        }
    }
}
