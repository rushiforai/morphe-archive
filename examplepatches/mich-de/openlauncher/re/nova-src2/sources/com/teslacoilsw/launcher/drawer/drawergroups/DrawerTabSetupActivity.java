package com.teslacoilsw.launcher.drawer.drawergroups;

import ab.e0;
import android.app.Dialog;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.a;
import androidx.fragment.app.h0;
import androidx.fragment.app.h1;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.m1;
import androidx.recyclerview.widget.r0;
import b.z9;
import com.android.launcher3.allapps.AllAppsContainerView;
import com.android.launcher3.util.ComponentKey;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.widget.FontFamilyToolbar;
import d9.f;
import f10.t;
import ga.j;
import h10.i;
import iv.b;
import java.util.ArrayList;
import kotlin.Metadata;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import mx.g0;
import t70.j0;
import t70.k0;
import t70.m0;
import t70.y0;
import tm.o;
import uy.c0;
import uy.d0;
import uy.e;
import uy.n0;
import uy.o0;
import uy.q;
import uy.s;
import uy.y;
import v9.p;
import y70.d;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004:\u0001\u0007B\u0007¢\u0006\u0004\b\u0005\u0010\u0006¨\u0006\b"}, d2 = {"Lcom/teslacoilsw/launcher/drawer/drawergroups/DrawerTabSetupActivity;", "Lf10/t;", "Luy/e;", "Luy/c0;", "Lt70/j0;", "<init>", "()V", "RemoveDialogFragment", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class DrawerTabSetupActivity extends t implements e, c0, j0 {

    /* renamed from: p, reason: collision with root package name */
    public p f45740p;
    public final /* synthetic */ d o = k0.b();

    /* renamed from: q, reason: collision with root package name */
    public final r0 f45741q = new r0(new i(this, 1));

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/teslacoilsw/launcher/drawer/drawergroups/DrawerTabSetupActivity$RemoveDialogFragment;", "Landroidx/fragment/app/DialogFragment;", "<init>", "()V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class RemoveDialogFragment extends DialogFragment {

        /* renamed from: a, reason: collision with root package name */
        public int f45742a;

        @Override // androidx.fragment.app.DialogFragment
        public final Dialog onCreateDialog(Bundle bundle) throws Resources.NotFoundException {
            Bundle bundleRequireArguments = requireArguments();
            this.f45742a = bundleRequireArguments.getInt("id");
            String string = bundleRequireArguments.getString("title");
            String string2 = getResources().getString(2132017719, string);
            o oVar = new o((ContextThemeWrapper) requireActivity());
            Intrinsics.d(string);
            f fVar = (f) oVar.f89493b;
            fVar.f49037b = string;
            fVar.e(string2);
            fVar.i(2132017603);
            oVar.f89494c = null;
            z9 z9Var = new z9(this, 6);
            fVar.o(2132017718);
            oVar.f89495d = z9Var;
            return oVar.Y();
        }
    }

    @Override // uy.c0
    public final boolean D(q qVar, j jVar) {
        return false;
    }

    public final void Z() {
        d0 d0Var = d0.f91699e;
        d0Var.o(this);
        p pVar = this.f45740p;
        if (pVar == null) {
            Intrinsics.m("binding");
            throw null;
        }
        RecyclerView recyclerView = pVar.f92502b;
        p pVar2 = this.f45740p;
        if (pVar2 == null) {
            Intrinsics.m("binding");
            throw null;
        }
        recyclerView.setAdapter(new y(this, pVar2.f92502b, d0Var.j(true), this.f45741q));
        p pVar3 = this.f45740p;
        if (pVar3 == null) {
            Intrinsics.m("binding");
            throw null;
        }
        RecyclerView recyclerView2 = pVar3.f92502b;
        pVar3.f92501a.getContext();
        recyclerView2.setLayoutManager(new LinearLayoutManager());
    }

    public final void a0() {
        AllAppsContainerView allAppsContainerView;
        p pVar = this.f45740p;
        if (pVar == null) {
            Intrinsics.m("binding");
            throw null;
        }
        m1 adapter = pVar.f92502b.getAdapter();
        Intrinsics.e(adapter, "null cannot be cast to non-null type com.teslacoilsw.launcher.drawer.drawergroups.DrawerGroupAdapter");
        ArrayList arrayList = ((y) adapter).f91776e;
        int size = arrayList.size();
        ArrayList arrayList2 = new ArrayList();
        for (int i5 = 0; i5 < size; i5++) {
            s sVar = (s) arrayList.get(i5);
            if ((sVar instanceof uy.j) && sVar.f91754f != i5) {
                sVar.f91754f = i5;
                arrayList2.add(sVar);
            }
        }
        if (arrayList2.isEmpty()) {
            return;
        }
        d0 d0Var = d0.f91699e;
        ContentResolver contentResolver = getContentResolver();
        Uri uri = o0.f91743a;
        int size2 = arrayList2.size();
        ContentValues contentValues = new ContentValues();
        for (int i11 = 0; i11 < size2; i11++) {
            uy.j jVar = (uy.j) arrayList2.get(i11);
            String[] strArr = {Integer.toString(jVar.f91753e)};
            contentValues.put("tabOrder", Integer.valueOf(jVar.f91754f));
            contentResolver.update(uri, contentValues, "_id = ?", strArr);
        }
        NovaLauncher novaLauncher = NovaLauncher.f45649u1;
        if (novaLauncher != null && (allAppsContainerView = novaLauncher.V) != null) {
            allAppsContainerView.b(novaLauncher.f79934x);
        }
        e0.O();
    }

    public final void b0(n0 n0Var) {
        h1 supportFragmentManager = getSupportFragmentManager();
        supportFragmentManager.getClass();
        a aVar = new a(supportFragmentManager);
        h0 h0VarE = getSupportFragmentManager().E("dialog");
        if (h0VarE != null) {
            aVar.s(h0VarE);
        }
        aVar.d();
        DialogAddDrawerGroupFragment dialogAddDrawerGroupFragment = new DialogAddDrawerGroupFragment();
        Bundle arguments = dialogAddDrawerGroupFragment.getArguments();
        if (arguments == null) {
            arguments = new Bundle();
        }
        arguments.putString("TAB_TYPE", n0Var.name());
        dialogAddDrawerGroupFragment.setArguments(arguments);
        dialogAddDrawerGroupFragment.show(aVar, "dialog");
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.o.f96790a;
    }

    @Override // uy.c0
    public final void o() {
        a80.e eVar = y0.f88884a;
        m0.t(this, y70.o.f96819a, null, new b(this, null, 26), 2);
    }

    @Override // f10.t, androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        View viewInflate = LayoutInflater.from(this).inflate(2131624106, (ViewGroup) null, false);
        int i5 = 2131428974;
        RecyclerView recyclerView = (RecyclerView) e0.x(2131428974, viewInflate);
        if (recyclerView != null) {
            i5 = 2131429059;
            FontFamilyToolbar fontFamilyToolbar = (FontFamilyToolbar) e0.x(2131429059, viewInflate);
            if (fontFamilyToolbar != null) {
                LinearLayout linearLayout = (LinearLayout) viewInflate;
                this.f45740p = new p(linearLayout, recyclerView, fontFamilyToolbar);
                setContentView(linearLayout);
                p pVar = this.f45740p;
                if (pVar == null) {
                    Intrinsics.m("binding");
                    throw null;
                }
                setSupportActionBar(pVar.f92503c);
                m.b supportActionBar = getSupportActionBar();
                Intrinsics.d(supportActionBar);
                supportActionBar.q(true);
                p pVar2 = this.f45740p;
                if (pVar2 != null) {
                    pg.p.n(pVar2.f92501a, pVar2.f92503c, pVar2.f92502b);
                    return;
                } else {
                    Intrinsics.m("binding");
                    throw null;
                }
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(i5)));
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public final void onDestroy() {
        super.onDestroy();
        k0.c(this, null);
        d0.f91699e.s(this);
    }

    @Override // android.app.Activity
    public final boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 16908332) {
            return super.onOptionsItemSelected(menuItem);
        }
        onBackPressed();
        return true;
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public final void onStart() {
        super.onStart();
        Z();
        d0.f91699e.b(this);
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public final void onStop() {
        super.onStop();
        a0();
        d0.f91699e.s(this);
        Context context = g0.f77088a;
        g0.b();
    }

    @Override // uy.c0
    public final void q(q qVar, ComponentKey componentKey) {
    }
}
