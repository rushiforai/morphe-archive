package com.google.android.gms.fido.fido2.api.common;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.measurement.ub;
import java.util.Arrays;
import mh.k0;
import mh.x0;
import sg.w;
import xg.b;

/* loaded from: classes3.dex */
public class PublicKeyCredential extends AbstractSafeParcelable {
    public static final Parcelable.Creator<PublicKeyCredential> CREATOR = new cf.a(10);

    /* renamed from: f, reason: collision with root package name */
    public final String f31932f;

    /* renamed from: g, reason: collision with root package name */
    public final String f31933g;

    /* renamed from: h, reason: collision with root package name */
    public final k0 f31934h;

    /* renamed from: i, reason: collision with root package name */
    public final AuthenticatorAttestationResponse f31935i;

    /* renamed from: j, reason: collision with root package name */
    public final AuthenticatorAssertionResponse f31936j;

    /* renamed from: k, reason: collision with root package name */
    public final AuthenticatorErrorResponse f31937k;

    /* renamed from: l, reason: collision with root package name */
    public final AuthenticationExtensionsClientOutputs f31938l;

    /* renamed from: m, reason: collision with root package name */
    public final String f31939m;

    public PublicKeyCredential(String str, String str2, byte[] bArr, AuthenticatorAttestationResponse authenticatorAttestationResponse, AuthenticatorAssertionResponse authenticatorAssertionResponse, AuthenticatorErrorResponse authenticatorErrorResponse, AuthenticationExtensionsClientOutputs authenticationExtensionsClientOutputs, String str3) {
        k0 k0VarK = bArr == null ? null : k0.k(bArr.length, bArr);
        boolean z11 = false;
        w.a("Must provide a response object.", (authenticatorAttestationResponse != null && authenticatorAssertionResponse == null && authenticatorErrorResponse == null) || (authenticatorAttestationResponse == null && authenticatorAssertionResponse != null && authenticatorErrorResponse == null) || (authenticatorAttestationResponse == null && authenticatorAssertionResponse == null && authenticatorErrorResponse != null));
        if (authenticatorErrorResponse != null || (str != null && k0VarK != null)) {
            z11 = true;
        }
        w.a("Must provide id and rawId if not an error response.", z11);
        this.f31932f = str;
        this.f31933g = str2;
        this.f31934h = k0VarK;
        this.f31935i = authenticatorAttestationResponse;
        this.f31936j = authenticatorAssertionResponse;
        this.f31937k = authenticatorErrorResponse;
        this.f31938l = authenticationExtensionsClientOutputs;
        this.f31939m = str3;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof PublicKeyCredential)) {
            return false;
        }
        PublicKeyCredential publicKeyCredential = (PublicKeyCredential) obj;
        return w.k(this.f31932f, publicKeyCredential.f31932f) && w.k(this.f31933g, publicKeyCredential.f31933g) && w.k(this.f31934h, publicKeyCredential.f31934h) && w.k(this.f31935i, publicKeyCredential.f31935i) && w.k(this.f31936j, publicKeyCredential.f31936j) && w.k(this.f31937k, publicKeyCredential.f31937k) && w.k(this.f31938l, publicKeyCredential.f31938l) && w.k(this.f31939m, publicKeyCredential.f31939m);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f31932f, this.f31933g, this.f31934h, this.f31936j, this.f31935i, this.f31937k, this.f31938l, this.f31939m});
    }

    public final String toString() {
        k0 k0Var = this.f31934h;
        String strC = b.c(k0Var == null ? null : k0Var.l());
        String strValueOf = String.valueOf(this.f31935i);
        String strValueOf2 = String.valueOf(this.f31936j);
        String strValueOf3 = String.valueOf(this.f31937k);
        String strValueOf4 = String.valueOf(this.f31938l);
        StringBuilder sbW = c0.w("PublicKeyCredential{\n id='", this.f31932f, "', \n type='", this.f31933g, "', \n rawId=");
        c0.D(sbW, strC, ", \n registerResponse=", strValueOf, ", \n signResponse=");
        c0.D(sbW, strValueOf2, ", \n errorResponse=", strValueOf3, ", \n extensionsClientOutputs=");
        return c0.s(sbW, strValueOf4, ", \n authenticatorAttachment='", this.f31939m, "'}");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        x0.f76399a.getClass();
        if (mh.a.f76313b == null) {
            mh.a.f76313b = new ub();
        }
        synchronized (mh.a.f76312a) {
        }
        throw new IllegalStateException("Must call PhenotypeContext.setContext() first");
    }
}
