package io.branch.requery.android.database.sqlite;

import a5.j1;
import androidx.appcompat.widget.ActionBarContextView;

/* loaded from: classes4.dex */
public final class y implements j1 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f61880a;

    /* renamed from: b, reason: collision with root package name */
    public int f61881b;

    /* renamed from: c, reason: collision with root package name */
    public Object f61882c;

    @Override // a5.j1
    public void a() {
        this.f61880a = true;
    }

    @Override // a5.j1
    public void b() {
        super/*android.view.View*/.setVisibility(0);
        this.f61880a = false;
    }

    @Override // a5.j1
    public void c() {
        if (this.f61880a) {
            return;
        }
        ActionBarContextView actionBarContextView = (ActionBarContextView) this.f61882c;
        actionBarContextView.f13705f = null;
        super/*android.view.View*/.setVisibility(this.f61881b);
    }
}
