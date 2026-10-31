package eb;

import android.util.FloatProperty;
import android.view.View;
import com.android.launcher3.notification.NotificationContainer;
import com.android.launcher3.notification.NotificationMainView;
import com.teslacoilsw.launcher.quicksearchbar.NovaSearchBarView;

/* loaded from: classes2.dex */
public final class b extends FloatProperty {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52453a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(String str, int i5) {
        super(str);
        this.f52453a = i5;
    }

    @Override // android.util.Property
    public final Float get(Object obj) {
        switch (this.f52453a) {
            case 0:
                return Float.valueOf(((c) obj).f52464j);
            case 1:
                return Float.valueOf(((NotificationContainer) obj).f21182e);
            case 2:
                return Float.valueOf(1.0f);
            case 3:
                return Float.valueOf(((l30.k) obj).f74663y);
            case 4:
                return Float.valueOf(((View) obj).getTranslationX());
            case 5:
                return Float.valueOf(((View) obj).getTranslationY());
            default:
                return Float.valueOf(((View) obj).getAlpha());
        }
    }

    @Override // android.util.FloatProperty
    public final void setValue(Object obj, float f11) {
        switch (this.f52453a) {
            case 0:
                c cVar = (c) obj;
                cVar.f52464j = f11;
                cVar.d();
                break;
            case 1:
                NotificationContainer notificationContainer = (NotificationContainer) obj;
                notificationContainer.f21182e = f11;
                float width = f11 / notificationContainer.getWidth();
                notificationContainer.f21183f.c(width);
                NotificationMainView notificationMainView = notificationContainer.f21184g;
                if (notificationMainView.f21186a != null) {
                    notificationMainView.d(width);
                    break;
                } else {
                    notificationMainView.setAlpha(0.0f);
                    break;
                }
            case 2:
                Object parent = ((NovaSearchBarView) obj).getParent();
                View view = parent instanceof View ? (View) parent : null;
                if (view != null) {
                    view.invalidate();
                    break;
                }
                break;
            case 3:
                l30.k kVar = (l30.k) obj;
                kVar.f74663y = f11;
                kVar.invalidate();
                break;
            case 4:
                ((View) obj).setTranslationX(f11);
                break;
            case 5:
                ((View) obj).setTranslationY(f11);
                break;
            default:
                ((View) obj).setAlpha(f11);
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(int i5) {
        super("x");
        this.f52453a = i5;
        switch (i5) {
            case 4:
                super("translateX");
                break;
            case 5:
                super("translateY");
                break;
            case 6:
                super("alpha");
                break;
            default:
                break;
        }
    }
}
