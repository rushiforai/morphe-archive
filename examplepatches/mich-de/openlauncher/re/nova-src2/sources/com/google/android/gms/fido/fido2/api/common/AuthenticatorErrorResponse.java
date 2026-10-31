package com.google.android.gms.fido.fido2.api.common;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.fido.fido2.api.common.ErrorCode;
import fl.l;
import java.util.Arrays;
import mh.b;
import mh.c;
import sg.w;

/* loaded from: classes3.dex */
public class AuthenticatorErrorResponse extends AuthenticatorResponse {
    public static final Parcelable.Creator<AuthenticatorErrorResponse> CREATOR = new cf.a(19);

    /* renamed from: f, reason: collision with root package name */
    public final ErrorCode f31916f;

    /* renamed from: g, reason: collision with root package name */
    public final String f31917g;

    /* renamed from: h, reason: collision with root package name */
    public final int f31918h;

    public AuthenticatorErrorResponse(int i5, String str, int i11) {
        try {
            this.f31916f = ErrorCode.a(i5);
            this.f31917g = str;
            this.f31918h = i11;
        } catch (ErrorCode.UnsupportedErrorCodeException e3) {
            throw new IllegalArgumentException(e3);
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof AuthenticatorErrorResponse)) {
            return false;
        }
        AuthenticatorErrorResponse authenticatorErrorResponse = (AuthenticatorErrorResponse) obj;
        return w.k(this.f31916f, authenticatorErrorResponse.f31916f) && w.k(this.f31917g, authenticatorErrorResponse.f31917g) && w.k(Integer.valueOf(this.f31918h), Integer.valueOf(authenticatorErrorResponse.f31918h));
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f31916f, this.f31917g, Integer.valueOf(this.f31918h)});
    }

    public final String toString() {
        c cVar = new c(getClass().getSimpleName(), 0);
        String strValueOf = String.valueOf(this.f31916f.f31931a);
        b bVar = new b(29, (byte) 0);
        ((l) cVar.f76325d).f55375c = bVar;
        cVar.f76325d = bVar;
        bVar.f55374b = strValueOf;
        bVar.f55376d = "errorCode";
        String str = this.f31917g;
        if (str != null) {
            cVar.O(str, "errorMessage");
        }
        return cVar.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = fg.a.j0(parcel, 20293);
        int i11 = this.f31916f.f31931a;
        fg.a.i0(parcel, 2, 4);
        parcel.writeInt(i11);
        fg.a.c0(parcel, 3, this.f31917g);
        fg.a.i0(parcel, 4, 4);
        parcel.writeInt(this.f31918h);
        fg.a.k0(parcel, iJ0);
    }
}
