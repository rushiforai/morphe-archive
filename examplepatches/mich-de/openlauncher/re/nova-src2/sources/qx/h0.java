package qx;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

/* loaded from: classes4.dex */
public final class h0 extends FrameLayout {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f84502a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h0(int i5, LinearLayout linearLayout, Context context) {
        super(context);
        this.f84502a = i5;
        setLayoutParams(new ViewGroup.LayoutParams(-1, i5));
        addView(linearLayout);
    }

    @Override // android.widget.FrameLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, View.MeasureSpec.makeMeasureSpec(this.f84502a, 1073741824));
    }
}
