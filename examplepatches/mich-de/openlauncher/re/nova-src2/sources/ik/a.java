package ik;

import android.view.View;
import android.view.ViewTreeObserver;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.transformation.ExpandableBehavior;

/* loaded from: classes3.dex */
public final class a implements ViewTreeObserver.OnPreDrawListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f61629a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f61630b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ qj.a f61631c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ExpandableBehavior f61632d;

    public a(ExpandableBehavior expandableBehavior, View view, int i5, qj.a aVar) {
        this.f61632d = expandableBehavior;
        this.f61629a = view;
        this.f61630b = i5;
        this.f61631c = aVar;
    }

    @Override // android.view.ViewTreeObserver.OnPreDrawListener
    public final boolean onPreDraw() {
        View view = this.f61629a;
        view.getViewTreeObserver().removeOnPreDrawListener(this);
        ExpandableBehavior expandableBehavior = this.f61632d;
        if (expandableBehavior.f34532a == this.f61630b) {
            Object obj = this.f61631c;
            expandableBehavior.w((View) obj, view, ((FloatingActionButton) obj).f34292l.f61880a, false);
        }
        return false;
    }
}
