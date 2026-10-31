package ha;

import com.android.launcher3.notification.NotificationContainer;
import com.android.launcher3.notification.NotificationMainView;

/* loaded from: classes2.dex */
public final class a extends s9.b {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f59561b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ NotificationMainView f59562c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ NotificationContainer f59563d;

    public a(NotificationContainer notificationContainer, boolean z11, NotificationMainView notificationMainView) {
        this.f59563d = notificationContainer;
        this.f59561b = z11;
        this.f59562c = notificationMainView;
    }

    @Override // s9.b
    public final void a() {
        NotificationContainer notificationContainer = this.f59563d;
        notificationContainer.f21178a.h(1);
        if (this.f59561b) {
            this.f59562c.b();
        }
        notificationContainer.f21185h.f71263u.setVisibility(0);
    }
}
