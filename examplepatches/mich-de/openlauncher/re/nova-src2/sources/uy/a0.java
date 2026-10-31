package uy;

import android.view.View;
import android.widget.FrameLayout;
import androidx.recyclerview.widget.s2;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView;

/* loaded from: classes4.dex */
public final class a0 extends s2 {

    /* renamed from: b, reason: collision with root package name */
    public final FancyPrefView f91679b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f91680c;

    /* renamed from: d, reason: collision with root package name */
    public final View f91681d;

    public a0(FancyPrefView fancyPrefView, boolean z11) {
        super(fancyPrefView);
        this.f91679b = fancyPrefView;
        this.f91680c = z11;
        FrameLayout frameLayout = fancyPrefView.f46013u;
        this.f91681d = frameLayout != null ? frameLayout.findViewById(2131428507) : null;
    }
}
