package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import com.instabridge.mobilesdk.internal.ui.screens.t;
import com.teslacoilsw.launcher.widget.GridPreviewView;
import com.teslacoilsw.launcher.widget.NumberPicker;
import e10.t0;
import f10.g;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefLandGridView;", "Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefGridView;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class FancyPrefLandGridView extends FancyPrefGridView {

    /* renamed from: e0, reason: collision with root package name */
    public static final /* synthetic */ int f46001e0 = 0;

    /* renamed from: d0, reason: collision with root package name */
    public t0 f46002d0;

    @JvmOverloads
    public FancyPrefLandGridView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefGridView, f10.d
    public final Function0 K(View view) {
        AtomicBoolean atomicBoolean;
        Object obj;
        super.K(view);
        NumberPicker numberPicker = (NumberPicker) view.findViewById(2131427712);
        NumberPicker numberPicker2 = (NumberPicker) view.findViewById(2131428722);
        View viewFindViewById = view.findViewById(2131428624);
        GridPreviewView gridPreviewView = (GridPreviewView) view.findViewById(2131428620);
        numberPicker2.p(((t0) r()).f51821a, false);
        numberPicker.p(((t0) r()).f51822b, false);
        int i5 = numberPicker2.f46442l;
        int i11 = numberPicker.f46442l;
        gridPreviewView.f46419a = i5;
        gridPreviewView.f46420b = i11;
        gridPreviewView.invalidate();
        t0[] t0VarArr = new t0[2];
        t0VarArr[0] = r();
        t0 t0Var = this.f46002d0;
        if (t0Var == null) {
            Intrinsics.m("landValue");
            throw null;
        }
        t0VarArr[1] = t0Var;
        AtomicBoolean atomicBoolean2 = new AtomicBoolean(true);
        Spinner spinner = (Spinner) view.findViewById(2131428503);
        spinner.setVisibility(0);
        if (spinner.getAdapter() == null) {
            ArrayAdapter arrayAdapter = new ArrayAdapter(getContext(), 17367048, new String[]{view.getResources().getString(2132019134), view.getResources().getString(2132018092)});
            arrayAdapter.setDropDownViewResource(17367049);
            spinner.setAdapter((SpinnerAdapter) arrayAdapter);
            spinner.setSelection(getContext().getResources().getConfiguration().orientation == 2 ? 1 : 0);
            g gVar = new g(this, viewFindViewById, gridPreviewView, atomicBoolean2, t0VarArr, numberPicker2, numberPicker);
            atomicBoolean = atomicBoolean2;
            obj = t0VarArr;
            numberPicker2 = numberPicker2;
            spinner.setOnItemSelectedListener(gVar);
        } else {
            atomicBoolean = atomicBoolean2;
            obj = t0VarArr;
        }
        return new t(atomicBoolean, obj, numberPicker2, numberPicker, this, 5);
    }
}
