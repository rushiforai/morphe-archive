package c3;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.os.Build;
import kotlin.Unit;

/* loaded from: classes.dex */
public final class i implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final j f19319a;

    public i(j jVar) {
        this.f19319a = jVar;
    }

    public final Unit a(t1 t1Var) {
        ClipboardManager clipboardManager = this.f19319a.f19327a;
        if (t1Var != null) {
            clipboardManager.setPrimaryClip(t1Var.a());
        } else if (Build.VERSION.SDK_INT >= 28) {
            ex.i.q(clipboardManager);
        } else {
            clipboardManager.setPrimaryClip(ClipData.newPlainText(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
        }
        return Unit.f71706a;
    }
}
