package eb;

import android.animation.ObjectAnimator;
import android.view.MotionEvent;
import android.view.View;
import android.widget.TextView;
import androidx.recyclerview.widget.b2;
import com.android.launcher3.widget.picker.SearchAndRecommendationsView;
import com.android.launcher3.widget.picker.WidgetsRecommendationTableLayout;
import com.android.launcher3.widget.picker.WidgetsRecyclerView;
import o9.t0;

/* loaded from: classes2.dex */
public final class c implements b2 {

    /* renamed from: m, reason: collision with root package name */
    public static final b f52454m = new b("scrollAnimOffset", 0);
    public static final a5.i n = new a5.i(19);
    public static final a5.i o = new a5.i(20);

    /* renamed from: a, reason: collision with root package name */
    public final SearchAndRecommendationsView f52455a;

    /* renamed from: b, reason: collision with root package name */
    public final View f52456b;

    /* renamed from: c, reason: collision with root package name */
    public final fb.b f52457c;

    /* renamed from: d, reason: collision with root package name */
    public final TextView f52458d;

    /* renamed from: e, reason: collision with root package name */
    public final WidgetsRecommendationTableLayout f52459e;

    /* renamed from: f, reason: collision with root package name */
    public final View f52460f;

    /* renamed from: g, reason: collision with root package name */
    public WidgetsRecyclerView f52461g;

    /* renamed from: h, reason: collision with root package name */
    public x f52462h;

    /* renamed from: k, reason: collision with root package name */
    public ObjectAnimator f52465k;

    /* renamed from: i, reason: collision with root package name */
    public float f52463i = 0.0f;

    /* renamed from: j, reason: collision with root package name */
    public float f52464j = 0.0f;

    /* renamed from: l, reason: collision with root package name */
    public boolean f52466l = false;

    public c(SearchAndRecommendationsView searchAndRecommendationsView) {
        this.f52455a = searchAndRecommendationsView;
        this.f52456b = searchAndRecommendationsView.findViewById(2131428751);
        this.f52457c = (fb.b) searchAndRecommendationsView.findViewById(2131429230);
        this.f52458d = (TextView) searchAndRecommendationsView.findViewById(2131429031);
        this.f52459e = (WidgetsRecommendationTableLayout) searchAndRecommendationsView.findViewById(2131428682);
        this.f52460f = searchAndRecommendationsView.findViewById(2131428973);
        searchAndRecommendationsView.f21345a = this;
    }

    public final void a() {
        x xVar = this.f52462h;
        if (xVar != null) {
            xVar.f52527a = null;
            this.f52462h = null;
        }
        int childCount = this.f52461g.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = this.f52461g.getChildAt(i5);
            if (childAt instanceof x) {
                x xVar2 = (x) childAt;
                this.f52462h = xVar2;
                if (xVar2.f52528b != 0) {
                    xVar2.f52528b = 0;
                    xVar2.requestLayout();
                }
                this.f52462h.f52527a = new a(this, 1);
                return;
            }
        }
    }

    public final boolean b(MotionEvent motionEvent, a5.i iVar) {
        boolean zOnInterceptTouchEvent;
        int left = this.f52461g.getLeft();
        SearchAndRecommendationsView searchAndRecommendationsView = this.f52455a;
        float left2 = left - searchAndRecommendationsView.getLeft();
        float top = this.f52461g.getTop() - searchAndRecommendationsView.getTop();
        motionEvent.offsetLocation(left2, top);
        try {
            WidgetsRecyclerView widgetsRecyclerView = this.f52461g;
            switch (iVar.f297a) {
                case 19:
                    zOnInterceptTouchEvent = widgetsRecyclerView.onInterceptTouchEvent(motionEvent);
                    break;
                default:
                    zOnInterceptTouchEvent = widgetsRecyclerView.onTouchEvent(motionEvent);
                    break;
            }
            return zOnInterceptTouchEvent;
        } finally {
            motionEvent.offsetLocation(-left2, -top);
        }
    }

    public final void c(boolean z11) {
        ObjectAnimator objectAnimator = this.f52465k;
        if (objectAnimator != null) {
            objectAnimator.cancel();
            this.f52465k = null;
        }
        this.f52464j = 0.0f;
        if (!z11) {
            d();
            return;
        }
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, f52454m, this.f52463i - 0.0f, 0.0f);
        this.f52465k = objectAnimatorOfFloat;
        objectAnimatorOfFloat.addListener(new t0(new a(this, 0), 1));
        this.f52465k.start();
    }

    public final void d() {
        float f11 = this.f52464j;
        this.f52463i = f11;
        this.f52458d.setTranslationY(f11);
        this.f52459e.setTranslationY(this.f52463i);
        float f12 = this.f52463i;
        this.f52456b.setTranslationY(Math.max(f12, -r1.getTop()));
        View view = this.f52460f;
        if (view != null) {
            view.setTranslationY(Math.max(this.f52463i, r1.getHeight() + (-view.getTop())));
        }
    }

    @Override // androidx.recyclerview.widget.b2
    public final void onChildViewAttachedToWindow(View view) {
        if (view instanceof x) {
            a();
        }
    }

    @Override // androidx.recyclerview.widget.b2
    public final void onChildViewDetachedFromWindow(View view) {
        if (view == this.f52462h) {
            a();
        }
    }
}
