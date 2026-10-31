package com.stripe.android.ui.core.elements;

import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.x;
import cw.c;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\n\u0018\u00002\u00020\u0001J\u0013\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00000\u0002¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/OTPSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", "Lkotlinx/serialization/KSerializer;", "serializer", "()Lkotlinx/serialization/KSerializer;", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class OTPSpec extends FormItemSpec {

    @NotNull
    public static final OTPSpec INSTANCE = new OTPSpec();

    @NotNull
    public static final Parcelable.Creator<OTPSpec> CREATOR = new c(20);

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ Object f45326a = LazyKt.b(LazyThreadSafetyMode.f71680b, new x(29));

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof OTPSpec);
    }

    public final int hashCode() {
        return -1061058889;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, kotlin.Lazy] */
    @NotNull
    public final KSerializer<OTPSpec> serializer() {
        return (KSerializer) f45326a.getValue();
    }

    public final String toString() {
        return "OTPSpec";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(1);
    }
}
