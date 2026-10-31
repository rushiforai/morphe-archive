package com.android.launcher3;

import android.content.Context;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.DragEvent;
import android.view.KeyEvent;
import android.widget.EditText;
import g.p;
import o9.n0;
import za.d;

/* loaded from: classes.dex */
public class ExtendedEditText extends EditText {

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ int f20956d = 0;

    /* renamed from: a, reason: collision with root package name */
    public boolean f20957a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f20958b;

    /* renamed from: c, reason: collision with root package name */
    public n0 f20959c;

    public ExtendedEditText(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f20958b = false;
    }

    public final void a() {
        ((d) d.p(getContext())).h();
        n0 n0Var = this.f20959c;
        if (n0Var != null) {
            n0Var.F();
        }
    }

    @Override // android.widget.TextView
    public final boolean isSuggestionsEnabled() {
        return !this.f20958b && super.isSuggestionsEnabled();
    }

    @Override // android.widget.TextView, android.view.View
    public final boolean onDragEvent(DragEvent dragEvent) {
        return false;
    }

    @Override // android.widget.TextView, android.view.View
    public final boolean onKeyPreIme(int i5, KeyEvent keyEvent) {
        if (i5 != 4 || keyEvent.getAction() != 1) {
            return super.onKeyPreIme(i5, keyEvent);
        }
        if (TextUtils.isEmpty(getText())) {
            ((d) d.p(getContext())).h();
        }
        n0 n0Var = this.f20959c;
        if (n0Var == null) {
            return false;
        }
        n0Var.F();
        return true;
    }

    @Override // android.widget.TextView, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        if (this.f20957a) {
            post(new p(this, 25));
        }
    }
}
