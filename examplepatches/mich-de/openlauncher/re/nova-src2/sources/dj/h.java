package dj;

import a5.a1;
import android.view.View;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final View f49261a;

    /* renamed from: b, reason: collision with root package name */
    public int f49262b;

    /* renamed from: c, reason: collision with root package name */
    public int f49263c;

    /* renamed from: d, reason: collision with root package name */
    public int f49264d;

    public h(View view) {
        this.f49261a = view;
    }

    public final void a() {
        int i5 = this.f49264d;
        View view = this.f49261a;
        int top = i5 - (view.getTop() - this.f49262b);
        WeakHashMap weakHashMap = a1.f250a;
        view.offsetTopAndBottom(top);
        view.offsetLeftAndRight(0 - (view.getLeft() - this.f49263c));
    }

    public final boolean b(int i5) {
        if (this.f49264d == i5) {
            return false;
        }
        this.f49264d = i5;
        a();
        return true;
    }
}
