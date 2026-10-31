package c3;

import android.content.ClipboardManager;
import android.content.Context;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class j implements v1 {

    /* renamed from: a, reason: collision with root package name */
    public final ClipboardManager f19327a;

    public j(Context context) {
        Object systemService = context.getSystemService("clipboard");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.content.ClipboardManager");
        this.f19327a = (ClipboardManager) systemService;
    }
}
