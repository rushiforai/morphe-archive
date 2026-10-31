package bn;

import com.amplitude.core.events.Identify;
import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class t0 {

    /* renamed from: a, reason: collision with root package name */
    public final h1 f18284a;

    /* renamed from: b, reason: collision with root package name */
    public final j1 f18285b;

    public t0(h1 timeProvider, j1 uuidGenerator) {
        Intrinsics.g(timeProvider, "timeProvider");
        Intrinsics.g(uuidGenerator, "uuidGenerator");
        this.f18284a = timeProvider;
        this.f18285b = uuidGenerator;
    }

    public final l0 a(l0 l0Var) {
        String str;
        String string = this.f18285b.a().toString();
        Intrinsics.f(string, "toString(...)");
        String lowerCase = r70.j.F0(string, Identify.UNSET_VALUE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false).toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        return new l0(lowerCase, (l0Var == null || (str = l0Var.f18243b) == null) ? lowerCase : str, l0Var != null ? l0Var.f18244c + 1 : 0, ((i1) this.f18284a).a().a());
    }
}
