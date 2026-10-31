package p6;

import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class b1 {

    /* renamed from: b, reason: collision with root package name */
    public static final LinkedHashMap f82141b = new LinkedHashMap();

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f82142a = new LinkedHashMap();

    public final void a(z0 navigator) {
        Intrinsics.g(navigator, "navigator");
        String strG = a1.g(navigator.getClass());
        if (strG.length() <= 0) {
            throw new IllegalArgumentException("navigator name cannot be an empty string");
        }
        LinkedHashMap linkedHashMap = this.f82142a;
        z0 z0Var = (z0) linkedHashMap.get(strG);
        if (Intrinsics.b(z0Var, navigator)) {
            return;
        }
        if (z0Var != null && z0Var.f82313b) {
            throw new IllegalStateException(("Navigator " + navigator + " is replacing an already attached " + z0Var).toString());
        }
        if (!navigator.f82313b) {
            return;
        }
        throw new IllegalStateException(("Navigator " + navigator + " is already attached to another NavController").toString());
    }

    public final z0 b(String name) {
        Intrinsics.g(name, "name");
        if (name.length() <= 0) {
            throw new IllegalArgumentException("navigator name cannot be an empty string");
        }
        z0 z0Var = (z0) this.f82142a.get(name);
        if (z0Var != null) {
            return z0Var;
        }
        throw new IllegalStateException(b.c0.l("Could not find Navigator with name \"", name, "\". You must call NavController.addNavigator() for each navigation type."));
    }
}
