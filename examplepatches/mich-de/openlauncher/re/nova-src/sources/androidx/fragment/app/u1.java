package androidx.fragment.app;

import android.transition.Transition;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class u1 implements Transition.TransitionListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object f14695a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ArrayList f14696b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f14697c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ArrayList f14698d;

    public u1(w1 w1Var, Object obj, ArrayList arrayList, Object obj2, ArrayList arrayList2) {
        this.f14695a = obj;
        this.f14696b = arrayList;
        this.f14697c = obj2;
        this.f14698d = arrayList2;
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionCancel(Transition transition) {
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionEnd(Transition transition) {
        transition.removeListener(this);
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionPause(Transition transition) {
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionResume(Transition transition) {
    }

    @Override // android.transition.Transition.TransitionListener
    public final void onTransitionStart(Transition transition) {
        Object obj = this.f14695a;
        if (obj != null) {
            w1.d(obj, this.f14696b, null);
        }
        Object obj2 = this.f14697c;
        if (obj2 != null) {
            w1.d(obj2, this.f14698d, null);
        }
    }
}
