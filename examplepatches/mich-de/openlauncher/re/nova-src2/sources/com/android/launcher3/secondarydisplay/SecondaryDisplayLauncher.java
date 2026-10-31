package com.android.launcher3.secondarydisplay;

import aa.w;
import android.animation.Animator;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.ViewAnimationUtils;
import android.view.inputmethod.InputMethodManager;
import bh.g;
import bm.t;
import com.android.launcher3.allapps.AllAppsContainerView;
import com.android.launcher3.popup.PopupContainerWithArrow;
import fa.p;
import ga.a;
import java.util.HashMap;
import java.util.Objects;
import kotlin.NotImplementedError;
import mx.j0;
import o9.c2;
import o9.g3;
import o9.i0;
import o9.l;
import o9.t1;
import o9.z0;
import tz.d;
import tz.k;
import za.j;

/* loaded from: classes2.dex */
public class SecondaryDisplayLauncher extends l implements p {
    public static final /* synthetic */ int O = 0;
    public c2 I;
    public j J;
    public AllAppsContainerView K;
    public View L;
    public t M;
    public boolean N = false;

    @Override // za.d
    public final d C() {
        throw new IllegalStateException();
    }

    @Override // fa.p
    public final void J(HashMap map) {
        this.M.f18111c = map;
    }

    @Override // o9.l, za.d
    public final View.OnClickListener Q() {
        return new fk.t(this, 23);
    }

    @Override // fa.p
    public final void c(a[] aVarArr, int i5) {
        q9.p pVar = this.K.f21025g;
        pVar.f83863c = aVarArr;
        pVar.f83866f = i5;
        pVar.d();
        PopupContainerWithArrow.n0(this);
    }

    @Override // za.d
    public final k l() {
        throw new NotImplementedError();
    }

    @Override // o9.l
    public final View n0() {
        return this.J;
    }

    public void onAppsButtonClicked(View view) {
        t0(true);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        s0();
    }

    @Override // g.o, android.app.Activity
    public final void onBackPressed() {
        if (m()) {
            return;
        }
        o9.a aVarP = o9.a.P(this, 7471103);
        if (aVarP != null) {
            aVarP.S();
        } else {
            t0(false);
        }
    }

    @Override // o9.l, androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.I = ((t1) t1.f80131h.h(this)).f80133b;
        if (getWindow().getDecorView().isAttachedToWindow()) {
            s0();
        }
    }

    @Override // o9.l, androidx.fragment.app.m0, android.app.Activity
    public final void onDestroy() {
        super.onDestroy();
        this.I.m(this);
    }

    @Override // g.o, android.app.Activity
    public final void onNewIntent(Intent intent) {
        View viewPeekDecorView;
        super.onNewIntent(intent);
        if ("android.intent.action.MAIN".equals(intent.getAction()) && (viewPeekDecorView = getWindow().peekDecorView()) != null && viewPeekDecorView.getWindowToken() != null) {
            ((InputMethodManager) getSystemService(InputMethodManager.class)).hideSoftInputFromWindow(viewPeekDecorView.getWindowToken(), 0);
        }
        t0(false);
    }

    @Override // o9.l
    public final void p0() {
    }

    public final void s0() {
        if (this.J != null) {
            return;
        }
        i0 i0VarR = new z0(this, getWindow().getDecorView().getDisplay()).a(this).r(this);
        i0VarR.f79882e = true;
        i0VarR.f79883f = Boolean.FALSE;
        j0 j0VarA = i0VarR.a();
        this.f79934x = j0VarA;
        j0VarA.f77138d0 = j0VarA.E0.f77074g;
        setContentView(2131624346);
        this.J = (j) findViewById(2131427911);
        this.K = (AllAppsContainerView) findViewById(2131427515);
        this.L = findViewById(2131427478);
        q9.p pVar = this.K.f21025g;
        Objects.requireNonNull(pVar);
        this.M = new t(new w(pVar, 5));
        this.I.a(this);
    }

    public final void t0(boolean z11) {
        if (z11 == this.N) {
            return;
        }
        float fHypot = (float) Math.hypot(this.K.getWidth(), this.K.getHeight());
        float fN = g.N(getResources().getDisplayMetrics(), 8);
        float width = this.L.getWidth() / 2.0f;
        float[] fArr = {width, width};
        j jVar = this.J;
        View view = this.L;
        jVar.getClass();
        g3.i(view, jVar, fArr, false, false);
        j jVar2 = this.J;
        AllAppsContainerView allAppsContainerView = this.K;
        jVar2.getClass();
        g3.q(allAppsContainerView, jVar2, fArr);
        AllAppsContainerView allAppsContainerView2 = this.K;
        int i5 = (int) fArr[0];
        int i11 = (int) fArr[1];
        float f11 = z11 ? fN : fHypot;
        if (!z11) {
            fHypot = fN;
        }
        Animator animatorCreateCircularReveal = ViewAnimationUtils.createCircularReveal(allAppsContainerView2, i5, i11, f11, fHypot);
        if (z11) {
            this.N = true;
            this.K.setVisibility(0);
            this.L.setVisibility(4);
        } else {
            this.N = false;
            animatorCreateCircularReveal.addListener(new aa.i0(this, 15));
        }
        animatorCreateCircularReveal.start();
    }

    @Override // za.d
    public final j u() {
        return this.J;
    }

    @Override // fa.p
    public final void x(a aVar) {
        q9.p pVar = this.K.f21025g;
        pVar.getClass();
        pVar.e(new w(aVar, 6));
    }
}
