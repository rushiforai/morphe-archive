package ia;

import android.graphics.Outline;
import android.graphics.RectF;
import android.view.View;
import android.view.ViewOutlineProvider;
import com.android.launcher3.pageindicators.PageIndicatorDots;

/* loaded from: classes.dex */
public final class c extends ViewOutlineProvider {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ PageIndicatorDots f61463a;

    public c(PageIndicatorDots pageIndicatorDots) {
        this.f61463a = pageIndicatorDots;
    }

    @Override // android.view.ViewOutlineProvider
    public final void getOutline(View view, Outline outline) {
        PageIndicatorDots pageIndicatorDots = this.f61463a;
        if (pageIndicatorDots.f21209i == null) {
            RectF rectFE = pageIndicatorDots.e();
            outline.setRoundRect((int) rectFE.left, (int) rectFE.top, (int) rectFE.right, (int) rectFE.bottom, pageIndicatorDots.f21202b);
        }
    }
}
