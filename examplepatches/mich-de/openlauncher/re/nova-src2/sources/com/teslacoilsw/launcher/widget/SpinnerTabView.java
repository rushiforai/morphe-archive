package com.teslacoilsw.launcher.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import l30.e;
import r.l1;

/* loaded from: classes.dex */
public class SpinnerTabView extends Button implements View.OnClickListener, View.OnTouchListener {

    /* renamed from: a, reason: collision with root package name */
    public e f46486a;

    /* renamed from: b, reason: collision with root package name */
    public View.OnClickListener f46487b;

    /* renamed from: c, reason: collision with root package name */
    public l1 f46488c;

    public SpinnerTabView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f46486a = null;
        this.f46487b = null;
        this.f46488c = null;
        super.setOnClickListener(this);
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        if (!view.isSelected()) {
            this.f46487b.onClick(view);
            return;
        }
        e eVar = this.f46486a;
        if (eVar == null || eVar == null) {
            return;
        }
        if (eVar.f84883z.isShowing()) {
            this.f46486a.dismiss();
        }
        this.f46486a.show();
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        l1 l1Var;
        if (!view.isSelected() || (l1Var = this.f46488c) == null) {
            return false;
        }
        return l1Var.onTouch(view, motionEvent);
    }

    @Override // android.view.View
    public final void setOnClickListener(View.OnClickListener onClickListener) {
        this.f46487b = onClickListener;
    }
}
