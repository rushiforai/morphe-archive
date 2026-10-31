package uf;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* loaded from: classes3.dex */
public final class r extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f91193a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ m f91194b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ s f91195c;

    public /* synthetic */ r(s sVar, m mVar, int i5) {
        this.f91193a = i5;
        this.f91195c = sVar;
        this.f91194b = mVar;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        switch (this.f91193a) {
            case 0:
                s sVar = this.f91195c;
                sVar.h(1);
                if (sVar.B) {
                    this.f91194b.post(sVar.f91212s);
                    sVar.B = false;
                    break;
                }
                break;
            case 1:
                s sVar2 = this.f91195c;
                sVar2.h(2);
                if (sVar2.B) {
                    this.f91194b.post(sVar2.f91212s);
                    sVar2.B = false;
                    break;
                }
                break;
            default:
                s sVar3 = this.f91195c;
                sVar3.h(2);
                if (sVar3.B) {
                    this.f91194b.post(sVar3.f91212s);
                    sVar3.B = false;
                    break;
                }
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        switch (this.f91193a) {
            case 0:
                this.f91195c.h(3);
                break;
            case 1:
                this.f91195c.h(3);
                break;
            default:
                this.f91195c.h(3);
                break;
        }
    }
}
