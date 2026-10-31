package os;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;

/* loaded from: classes4.dex */
public final class f extends androidx.appcompat.view.d {

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Context f80774g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ boolean f80775h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Configuration f80776i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(Context context, boolean z11, Configuration configuration, Resources.Theme theme) {
        super(context);
        this.f80774g = context;
        this.f80775h = z11;
        this.f80776i = configuration;
        this.f13609b = theme;
    }

    @Override // androidx.appcompat.view.d, android.content.ContextWrapper, android.content.Context
    public final Resources getResources() {
        if (!this.f80775h) {
            return super.getResources();
        }
        Resources resources = this.f80774g.getResources();
        return new Resources(resources.getAssets(), resources.getDisplayMetrics(), this.f80776i);
    }
}
