package u10;

import android.net.Uri;
import e10.z2;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class w0 extends e0 {

    @NotNull
    public static final v0 Companion = new v0();

    @Override // u10.e0
    public final String a() {
        return "AccuWeather";
    }

    @Override // u10.e0
    public final Uri b() {
        return z2.v(2131231421, "com.teslacoilsw.launcher");
    }

    @Override // u10.e0
    public final Function0 c() {
        return new sx.d(20);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!w0.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        Intrinsics.e(obj, "null cannot be cast to non-null type com.teslacoilsw.launcher.search.hero.WeatherHeroCard");
        return Intrinsics.b(this.f90373a, ((w0) obj).f90373a);
    }

    public final int hashCode() {
        return this.f90373a.hashCode();
    }
}
