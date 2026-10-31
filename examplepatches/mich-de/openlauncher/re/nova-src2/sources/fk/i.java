package fk;

import a5.a1;
import aa.i0;
import aa.x;
import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.AutoCompleteTextView;
import android.widget.EditText;
import android.widget.Spinner;
import b.e8;
import b00.b1;
import com.google.android.material.internal.CheckableImageButton;
import com.google.android.material.textfield.TextInputLayout;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public final class i extends n {

    /* renamed from: e, reason: collision with root package name */
    public final int f55185e;

    /* renamed from: f, reason: collision with root package name */
    public final int f55186f;

    /* renamed from: g, reason: collision with root package name */
    public final TimeInterpolator f55187g;

    /* renamed from: h, reason: collision with root package name */
    public AutoCompleteTextView f55188h;

    /* renamed from: i, reason: collision with root package name */
    public final ay.k f55189i;

    /* renamed from: j, reason: collision with root package name */
    public final a f55190j;

    /* renamed from: k, reason: collision with root package name */
    public final f10.o f55191k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f55192l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f55193m;
    public boolean n;
    public long o;

    /* renamed from: p, reason: collision with root package name */
    public AccessibilityManager f55194p;

    /* renamed from: q, reason: collision with root package name */
    public ValueAnimator f55195q;

    /* renamed from: r, reason: collision with root package name */
    public ValueAnimator f55196r;

    public i(m mVar) {
        super(mVar);
        this.f55189i = new ay.k(this, 29);
        this.f55190j = new a(this, 1);
        this.f55191k = new f10.o(this, 11);
        this.o = Long.MAX_VALUE;
        this.f55186f = ps.l.q(mVar.getContext(), 2130969706, 67);
        this.f55185e = ps.l.q(mVar.getContext(), 2130969706, 50);
        this.f55187g = ps.l.r(mVar.getContext(), 2130969715, cj.a.f19951a);
    }

    @Override // fk.n
    public final void a() {
        if (this.f55194p.isTouchExplorationEnabled() && this.f55188h.getInputType() != 0 && !this.f55223d.hasFocus()) {
            this.f55188h.dismissDropDown();
        }
        this.f55188h.post(new x(this, 27));
    }

    @Override // fk.n
    public final int c() {
        return 2132017863;
    }

    @Override // fk.n
    public final int d() {
        return 2131231995;
    }

    @Override // fk.n
    public final View.OnFocusChangeListener e() {
        return this.f55190j;
    }

    @Override // fk.n
    public final View.OnClickListener f() {
        return this.f55189i;
    }

    @Override // fk.n
    public final f10.o h() {
        return this.f55191k;
    }

    @Override // fk.n
    public final boolean i(int i5) {
        return i5 != 0;
    }

    @Override // fk.n
    public final boolean k() {
        return this.n;
    }

    @Override // fk.n
    public final void l(EditText editText) {
        if (!(editText instanceof AutoCompleteTextView)) {
            throw new RuntimeException("EditText needs to be an AutoCompleteTextView if an Exposed Dropdown Menu is being used.");
        }
        AutoCompleteTextView autoCompleteTextView = (AutoCompleteTextView) editText;
        this.f55188h = autoCompleteTextView;
        autoCompleteTextView.setOnTouchListener(new e8(this, 3));
        this.f55188h.setOnDismissListener(new AutoCompleteTextView.OnDismissListener() { // from class: fk.h
            @Override // android.widget.AutoCompleteTextView.OnDismissListener
            public final void onDismiss() {
                i iVar = this.f55184a;
                iVar.f55193m = true;
                iVar.o = System.currentTimeMillis();
                iVar.s(false);
            }
        });
        this.f55188h.setThreshold(0);
        TextInputLayout textInputLayout = this.f55220a;
        m mVar = textInputLayout.f34367c;
        CheckableImageButton checkableImageButton = mVar.f55205c;
        checkableImageButton.setImageDrawable(null);
        mVar.k();
        p7.u.E(mVar.f55203a, checkableImageButton, mVar.f55206d, mVar.f55207e);
        if (editText.getInputType() == 0 && this.f55194p.isTouchExplorationEnabled()) {
            WeakHashMap weakHashMap = a1.f250a;
            this.f55223d.setImportantForAccessibility(2);
        }
        textInputLayout.f34367c.h(true);
    }

    @Override // fk.n
    public final void m(b5.g gVar) {
        AccessibilityNodeInfo accessibilityNodeInfo = gVar.f17551a;
        if (this.f55188h.getInputType() == 0) {
            gVar.y(Spinner.class.getName());
        }
        if (accessibilityNodeInfo.isShowingHintText()) {
            accessibilityNodeInfo.setHintText(null);
        }
    }

    @Override // fk.n
    public final void n(AccessibilityEvent accessibilityEvent) {
        if (this.f55194p.isEnabled() && this.f55188h.getInputType() == 0) {
            boolean z11 = (accessibilityEvent.getEventType() == 32768 || accessibilityEvent.getEventType() == 8) && this.n && !this.f55188h.isPopupShowing();
            if (accessibilityEvent.getEventType() == 1 || z11) {
                t();
                this.f55193m = true;
                this.o = System.currentTimeMillis();
            }
        }
    }

    @Override // fk.n
    public final void q() {
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
        TimeInterpolator timeInterpolator = this.f55187g;
        valueAnimatorOfFloat.setInterpolator(timeInterpolator);
        valueAnimatorOfFloat.setDuration(this.f55186f);
        int i5 = 3;
        valueAnimatorOfFloat.addUpdateListener(new b1(this, i5));
        this.f55196r = valueAnimatorOfFloat;
        ValueAnimator valueAnimatorOfFloat2 = ValueAnimator.ofFloat(1.0f, 0.0f);
        valueAnimatorOfFloat2.setInterpolator(timeInterpolator);
        valueAnimatorOfFloat2.setDuration(this.f55185e);
        valueAnimatorOfFloat2.addUpdateListener(new b1(this, i5));
        this.f55195q = valueAnimatorOfFloat2;
        valueAnimatorOfFloat2.addListener(new i0(this, 5));
        this.f55194p = (AccessibilityManager) this.f55222c.getSystemService("accessibility");
    }

    @Override // fk.n
    public final void r() {
        AutoCompleteTextView autoCompleteTextView = this.f55188h;
        if (autoCompleteTextView != null) {
            autoCompleteTextView.setOnTouchListener(null);
            this.f55188h.setOnDismissListener(null);
        }
    }

    public final void s(boolean z11) {
        if (this.n != z11) {
            this.n = z11;
            this.f55196r.cancel();
            this.f55195q.start();
        }
    }

    public final void t() {
        if (this.f55188h == null) {
            return;
        }
        long jCurrentTimeMillis = System.currentTimeMillis() - this.o;
        if (jCurrentTimeMillis < 0 || jCurrentTimeMillis > 300) {
            this.f55193m = false;
        }
        if (this.f55193m) {
            this.f55193m = false;
            return;
        }
        s(!this.n);
        if (!this.n) {
            this.f55188h.dismissDropDown();
        } else {
            this.f55188h.requestFocus();
            this.f55188h.showDropDown();
        }
    }
}
