package ads_mobile_sdk;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import b.d0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public class vw2 extends FrameLayout {

    /* renamed from: a, reason: collision with root package name */
    public mi.a f10945a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vw2(Context context, mi.a adSize) {
        super(context);
        Intrinsics.g(adSize, "adSize");
        Intrinsics.g(context, "context");
        this.f10945a = adSize;
        setMinimumHeight(d0.b(context, adSize.f76405b));
        setMinimumWidth(d0.b(context, this.f10945a.f76404a));
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        View childAt = getChildAt(0);
        if (childAt == null || childAt.getVisibility() == 8) {
            return;
        }
        int measuredWidth = childAt.getMeasuredWidth();
        int measuredHeight = childAt.getMeasuredHeight();
        int i14 = ((i12 - i5) - measuredWidth) / 2;
        int i15 = ((i13 - i11) - measuredHeight) / 2;
        childAt.layout(i14, i15, measuredWidth + i14, measuredHeight + i15);
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        int iA;
        int iA2;
        View childAt = getChildAt(0);
        if (childAt == null || childAt.getVisibility() == 8) {
            Context context = getContext();
            mi.a aVar = this.f10945a;
            Intrinsics.d(context);
            int i12 = aVar.f76404a;
            iA = (i12 == -4 || i12 == -3) ? -1 : (int) d0.a(context, i12);
            int i13 = this.f10945a.f76405b;
            iA2 = (i13 == -4 || i13 == -3) ? -1 : (int) d0.a(context, i13);
        } else {
            measureChild(childAt, i5, i11);
            iA = childAt.getMeasuredWidth();
            iA2 = childAt.getMeasuredHeight();
        }
        int suggestedMinimumWidth = getSuggestedMinimumWidth();
        if (iA < suggestedMinimumWidth) {
            iA = suggestedMinimumWidth;
        }
        int suggestedMinimumHeight = getSuggestedMinimumHeight();
        if (iA2 < suggestedMinimumHeight) {
            iA2 = suggestedMinimumHeight;
        }
        setMeasuredDimension(View.resolveSize(iA, i5), View.resolveSize(iA2, i11));
    }
}
