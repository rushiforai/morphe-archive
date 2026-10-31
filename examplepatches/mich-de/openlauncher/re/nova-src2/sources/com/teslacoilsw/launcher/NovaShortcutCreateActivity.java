package com.teslacoilsw.launcher;

import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import f10.t;
import nx.n;
import nx.o;
import pg.p;

/* loaded from: classes.dex */
public class NovaShortcutCreateActivity extends t implements n {

    /* renamed from: p, reason: collision with root package name */
    public static final ComponentName f45669p = new ComponentName("com.teslacoilsw.launcher", NovaShortcutCreateActivity.class.getName());
    public o o;

    @Override // nx.n
    public final void f(Intent intent) {
        setResult(-1, intent);
        finish();
    }

    @Override // f10.t, androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(2131623975);
        Toolbar toolbar = (Toolbar) findViewById(2131429059);
        setSupportActionBar(toolbar);
        getSupportActionBar().t();
        getSupportActionBar().r(12);
        this.o = new o(this, this, false, false);
        RecyclerView recyclerView = (RecyclerView) findViewById(2131428684);
        recyclerView.setAdapter(this.o);
        recyclerView.setLayoutManager(new LinearLayoutManager());
        p.n(findViewById(16908290), toolbar, recyclerView);
    }

    @Override // android.app.Activity
    public final boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 16908332) {
            return super.onOptionsItemSelected(menuItem);
        }
        onBackPressed();
        return true;
    }
}
