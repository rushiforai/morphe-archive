package c3;

import android.content.Context;
import android.view.accessibility.AccessibilityManager;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class h implements g {

    /* renamed from: a, reason: collision with root package name */
    public final AccessibilityManager f19304a;

    public h(Context context) {
        Object systemService = context.getSystemService("accessibility");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.view.accessibility.AccessibilityManager");
        this.f19304a = (AccessibilityManager) systemService;
    }
}
