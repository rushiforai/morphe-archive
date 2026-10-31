package tx;

import android.view.View;
import com.android.launcher3.dragndrop.DragLayer;

/* loaded from: classes4.dex */
public final /* synthetic */ class e1 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f89702a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ DragLayer f89703b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ View f89704c;

    public /* synthetic */ e1(DragLayer dragLayer, View view, int i5) {
        this.f89702a = i5;
        this.f89703b = dragLayer;
        this.f89704c = view;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f89702a) {
            case 0:
                this.f89703b.removeView(this.f89704c);
                break;
            case 1:
                this.f89703b.removeView(this.f89704c);
                break;
            default:
                this.f89703b.removeView(this.f89704c);
                break;
        }
    }
}
