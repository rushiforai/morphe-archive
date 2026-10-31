package z9;

import aa.p;
import android.view.View;
import com.android.launcher3.dragndrop.DragLayer;

/* loaded from: classes.dex */
public class e {

    /* renamed from: f, reason: collision with root package name */
    public static final ca.c f98367f = new ca.c("scrimProgress", 10);

    /* renamed from: a, reason: collision with root package name */
    public final View f98368a;

    /* renamed from: b, reason: collision with root package name */
    public float f98369b;

    /* renamed from: c, reason: collision with root package name */
    public final int f98370c;

    /* renamed from: d, reason: collision with root package name */
    public int f98371d = 0;

    /* renamed from: e, reason: collision with root package name */
    public int f98372e = 0;

    public e(DragLayer dragLayer) {
        this.f98368a = dragLayer;
        this.f98370c = dragLayer.getContext().getColor(2131101257);
    }

    public final int a() {
        int i5 = this.f98372e;
        return i5 != 0 ? p.d(i5, this.f98371d) : p.d(this.f98370c, this.f98371d);
    }

    public final void b(int i5) {
        this.f98372e = i5;
        if (this.f98371d > 0) {
            this.f98368a.invalidate();
        }
    }
}
