package com.google.android.gms.fido.fido2.api.common;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.util.Arrays;
import org.json.JSONException;
import org.json.JSONObject;
import sg.w;

/* loaded from: classes3.dex */
public class AuthenticationExtensionsClientOutputs extends AbstractSafeParcelable {
    public static final Parcelable.Creator<AuthenticationExtensionsClientOutputs> CREATOR = new cf.a(13);

    /* renamed from: f, reason: collision with root package name */
    public final UvmEntries f31901f;

    /* renamed from: g, reason: collision with root package name */
    public final zzf f31902g;

    /* renamed from: h, reason: collision with root package name */
    public final AuthenticationExtensionsCredPropsOutputs f31903h;

    /* renamed from: i, reason: collision with root package name */
    public final zzh f31904i;

    /* renamed from: j, reason: collision with root package name */
    public final String f31905j;

    public AuthenticationExtensionsClientOutputs(UvmEntries uvmEntries, zzf zzfVar, AuthenticationExtensionsCredPropsOutputs authenticationExtensionsCredPropsOutputs, zzh zzhVar, String str) {
        this.f31901f = uvmEntries;
        this.f31902g = zzfVar;
        this.f31903h = authenticationExtensionsCredPropsOutputs;
        this.f31904i = zzhVar;
        this.f31905j = str;
    }

    public final JSONObject d() throws JSONException {
        try {
            JSONObject jSONObject = new JSONObject();
            AuthenticationExtensionsCredPropsOutputs authenticationExtensionsCredPropsOutputs = this.f31903h;
            if (authenticationExtensionsCredPropsOutputs != null) {
                try {
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("rk", authenticationExtensionsCredPropsOutputs.f31906f);
                    jSONObject.put("credProps", jSONObject2);
                } catch (JSONException e3) {
                    throw new RuntimeException("Error encoding AuthenticationExtensionsCredPropsOutputs to JSON object", e3);
                }
            }
            UvmEntries uvmEntries = this.f31901f;
            if (uvmEntries != null) {
                jSONObject.put("uvm", uvmEntries.d());
            }
            zzh zzhVar = this.f31904i;
            if (zzhVar != null) {
                jSONObject.put("prf", zzhVar.d());
            }
            String str = this.f31905j;
            if (str != null) {
                jSONObject.put("txAuthSimple", str);
            }
            return jSONObject;
        } catch (JSONException e11) {
            throw new RuntimeException("Error encoding AuthenticationExtensionsClientOutputs to JSON object", e11);
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof AuthenticationExtensionsClientOutputs)) {
            return false;
        }
        AuthenticationExtensionsClientOutputs authenticationExtensionsClientOutputs = (AuthenticationExtensionsClientOutputs) obj;
        return w.k(this.f31901f, authenticationExtensionsClientOutputs.f31901f) && w.k(this.f31902g, authenticationExtensionsClientOutputs.f31902g) && w.k(this.f31903h, authenticationExtensionsClientOutputs.f31903h) && w.k(this.f31904i, authenticationExtensionsClientOutputs.f31904i) && w.k(this.f31905j, authenticationExtensionsClientOutputs.f31905j);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f31901f, this.f31902g, this.f31903h, this.f31904i, this.f31905j});
    }

    public final String toString() {
        return c0.l("AuthenticationExtensionsClientOutputs{", d().toString(), "}");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = fg.a.j0(parcel, 20293);
        fg.a.b0(parcel, 1, this.f31901f, i5);
        fg.a.b0(parcel, 2, this.f31902g, i5);
        fg.a.b0(parcel, 3, this.f31903h, i5);
        fg.a.b0(parcel, 4, this.f31904i, i5);
        fg.a.c0(parcel, 5, this.f31905j);
        fg.a.k0(parcel, iJ0);
    }
}
