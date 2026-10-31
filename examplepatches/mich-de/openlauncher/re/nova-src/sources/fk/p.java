package fk;

import a5.a1;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.TimeInterpolator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.text.TextUtils;
import android.util.Property;
import android.view.View;
import android.view.animation.LinearInterpolator;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.appcompat.widget.AppCompatTextView;
import cl.l0;
import com.google.android.material.textfield.TextInputLayout;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.WeakHashMap;
import ps.f0;

/* loaded from: classes3.dex */
public final class p {
    public ColorStateList A;

    /* renamed from: a, reason: collision with root package name */
    public final int f55229a;

    /* renamed from: b, reason: collision with root package name */
    public final int f55230b;

    /* renamed from: c, reason: collision with root package name */
    public final int f55231c;

    /* renamed from: d, reason: collision with root package name */
    public final TimeInterpolator f55232d;

    /* renamed from: e, reason: collision with root package name */
    public final TimeInterpolator f55233e;

    /* renamed from: f, reason: collision with root package name */
    public final TimeInterpolator f55234f;

    /* renamed from: g, reason: collision with root package name */
    public final Context f55235g;

    /* renamed from: h, reason: collision with root package name */
    public final TextInputLayout f55236h;

    /* renamed from: i, reason: collision with root package name */
    public LinearLayout f55237i;

    /* renamed from: j, reason: collision with root package name */
    public int f55238j;

    /* renamed from: k, reason: collision with root package name */
    public FrameLayout f55239k;

    /* renamed from: l, reason: collision with root package name */
    public AnimatorSet f55240l;

    /* renamed from: m, reason: collision with root package name */
    public final float f55241m;
    public int n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public CharSequence f55242p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f55243q;

    /* renamed from: r, reason: collision with root package name */
    public AppCompatTextView f55244r;

    /* renamed from: s, reason: collision with root package name */
    public CharSequence f55245s;

    /* renamed from: t, reason: collision with root package name */
    public int f55246t;

    /* renamed from: u, reason: collision with root package name */
    public int f55247u;

    /* renamed from: v, reason: collision with root package name */
    public ColorStateList f55248v;

    /* renamed from: w, reason: collision with root package name */
    public CharSequence f55249w;

    /* renamed from: x, reason: collision with root package name */
    public boolean f55250x;

    /* renamed from: y, reason: collision with root package name */
    public AppCompatTextView f55251y;

    /* renamed from: z, reason: collision with root package name */
    public int f55252z;

    public p(TextInputLayout textInputLayout) {
        Context context = textInputLayout.getContext();
        this.f55235g = context;
        this.f55236h = textInputLayout;
        this.f55241m = context.getResources().getDimensionPixelSize(2131165418);
        this.f55229a = ps.l.q(context, 2130969707, Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE);
        this.f55230b = ps.l.q(context, 2130969703, 167);
        this.f55231c = ps.l.q(context, 2130969707, 167);
        this.f55232d = ps.l.r(context, 2130969712, cj.a.f19954d);
        LinearInterpolator linearInterpolator = cj.a.f19951a;
        this.f55233e = ps.l.r(context, 2130969712, linearInterpolator);
        this.f55234f = ps.l.r(context, 2130969715, linearInterpolator);
    }

    public final void a(AppCompatTextView appCompatTextView, int i5) {
        if (this.f55237i == null && this.f55239k == null) {
            Context context = this.f55235g;
            LinearLayout linearLayout = new LinearLayout(context);
            this.f55237i = linearLayout;
            linearLayout.setOrientation(0);
            LinearLayout linearLayout2 = this.f55237i;
            TextInputLayout textInputLayout = this.f55236h;
            textInputLayout.addView(linearLayout2, -1, -2);
            this.f55239k = new FrameLayout(context);
            this.f55237i.addView(this.f55239k, new LinearLayout.LayoutParams(0, -2, 1.0f));
            if (textInputLayout.f34369d != null) {
                b();
            }
        }
        if (i5 == 0 || i5 == 1) {
            this.f55239k.setVisibility(0);
            this.f55239k.addView(appCompatTextView);
        } else {
            this.f55237i.addView(appCompatTextView, new LinearLayout.LayoutParams(-2, -2));
        }
        this.f55237i.setVisibility(0);
        this.f55238j++;
    }

    public final void b() {
        EditText editText;
        if (this.f55237i == null || (editText = this.f55236h.f34369d) == null) {
            return;
        }
        Context context = this.f55235g;
        boolean zV = f0.v(context);
        LinearLayout linearLayout = this.f55237i;
        WeakHashMap weakHashMap = a1.f250a;
        int paddingStart = editText.getPaddingStart();
        if (zV) {
            paddingStart = context.getResources().getDimensionPixelSize(2131166011);
        }
        int dimensionPixelSize = context.getResources().getDimensionPixelSize(2131166010);
        if (zV) {
            dimensionPixelSize = context.getResources().getDimensionPixelSize(2131166012);
        }
        int paddingEnd = editText.getPaddingEnd();
        if (zV) {
            paddingEnd = context.getResources().getDimensionPixelSize(2131166011);
        }
        linearLayout.setPaddingRelative(paddingStart, dimensionPixelSize, paddingEnd, 0);
    }

    public final void c() {
        AnimatorSet animatorSet = this.f55240l;
        if (animatorSet != null) {
            animatorSet.cancel();
        }
    }

    public final void d(ArrayList arrayList, boolean z11, AppCompatTextView appCompatTextView, int i5, int i11, int i12) {
        if (appCompatTextView == null || !z11) {
            return;
        }
        if (i5 == i12 || i5 == i11) {
            boolean z12 = i12 == i5;
            ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(appCompatTextView, (Property<AppCompatTextView, Float>) View.ALPHA, z12 ? 1.0f : 0.0f);
            int i13 = this.f55231c;
            objectAnimatorOfFloat.setDuration(z12 ? this.f55230b : i13);
            objectAnimatorOfFloat.setInterpolator(z12 ? this.f55233e : this.f55234f);
            if (i5 == i12 && i11 != 0) {
                objectAnimatorOfFloat.setStartDelay(i13);
            }
            arrayList.add(objectAnimatorOfFloat);
            if (i12 != i5 || i11 == 0) {
                return;
            }
            ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(appCompatTextView, (Property<AppCompatTextView, Float>) View.TRANSLATION_Y, -this.f55241m, 0.0f);
            objectAnimatorOfFloat2.setDuration(this.f55229a);
            objectAnimatorOfFloat2.setInterpolator(this.f55232d);
            objectAnimatorOfFloat2.setStartDelay(i13);
            arrayList.add(objectAnimatorOfFloat2);
        }
    }

    public final TextView e(int i5) {
        if (i5 == 1) {
            return this.f55244r;
        }
        if (i5 != 2) {
            return null;
        }
        return this.f55251y;
    }

    public final void f() {
        this.f55242p = null;
        c();
        if (this.n == 1) {
            if (!this.f55250x || TextUtils.isEmpty(this.f55249w)) {
                this.o = 0;
            } else {
                this.o = 2;
            }
        }
        i(this.n, this.o, h(this.f55244r, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
    }

    public final void g(AppCompatTextView appCompatTextView, int i5) {
        FrameLayout frameLayout;
        LinearLayout linearLayout = this.f55237i;
        if (linearLayout == null) {
            return;
        }
        if ((i5 == 0 || i5 == 1) && (frameLayout = this.f55239k) != null) {
            frameLayout.removeView(appCompatTextView);
        } else {
            linearLayout.removeView(appCompatTextView);
        }
        int i11 = this.f55238j - 1;
        this.f55238j = i11;
        LinearLayout linearLayout2 = this.f55237i;
        if (i11 == 0) {
            linearLayout2.setVisibility(8);
        }
    }

    public final boolean h(TextView textView, CharSequence charSequence) {
        WeakHashMap weakHashMap = a1.f250a;
        TextInputLayout textInputLayout = this.f55236h;
        if (textInputLayout.isLaidOut() && textInputLayout.isEnabled()) {
            return (this.o == this.n && textView != null && TextUtils.equals(textView.getText(), charSequence)) ? false : true;
        }
        return false;
    }

    public final void i(int i5, int i11, boolean z11) {
        TextView textViewE;
        TextView textViewE2;
        if (i5 == i11) {
            return;
        }
        if (z11) {
            AnimatorSet animatorSet = new AnimatorSet();
            this.f55240l = animatorSet;
            ArrayList arrayList = new ArrayList();
            d(arrayList, this.f55250x, this.f55251y, 2, i5, i11);
            d(arrayList, this.f55243q, this.f55244r, 1, i5, i11);
            l0.L(animatorSet, arrayList);
            animatorSet.addListener(new o(this, i11, e(i5), i5, e(i11)));
            animatorSet.start();
        } else if (i5 != i11) {
            if (i11 != 0 && (textViewE2 = e(i11)) != null) {
                textViewE2.setVisibility(0);
                textViewE2.setAlpha(1.0f);
            }
            if (i5 != 0 && (textViewE = e(i5)) != null) {
                textViewE.setVisibility(4);
                if (i5 == 1) {
                    textViewE.setText((CharSequence) null);
                }
            }
            this.n = i11;
        }
        TextInputLayout textInputLayout = this.f55236h;
        textInputLayout.A();
        textInputLayout.D(z11, false);
        textInputLayout.F();
    }
}
