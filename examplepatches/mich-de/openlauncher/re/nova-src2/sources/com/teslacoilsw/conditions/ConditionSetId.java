package com.teslacoilsw.conditions;

import aa.d;
import android.os.Parcel;
import android.os.Parcelable;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import jx.h;
import kotlin.Metadata;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0000\b\u0087@\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004\u0088\u0001\u0005\u0092\u0001\u00020\u0006¨\u0006\u0007"}, d2 = {"Lcom/teslacoilsw/conditions/ConditionSetId;", "Landroid/os/Parcelable;", k.O, "jx/g", "jx/h", "value", b.f42142b, "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@JvmInline
@Serializable
/* loaded from: classes.dex */
public final class ConditionSetId implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final String f45529a;

    @NotNull
    public static final h Companion = new h();

    @NotNull
    public static final Parcelable.Creator<ConditionSetId> CREATOR = new d(10);

    public /* synthetic */ ConditionSetId(String str) {
        this.f45529a = str;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof ConditionSetId) {
            return Intrinsics.b(this.f45529a, ((ConditionSetId) obj).f45529a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f45529a.hashCode();
    }

    /* renamed from: toString, reason: from getter */
    public final String getF45529a() {
        return this.f45529a;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f45529a);
    }
}
