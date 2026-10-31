package io.branch.search.internal;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0006J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\u0019\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u000eHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u001c\u0010\u0005\u001a\u0004\u0018\u00010\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\t\u0010\b\"\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\b¨\u0006\u0014"}, d2 = {"Lio/branch/search/internal/RequestMetadata;", "Landroid/os/Parcelable;", "callerId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "sessionId", "requestId", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getCallerId", "()Ljava/lang/String;", "getRequestId", "setRequestId", "(Ljava/lang/String;)V", "getSessionId", "describeContents", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "writeToParcel", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "parcel", "Landroid/os/Parcel;", "flags", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class RequestMetadata implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<RequestMetadata> CREATOR = new a();

    @NotNull
    private final String callerId;

    @Nullable
    private String requestId;

    @NotNull
    private final String sessionId;

    public static final class a implements Parcelable.Creator<RequestMetadata> {
        @Override // android.os.Parcelable.Creator
        public final RequestMetadata createFromParcel(Parcel parcel) {
            Intrinsics.g(parcel, "parcel");
            return new RequestMetadata(parcel.readString(), parcel.readString(), parcel.readString());
        }

        @Override // android.os.Parcelable.Creator
        public final RequestMetadata[] newArray(int i5) {
            return new RequestMetadata[i5];
        }
    }

    public RequestMetadata(@NotNull String callerId, @NotNull String sessionId, @Nullable String str) {
        Intrinsics.g(callerId, "callerId");
        Intrinsics.g(sessionId, "sessionId");
        this.callerId = callerId;
        this.sessionId = sessionId;
        this.requestId = str;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @NotNull
    public final String getCallerId() {
        return this.callerId;
    }

    @Nullable
    public final String getRequestId() {
        return this.requestId;
    }

    @NotNull
    public final String getSessionId() {
        return this.sessionId;
    }

    public final void setRequestId(@Nullable String str) {
        this.requestId = str;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(@NotNull Parcel parcel, int flags) {
        Intrinsics.g(parcel, "out");
        parcel.writeString(this.callerId);
        parcel.writeString(this.sessionId);
        parcel.writeString(this.requestId);
    }

    public /* synthetic */ RequestMetadata(String str, String str2, String str3, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, (i5 & 4) != 0 ? null : str3);
    }
}
