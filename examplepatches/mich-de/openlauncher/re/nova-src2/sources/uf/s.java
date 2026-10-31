package uf;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.res.Resources;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.LinearInterpolator;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class s {
    public boolean A;
    public boolean B;

    /* renamed from: a, reason: collision with root package name */
    public final m f91196a;

    /* renamed from: b, reason: collision with root package name */
    public final View f91197b;

    /* renamed from: c, reason: collision with root package name */
    public final ViewGroup f91198c;

    /* renamed from: d, reason: collision with root package name */
    public final ViewGroup f91199d;

    /* renamed from: e, reason: collision with root package name */
    public final ViewGroup f91200e;

    /* renamed from: f, reason: collision with root package name */
    public final ViewGroup f91201f;

    /* renamed from: g, reason: collision with root package name */
    public final ViewGroup f91202g;

    /* renamed from: h, reason: collision with root package name */
    public final ViewGroup f91203h;

    /* renamed from: i, reason: collision with root package name */
    public final ViewGroup f91204i;

    /* renamed from: j, reason: collision with root package name */
    public final View f91205j;

    /* renamed from: k, reason: collision with root package name */
    public final View f91206k;

    /* renamed from: l, reason: collision with root package name */
    public final AnimatorSet f91207l;

    /* renamed from: m, reason: collision with root package name */
    public final AnimatorSet f91208m;
    public final AnimatorSet n;
    public final AnimatorSet o;

    /* renamed from: p, reason: collision with root package name */
    public final AnimatorSet f91209p;

    /* renamed from: q, reason: collision with root package name */
    public final ValueAnimator f91210q;

    /* renamed from: r, reason: collision with root package name */
    public final ValueAnimator f91211r;

    /* renamed from: s, reason: collision with root package name */
    public final n f91212s;

    /* renamed from: t, reason: collision with root package name */
    public final n f91213t;

    /* renamed from: u, reason: collision with root package name */
    public final n f91214u;

    /* renamed from: x, reason: collision with root package name */
    public final bd.a f91217x;

    /* renamed from: v, reason: collision with root package name */
    public final n f91215v = new n(this, 5);

    /* renamed from: w, reason: collision with root package name */
    public final n f91216w = new n(this, 6);
    public boolean C = true;

    /* renamed from: z, reason: collision with root package name */
    public int f91219z = 0;

    /* renamed from: y, reason: collision with root package name */
    public final ArrayList f91218y = new ArrayList();

    public s(m mVar) throws Resources.NotFoundException {
        this.f91196a = mVar;
        final int i5 = 0;
        this.f91212s = new n(this, i5);
        final int i11 = 3;
        this.f91213t = new n(this, i11);
        int i12 = 4;
        this.f91214u = new n(this, i12);
        this.f91217x = new bd.a(this, i12);
        final int i13 = 1;
        this.f91197b = mVar.findViewById(2131427992);
        this.f91198c = (ViewGroup) mVar.findViewById(2131427987);
        this.f91200e = (ViewGroup) mVar.findViewById(2131428002);
        ViewGroup viewGroup = (ViewGroup) mVar.findViewById(2131427985);
        this.f91199d = viewGroup;
        this.f91204i = (ViewGroup) mVar.findViewById(2131428027);
        View viewFindViewById = mVar.findViewById(2131428014);
        this.f91205j = viewFindViewById;
        this.f91201f = (ViewGroup) mVar.findViewById(2131427984);
        this.f91202g = (ViewGroup) mVar.findViewById(2131427995);
        this.f91203h = (ViewGroup) mVar.findViewById(2131427996);
        View viewFindViewById2 = mVar.findViewById(2131428006);
        this.f91206k = viewFindViewById2;
        View viewFindViewById3 = mVar.findViewById(2131428005);
        if (viewFindViewById2 != null && viewFindViewById3 != null) {
            viewFindViewById2.setOnClickListener(new p(this, i5));
            viewFindViewById3.setOnClickListener(new p(this, i5));
        }
        final int i14 = 2;
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(1.0f, 0.0f);
        valueAnimatorOfFloat.setInterpolator(new LinearInterpolator());
        valueAnimatorOfFloat.addUpdateListener(new ValueAnimator.AnimatorUpdateListener(this) { // from class: uf.o

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ s f91188b;

            {
                this.f91188b = this;
            }

            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                switch (i11) {
                    case 0:
                        s sVar = this.f91188b;
                        sVar.getClass();
                        float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                        View view = sVar.f91197b;
                        if (view != null) {
                            view.setAlpha(fFloatValue);
                        }
                        ViewGroup viewGroup2 = sVar.f91198c;
                        if (viewGroup2 != null) {
                            viewGroup2.setAlpha(fFloatValue);
                        }
                        ViewGroup viewGroup3 = sVar.f91200e;
                        if (viewGroup3 != null) {
                            viewGroup3.setAlpha(fFloatValue);
                            break;
                        }
                        break;
                    case 1:
                        s sVar2 = this.f91188b;
                        sVar2.getClass();
                        sVar2.a(((Float) valueAnimator.getAnimatedValue()).floatValue());
                        break;
                    case 2:
                        s sVar3 = this.f91188b;
                        sVar3.getClass();
                        sVar3.a(((Float) valueAnimator.getAnimatedValue()).floatValue());
                        break;
                    default:
                        s sVar4 = this.f91188b;
                        sVar4.getClass();
                        float fFloatValue2 = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                        View view2 = sVar4.f91197b;
                        if (view2 != null) {
                            view2.setAlpha(fFloatValue2);
                        }
                        ViewGroup viewGroup4 = sVar4.f91198c;
                        if (viewGroup4 != null) {
                            viewGroup4.setAlpha(fFloatValue2);
                        }
                        ViewGroup viewGroup5 = sVar4.f91200e;
                        if (viewGroup5 != null) {
                            viewGroup5.setAlpha(fFloatValue2);
                            break;
                        }
                        break;
                }
            }
        });
        valueAnimatorOfFloat.addListener(new q(this, i5));
        ValueAnimator valueAnimatorOfFloat2 = ValueAnimator.ofFloat(0.0f, 1.0f);
        valueAnimatorOfFloat2.setInterpolator(new LinearInterpolator());
        valueAnimatorOfFloat2.addUpdateListener(new ValueAnimator.AnimatorUpdateListener(this) { // from class: uf.o

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ s f91188b;

            {
                this.f91188b = this;
            }

            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                switch (i5) {
                    case 0:
                        s sVar = this.f91188b;
                        sVar.getClass();
                        float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                        View view = sVar.f91197b;
                        if (view != null) {
                            view.setAlpha(fFloatValue);
                        }
                        ViewGroup viewGroup2 = sVar.f91198c;
                        if (viewGroup2 != null) {
                            viewGroup2.setAlpha(fFloatValue);
                        }
                        ViewGroup viewGroup3 = sVar.f91200e;
                        if (viewGroup3 != null) {
                            viewGroup3.setAlpha(fFloatValue);
                            break;
                        }
                        break;
                    case 1:
                        s sVar2 = this.f91188b;
                        sVar2.getClass();
                        sVar2.a(((Float) valueAnimator.getAnimatedValue()).floatValue());
                        break;
                    case 2:
                        s sVar3 = this.f91188b;
                        sVar3.getClass();
                        sVar3.a(((Float) valueAnimator.getAnimatedValue()).floatValue());
                        break;
                    default:
                        s sVar4 = this.f91188b;
                        sVar4.getClass();
                        float fFloatValue2 = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                        View view2 = sVar4.f91197b;
                        if (view2 != null) {
                            view2.setAlpha(fFloatValue2);
                        }
                        ViewGroup viewGroup4 = sVar4.f91198c;
                        if (viewGroup4 != null) {
                            viewGroup4.setAlpha(fFloatValue2);
                        }
                        ViewGroup viewGroup5 = sVar4.f91200e;
                        if (viewGroup5 != null) {
                            viewGroup5.setAlpha(fFloatValue2);
                            break;
                        }
                        break;
                }
            }
        });
        valueAnimatorOfFloat2.addListener(new q(this, i13));
        Resources resources = mVar.getResources();
        float dimension = resources.getDimension(2131165480) - resources.getDimension(2131165485);
        float dimension2 = resources.getDimension(2131165480);
        AnimatorSet animatorSet = new AnimatorSet();
        this.f91207l = animatorSet;
        animatorSet.setDuration(250L);
        animatorSet.addListener(new r(this, mVar, i5));
        animatorSet.play(valueAnimatorOfFloat).with(c(viewFindViewById, 0.0f, dimension)).with(c(viewGroup, 0.0f, dimension));
        AnimatorSet animatorSet2 = new AnimatorSet();
        this.f91208m = animatorSet2;
        animatorSet2.setDuration(250L);
        animatorSet2.addListener(new r(this, mVar, i13));
        animatorSet2.play(c(viewFindViewById, dimension, dimension2)).with(c(viewGroup, dimension, dimension2));
        AnimatorSet animatorSet3 = new AnimatorSet();
        this.n = animatorSet3;
        animatorSet3.setDuration(250L);
        animatorSet3.addListener(new r(this, mVar, i14));
        animatorSet3.play(valueAnimatorOfFloat).with(c(viewFindViewById, 0.0f, dimension2)).with(c(viewGroup, 0.0f, dimension2));
        AnimatorSet animatorSet4 = new AnimatorSet();
        this.o = animatorSet4;
        animatorSet4.setDuration(250L);
        animatorSet4.addListener(new q(this, i14));
        animatorSet4.play(valueAnimatorOfFloat2).with(c(viewFindViewById, dimension, 0.0f)).with(c(viewGroup, dimension, 0.0f));
        AnimatorSet animatorSet5 = new AnimatorSet();
        this.f91209p = animatorSet5;
        animatorSet5.setDuration(250L);
        animatorSet5.addListener(new q(this, i11));
        animatorSet5.play(valueAnimatorOfFloat2).with(c(viewFindViewById, dimension2, 0.0f)).with(c(viewGroup, dimension2, 0.0f));
        ValueAnimator valueAnimatorOfFloat3 = ValueAnimator.ofFloat(0.0f, 1.0f);
        this.f91210q = valueAnimatorOfFloat3;
        valueAnimatorOfFloat3.setDuration(250L);
        valueAnimatorOfFloat3.addUpdateListener(new ValueAnimator.AnimatorUpdateListener(this) { // from class: uf.o

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ s f91188b;

            {
                this.f91188b = this;
            }

            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                switch (i13) {
                    case 0:
                        s sVar = this.f91188b;
                        sVar.getClass();
                        float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                        View view = sVar.f91197b;
                        if (view != null) {
                            view.setAlpha(fFloatValue);
                        }
                        ViewGroup viewGroup2 = sVar.f91198c;
                        if (viewGroup2 != null) {
                            viewGroup2.setAlpha(fFloatValue);
                        }
                        ViewGroup viewGroup3 = sVar.f91200e;
                        if (viewGroup3 != null) {
                            viewGroup3.setAlpha(fFloatValue);
                            break;
                        }
                        break;
                    case 1:
                        s sVar2 = this.f91188b;
                        sVar2.getClass();
                        sVar2.a(((Float) valueAnimator.getAnimatedValue()).floatValue());
                        break;
                    case 2:
                        s sVar3 = this.f91188b;
                        sVar3.getClass();
                        sVar3.a(((Float) valueAnimator.getAnimatedValue()).floatValue());
                        break;
                    default:
                        s sVar4 = this.f91188b;
                        sVar4.getClass();
                        float fFloatValue2 = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                        View view2 = sVar4.f91197b;
                        if (view2 != null) {
                            view2.setAlpha(fFloatValue2);
                        }
                        ViewGroup viewGroup4 = sVar4.f91198c;
                        if (viewGroup4 != null) {
                            viewGroup4.setAlpha(fFloatValue2);
                        }
                        ViewGroup viewGroup5 = sVar4.f91200e;
                        if (viewGroup5 != null) {
                            viewGroup5.setAlpha(fFloatValue2);
                            break;
                        }
                        break;
                }
            }
        });
        valueAnimatorOfFloat3.addListener(new q(this, 4));
        ValueAnimator valueAnimatorOfFloat4 = ValueAnimator.ofFloat(1.0f, 0.0f);
        this.f91211r = valueAnimatorOfFloat4;
        valueAnimatorOfFloat4.setDuration(250L);
        valueAnimatorOfFloat4.addUpdateListener(new ValueAnimator.AnimatorUpdateListener(this) { // from class: uf.o

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ s f91188b;

            {
                this.f91188b = this;
            }

            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                switch (i14) {
                    case 0:
                        s sVar = this.f91188b;
                        sVar.getClass();
                        float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                        View view = sVar.f91197b;
                        if (view != null) {
                            view.setAlpha(fFloatValue);
                        }
                        ViewGroup viewGroup2 = sVar.f91198c;
                        if (viewGroup2 != null) {
                            viewGroup2.setAlpha(fFloatValue);
                        }
                        ViewGroup viewGroup3 = sVar.f91200e;
                        if (viewGroup3 != null) {
                            viewGroup3.setAlpha(fFloatValue);
                            break;
                        }
                        break;
                    case 1:
                        s sVar2 = this.f91188b;
                        sVar2.getClass();
                        sVar2.a(((Float) valueAnimator.getAnimatedValue()).floatValue());
                        break;
                    case 2:
                        s sVar3 = this.f91188b;
                        sVar3.getClass();
                        sVar3.a(((Float) valueAnimator.getAnimatedValue()).floatValue());
                        break;
                    default:
                        s sVar4 = this.f91188b;
                        sVar4.getClass();
                        float fFloatValue2 = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                        View view2 = sVar4.f91197b;
                        if (view2 != null) {
                            view2.setAlpha(fFloatValue2);
                        }
                        ViewGroup viewGroup4 = sVar4.f91198c;
                        if (viewGroup4 != null) {
                            viewGroup4.setAlpha(fFloatValue2);
                        }
                        ViewGroup viewGroup5 = sVar4.f91200e;
                        if (viewGroup5 != null) {
                            viewGroup5.setAlpha(fFloatValue2);
                            break;
                        }
                        break;
                }
            }
        });
        valueAnimatorOfFloat4.addListener(new q(this, 5));
    }

    public static int b(View view) {
        if (view == null) {
            return 0;
        }
        int width = view.getWidth();
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        if (!(layoutParams instanceof ViewGroup.MarginLayoutParams)) {
            return width;
        }
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
        return marginLayoutParams.leftMargin + marginLayoutParams.rightMargin + width;
    }

    public static ObjectAnimator c(View view, float f11, float f12) {
        return ObjectAnimator.ofFloat(view, "translationY", f11, f12);
    }

    public static boolean i(View view) {
        int id2 = view.getId();
        return id2 == 2131427985 || id2 == 2131428013 || id2 == 2131428004 || id2 == 2131428017 || id2 == 2131428018 || id2 == 2131427997 || id2 == 2131427998;
    }

    public final void a(float f11) {
        ViewGroup viewGroup = this.f91203h;
        if (viewGroup != null) {
            viewGroup.setTranslationX((int) ((1.0f - f11) * viewGroup.getWidth()));
        }
        ViewGroup viewGroup2 = this.f91204i;
        if (viewGroup2 != null) {
            viewGroup2.setAlpha(1.0f - f11);
        }
        ViewGroup viewGroup3 = this.f91201f;
        if (viewGroup3 != null) {
            viewGroup3.setAlpha(1.0f - f11);
        }
    }

    public final void d(Runnable runnable, long j11) {
        if (j11 >= 0) {
            this.f91196a.postDelayed(runnable, j11);
        }
    }

    public final void e() {
        n nVar = this.f91216w;
        m mVar = this.f91196a;
        mVar.removeCallbacks(nVar);
        mVar.removeCallbacks(this.f91213t);
        mVar.removeCallbacks(this.f91215v);
        mVar.removeCallbacks(this.f91214u);
    }

    public final void f() {
        if (this.f91219z == 3) {
            return;
        }
        e();
        int i5 = this.f91196a.f91157e0;
        if (i5 > 0) {
            if (!this.C) {
                d(this.f91216w, i5);
            } else if (this.f91219z == 1) {
                d(this.f91214u, 2000L);
            } else {
                d(this.f91215v, i5);
            }
        }
    }

    public final void g(View view, boolean z11) {
        if (view == null) {
            return;
        }
        ArrayList arrayList = this.f91218y;
        if (!z11) {
            view.setVisibility(8);
            arrayList.remove(view);
            return;
        }
        if (this.A && i(view)) {
            view.setVisibility(4);
        } else {
            view.setVisibility(0);
        }
        arrayList.add(view);
    }

    public final void h(int i5) {
        int i11 = this.f91219z;
        this.f91219z = i5;
        m mVar = this.f91196a;
        if (i5 == 2) {
            mVar.setVisibility(8);
        } else if (i11 == 2) {
            mVar.setVisibility(0);
        }
        if (i11 != i5) {
            Iterator it = mVar.f91154d.iterator();
            while (it.hasNext()) {
                t tVar = (t) it.next();
                mVar.getVisibility();
                tVar.f91222c.h();
            }
        }
    }

    public final void j() {
        if (!this.C) {
            h(0);
            f();
            return;
        }
        int i5 = this.f91219z;
        if (i5 == 1) {
            this.o.start();
        } else if (i5 == 2) {
            this.f91209p.start();
        } else if (i5 == 3) {
            this.B = true;
        } else if (i5 == 4) {
            return;
        }
        f();
    }
}
