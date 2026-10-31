package com.teslacoilsw.launcher.preferences.fragments;

import ab.e0;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import b10.f1;
import bh.g;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefColorView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCornerRadiusSeekBarView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSpinnerView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefTransparencySeekBarView;
import com.teslacoilsw.launcher.preferences.widget.MatchWrapLinearLayout;
import e10.s2;
import e10.y2;
import e10.z;
import fz.h;
import fz.i;
import fz.p;
import fz.q;
import h10.d;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import l7.a;
import sy.c;
import v9.m0;
import v9.w;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fragments/SettingsDockBackground;", "Lcom/teslacoilsw/launcher/preferences/fragments/NovaSettingsFragment;", "Lv9/w;", "<init>", "()V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class SettingsDockBackground extends NovaSettingsFragment<w> {

    /* renamed from: h, reason: collision with root package name */
    public final int f46081h = 2132017754;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f46082i = true;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f46083j = true;

    /* renamed from: k, reason: collision with root package name */
    public d f46084k;

    /* renamed from: l, reason: collision with root package name */
    public c f46085l;

    @Override // com.teslacoilsw.launcher.preferences.fragments.NovaSettingsFragmentBase
    /* renamed from: n, reason: from getter */
    public final boolean getF46083j() {
        return this.f46083j;
    }

    @Override // androidx.fragment.app.h0
    public final void onPause() {
        c cVar;
        super.onPause();
        w wVar = (w) this.f46052e;
        if (wVar == null) {
            return;
        }
        s2 s2VarB = y2.f51877a.B();
        if (wVar.f92551d.isChecked()) {
            cVar = this.f46085l;
            if (cVar == null) {
                Intrinsics.m("newShape");
                throw null;
            }
        } else {
            c.Companion.getClass();
            cVar = c.f87826h;
        }
        s2VarB.i(cVar);
        NovaSettingsFragmentBase.w(this);
    }

    @Override // androidx.fragment.app.h0
    public final void onViewCreated(View view, Bundle bundle) {
        z();
    }

    @Override // com.teslacoilsw.launcher.preferences.fragments.NovaSettingsFragmentBase
    /* renamed from: r, reason: from getter */
    public final boolean getF46082i() {
        return this.f46082i;
    }

    @Override // com.teslacoilsw.launcher.preferences.fragments.NovaSettingsFragmentBase
    /* renamed from: t, reason: from getter */
    public final int getF46081h() {
        return this.f46081h;
    }

    @Override // com.teslacoilsw.launcher.preferences.fragments.NovaSettingsFragment
    public final a x(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewInflate = layoutInflater.inflate(2131624355, viewGroup, false);
        int i5 = 2131427698;
        FancyPrefColorView fancyPrefColorView = (FancyPrefColorView) e0.x(2131427698, viewInflate);
        if (fancyPrefColorView != null) {
            i5 = 2131427816;
            if (((MatchWrapLinearLayout) e0.x(2131427816, viewInflate)) != null) {
                i5 = 2131427912;
                FancyPrefCheckableView fancyPrefCheckableView = (FancyPrefCheckableView) e0.x(2131427912, viewInflate);
                if (fancyPrefCheckableView != null) {
                    i5 = 2131427956;
                    FancyPrefCheckableView fancyPrefCheckableView2 = (FancyPrefCheckableView) e0.x(2131427956, viewInflate);
                    if (fancyPrefCheckableView2 != null) {
                        i5 = 2131428301;
                        if (((LinearLayout) e0.x(2131428301, viewInflate)) != null) {
                            i5 = 2131428303;
                            if (((ScrollView) e0.x(2131428303, viewInflate)) != null) {
                                i5 = 2131428512;
                                FancyPrefCheckableView fancyPrefCheckableView3 = (FancyPrefCheckableView) e0.x(2131428512, viewInflate);
                                if (fancyPrefCheckableView3 != null) {
                                    i5 = 2131428623;
                                    View viewX = e0.x(2131428623, viewInflate);
                                    if (viewX != null) {
                                        i5 = 2131428626;
                                        if (((LinearLayout) e0.x(2131428626, viewInflate)) != null) {
                                            i5 = 2131428638;
                                            if (((TextView) e0.x(2131428638, viewInflate)) != null) {
                                                SettingsDockBackgroundLayout settingsDockBackgroundLayout = (SettingsDockBackgroundLayout) viewInflate;
                                                i5 = 2131428823;
                                                View viewX2 = e0.x(2131428823, viewInflate);
                                                if (viewX2 != null) {
                                                    m0 m0VarA = m0.a(viewX2);
                                                    FancyPrefCornerRadiusSeekBarView fancyPrefCornerRadiusSeekBarView = m0VarA.f92472f;
                                                    FancyPrefCornerRadiusSeekBarView fancyPrefCornerRadiusSeekBarView2 = m0VarA.f92469c;
                                                    FancyPrefCornerRadiusSeekBarView fancyPrefCornerRadiusSeekBarView3 = m0VarA.f92476j;
                                                    FancyPrefCornerRadiusSeekBarView fancyPrefCornerRadiusSeekBarView4 = m0VarA.f92474h;
                                                    FancyPrefSpinnerView fancyPrefSpinnerView = m0VarA.f92473g;
                                                    FancyPrefSpinnerView fancyPrefSpinnerView2 = m0VarA.f92470d;
                                                    FancyPrefSpinnerView fancyPrefSpinnerView3 = m0VarA.f92477k;
                                                    FancyPrefSpinnerView fancyPrefSpinnerView4 = m0VarA.f92475i;
                                                    FancyPrefTransparencySeekBarView fancyPrefTransparencySeekBarView = (FancyPrefTransparencySeekBarView) e0.x(2131429076, viewInflate);
                                                    if (fancyPrefTransparencySeekBarView != null) {
                                                        w wVar = new w(settingsDockBackgroundLayout, fancyPrefColorView, fancyPrefCheckableView, fancyPrefCheckableView2, fancyPrefCheckableView3, viewX, m0VarA, fancyPrefTransparencySeekBarView);
                                                        c cVar = (c) y2.f51877a.B().l();
                                                        settingsDockBackgroundLayout.f46086a = this;
                                                        fancyPrefCheckableView2.setChecked(cVar.f87828c);
                                                        fancyPrefCheckableView.E(Boolean.valueOf(cVar.f87831f));
                                                        fancyPrefCheckableView3.setChecked(cVar.f87830e != 0);
                                                        p pVar = cVar.f87829d;
                                                        i iVar = pVar.f56328d;
                                                        i iVar2 = pVar.f56331g;
                                                        i iVar3 = pVar.f56330f;
                                                        i iVar4 = pVar.f56329e;
                                                        fancyPrefSpinnerView4.E(iVar.f56260b.name());
                                                        fancyPrefSpinnerView3.E(iVar4.f56260b.name());
                                                        fancyPrefSpinnerView2.E(iVar3.f56260b.name());
                                                        fancyPrefSpinnerView.E(iVar2.f56260b.name());
                                                        fancyPrefCornerRadiusSeekBarView4.E(Integer.valueOf(pVar.f56328d.f56259a));
                                                        fancyPrefCornerRadiusSeekBarView3.E(Integer.valueOf(iVar4.f56259a));
                                                        fancyPrefCornerRadiusSeekBarView2.E(Integer.valueOf(iVar3.f56259a));
                                                        fancyPrefCornerRadiusSeekBarView.E(Integer.valueOf(iVar2.f56259a));
                                                        f1 f1Var = new f1(26, wVar, this);
                                                        p.Companion.getClass();
                                                        d dVar = new d(p.f56327k);
                                                        this.f46084k = dVar;
                                                        viewX.setBackground(dVar);
                                                        fancyPrefCheckableView.C = f1Var;
                                                        fancyPrefCornerRadiusSeekBarView4.C = f1Var;
                                                        fancyPrefCornerRadiusSeekBarView3.C = f1Var;
                                                        fancyPrefCornerRadiusSeekBarView2.C = f1Var;
                                                        fancyPrefCornerRadiusSeekBarView.C = f1Var;
                                                        fancyPrefSpinnerView4.C = f1Var;
                                                        fancyPrefSpinnerView3.C = f1Var;
                                                        fancyPrefSpinnerView2.C = f1Var;
                                                        fancyPrefSpinnerView.C = f1Var;
                                                        fancyPrefCheckableView3.C = f1Var;
                                                        fancyPrefColorView.C = f1Var;
                                                        fancyPrefTransparencySeekBarView.C = f1Var;
                                                        return wVar;
                                                    }
                                                    i5 = 2131429076;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(i5)));
    }

    public final void z() {
        w wVar = (w) this.f46052e;
        if (wVar == null) {
            return;
        }
        View view = wVar.f92553f;
        SettingsDockBackgroundLayout settingsDockBackgroundLayout = wVar.f92548a;
        FancyPrefCheckableView fancyPrefCheckableView = wVar.f92552e;
        FancyPrefColorView fancyPrefColorView = wVar.f92549b;
        FancyPrefTransparencySeekBarView fancyPrefTransparencySeekBarView = wVar.f92555h;
        FancyPrefCheckableView fancyPrefCheckableView2 = wVar.f92550c;
        m0 m0Var = wVar.f92554g;
        fancyPrefTransparencySeekBarView.Q(((Number) fancyPrefColorView.r()).intValue());
        int iIntValue = ((Number) m0Var.f92469c.r()).intValue();
        String str = (String) m0Var.f92470d.r();
        q qVar = q.f56341c;
        i iVar = new i(iIntValue, (q) z.a(str, qVar));
        i iVar2 = new i(((Number) m0Var.f92472f.r()).intValue(), (q) z.a((String) m0Var.f92473g.r(), qVar));
        if (((Boolean) fancyPrefCheckableView2.r()).booleanValue()) {
            h hVar = i.Companion;
            hVar.getClass();
            iVar2 = i.f56258e;
            hVar.getClass();
            iVar = iVar2;
        }
        p pVar = new p(new i(((Number) m0Var.f92474h.r()).intValue(), (q) z.a((String) m0Var.f92475i.r(), qVar)), new i(((Number) m0Var.f92476j.r()).intValue(), (q) z.a((String) m0Var.f92477k.r(), qVar)), iVar, iVar2);
        this.f46085l = new c(wVar.f92551d.isChecked(), pVar, fancyPrefCheckableView.isChecked() ? 8 : 0, fancyPrefCheckableView2.isChecked());
        d dVar = this.f46084k;
        if (dVar == null) {
            Intrinsics.m("dockPreview");
            throw null;
        }
        dVar.f58854a = pVar;
        settingsDockBackgroundLayout.f46089d = !((Boolean) fancyPrefCheckableView2.r()).booleanValue();
        settingsDockBackgroundLayout.a();
        d dVar2 = this.f46084k;
        if (dVar2 == null) {
            Intrinsics.m("dockPreview");
            throw null;
        }
        dVar2.d(((Boolean) fancyPrefCheckableView2.r()).booleanValue() ? settingsDockBackgroundLayout.f46087b.bottom : 0);
        view.invalidate();
        m0Var.f92468b.setVisibility(!fancyPrefCheckableView2.isChecked() ? 0 : 8);
        m0Var.f92471e.setVisibility(!fancyPrefCheckableView2.isChecked() ? 0 : 8);
        if (fancyPrefCheckableView.isChecked()) {
            d dVar3 = this.f46084k;
            if (dVar3 == null) {
                Intrinsics.m("dockPreview");
                throw null;
            }
            dVar3.f58857d = g.M(requireContext(), 8);
        } else {
            d dVar4 = this.f46084k;
            if (dVar4 == null) {
                Intrinsics.m("dockPreview");
                throw null;
            }
            dVar4.f58857d = 0;
        }
        d dVar5 = this.f46084k;
        if (dVar5 == null) {
            Intrinsics.m("dockPreview");
            throw null;
        }
        dVar5.a(r4.a.n(((Number) fancyPrefColorView.r()).intValue(), 255 - ((Number) fancyPrefTransparencySeekBarView.r()).intValue()));
        view.invalidate();
    }
}
