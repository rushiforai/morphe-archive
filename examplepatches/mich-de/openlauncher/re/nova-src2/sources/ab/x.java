package ab;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RemoteViews;
import h10.q0;

/* loaded from: classes2.dex */
public final class x extends q {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f772j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ x(Context context, int i5) {
        super(context);
        this.f772j = i5;
    }

    @Override // android.appwidget.AppWidgetHostView
    public View getDefaultView() {
        switch (this.f772j) {
            case 1:
                View defaultView = super.getDefaultView();
                defaultView.setOnClickListener(new fk.t(this, 19));
                return defaultView;
            default:
                return super.getDefaultView();
        }
    }

    @Override // android.appwidget.AppWidgetHostView
    public View getErrorView() {
        switch (this.f772j) {
            case 1:
                View viewInflate = LayoutInflater.from(getContext()).inflate(2131624336, (ViewGroup) this, false);
                viewInflate.findViewById(2131427602).setOnClickListener(new q0(2));
                return viewInflate;
            default:
                return super.getErrorView();
        }
    }

    @Override // android.appwidget.AppWidgetHostView, android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        switch (this.f772j) {
            case 1:
                try {
                    super.onLayout(z11, i5, i11, i12, i13);
                    break;
                } catch (RuntimeException unused) {
                    post(new g.p(this, 17));
                    return;
                }
            default:
                super.onLayout(z11, i5, i11, i12, i13);
                break;
        }
    }

    @Override // ab.q
    public final boolean q() {
        switch (this.f772j) {
            case 0:
                return false;
            default:
                return true;
        }
    }

    @Override // android.view.View
    public void setPadding(int i5, int i11, int i12, int i13) {
        switch (this.f772j) {
            case 1:
                super.setPadding(0, 0, 0, 0);
                break;
            default:
                super.setPadding(i5, i11, i12, i13);
                break;
        }
    }

    @Override // android.appwidget.AppWidgetHostView
    public void updateAppWidget(RemoteViews remoteViews) {
        switch (this.f772j) {
            case 1:
                int i5 = getResources().getConfiguration().orientation;
                super.updateAppWidget(remoteViews);
                break;
            default:
                super.updateAppWidget(remoteViews);
                break;
        }
    }
}
