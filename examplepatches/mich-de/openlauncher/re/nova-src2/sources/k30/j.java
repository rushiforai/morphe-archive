package k30;

import android.view.View;
import android.widget.Button;
import h6.o0;

/* loaded from: classes4.dex */
public final class j implements h6.z {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ w20.l f70993a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g.o f70994b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Button f70995c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ View f70996d;

    public j(w20.l lVar, g.o oVar, Button button, View view) {
        this.f70993a = lVar;
        this.f70994b = oVar;
        this.f70995c = button;
        this.f70996d = view;
    }

    @o0(h6.s.ON_RESUME)
    public final void refresh() {
        r.c(this.f70993a, this.f70994b, this.f70995c, this.f70996d);
    }
}
