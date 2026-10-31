package androidx.browser.browseractions;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;

@Deprecated
/* loaded from: classes2.dex */
public class BrowserActionsFallbackMenuView extends LinearLayout {

    /* renamed from: a, reason: collision with root package name */
    public final int f13848a;

    /* renamed from: b, reason: collision with root package name */
    public final int f13849b;

    public BrowserActionsFallbackMenuView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f13848a = getResources().getDimensionPixelOffset(2131165336);
        this.f13849b = getResources().getDimensionPixelOffset(2131165335);
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(Math.min(getResources().getDisplayMetrics().widthPixels - (this.f13848a * 2), this.f13849b), 1073741824), i11);
    }
}
