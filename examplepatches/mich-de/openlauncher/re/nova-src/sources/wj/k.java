package wj;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class k extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94446a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l f94447b;

    public /* synthetic */ k(l lVar, int i5) {
        this.f94446a = i5;
        this.f94447b = lVar;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationEnd(Animator animator) {
        switch (this.f94446a) {
            case 1:
                super.onAnimationEnd(animator);
                l lVar = this.f94447b;
                super/*android.graphics.drawable.Drawable*/.setVisible(false, false);
                ArrayList arrayList = lVar.f94454f;
                if (arrayList != null && !lVar.f94455g) {
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        ((b) it.next()).a(lVar);
                    }
                    break;
                }
                break;
            default:
                super.onAnimationEnd(animator);
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationStart(Animator animator) {
        switch (this.f94446a) {
            case 0:
                super.onAnimationStart(animator);
                l lVar = this.f94447b;
                ArrayList arrayList = lVar.f94454f;
                if (arrayList != null && !lVar.f94455g) {
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        ((b) it.next()).b(lVar);
                    }
                    break;
                }
                break;
            default:
                super.onAnimationStart(animator);
                break;
        }
    }
}
