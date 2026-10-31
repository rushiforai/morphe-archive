package ya;

import android.content.Context;
import com.android.systemui.plugins.Plugin;
import com.android.systemui.plugins.PluginListener;
import com.android.systemui.plugins.ResourceProvider;

/* loaded from: classes.dex */
public final class h implements ResourceProvider, PluginListener {

    /* renamed from: c, reason: collision with root package name */
    public static final x7.c f97142c = new x7.c(new c(1));

    /* renamed from: a, reason: collision with root package name */
    public final Context f97143a;

    /* renamed from: b, reason: collision with root package name */
    public ResourceProvider f97144b;

    public h(Context context) {
        this.f97143a = context;
        ((wa.a) wa.a.f94126a.h(context)).getClass();
    }

    @Override // com.android.systemui.plugins.ResourceProvider
    public final int getColor(int i5) {
        return this.f97143a.getResources().getColor(i5, null);
    }

    @Override // com.android.systemui.plugins.ResourceProvider
    public final float getDimension(int i5) {
        return this.f97143a.getResources().getDimension(i5);
    }

    @Override // com.android.systemui.plugins.ResourceProvider
    public final float getFloat(int i5) {
        return this.f97143a.getResources().getFloat(i5);
    }

    @Override // com.android.systemui.plugins.ResourceProvider
    public final float getFraction(int i5) {
        return this.f97143a.getResources().getFraction(i5, 1, 1);
    }

    @Override // com.android.systemui.plugins.ResourceProvider
    public final int getInt(int i5) {
        return this.f97143a.getResources().getInteger(i5);
    }

    @Override // com.android.systemui.plugins.PluginListener
    public final void onPluginConnected(Plugin plugin, Context context) {
        this.f97144b = (ResourceProvider) plugin;
    }

    @Override // com.android.systemui.plugins.PluginListener
    public final void onPluginDisconnected(Plugin plugin) {
        this.f97144b = null;
    }
}
