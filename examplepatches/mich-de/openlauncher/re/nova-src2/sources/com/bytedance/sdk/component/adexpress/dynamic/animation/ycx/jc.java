package com.bytedance.sdk.component.adexpress.dynamic.animation.ycx;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class jc extends dj {

    /* renamed from: dj, reason: collision with root package name */
    private ycx f23296dj;

    /* renamed from: lt, reason: collision with root package name */
    private float f23297lt;
    private float lud;

    public class ycx {

        /* renamed from: zb, reason: collision with root package name */
        private View f23299zb;

        public ycx(View view) {
            this.f23299zb = view;
        }

        public void ycx(int i5) {
            if (!"top".equals(jc.this.f23292zb.ycx())) {
                ViewGroup.LayoutParams layoutParams = this.f23299zb.getLayoutParams();
                layoutParams.height = i5;
                this.f23299zb.setLayoutParams(layoutParams);
                this.f23299zb.requestLayout();
                return;
            }
            if (jc.this.sya instanceof ViewGroup) {
                for (int i11 = 0; i11 < ((ViewGroup) jc.this.sya).getChildCount(); i11++) {
                    ((ViewGroup) jc.this.sya).getChildAt(i11).setTranslationY(i5 - jc.this.lud);
                }
            }
            jc jcVar = jc.this;
            jcVar.sya.setTranslationY(jcVar.lud - i5);
        }
    }

    public jc(View view, com.bytedance.sdk.component.adexpress.dynamic.dj.ycx ycxVar) {
        super(view, ycxVar);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.ycx.dj
    public List<ObjectAnimator> ycx() {
        int i5;
        String str;
        View view = this.sya;
        if ((view instanceof ImageView) && (view.getParent() instanceof com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud)) {
            this.sya = (View) this.sya.getParent();
        }
        this.sya.setAlpha(0.0f);
        ObjectAnimator duration = ObjectAnimator.ofFloat(this.sya, "alpha", 0.0f, 1.0f).setDuration((int) (this.f23292zb.jc() * 1000.0d));
        this.f23296dj = new ycx(this.sya);
        final int i11 = this.sya.getLayoutParams().height;
        this.lud = i11;
        this.f23297lt = this.sya.getLayoutParams().width;
        if ("left".equals(this.f23292zb.ycx()) || "right".equals(this.f23292zb.ycx())) {
            i5 = (int) this.f23297lt;
            str = "width";
        } else {
            str = "height";
            i5 = i11;
        }
        ObjectAnimator duration2 = ObjectAnimator.ofInt(this.f23296dj, str, 0, i5).setDuration((int) (this.f23292zb.jc() * 1000.0d));
        ArrayList arrayList = new ArrayList();
        arrayList.add(ycx(duration));
        arrayList.add(ycx(duration2));
        ((ObjectAnimator) arrayList.get(0)).addListener(new Animator.AnimatorListener() { // from class: com.bytedance.sdk.component.adexpress.dynamic.animation.ycx.jc.1
            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator, boolean z11) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationRepeat(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
                jc.this.f23296dj.ycx(i11);
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animator, boolean z11) {
            }
        });
        return arrayList;
    }
}
