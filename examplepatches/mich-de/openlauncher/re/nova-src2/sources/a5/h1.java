package a5;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.util.Property;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.folder.Folder;
import com.android.launcher3.folder.FolderIcon;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.pageindicators.PageIndicatorDots;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.launcher3.NovaAppDrawerSearchBar;
import com.teslacoilsw.launcher.quicksearchbar.NovaSearchEditText;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;

/* loaded from: classes2.dex */
public final class h1 extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f292a;

    /* renamed from: b, reason: collision with root package name */
    public Object f293b;

    /* renamed from: c, reason: collision with root package name */
    public Object f294c;

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationCancel(Animator animator) {
        switch (this.f292a) {
            case 0:
                ((j1) this.f294c).a();
                break;
            default:
                super.onAnimationCancel(animator);
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        int i5;
        switch (this.f292a) {
            case 0:
                ((j1) this.f294c).c();
                return;
            case 1:
                t1 t1Var = (t1) this.f294c;
                t1Var.f369a.d(1.0f);
                p1.e((View) this.f293b, t1Var);
                return;
            case 2:
                NovaLauncher novaLauncher = (NovaLauncher) this.f294c;
                NovaSearchEditText novaSearchEditText = ((NovaAppDrawerSearchBar) novaLauncher.V.f21030l).b().f74425h;
                EditText editTextB = novaSearchEditText != null ? novaSearchEditText.b() : null;
                Intrinsics.d(editTextB);
                editTextB.setText((String) this.f293b);
                editTextB.setSelection(editTextB.getText().length());
                NovaAppDrawerSearchBar novaAppDrawerSearchBar = (NovaAppDrawerSearchBar) novaLauncher.V.f21030l;
                if (novaAppDrawerSearchBar.f45806r) {
                    NovaSearchEditText novaSearchEditText2 = novaAppDrawerSearchBar.b().f74425h;
                    Intrinsics.d(novaSearchEditText2);
                    EditText editTextB2 = novaSearchEditText2.b();
                    editTextB2.requestFocus();
                    lx.d.g(editTextB2);
                    return;
                }
                return;
            case 3:
                e10.b0 b0Var = (e10.b0) this.f294c;
                v9.o oVar = (v9.o) this.f293b;
                AnimatorSet animatorSet = new AnimatorSet();
                int iOrdinal = b0Var.ordinal();
                if (iOrdinal == 0) {
                    ImageView imageView = oVar.f92499b;
                    ImageView imageView2 = oVar.f92500c;
                    double d5 = (320 * 2.0f) / 3;
                    i5 = 1;
                    animatorSet.playTogether(ObjectAnimator.ofFloat(imageView, "alpha", 0.0f, 1.0f).setDuration(MathKt.c(d5)), ObjectAnimator.ofFloat(imageView, "scaleX", 0.5f, 1.0f).setDuration(320L), ObjectAnimator.ofFloat(imageView, "scaleY", 0.5f, 1.0f).setDuration(320L), ObjectAnimator.ofFloat(imageView2, "alpha", 1.0f, 0.0f).setDuration(MathKt.c(d5)), ObjectAnimator.ofFloat(imageView2, "scaleX", 1.0f, 1.5f).setDuration(320L), ObjectAnimator.ofFloat(imageView2, "scaleY", 1.0f, 1.5f).setDuration(320L));
                    animatorSet.addListener(new p00.t(oVar, 0));
                } else if (iOrdinal == 1) {
                    ImageView imageView3 = oVar.f92499b;
                    ImageView imageView4 = oVar.f92500c;
                    float f11 = (320 * 2.0f) / 3;
                    animatorSet.playTogether(ObjectAnimator.ofFloat(imageView3, "alpha", 0.0f, 1.0f).setDuration(x7.f.O(f11)), ObjectAnimator.ofFloat(imageView3, "scaleX", 0.5f, 1.0f).setDuration(320L), ObjectAnimator.ofFloat(imageView3, "scaleY", 0.5f, 1.0f).setDuration(320L), ObjectAnimator.ofFloat(imageView4, "alpha", 1.0f, 0.0f).setDuration(x7.f.O(f11)), ObjectAnimator.ofFloat(imageView4, "translationY", 0.0f, imageView3.getHeight()).setDuration(320L));
                    animatorSet.addListener(new p00.t(oVar, 1));
                    i5 = 1;
                } else {
                    if (iOrdinal != 2) {
                        throw new NoWhenBranchMatchedException();
                    }
                    animatorSet.playTogether(ObjectAnimator.ofFloat(oVar.f92499b, "alpha", 0.0f, 1.0f).setDuration(320L), ObjectAnimator.ofFloat(oVar.f92500c, "alpha", 1.0f, 0.0f).setDuration(320L));
                    i5 = 1;
                }
                animatorSet.addListener(new com.google.android.material.timepicker.e(i5));
                animatorSet.setStartDelay(200L);
                animatorSet.start();
                return;
            case 4:
                ((Property) this.f294c).set(((ObjectAnimator) animator).getTarget(), (Float) this.f293b);
                return;
            case 5:
                ((Folder) this.f293b).f21108h = null;
                return;
            case 6:
                ((FolderIcon) ((BubbleTextView) this.f294c)).k0();
                return;
            case 7:
                super.onAnimationEnd(animator);
                y9.p pVar = (y9.p) this.f293b;
                if (!pVar.f96936g) {
                    ((NovaLauncher) this.f294c).P.f21088w.b(0);
                }
                ((PageIndicatorDots) pVar.f96930a.W.f82827e).setTranslationZ(0.0f);
                return;
            default:
                Runnable runnable = (Runnable) this.f294c;
                if (runnable != null) {
                    runnable.run();
                }
                ((y9.z) this.f293b).f97000e = null;
                return;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationStart(Animator animator) {
        switch (this.f292a) {
            case 0:
                ((j1) this.f294c).b();
                break;
            case 5:
                Folder folder = (Folder) this.f293b;
                folder.f21126z = 1;
                folder.f21108h = (AnimatorSet) this.f294c;
                break;
            case 6:
                ((BubbleTextView) this.f294c).O(new aa.n((BitmapInfo) this.f293b));
                break;
            case 7:
                super.onAnimationStart(animator);
                PageIndicatorDots pageIndicatorDots = (PageIndicatorDots) ((y9.p) this.f293b).f96930a.W.f82827e;
                pageIndicatorDots.setTranslationZ(-pageIndicatorDots.getElevation());
                break;
            default:
                super.onAnimationStart(animator);
                break;
        }
    }

    public /* synthetic */ h1(int i5, Object obj, Object obj2) {
        this.f292a = i5;
        this.f294c = obj;
        this.f293b = obj2;
    }

    public /* synthetic */ h1(Object obj, Object obj2, boolean z11, int i5) {
        this.f292a = i5;
        this.f293b = obj;
        this.f294c = obj2;
    }
}
