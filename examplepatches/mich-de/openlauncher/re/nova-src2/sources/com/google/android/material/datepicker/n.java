package com.google.android.material.datepicker;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.app.Activity;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Message;
import android.text.SpannableString;
import android.view.View;
import android.view.animation.BounceInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.widget.CheckedTextView;
import android.widget.Toast;
import androidx.appcompat.widget.Toolbar;
import androidx.preference.Preference;
import b10.i1;
import bn.s0;
import com.android.launcher3.dragndrop.AddItemActivity;
import com.android.launcher3.widget.WidgetImageView;
import com.google.android.exoplayer2.ui.TrackSelectionView;
import com.teslacoilsw.launcher.drawer.drawergroups.DialogAddDrawerGroupFragment;
import com.teslacoilsw.launcher.onboarding.NovaPaywallActivity;
import e10.a3;
import java.util.HashMap;
import java.util.Objects;
import mx.p1;
import o9.g3;
import r.i2;
import uy.n0;

/* loaded from: classes3.dex */
public final class n implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34263a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f34264b;

    public /* synthetic */ n(Object obj, int i5) {
        this.f34263a = i5;
        this.f34264b = obj;
    }

    /* JADX WARN: Type inference failed for: r0v18, types: [f10.t, nx.r] */
    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        Message message;
        Message message2;
        Message message3;
        int i5 = this.f34263a;
        Message messageObtain = null;
        messageObtain = null;
        Object obj = this.f34264b;
        switch (i5) {
            case 0:
                MaterialCalendar materialCalendar = (MaterialCalendar) obj;
                int i11 = materialCalendar.f34198e;
                if (i11 == 2) {
                    materialCalendar.o(1);
                    return;
                } else {
                    if (i11 == 1) {
                        materialCalendar.o(2);
                        return;
                    }
                    return;
                }
            case 1:
                if (a3.f51435a.f51552h) {
                    View.OnClickListener onClickListener = (View.OnClickListener) obj;
                    if (onClickListener != null) {
                        onClickListener.onClick(view);
                        return;
                    }
                    return;
                }
                Activity activityM = lb0.b.m(view.getContext());
                if (activityM == null) {
                    return;
                }
                zy.c cVar = zy.c.f98823a;
                zy.c.i("prime_locked_pref_tapped", b70.h.f17594a);
                int i12 = NovaPaywallActivity.o;
                activityM.startActivity(i1.b(activityM, null, "prime_locked_pref", false));
                return;
            case 2:
                gj.d dVar = (gj.d) obj;
                if (dVar.f57697j && dVar.isShowing()) {
                    if (!dVar.f57699l) {
                        TypedArray typedArrayObtainStyledAttributes = dVar.getContext().obtainStyledAttributes(new int[]{16843611});
                        dVar.f57698k = typedArrayObtainStyledAttributes.getBoolean(0, true);
                        typedArrayObtainStyledAttributes.recycle();
                        dVar.f57699l = true;
                    }
                    if (dVar.f57698k) {
                        dVar.cancel();
                        return;
                    }
                    return;
                }
                return;
            case 3:
                ((kd.k) obj).f71363r.showPrivacyActivity();
                return;
            case 4:
                m.i iVar = (m.i) obj;
                if (view == iVar.f75277i && (message3 = iVar.f75279k) != null) {
                    messageObtain = Message.obtain(message3);
                } else if (view == iVar.f75280l && (message2 = iVar.n) != null) {
                    messageObtain = Message.obtain(message2);
                } else if (view == iVar.o && (message = iVar.f75283q) != null) {
                    messageObtain = Message.obtain(message);
                }
                if (messageObtain != null) {
                    messageObtain.sendToTarget();
                }
                iVar.F.obtainMessage(1, iVar.f75270b).sendToTarget();
                return;
            case 5:
                ((mh.c) obj).N();
                return;
            case 6:
                ((nx.h) obj).f78637e.R(view, ((nx.f) view.getTag()).f78629a);
                return;
            case 7:
                ((androidx.appcompat.view.b) obj).b();
                return;
            case 8:
                i2 i2Var = ((Toolbar) obj).M;
                q.m mVar = i2Var != null ? i2Var.f84756b : null;
                if (mVar != null) {
                    mVar.collapseActionView();
                    return;
                }
                return;
            case 9:
                ((Preference) obj).j(view);
                return;
            case 10:
                ((l30.e) obj).show();
                return;
            case 11:
                TrackSelectionView trackSelectionView = (TrackSelectionView) obj;
                CheckedTextView checkedTextView = trackSelectionView.f31590b;
                HashMap map = trackSelectionView.f31591c;
                CheckedTextView checkedTextView2 = trackSelectionView.f31589a;
                if (view == checkedTextView2) {
                    trackSelectionView.f31592d = true;
                    map.clear();
                } else {
                    if (view != checkedTextView) {
                        trackSelectionView.f31592d = false;
                        view.getTag().getClass();
                        throw new ClassCastException();
                    }
                    trackSelectionView.f31592d = false;
                    map.clear();
                }
                checkedTextView2.setChecked(trackSelectionView.f31592d);
                checkedTextView.setChecked(!trackSelectionView.f31592d && map.size() == 0);
                throw null;
            case 12:
                Context context = view.getContext();
                s0 s0Var = new s0(context, view);
                androidx.appcompat.view.i iVar2 = new androidx.appcompat.view.i(context);
                q.k kVar = (q.k) s0Var.f18280c;
                iVar2.inflate(2131755014, kVar);
                DialogAddDrawerGroupFragment dialogAddDrawerGroupFragment = (DialogAddDrawerGroupFragment) obj;
                uy.s sVar = dialogAddDrawerGroupFragment.f45734a;
                if (sVar.f91751c == n0.f91730b || sVar.e()) {
                    kVar.clear();
                    if (dialogAddDrawerGroupFragment.f45734a.d()) {
                        kVar.add(0, 2131428352, 0, 2132017737);
                    } else {
                        kVar.add(0, 2131428352, 0, 2132017793);
                    }
                }
                s0Var.f18283f = new k30.e(this, 28);
                q.u uVar = (q.u) s0Var.f18282e;
                if (uVar.b()) {
                    return;
                }
                if (uVar.f83298e == null) {
                    throw new IllegalStateException("MenuPopupHelper cannot be used without an anchor");
                }
                uVar.d(0, 0, false, false);
                return;
            default:
                AddItemActivity addItemActivity = (AddItemActivity) obj;
                SpannableString spannableStringX = g3.x(addItemActivity.getString(2132018107), addItemActivity.getText(2132018110));
                Toast toast = addItemActivity.P;
                if (toast != null) {
                    toast.cancel();
                }
                Toast toastMakeText = Toast.makeText(addItemActivity.getApplicationContext(), spannableStringX, 0);
                addItemActivity.P = toastMakeText;
                toastMakeText.show();
                WidgetImageView widgetImageView = addItemActivity.J.f21325f;
                AnimatorSet animatorSet = new AnimatorSet();
                ObjectAnimator objectAnimatorB = a.a.B(widgetImageView, PropertyValuesHolder.ofFloat("scaleX", 1.2f), PropertyValuesHolder.ofFloat("scaleY", 1.2f));
                objectAnimatorB.setDuration(200L);
                objectAnimatorB.setInterpolator(new DecelerateInterpolator());
                ObjectAnimator objectAnimatorB2 = a.a.B(widgetImageView, PropertyValuesHolder.ofFloat("scaleX", 1.0f), PropertyValuesHolder.ofFloat("scaleY", 1.0f));
                objectAnimatorB2.setDuration(300L);
                objectAnimatorB2.setInterpolator(new BounceInterpolator());
                animatorSet.play(objectAnimatorB).before(objectAnimatorB2);
                animatorSet.addListener(p1.f77227d);
                animatorSet.start();
                return;
        }
    }

    public n(mh.c cVar) {
        this.f34263a = 5;
        Objects.requireNonNull(cVar);
        this.f34264b = cVar;
    }
}
