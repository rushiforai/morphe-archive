package o9;

import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.TextView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.android.launcher3.views.RecyclerViewFastScroller;
import com.teslacoilsw.launcher.launcher3.allapps.AllAppsPagedViewRecyclerView;

/* loaded from: classes.dex */
public abstract class m extends RecyclerView {

    /* renamed from: a, reason: collision with root package name */
    public RecyclerViewFastScroller f79988a;

    public void f() {
        q9.w wVar;
        ViewGroup viewGroup = (ViewGroup) getParent().getParent();
        RecyclerViewFastScroller recyclerViewFastScroller = (RecyclerViewFastScroller) viewGroup.findViewById(2131428044);
        this.f79988a = recyclerViewFastScroller;
        TextView textView = (TextView) viewGroup.findViewById(2131428045);
        m mVar = recyclerViewFastScroller.f21306x;
        if (mVar != null && (wVar = recyclerViewFastScroller.f21307y) != null) {
            mVar.removeOnScrollListener(wVar);
        }
        recyclerViewFastScroller.f21306x = this;
        q9.w wVar2 = new q9.w(recyclerViewFastScroller, 1);
        recyclerViewFastScroller.f21307y = wVar2;
        addOnScrollListener(wVar2);
        recyclerViewFastScroller.f21302t = textView;
        textView.setBackground(new z9.b(recyclerViewFastScroller.f21292h, g3.p(recyclerViewFastScroller.getResources())));
        l(0);
    }

    public abstract int g();

    public abstract int h();

    public RecyclerViewFastScroller i() {
        return this.f79988a;
    }

    public final int j() {
        return (this.f79988a.getHeight() - e()) - d();
    }

    public void k() {
    }

    public abstract void l(int i5);

    public abstract String m(float f11);

    public void n() {
        RecyclerViewFastScroller recyclerViewFastScroller = this.f79988a;
        if (recyclerViewFastScroller != null) {
            recyclerViewFastScroller.n = false;
        }
        if ((getLayoutManager() instanceof LinearLayoutManager) && ((LinearLayoutManager) getLayoutManager()).findFirstCompletelyVisibleItemPosition() == 0) {
            return;
        }
        scrollToPosition(0);
    }

    public final boolean o(View view, MotionEvent motionEvent) {
        float[] fArr = {motionEvent.getX(), motionEvent.getY()};
        g3.q(this.f79988a, view, fArr);
        return !this.f79988a.d((int) fArr[0], (int) fArr[1]) && (h() == 0 || h() == -1 || getAdapter() == null || getAdapter().getItemCount() == 0);
    }

    @Override // androidx.recyclerview.widget.RecyclerView, android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        f();
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        if (isLayoutSuppressed()) {
            accessibilityNodeInfo.setScrollable(false);
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView
    public void onScrollStateChanged(int i5) {
        super.onScrollStateChanged(i5);
        if (i5 == 0) {
            ps.f.q(getContext());
        }
    }

    public boolean p() {
        return !(this instanceof AllAppsPagedViewRecyclerView);
    }

    public final void q(int i5, int i11) {
        if (i11 <= 0) {
            this.f79988a.e(-1);
            return;
        }
        float f11 = i5 / i11;
        int iJ = j();
        this.f79988a.e((int) (f11 * (iJ - r0.f21293i)));
    }
}
