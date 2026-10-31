package u10;

import android.net.Uri;
import e10.z2;
import kotlin.jvm.functions.Function0;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class h0 extends e0 {

    @NotNull
    public static final g0 Companion = new g0();

    /* renamed from: c, reason: collision with root package name */
    public final boolean f90382c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ h0(int i5, String str, boolean z11) {
        super(str, 0);
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, f0.f90377a.getDescriptor());
        }
        this.f90382c = z11;
    }

    @Override // u10.e0
    public final String a() {
        return this.f90382c ? "Screenshots" : "Photos";
    }

    @Override // u10.e0
    public final Uri b() {
        return r10.o0.d(z2.v(2131232042, "com.teslacoilsw.launcher"), r10.n0.f85193c);
    }

    @Override // u10.e0
    public final Function0 c() {
        return new sx.d(18);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof h0) && this.f90382c == ((h0) obj).f90382c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f90382c);
    }

    public final String toString() {
        return a80.m.i("ImageGalleryCard(screenshots=", ")", this.f90382c);
    }

    public h0(boolean z11) {
        super("ImageGalleryCard:".concat(z11 ? "Screenshot" : "Photo"));
        this.f90382c = z11;
    }
}
