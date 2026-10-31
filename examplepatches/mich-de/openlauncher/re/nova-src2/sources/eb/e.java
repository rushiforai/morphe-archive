package eb;

import com.android.launcher3.widget.picker.WidgetsFullSheet;

/* loaded from: classes2.dex */
public final /* synthetic */ class e implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52469a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ WidgetsFullSheet f52470b;

    public /* synthetic */ e(WidgetsFullSheet widgetsFullSheet, int i5) {
        this.f52469a = i5;
        this.f52470b = widgetsFullSheet;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5 = this.f52469a;
        WidgetsFullSheet widgetsFullSheet = this.f52470b;
        switch (i5) {
            case 0:
                int i11 = WidgetsFullSheet.Q;
                widgetsFullSheet.f70511d.start();
                widgetsFullSheet.f70513f.animate().alpha(1.0f).setDuration(150L);
                break;
            case 1:
                int i12 = WidgetsFullSheet.Q;
                widgetsFullSheet.I();
                break;
            default:
                widgetsFullSheet.removeOnLayoutChangeListener(widgetsFullSheet.E);
                break;
        }
    }
}
