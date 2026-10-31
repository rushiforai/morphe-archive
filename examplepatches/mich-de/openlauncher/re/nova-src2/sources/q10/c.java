package q10;

import android.content.Context;
import android.os.Build;
import com.teslacoilsw.launcher.NovaAccessibilityService;
import kotlin.coroutines.Continuation;

/* loaded from: classes.dex */
public final class c extends l {
    @Override // q10.l
    public final boolean g(Context context) {
        return NovaAccessibilityService.a() != null;
    }

    @Override // q10.l
    public final boolean h() {
        return Build.VERSION.SDK_INT >= 28;
    }

    @Override // q10.l
    public final Object i(Context context, Continuation continuation) {
        NovaAccessibilityService novaAccessibilityServiceA = NovaAccessibilityService.a();
        return Boolean.valueOf(novaAccessibilityServiceA != null ? novaAccessibilityServiceA.performGlobalAction(8) : false);
    }

    @Override // q10.l
    public final void j(Context context) {
        new x20.f(context).c();
    }
}
