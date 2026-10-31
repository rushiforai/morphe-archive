package com.google.android.libraries.places.api.net;

/* loaded from: classes3.dex */
final class zzx extends IsOpenResponse {
    private final Boolean zza;

    public zzx(Boolean bool) {
        this.zza = bool;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof IsOpenResponse)) {
            return false;
        }
        IsOpenResponse isOpenResponse = (IsOpenResponse) obj;
        Boolean bool = this.zza;
        return bool == null ? isOpenResponse.isOpen() == null : bool.equals(isOpenResponse.isOpen());
    }

    public final int hashCode() {
        Boolean bool = this.zza;
        return (bool == null ? 0 : bool.hashCode()) ^ 1000003;
    }

    @Override // com.google.android.libraries.places.api.net.IsOpenResponse
    public final Boolean isOpen() {
        return this.zza;
    }

    public final String toString() {
        return "IsOpenResponse{isOpen=" + this.zza + "}";
    }
}
