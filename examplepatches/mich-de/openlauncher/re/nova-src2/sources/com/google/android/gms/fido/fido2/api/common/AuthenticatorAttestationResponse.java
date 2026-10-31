package com.google.android.gms.fido.fido2.api.common;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;
import com.google.android.gms.internal.fido.zzhj;
import com.google.android.gms.internal.fido.zzho;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import mh.c;
import mh.c0;
import mh.e0;
import mh.j0;
import mh.k0;
import mh.o;
import mh.o0;
import mh.p0;
import mh.q0;
import mh.r0;
import mh.s0;
import mh.u0;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import sg.w;
import xg.b;

/* loaded from: classes3.dex */
public class AuthenticatorAttestationResponse extends AuthenticatorResponse {
    public static final Parcelable.Creator<AuthenticatorAttestationResponse> CREATOR = new cf.a(18);

    /* renamed from: f, reason: collision with root package name */
    public final k0 f31912f;

    /* renamed from: g, reason: collision with root package name */
    public final k0 f31913g;

    /* renamed from: h, reason: collision with root package name */
    public final k0 f31914h;

    /* renamed from: i, reason: collision with root package name */
    public final String[] f31915i;

    public AuthenticatorAttestationResponse(byte[] bArr, byte[] bArr2, byte[] bArr3, String[] strArr) {
        w.h(bArr);
        k0 k0VarK = k0.k(bArr.length, bArr);
        w.h(bArr2);
        k0 k0VarK2 = k0.k(bArr2.length, bArr2);
        w.h(bArr3);
        k0 k0VarK3 = k0.k(bArr3.length, bArr3);
        this.f31912f = k0VarK;
        this.f31913g = k0VarK2;
        this.f31914h = k0VarK3;
        w.h(strArr);
        this.f31915i = strArr;
    }

    /* JADX WARN: Removed duplicated region for block: B:49:0x0145 A[Catch: JSONException -> 0x0021, zzho -> 0x01a9, TRY_LEAVE, TryCatch #7 {zzho -> 0x01a9, blocks: (B:41:0x0111, B:47:0x0134, B:49:0x0145, B:54:0x015b, B:57:0x0177, B:59:0x018c, B:61:0x0191, B:64:0x01ac, B:65:0x01b1, B:66:0x01b2, B:67:0x01b9, B:72:0x01c6, B:74:0x01d3, B:76:0x01e0, B:77:0x01f5, B:78:0x01fa, B:79:0x01fb, B:80:0x0200, B:86:0x0222, B:87:0x0227), top: B:127:0x0111, outer: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0221  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final JSONObject d() throws JSONException {
        s0 s0Var;
        String[] strArr = this.f31915i;
        try {
            JSONObject jSONObject = new JSONObject();
            k0 k0Var = this.f31913g;
            if (k0Var != null) {
                jSONObject.put("clientDataJSON", b.c(k0Var.l()));
            }
            k0 k0Var2 = this.f31914h;
            if (k0Var2 != null) {
                jSONObject.put("attestationObject", b.c(k0Var2.l()));
            }
            JSONArray jSONArray = new JSONArray();
            for (int i5 = 0; i5 < strArr.length; i5++) {
                if (strArr[i5].equals("cable")) {
                    jSONArray.put(i5, "hybrid");
                } else {
                    jSONArray.put(i5, strArr[i5]);
                }
            }
            jSONObject.put("transports", jSONArray);
            try {
                try {
                    s0 s0Var2 = (s0) ((q0) s0.d(k0Var2.l()).b(q0.class)).f76373b.get(new r0("authData"));
                    if (s0Var2 == null) {
                        throw new IllegalArgumentException("attestation object missing authData");
                    }
                    k0 k0Var3 = ((o0) s0Var2.b(o0.class)).f76366a;
                    byte[] bArr = k0Var3.f76353b;
                    ByteBuffer byteBufferAsReadOnlyBuffer = ByteBuffer.wrap(bArr, 0, k0Var3.f()).asReadOnlyBuffer();
                    try {
                        byteBufferAsReadOnlyBuffer.position(byteBufferAsReadOnlyBuffer.position() + 32);
                        if ((byteBufferAsReadOnlyBuffer.get() & 64) == 0) {
                            throw new IllegalArgumentException("authData does not include credential data");
                        }
                        byteBufferAsReadOnlyBuffer.position(byteBufferAsReadOnlyBuffer.position() + 4);
                        byteBufferAsReadOnlyBuffer.position(byteBufferAsReadOnlyBuffer.position() + 16);
                        byteBufferAsReadOnlyBuffer.position(byteBufferAsReadOnlyBuffer.position() + byteBufferAsReadOnlyBuffer.getShort());
                        try {
                            try {
                                int iPosition = byteBufferAsReadOnlyBuffer.position();
                                int iJ = k0.j(iPosition, bArr.length, k0Var3.f());
                                u0 u0Var = new u0((iJ == 0 ? k0.f76351c : new j0(bArr, iPosition, iJ)).h());
                                try {
                                    o oVar = ((q0) mh.a.k(u0Var).b(q0.class)).f76373b;
                                    s0 s0Var3 = (s0) oVar.get(new p0(3L));
                                    s0 s0Var4 = (s0) oVar.get(new p0(1L));
                                    if (s0Var3 == null || s0Var4 == null) {
                                        throw new IllegalArgumentException("COSE key missing required fields");
                                    }
                                    try {
                                        long j11 = ((p0) s0Var3.b(p0.class)).f76369a;
                                        long j12 = ((p0) s0Var4.b(p0.class)).f76369a;
                                        byte[] bArrJ = null;
                                        if (j12 == 1) {
                                            s0Var = (s0) oVar.get(new p0(-1L));
                                            if (s0Var != null) {
                                                throw new IllegalArgumentException("COSE key missing required fields");
                                            }
                                            long j13 = ((p0) s0Var.b(p0.class)).f76369a;
                                            if (j12 == 2 && j13 == 1) {
                                                s0 s0Var5 = (s0) oVar.get(new p0(-2L));
                                                s0 s0Var6 = (s0) oVar.get(new p0(-3L));
                                                if (s0Var5 == null || s0Var6 == null) {
                                                    throw new IllegalArgumentException("COSE key missing required fields");
                                                }
                                                k0 k0Var4 = ((o0) s0Var5.b(o0.class)).f76366a;
                                                k0 k0Var5 = ((o0) s0Var6.b(o0.class)).f76366a;
                                                if (k0Var4.f76353b.length != 32 || k0Var5.f76353b.length != 32) {
                                                    throw new IllegalArgumentException("COSE coordinates are the wrong size");
                                                }
                                                bArrJ = mh.a.j(Base64.decode("MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE", 0), k0Var4.l(), k0Var5.l());
                                            } else if (j12 == 1 && j13 == 6) {
                                                s0 s0Var7 = (s0) oVar.get(new p0(-2L));
                                                if (s0Var7 == null) {
                                                    throw new IllegalArgumentException("COSE key missing required fields");
                                                }
                                                k0 k0Var6 = ((o0) s0Var7.b(o0.class)).f76366a;
                                                if (k0Var6.f76353b.length != 32) {
                                                    throw new IllegalArgumentException("COSE coordinates are the wrong size");
                                                }
                                                bArrJ = mh.a.j(Base64.decode("MCowBQYDK2VwAyEA", 0), k0Var6.l());
                                            }
                                        } else if (j12 == 2) {
                                            j12 = 2;
                                            s0Var = (s0) oVar.get(new p0(-1L));
                                            if (s0Var != null) {
                                            }
                                        }
                                        byte[] bArr2 = bArrJ;
                                        jSONObject.put("authenticatorData", b.c(k0Var3.l()));
                                        jSONObject.put("publicKeyAlgorithm", j11);
                                        if (bArr2 != null) {
                                            jSONObject.put("publicKey", Base64.encodeToString(bArr2, 11));
                                        }
                                        return jSONObject;
                                    } catch (zzho e3) {
                                        throw new IllegalArgumentException("COSE key ill-formed", e3);
                                    }
                                } finally {
                                    try {
                                        u0Var.close();
                                    } catch (IOException unused) {
                                    }
                                }
                            } catch (zzhj e11) {
                                e = e11;
                                throw new IllegalArgumentException("failed to parse COSE key", e);
                            }
                        } catch (zzho e12) {
                            e = e12;
                            throw new IllegalArgumentException("failed to parse COSE key", e);
                        }
                    } catch (IllegalArgumentException e13) {
                        throw new IllegalArgumentException("ill-formed authenticator data", e13);
                    }
                } catch (zzho e14) {
                    throw new IllegalArgumentException("authData value has wrong type", e14);
                }
            } catch (zzhj e15) {
                e = e15;
                throw new IllegalArgumentException("failed to parse attestation object", e);
            } catch (zzho e16) {
                e = e16;
                throw new IllegalArgumentException("failed to parse attestation object", e);
            }
        } catch (JSONException e17) {
            throw new RuntimeException("Error encoding AuthenticatorAttestationResponse to JSON object", e17);
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof AuthenticatorAttestationResponse)) {
            return false;
        }
        AuthenticatorAttestationResponse authenticatorAttestationResponse = (AuthenticatorAttestationResponse) obj;
        return w.k(this.f31912f, authenticatorAttestationResponse.f31912f) && w.k(this.f31913g, authenticatorAttestationResponse.f31913g) && w.k(this.f31914h, authenticatorAttestationResponse.f31914h);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(Arrays.hashCode(new Object[]{this.f31912f})), Integer.valueOf(Arrays.hashCode(new Object[]{this.f31913g})), Integer.valueOf(Arrays.hashCode(new Object[]{this.f31914h}))});
    }

    public final String toString() {
        c cVar = new c(getClass().getSimpleName(), 0);
        c0 c0Var = e0.f76329d;
        byte[] bArrL = this.f31912f.l();
        cVar.O(c0Var.c(bArrL.length, bArrL), "keyHandle");
        byte[] bArrL2 = this.f31913g.l();
        cVar.O(c0Var.c(bArrL2.length, bArrL2), "clientDataJSON");
        byte[] bArrL3 = this.f31914h.l();
        cVar.O(c0Var.c(bArrL3.length, bArrL3), "attestationObject");
        cVar.O(Arrays.toString(this.f31915i), "transports");
        return cVar.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = fg.a.j0(parcel, 20293);
        fg.a.V(parcel, 2, this.f31912f.l());
        fg.a.V(parcel, 3, this.f31913g.l());
        fg.a.V(parcel, 4, this.f31914h.l());
        fg.a.d0(parcel, 5, this.f31915i);
        fg.a.k0(parcel, iJ0);
    }
}
