package e10;

import kotlinx.serialization.Serializable;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialDescriptorsKt;
import org.jetbrains.annotations.NotNull;

@Serializable(with = s0.class)
/* loaded from: classes.dex */
public final class t0 {

    @NotNull
    public static final s0 Companion = new s0();

    /* renamed from: d, reason: collision with root package name */
    public static final SerialDescriptor f51820d = SerialDescriptorsKt.PrimitiveSerialDescriptor("GridSize", PrimitiveKind.STRING.INSTANCE);

    /* renamed from: a, reason: collision with root package name */
    public final int f51821a;

    /* renamed from: b, reason: collision with root package name */
    public final int f51822b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f51823c;

    public /* synthetic */ t0(int i5, int i11) {
        this(i5, i11, false);
    }

    public final String a() {
        return this.f51821a + "x" + this.f51822b + (this.f51823c ? " subgrid" : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    public final String toString() {
        return b.c0.l("GridSize(", a(), ")");
    }

    public t0(int i5, int i11, boolean z11) {
        this.f51821a = i5;
        this.f51822b = i11;
        this.f51823c = z11;
    }
}
