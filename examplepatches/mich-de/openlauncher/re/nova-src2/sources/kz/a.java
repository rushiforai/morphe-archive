package kz;

import mx.j0;
import q9.s;

/* loaded from: classes.dex */
public abstract class a extends o9.m {

    /* renamed from: b, reason: collision with root package name */
    public int f72855b;

    public abstract s r();

    public int s() {
        j0 j0Var = o9.k.Y(getContext()).f79934x;
        int measuredWidth = (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight();
        return (measuredWidth - ((measuredWidth / j0Var.f77146h0) - j0Var.f77140e0)) - j0Var.f77142f0;
    }

    public boolean t() {
        return false;
    }

    public abstract void u(s sVar);
}
