package a4;

import android.app.role.RoleManager;
import android.graphics.RenderNode;
import android.view.WindowInsets;

/* loaded from: classes2.dex */
public abstract /* synthetic */ class a {
    public static /* bridge */ /* synthetic */ RoleManager b(Object obj) {
        return (RoleManager) obj;
    }

    public static /* synthetic */ RenderNode e() {
        return new RenderNode("BlurEffect");
    }

    public static /* synthetic */ WindowInsets.Builder f(WindowInsets windowInsets) {
        return new WindowInsets.Builder(windowInsets);
    }

    public static /* bridge */ /* synthetic */ Class i() {
        return RoleManager.class;
    }

    public static /* synthetic */ RenderNode w() {
        return new RenderNode("AndroidEdgeEffectOverscrollEffect");
    }
}
