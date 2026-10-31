package v9;

import android.view.View;
import android.widget.RadioButton;
import com.android.launcher3.BubbleTextView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefColorView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefTransparencySeekBarView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPreviewLayout;
import com.teslacoilsw.launcher.widget.DumbRadioGrid;

/* loaded from: classes2.dex */
public final class a0 implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final FancyPreviewLayout f92245a;

    /* renamed from: b, reason: collision with root package name */
    public final FancyPrefCheckableView f92246b;

    /* renamed from: c, reason: collision with root package name */
    public final FancyPrefColorView f92247c;

    /* renamed from: d, reason: collision with root package name */
    public final FancyPrefCheckableView f92248d;

    /* renamed from: e, reason: collision with root package name */
    public final DumbRadioGrid f92249e;

    /* renamed from: f, reason: collision with root package name */
    public final BubbleTextView f92250f;

    /* renamed from: g, reason: collision with root package name */
    public final FancyPrefCheckableView f92251g;

    /* renamed from: h, reason: collision with root package name */
    public final RadioButton f92252h;

    /* renamed from: i, reason: collision with root package name */
    public final DumbRadioGrid f92253i;

    /* renamed from: j, reason: collision with root package name */
    public final RadioButton f92254j;

    /* renamed from: k, reason: collision with root package name */
    public final FancyPrefTransparencySeekBarView f92255k;

    public a0(FancyPreviewLayout fancyPreviewLayout, FancyPrefCheckableView fancyPrefCheckableView, FancyPrefColorView fancyPrefColorView, FancyPrefCheckableView fancyPrefCheckableView2, DumbRadioGrid dumbRadioGrid, BubbleTextView bubbleTextView, FancyPrefCheckableView fancyPrefCheckableView3, RadioButton radioButton, RadioButton radioButton2, RadioButton radioButton3, DumbRadioGrid dumbRadioGrid2, RadioButton radioButton4, RadioButton radioButton5, RadioButton radioButton6, RadioButton radioButton7, FancyPrefTransparencySeekBarView fancyPrefTransparencySeekBarView) {
        this.f92245a = fancyPreviewLayout;
        this.f92246b = fancyPrefCheckableView;
        this.f92247c = fancyPrefColorView;
        this.f92248d = fancyPrefCheckableView2;
        this.f92249e = dumbRadioGrid;
        this.f92250f = bubbleTextView;
        this.f92251g = fancyPrefCheckableView3;
        this.f92252h = radioButton;
        this.f92253i = dumbRadioGrid2;
        this.f92254j = radioButton4;
        this.f92255k = fancyPrefTransparencySeekBarView;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92245a;
    }
}
