package u10;

import android.net.Uri;
import e10.z2;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class c0 extends e0 {

    @NotNull
    public static final b0 Companion = new b0();

    public c0() {
        super("GamesCard:Games");
    }

    @Override // u10.e0
    public final String a() {
        return "Games";
    }

    @Override // u10.e0
    public final Uri b() {
        return r10.o0.d(z2.v(2131231566, "com.teslacoilsw.launcher"), r10.n0.f85193c);
    }

    @Override // u10.e0
    public final Function0 c() {
        return new sx.d(17);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!c0.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        Intrinsics.e(obj, "null cannot be cast to non-null type com.teslacoilsw.launcher.search.hero.GamesHeroCard");
        return Intrinsics.b(this.f90373a, ((c0) obj).f90373a);
    }

    public final int hashCode() {
        return this.f90373a.hashCode();
    }
}
