package ab;

import android.content.Context;
import android.graphics.Rect;
import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.widget.ImageView;
import android.widget.RemoteViews;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public abstract class b extends q {

    /* renamed from: j, reason: collision with root package name */
    public final LayoutInflater f681j;

    /* renamed from: k, reason: collision with root package name */
    public final Rect f682k;

    /* renamed from: l, reason: collision with root package name */
    public float f683l;

    /* renamed from: m, reason: collision with root package name */
    public final a f684m;

    public b(Context context) {
        super(context);
        this.f682k = new Rect();
        this.f684m = new a(this, 0);
        setExecutor(ya.j.f97146a);
        this.f681j = LayoutInflater.from(context);
        getContext();
        this.f683l = com.google.android.gms.internal.consent_sdk.e0.w();
    }

    @Override // android.appwidget.AppWidgetHostView
    public final View getErrorView() {
        return this.f681j.inflate(2131624054, (ViewGroup) this, false);
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0059  */
    @Override // android.appwidget.AppWidgetHostView, android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        b bVar;
        View viewA;
        try {
            super.onLayout(z11, i5, i11, i12, i13);
            bVar = this;
        } catch (RuntimeException unused) {
            bVar = this;
            post(new aa.x(this, 1));
        }
        if (bVar.f683l <= 0.0f) {
            setOutlineProvider(ViewOutlineProvider.BACKGROUND);
            setClipToOutline(false);
            return;
        }
        ArrayList arrayList = new ArrayList();
        com.google.android.gms.internal.consent_sdk.e0.n(this, arrayList);
        if (arrayList.size() == 1) {
            viewA = (View) arrayList.get(0);
        } else if ("samsung".equalsIgnoreCase(Build.MANUFACTURER)) {
            ViewGroup viewGroup = null;
            for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
                View childAt = getChildAt(childCount);
                if (!(childAt instanceof ViewGroup) || viewGroup != null) {
                    if (!(childAt instanceof ImageView)) {
                        break;
                    }
                } else {
                    viewGroup = (ViewGroup) childAt;
                }
            }
            viewA = viewGroup != null ? viewGroup : getChildCount() > 0 ? com.google.android.gms.internal.consent_sdk.e0.A(getChildAt(0)) : bVar;
        }
        if (viewA == null || (viewA.getId() == 16908288 && viewA.getClipToOutline())) {
            setOutlineProvider(ViewOutlineProvider.BACKGROUND);
            setClipToOutline(false);
            return;
        }
        Rect rect = bVar.f682k;
        rect.left = 0;
        rect.right = viewA.getWidth();
        rect.top = 0;
        rect.bottom = viewA.getHeight();
        while (viewA != bVar) {
            rect.offset(viewA.getLeft(), viewA.getTop());
            viewA = (View) viewA.getParent();
        }
        setOutlineProvider(bVar.f684m);
        setClipToOutline(true);
        invalidateOutline();
    }

    public final float s() {
        return this.f683l;
    }

    public final Rect t() {
        return this.f682k;
    }

    public final void u() {
        try {
            updateAppWidget(new RemoteViews(getAppWidgetInfo().provider.getPackageName(), 0));
        } catch (Exception e3) {
            mc0.d.b(e3);
            removeAllViews();
            addView(getErrorView());
        }
    }
}
