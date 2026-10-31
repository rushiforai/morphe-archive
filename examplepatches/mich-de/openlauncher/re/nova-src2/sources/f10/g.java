package f10;

import android.content.res.Resources;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefLandGridView;
import com.teslacoilsw.launcher.widget.GridPreviewView;
import com.teslacoilsw.launcher.widget.NumberPicker;
import e10.t0;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes4.dex */
public final class g implements AdapterView.OnItemSelectedListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ FancyPrefLandGridView f54179a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ View f54180b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ GridPreviewView f54181c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ AtomicBoolean f54182d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ t0[] f54183e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ NumberPicker f54184f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ NumberPicker f54185g;

    public g(FancyPrefLandGridView fancyPrefLandGridView, View view, GridPreviewView gridPreviewView, AtomicBoolean atomicBoolean, t0[] t0VarArr, NumberPicker numberPicker, NumberPicker numberPicker2) {
        this.f54179a = fancyPrefLandGridView;
        this.f54180b = view;
        this.f54181c = gridPreviewView;
        this.f54182d = atomicBoolean;
        this.f54183e = t0VarArr;
        this.f54184f = numberPicker;
        this.f54185g = numberPicker2;
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public final void onItemSelected(AdapterView adapterView, View view, int i5, long j11) throws Resources.NotFoundException {
        FancyPrefLandGridView fancyPrefLandGridView = this.f54179a;
        int dimensionPixelSize = fancyPrefLandGridView.getContext().getResources().getDimensionPixelSize(i5 == 0 ? 2131165496 : 2131165495);
        int dimensionPixelSize2 = fancyPrefLandGridView.getContext().getResources().getDimensionPixelSize(i5 == 0 ? 2131165492 : 2131165494);
        View view2 = this.f54180b;
        ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
        if (layoutParams == null) {
            throw new NullPointerException("null cannot be cast to non-null type android.view.ViewGroup.LayoutParams");
        }
        layoutParams.width = dimensionPixelSize;
        layoutParams.height = dimensionPixelSize2;
        view2.setLayoutParams(layoutParams);
        GridPreviewView gridPreviewView = this.f54181c;
        ViewGroup.LayoutParams layoutParams2 = gridPreviewView.getLayoutParams();
        if (layoutParams2 == null) {
            throw new NullPointerException("null cannot be cast to non-null type android.view.ViewGroup.LayoutParams");
        }
        layoutParams2.width = dimensionPixelSize;
        layoutParams2.height = dimensionPixelSize2;
        gridPreviewView.setLayoutParams(layoutParams2);
        AtomicBoolean atomicBoolean = this.f54182d;
        boolean z11 = atomicBoolean.get();
        NumberPicker numberPicker = this.f54185g;
        NumberPicker numberPicker2 = this.f54184f;
        t0[] t0VarArr = this.f54183e;
        if (z11) {
            t0VarArr[0] = new t0(numberPicker2.f46442l, numberPicker.f46442l, false);
        } else {
            t0VarArr[1] = new t0(numberPicker2.f46442l, numberPicker.f46442l, false);
        }
        atomicBoolean.set(i5 == 0);
        if (atomicBoolean.get()) {
            numberPicker2.p(t0VarArr[0].f51821a, false);
            numberPicker.p(t0VarArr[0].f51822b, false);
        } else {
            numberPicker2.p(t0VarArr[1].f51821a, false);
            numberPicker.p(t0VarArr[1].f51822b, false);
        }
        int i11 = numberPicker2.f46442l;
        int i12 = numberPicker.f46442l;
        gridPreviewView.f46419a = i11;
        gridPreviewView.f46420b = i12;
        gridPreviewView.invalidate();
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public final void onNothingSelected(AdapterView adapterView) {
    }
}
