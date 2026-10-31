package v9;

import android.view.View;
import android.widget.LinearLayout;
import android.widget.Space;
import com.teslacoilsw.launcher.desktoppreview.DesktopPreviewPanelView;
import com.teslacoilsw.launcher.widget.PressedAlphaCheckedTextView;

/* loaded from: classes.dex */
public final class l implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final DesktopPreviewPanelView f92438a;

    /* renamed from: b, reason: collision with root package name */
    public final PressedAlphaCheckedTextView f92439b;

    /* renamed from: c, reason: collision with root package name */
    public final LinearLayout f92440c;

    /* renamed from: d, reason: collision with root package name */
    public final PressedAlphaCheckedTextView f92441d;

    /* renamed from: e, reason: collision with root package name */
    public final Space f92442e;

    /* renamed from: f, reason: collision with root package name */
    public final PressedAlphaCheckedTextView f92443f;

    public l(DesktopPreviewPanelView desktopPreviewPanelView, PressedAlphaCheckedTextView pressedAlphaCheckedTextView, LinearLayout linearLayout, PressedAlphaCheckedTextView pressedAlphaCheckedTextView2, Space space, PressedAlphaCheckedTextView pressedAlphaCheckedTextView3) {
        this.f92438a = desktopPreviewPanelView;
        this.f92439b = pressedAlphaCheckedTextView;
        this.f92440c = linearLayout;
        this.f92441d = pressedAlphaCheckedTextView2;
        this.f92442e = space;
        this.f92443f = pressedAlphaCheckedTextView3;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92438a;
    }
}
