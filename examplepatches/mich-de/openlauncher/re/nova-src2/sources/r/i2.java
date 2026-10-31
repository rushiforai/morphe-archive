package r;

import android.content.Context;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import androidx.appcompat.widget.Toolbar;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class i2 implements q.w {

    /* renamed from: a, reason: collision with root package name */
    public q.k f84755a;

    /* renamed from: b, reason: collision with root package name */
    public q.m f84756b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Toolbar f84757c;

    public i2(Toolbar toolbar) {
        this.f84757c = toolbar;
    }

    @Override // q.w
    public final boolean a(q.c0 c0Var) {
        return false;
    }

    @Override // q.w
    public final void b(q.k kVar, boolean z11) {
    }

    @Override // q.w
    public final void c() {
        if (this.f84756b != null) {
            q.k kVar = this.f84755a;
            if (kVar != null) {
                int size = kVar.f83237f.size();
                for (int i5 = 0; i5 < size; i5++) {
                    if (this.f84755a.getItem(i5) == this.f84756b) {
                        return;
                    }
                }
            }
            f(this.f84756b);
        }
    }

    @Override // q.w
    public final boolean d(q.m mVar) {
        Toolbar toolbar = this.f84757c;
        s sVar = toolbar.f13807h;
        int i5 = toolbar.n;
        if (sVar == null) {
            s sVar2 = new s(toolbar.getContext(), null, 2130970239);
            toolbar.f13807h = sVar2;
            sVar2.setImageDrawable(toolbar.f13805f);
            toolbar.f13807h.setContentDescription(toolbar.f13806g);
            j2 j2VarF = Toolbar.f();
            j2VarF.f75187a = (i5 & 112) | 8388611;
            j2VarF.f84762b = 2;
            toolbar.f13807h.setLayoutParams(j2VarF);
            toolbar.f13807h.setOnClickListener(new com.google.android.material.datepicker.n(toolbar, 8));
        }
        ViewParent parent = toolbar.f13807h.getParent();
        if (parent != toolbar) {
            if (parent instanceof ViewGroup) {
                ((ViewGroup) parent).removeView(toolbar.f13807h);
            }
            toolbar.addView(toolbar.f13807h);
        }
        View actionView = mVar.getActionView();
        toolbar.f13808i = actionView;
        this.f84756b = mVar;
        ViewParent parent2 = actionView.getParent();
        if (parent2 != toolbar) {
            if (parent2 instanceof ViewGroup) {
                ((ViewGroup) parent2).removeView(toolbar.f13808i);
            }
            j2 j2VarF2 = Toolbar.f();
            j2VarF2.f75187a = (i5 & 112) | 8388611;
            j2VarF2.f84762b = 2;
            toolbar.f13808i.setLayoutParams(j2VarF2);
            toolbar.addView(toolbar.f13808i);
        }
        for (int childCount = toolbar.getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = toolbar.getChildAt(childCount);
            if (((j2) childAt.getLayoutParams()).f84762b != 2 && childAt != toolbar.f13800a) {
                toolbar.removeViewAt(childCount);
                toolbar.E.add(childAt);
            }
        }
        toolbar.requestLayout();
        mVar.C = true;
        mVar.n.p(false);
        KeyEvent.Callback callback = toolbar.f13808i;
        if (callback instanceof androidx.appcompat.view.c) {
            ((q.o) ((androidx.appcompat.view.c) callback)).f83284a.onActionViewExpanded();
        }
        toolbar.D();
        return true;
    }

    @Override // q.w
    public final void e(Context context, q.k kVar) {
        q.m mVar;
        q.k kVar2 = this.f84755a;
        if (kVar2 != null && (mVar = this.f84756b) != null) {
            kVar2.d(mVar);
        }
        this.f84755a = kVar;
    }

    @Override // q.w
    public final boolean f(q.m mVar) {
        Toolbar toolbar = this.f84757c;
        KeyEvent.Callback callback = toolbar.f13808i;
        if (callback instanceof androidx.appcompat.view.c) {
            ((q.o) ((androidx.appcompat.view.c) callback)).f83284a.onActionViewCollapsed();
        }
        toolbar.removeView(toolbar.f13808i);
        toolbar.removeView(toolbar.f13807h);
        toolbar.f13808i = null;
        ArrayList arrayList = toolbar.E;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            toolbar.addView((View) arrayList.get(size));
        }
        arrayList.clear();
        this.f84756b = null;
        toolbar.requestLayout();
        mVar.C = false;
        mVar.n.p(false);
        toolbar.D();
        return true;
    }

    @Override // q.w
    public final boolean g() {
        return false;
    }
}
