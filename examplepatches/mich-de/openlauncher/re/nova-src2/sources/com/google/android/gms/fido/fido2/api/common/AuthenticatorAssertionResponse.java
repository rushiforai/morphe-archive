package com.google.android.gms.fido.fido2.api.common;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Arrays;
import mh.c;
import mh.c0;
import mh.e0;
import mh.k0;
import org.json.JSONException;
import org.json.JSONObject;
import sg.w;
import xg.b;

/* loaded from: classes3.dex */
public class AuthenticatorAssertionResponse extends AuthenticatorResponse {
    public static final Parcelable.Creator<AuthenticatorAssertionResponse> CREATOR = new cf.a(17);

    /* renamed from: f, reason: collision with root package name */
    public final k0 f31907f;

    /* renamed from: g, reason: collision with root package name */
    public final k0 f31908g;

    /* renamed from: h, reason: collision with root package name */
    public final k0 f31909h;

    /* renamed from: i, reason: collision with root package name */
    public final k0 f31910i;

    /* renamed from: j, reason: collision with root package name */
    public final k0 f31911j;

    public AuthenticatorAssertionResponse(byte[] bArr, byte[] bArr2, byte[] bArr3, byte[] bArr4, byte[] bArr5) {
        w.h(bArr);
        k0 k0VarK = k0.k(bArr.length, bArr);
        w.h(bArr2);
        k0 k0VarK2 = k0.k(bArr2.length, bArr2);
        w.h(bArr3);
        k0 k0VarK3 = k0.k(bArr3.length, bArr3);
        w.h(bArr4);
        k0 k0VarK4 = k0.k(bArr4.length, bArr4);
        k0 k0VarK5 = bArr5 == null ? null : k0.k(bArr5.length, bArr5);
        this.f31907f = k0VarK;
        this.f31908g = k0VarK2;
        this.f31909h = k0VarK3;
        this.f31910i = k0VarK4;
        this.f31911j = k0VarK5;
    }

    public final JSONObject d() throws JSONException {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("clientDataJSON", b.c(this.f31908g.l()));
            jSONObject.put("authenticatorData", b.c(this.f31909h.l()));
            jSONObject.put("signature", b.c(this.f31910i.l()));
            k0 k0Var = this.f31911j;
            if (k0Var == null) {
                return jSONObject;
            }
            jSONObject.put("userHandle", b.c(k0Var == null ? null : k0Var.l()));
            return jSONObject;
        } catch (JSONException e3) {
            throw new RuntimeException("Error encoding AuthenticatorAssertionResponse to JSON object", e3);
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof AuthenticatorAssertionResponse)) {
            return false;
        }
        AuthenticatorAssertionResponse authenticatorAssertionResponse = (AuthenticatorAssertionResponse) obj;
        return w.k(this.f31907f, authenticatorAssertionResponse.f31907f) && w.k(this.f31908g, authenticatorAssertionResponse.f31908g) && w.k(this.f31909h, authenticatorAssertionResponse.f31909h) && w.k(this.f31910i, authenticatorAssertionResponse.f31910i) && w.k(this.f31911j, authenticatorAssertionResponse.f31911j);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(Arrays.hashCode(new Object[]{this.f31907f})), Integer.valueOf(Arrays.hashCode(new Object[]{this.f31908g})), Integer.valueOf(Arrays.hashCode(new Object[]{this.f31909h})), Integer.valueOf(Arrays.hashCode(new Object[]{this.f31910i})), Integer.valueOf(Arrays.hashCode(new Object[]{this.f31911j}))});
    }

    public final String toString() {
        c cVar = new c(getClass().getSimpleName(), 0);
        c0 c0Var = e0.f76329d;
        byte[] bArrL = this.f31907f.l();
        cVar.O(c0Var.c(bArrL.length, bArrL), "keyHandle");
        byte[] bArrL2 = this.f31908g.l();
        cVar.O(c0Var.c(bArrL2.length, bArrL2), "clientDataJSON");
        byte[] bArrL3 = this.f31909h.l();
        cVar.O(c0Var.c(bArrL3.length, bArrL3), "authenticatorData");
        byte[] bArrL4 = this.f31910i.l();
        cVar.O(c0Var.c(bArrL4.length, bArrL4), "signature");
        k0 k0Var = this.f31911j;
        byte[] bArrL5 = k0Var == null ? null : k0Var.l();
        if (bArrL5 != null) {
            cVar.O(c0Var.c(bArrL5.length, bArrL5), "userHandle");
        }
        return cVar.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = fg.a.j0(parcel, 20293);
        fg.a.V(parcel, 2, this.f31907f.l());
        fg.a.V(parcel, 3, this.f31908g.l());
        fg.a.V(parcel, 4, this.f31909h.l());
        fg.a.V(parcel, 5, this.f31910i.l());
        k0 k0Var = this.f31911j;
        fg.a.V(parcel, 6, k0Var == null ? null : k0Var.l());
        fg.a.k0(parcel, iJ0);
    }
}
