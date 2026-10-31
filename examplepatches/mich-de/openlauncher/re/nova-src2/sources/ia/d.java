package ia;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import com.android.launcher3.pageindicators.WorkspacePageIndicator;

/* loaded from: classes.dex */
public final class d extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61464a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ WorkspacePageIndicator f61465b;

    public d(WorkspacePageIndicator workspacePageIndicator, int i5) {
        this.f61465b = workspacePageIndicator;
        this.f61464a = i5;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        this.f61465b.f21213a[this.f61464a] = null;
    }
}
