package com.teslacoilsw.launcher.drawer.drawergroups;

import android.app.Dialog;
import android.os.Bundle;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import androidx.fragment.app.DialogFragment;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import com.google.android.material.datepicker.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefColorView;
import d9.j;
import e10.a3;
import e10.g2;
import tm.o;
import uy.c;
import uy.d;
import uy.d0;
import uy.f;
import uy.g;
import uy.j0;
import uy.n0;
import uy.s;

/* loaded from: classes4.dex */
public class DialogAddDrawerGroupFragment extends DialogFragment {

    /* renamed from: e, reason: collision with root package name */
    public j f45738e;

    /* renamed from: a, reason: collision with root package name */
    public s f45734a = null;

    /* renamed from: b, reason: collision with root package name */
    public n0 f45735b = null;

    /* renamed from: c, reason: collision with root package name */
    public int f45736c = -1;

    /* renamed from: d, reason: collision with root package name */
    public boolean f45737d = false;

    /* renamed from: f, reason: collision with root package name */
    public boolean f45739f = false;

    public static DialogAddDrawerGroupFragment o(s sVar) {
        DialogAddDrawerGroupFragment dialogAddDrawerGroupFragment = new DialogAddDrawerGroupFragment();
        Bundle bundle = new Bundle();
        bundle.putString(NativeAdContent.ViewTag.AD_TITLE, sVar.f91749a);
        bundle.putInt("EDIT_ID", sVar.f91753e);
        bundle.putString("TAB_TYPE", sVar.f91751c.name());
        bundle.putBoolean("SHOW_SPINNER", false);
        bundle.putBoolean("HIDE_APPS", sVar.f91750b);
        bundle.putInt("TABCOLOR", sVar.f91755g);
        dialogAddDrawerGroupFragment.setArguments(bundle);
        return dialogAddDrawerGroupFragment;
    }

    @Override // androidx.fragment.app.DialogFragment
    public final Dialog onCreateDialog(Bundle bundle) throws Throwable {
        boolean z11;
        ContextThemeWrapper contextThemeWrapper = new ContextThemeWrapper(getActivity(), 2132083105);
        ViewGroup viewGroup = (ViewGroup) LayoutInflater.from(contextThemeWrapper).inflate(2131624092, (ViewGroup) null);
        Spinner spinner = (Spinner) viewGroup.findViewById(2131429082);
        TextView textView = (TextView) viewGroup.findViewById(2131429031);
        CheckBox checkBox = (CheckBox) viewGroup.findViewById(2131428247);
        FancyPrefColorView fancyPrefColorView = (FancyPrefColorView) viewGroup.findViewById(2131427700);
        fancyPrefColorView.C = new ux.s(this, 1);
        Bundle arguments = getArguments();
        if (arguments != null) {
            z11 = arguments.getBoolean("SHOW_SPINNER", true);
            this.f45735b = n0.valueOf(arguments.getString("TAB_TYPE", "TAB_APP_GROUP"));
            int i5 = arguments.getInt("EDIT_ID", -1);
            this.f45736c = i5;
            if (i5 != -1) {
                d0 d0Var = d0.f91699e;
                d0Var.o(getActivity());
                this.f45734a = d0Var.h(this.f45736c);
            } else {
                this.f45739f = true;
                this.f45734a = null;
            }
            textView.setText(arguments.getString(NativeAdContent.ViewTag.AD_TITLE, b.f42142b));
            this.f45737d = arguments.getBoolean("FOLDER_VS_TAB", false);
            checkBox.setChecked(!arguments.getBoolean("HIDE_APPS", true));
            int i11 = arguments.getInt("TABCOLOR", 0);
            if (i11 == 0) {
                i11 = 262914;
            }
            fancyPrefColorView.L(i11);
        } else {
            this.f45734a = null;
            z11 = true;
        }
        if (!this.f45737d) {
            z11 = false;
        }
        if (this.f45736c != -1 && !this.f45735b.a()) {
            checkBox.setVisibility(8);
        }
        if (!z11) {
            spinner.setVisibility(8);
        }
        getActivity();
        g gVar = new g(this, this.f45737d);
        spinner.setAdapter((SpinnerAdapter) gVar);
        spinner.setSelection(0);
        spinner.setOnItemSelectedListener(new c(this, gVar, textView, checkBox));
        n0 n0Var = ((f) gVar.f91712b.get(0)).f91709c;
        ((TextView) viewGroup.findViewById(2131427870)).setText(this.f45736c != -1 ? 2132017771 : this.f45735b == n0.f91731c ? 2132017243 : 2132017235);
        View viewFindViewById = viewGroup.findViewById(2131428347);
        g2 g2Var = a3.f51435a;
        boolean z12 = g2Var.f51552h;
        j0 j0Var = n0.f91729a;
        viewFindViewById.setVisibility((!z12 || this.f45736c == -1 || this.f45735b == j0Var) ? 8 : 0);
        viewFindViewById.setOnClickListener(new n(this, 12));
        o oVar = new o(contextThemeWrapper);
        d9.f fVar = (d9.f) oVar.f89493b;
        fVar.g(viewGroup, false);
        fVar.i(2132017603);
        oVar.f89494c = null;
        int i12 = this.f45736c != -1 ? 2132019022 : 2132017229;
        d dVar = new d(this, textView, checkBox, fancyPrefColorView, spinner, gVar);
        fVar.o(i12);
        oVar.f89495d = dVar;
        if (this.f45736c != -1 && g2Var.f51552h) {
            int i13 = this.f45735b == j0Var ? 2132017985 : 2132019484;
            n80.b bVar = new n80.b(this, 4);
            fVar.k(i13);
            oVar.f89496e = bVar;
        }
        j jVarY = oVar.Y();
        this.f45738e = jVarY;
        jVarY.setCanceledOnTouchOutside(true);
        return this.f45738e;
    }
}
