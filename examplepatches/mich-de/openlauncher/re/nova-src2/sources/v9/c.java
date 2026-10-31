package v9;

import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.Spinner;
import android.widget.TextView;
import com.android.launcher3.views.DoubleShadowBubbleTextView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefCheckableView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefColorView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefDisabledSegmentSeekBarView;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPreviewLayout;

/* loaded from: classes2.dex */
public final class c implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final FancyPreviewLayout f92279a;

    /* renamed from: b, reason: collision with root package name */
    public final ImageView f92280b;

    /* renamed from: c, reason: collision with root package name */
    public final TextView f92281c;

    /* renamed from: d, reason: collision with root package name */
    public final FancyPrefDisabledSegmentSeekBarView f92282d;

    /* renamed from: e, reason: collision with root package name */
    public final FancyPrefCheckableView f92283e;

    /* renamed from: f, reason: collision with root package name */
    public final FancyPrefColorView f92284f;

    /* renamed from: g, reason: collision with root package name */
    public final Spinner f92285g;

    /* renamed from: h, reason: collision with root package name */
    public final TextView f92286h;

    /* renamed from: i, reason: collision with root package name */
    public final FancyPrefCheckableView f92287i;

    /* renamed from: j, reason: collision with root package name */
    public final FancyPrefCheckableView f92288j;

    /* renamed from: k, reason: collision with root package name */
    public final TextView f92289k;

    /* renamed from: l, reason: collision with root package name */
    public final SeekBar f92290l;

    /* renamed from: m, reason: collision with root package name */
    public final FancyPrefCheckableView f92291m;
    public final DoubleShadowBubbleTextView n;
    public final LinearLayout o;

    /* renamed from: p, reason: collision with root package name */
    public final View f92292p;

    public c(FancyPreviewLayout fancyPreviewLayout, ImageView imageView, TextView textView, FancyPrefDisabledSegmentSeekBarView fancyPrefDisabledSegmentSeekBarView, FancyPrefCheckableView fancyPrefCheckableView, FancyPrefColorView fancyPrefColorView, Spinner spinner, TextView textView2, FancyPrefCheckableView fancyPrefCheckableView2, FancyPrefCheckableView fancyPrefCheckableView3, TextView textView3, SeekBar seekBar, FancyPrefCheckableView fancyPrefCheckableView4, DoubleShadowBubbleTextView doubleShadowBubbleTextView, LinearLayout linearLayout, View view) {
        this.f92279a = fancyPreviewLayout;
        this.f92280b = imageView;
        this.f92281c = textView;
        this.f92282d = fancyPrefDisabledSegmentSeekBarView;
        this.f92283e = fancyPrefCheckableView;
        this.f92284f = fancyPrefColorView;
        this.f92285g = spinner;
        this.f92286h = textView2;
        this.f92287i = fancyPrefCheckableView2;
        this.f92288j = fancyPrefCheckableView3;
        this.f92289k = textView3;
        this.f92290l = seekBar;
        this.f92291m = fancyPrefCheckableView4;
        this.n = doubleShadowBubbleTextView;
        this.o = linearLayout;
        this.f92292p = view;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92279a;
    }
}
