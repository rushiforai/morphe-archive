package v9;

import android.view.View;
import android.widget.LinearLayout;
import androidx.recyclerview.widget.RecyclerView;
import com.teslacoilsw.launcher.widget.FontFamilyToolbar;

/* loaded from: classes2.dex */
public final class p implements l7.a {

    /* renamed from: a, reason: collision with root package name */
    public final LinearLayout f92501a;

    /* renamed from: b, reason: collision with root package name */
    public final RecyclerView f92502b;

    /* renamed from: c, reason: collision with root package name */
    public final FontFamilyToolbar f92503c;

    public p(LinearLayout linearLayout, RecyclerView recyclerView, FontFamilyToolbar fontFamilyToolbar) {
        this.f92501a = linearLayout;
        this.f92502b = recyclerView;
        this.f92503c = fontFamilyToolbar;
    }

    @Override // l7.a
    public final View getRoot() {
        return this.f92501a;
    }
}
