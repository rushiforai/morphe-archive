package ya;

import android.content.ComponentName;

/* loaded from: classes.dex */
public interface v {

    /* renamed from: a, reason: collision with root package name */
    public static final ComponentName f97214a = new ComponentName(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);

    default boolean a(ga.e eVar) {
        if (eVar == null) {
            return false;
        }
        ComponentName componentNameI = eVar.i();
        if (componentNameI == null) {
            componentNameI = f97214a;
        }
        return b(eVar, componentNameI);
    }

    boolean b(ga.e eVar, ComponentName componentName);
}
