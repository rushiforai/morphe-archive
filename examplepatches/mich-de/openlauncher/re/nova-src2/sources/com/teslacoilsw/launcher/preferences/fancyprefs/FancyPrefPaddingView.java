package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.SeekBar;
import b10.u;
import b20.g;
import e10.s1;
import f10.d;
import f10.h;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import o9.t1;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;
import w20.e;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00030\u00020\u0001¨\u0006\u0004"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefPaddingView;", "Lf10/d;", "Lkotlin/Pair;", "Le10/s1;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class FancyPrefPaddingView extends d {
    public static final /* synthetic */ int W = 0;
    public s1 S;
    public s1 T;
    public final boolean U;
    public final boolean V;

    @JvmOverloads
    public FancyPrefPaddingView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        s1 s1Var = s1.NONE;
        this.S = s1Var;
        this.T = s1Var;
        if (this.L == 0) {
            this.L = 2131624323;
        }
        if (this.B == null) {
            C("%s ✕ %s");
        }
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80168s);
        try {
            int i5 = typedArrayObtainStyledAttributes.getInt(0, -1);
            this.U = i5 == 0 && ((t1) t1.f80131h.h(context)).f80136e.a(context).f77137d;
            this.V = i5 == 1;
            typedArrayObtainStyledAttributes.recycle();
        } catch (Throwable th2) {
            typedArrayObtainStyledAttributes.recycle();
            throw th2;
        }
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final void I() {
        CharSequence string;
        s1 s1Var = this.S;
        s1 s1Var2 = s1.AUTO;
        if (s1Var == s1Var2 || this.T == s1Var2) {
            string = getContext().getString(s1Var.f51805b);
        } else {
            string = this.B;
            if (string != null && k.L0(string, '%') && this.E != null) {
                string = G(string.toString(), (Pair) r());
            }
        }
        J(string);
    }

    @Override // f10.d
    public final Function0 K(View view) {
        View viewFindViewById = view.findViewById(2131428157);
        Intrinsics.d(viewFindViewById);
        SeekBar seekBar = (SeekBar) viewFindViewById;
        View viewFindViewById2 = view.findViewById(2131429150);
        Intrinsics.d(viewFindViewById2);
        SeekBar seekBar2 = (SeekBar) viewFindViewById2;
        PaddingPreviewView paddingPreviewView = (PaddingPreviewView) view.findViewById(2131428620);
        FancyPrefCheckableView fancyPrefCheckableView = (FancyPrefCheckableView) view.findViewById(2131427520);
        boolean z11 = this.V;
        boolean z12 = this.U;
        if ((z12 || z11) && fancyPrefCheckableView == null) {
            throw new IllegalArgumentException("Required value was null.");
        }
        if (z11) {
            paddingPreviewView.getLayoutParams().height = getContext().getResources().getDimensionPixelSize(2131165493);
        }
        boolean z13 = true;
        seekBar.setProgress(this.S.ordinal() - 1);
        seekBar2.setProgress(this.T.ordinal() - 1);
        h hVar = new h(paddingPreviewView, seekBar, e.k(4), seekBar2);
        seekBar.setProgress(Math.max(this.S.ordinal() - 1, 0));
        seekBar2.setProgress(Math.max(this.T.ordinal() - 1, 0));
        hVar.onProgressChanged(seekBar, 0, true);
        seekBar.setOnSeekBarChangeListener(hVar);
        seekBar2.setOnSeekBarChangeListener(hVar);
        if (fancyPrefCheckableView != null) {
            fancyPrefCheckableView.C = new g(seekBar, fancyPrefCheckableView, this, seekBar2);
        }
        if (z12 || z11) {
            Intrinsics.d(fancyPrefCheckableView);
            fancyPrefCheckableView.setVisibility(0);
            s1 s1Var = this.S;
            s1 s1Var2 = s1.AUTO;
            if (s1Var != s1Var2 && (!z12 || this.T != s1Var2)) {
                z13 = false;
            }
            fancyPrefCheckableView.setChecked(z13);
        } else {
            if (fancyPrefCheckableView != null) {
                fancyPrefCheckableView.setVisibility(8);
            }
            if (fancyPrefCheckableView != null) {
                fancyPrefCheckableView.setChecked(false);
            }
        }
        return new u(this, fancyPrefCheckableView, seekBar2, seekBar, 9);
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    /* renamed from: M, reason: merged with bridge method [inline-methods] */
    public final String G(String str, Pair pair) {
        StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
        return String.format(str, Arrays.copyOf(new Object[]{getContext().getString(((s1) pair.f71683a).f51805b), getContext().getString(((s1) pair.f71684b).f51805b)}, 2));
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final void t(Object obj) {
        Pair pair = (Pair) obj;
        super.t(pair);
        if (!this.V) {
            Object obj2 = pair.f71683a;
            s1 s1Var = s1.AUTO;
            if (obj2 == s1Var || pair.f71684b == s1Var) {
                if (this.U) {
                    this.S = s1Var;
                    this.T = s1Var;
                    return;
                } else {
                    s1 s1Var2 = s1.NONE;
                    E(new Pair(s1Var2, s1Var2));
                    return;
                }
            }
        }
        this.S = (s1) pair.f71683a;
        this.T = (s1) pair.f71684b;
    }
}
