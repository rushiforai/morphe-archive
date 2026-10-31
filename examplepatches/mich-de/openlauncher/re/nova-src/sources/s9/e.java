package s9;

import android.animation.Animator;
import java.util.function.BiConsumer;

/* loaded from: classes.dex */
public final /* synthetic */ class e implements BiConsumer {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86771a;

    @Override // java.util.function.BiConsumer
    public final void accept(Object obj, Object obj2) {
        Animator.AnimatorListener animatorListener = (Animator.AnimatorListener) obj;
        Animator animator = (Animator) obj2;
        switch (this.f86771a) {
            case 0:
                animatorListener.onAnimationCancel(animator);
                break;
            default:
                animatorListener.onAnimationEnd(animator);
                break;
        }
    }
}
