package s9;

import android.animation.Animator;
import java.util.function.BiConsumer;

/* loaded from: classes2.dex */
public final /* synthetic */ class d implements BiConsumer {
    @Override // java.util.function.BiConsumer
    public final void accept(Object obj, Object obj2) {
        ((Animator.AnimatorListener) obj).onAnimationStart((Animator) obj2);
    }
}
