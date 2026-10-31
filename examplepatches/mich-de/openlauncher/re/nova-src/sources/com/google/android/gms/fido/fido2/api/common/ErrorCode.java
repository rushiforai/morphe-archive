package com.google.android.gms.fido.fido2.api.common;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import java.util.Locale;

/* loaded from: classes3.dex */
public enum ErrorCode implements Parcelable {
    NOT_SUPPORTED_ERR(9),
    INVALID_STATE_ERR(11),
    SECURITY_ERR(18),
    NETWORK_ERR(19),
    ABORT_ERR(20),
    TIMEOUT_ERR(23),
    ENCODING_ERR(27),
    UNKNOWN_ERR(28),
    CONSTRAINT_ERR(29),
    DATA_ERR(30),
    NOT_ALLOWED_ERR(35),
    ATTESTATION_NOT_PRIVATE_ERR(36);

    public static final Parcelable.Creator<ErrorCode> CREATOR = new a();

    /* renamed from: a, reason: collision with root package name */
    public final int f31931a;

    public static class UnsupportedErrorCodeException extends Exception {
    }

    ErrorCode(int i5) {
        this.f31931a = i5;
    }

    public static ErrorCode a(int i5) throws UnsupportedErrorCodeException {
        for (ErrorCode errorCode : values()) {
            if (i5 == errorCode.f31931a) {
                return errorCode;
            }
        }
        Locale locale = Locale.US;
        throw new UnsupportedErrorCodeException(c0.i(i5, "Error code ", " is not supported"));
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f31931a);
    }
}
