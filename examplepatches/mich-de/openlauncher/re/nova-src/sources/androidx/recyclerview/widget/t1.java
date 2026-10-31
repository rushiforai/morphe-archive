package androidx.recyclerview.widget;

import android.view.View;

/* loaded from: classes2.dex */
public final class t1 {

    /* renamed from: a, reason: collision with root package name */
    public int f15125a;

    /* renamed from: b, reason: collision with root package name */
    public int f15126b;

    public final void a(s2 s2Var) {
        View view = s2Var.itemView;
        this.f15125a = view.getLeft();
        this.f15126b = view.getTop();
        view.getRight();
        view.getBottom();
    }
}
