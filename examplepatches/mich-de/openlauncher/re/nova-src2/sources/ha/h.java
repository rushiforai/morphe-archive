package ha;

import android.graphics.Outline;
import android.view.View;
import android.view.ViewOutlineProvider;
import com.android.launcher3.notification.NotificationMainView;

/* loaded from: classes2.dex */
public final class h extends ViewOutlineProvider {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59589a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f59590b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ NotificationMainView f59591c;

    public /* synthetic */ h(NotificationMainView notificationMainView, float f11, int i5) {
        this.f59589a = i5;
        this.f59591c = notificationMainView;
        this.f59590b = f11;
    }

    @Override // android.view.ViewOutlineProvider
    public final void getOutline(View view, Outline outline) {
        switch (this.f59589a) {
            case 0:
                outline.setRoundRect(this.f59591c.f21194i, this.f59590b);
                break;
            default:
                outline.setRoundRect(this.f59591c.f21194i, this.f59590b);
                break;
        }
    }
}
