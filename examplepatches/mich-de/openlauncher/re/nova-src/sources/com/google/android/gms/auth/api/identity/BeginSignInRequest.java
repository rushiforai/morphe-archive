package com.google.android.gms.auth.api.identity;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Objects;
import sg.w;

@Deprecated
/* loaded from: classes3.dex */
public final class BeginSignInRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<BeginSignInRequest> CREATOR = new b();

    /* renamed from: f, reason: collision with root package name */
    public final PasswordRequestOptions f31698f;

    /* renamed from: g, reason: collision with root package name */
    public final GoogleIdTokenRequestOptions f31699g;

    /* renamed from: h, reason: collision with root package name */
    public final String f31700h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f31701i;

    /* renamed from: j, reason: collision with root package name */
    public final int f31702j;

    /* renamed from: k, reason: collision with root package name */
    public final PasskeysRequestOptions f31703k;

    /* renamed from: l, reason: collision with root package name */
    public final PasskeyJsonRequestOptions f31704l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f31705m;

    @Deprecated
    public static final class GoogleIdTokenRequestOptions extends AbstractSafeParcelable {
        public static final Parcelable.Creator<GoogleIdTokenRequestOptions> CREATOR = new c();

        /* renamed from: f, reason: collision with root package name */
        public final boolean f31706f;

        /* renamed from: g, reason: collision with root package name */
        public final String f31707g;

        /* renamed from: h, reason: collision with root package name */
        public final String f31708h;

        /* renamed from: i, reason: collision with root package name */
        public final boolean f31709i;

        /* renamed from: j, reason: collision with root package name */
        public final String f31710j;

        /* renamed from: k, reason: collision with root package name */
        public final ArrayList f31711k;

        /* renamed from: l, reason: collision with root package name */
        public final boolean f31712l;

        public GoogleIdTokenRequestOptions(boolean z11, String str, String str2, boolean z12, String str3, ArrayList arrayList, boolean z13) {
            boolean z14 = true;
            if (z12 && z13) {
                z14 = false;
            }
            w.a("filterByAuthorizedAccounts and requestVerifiedPhoneNumber must not both be true; the Verified Phone Number feature only works in sign-ups.", z14);
            this.f31706f = z11;
            if (z11) {
                w.i(str, "serverClientId must be provided if Google ID tokens are requested");
            }
            this.f31707g = str;
            this.f31708h = str2;
            this.f31709i = z12;
            ArrayList arrayList2 = null;
            if (arrayList != null && !arrayList.isEmpty()) {
                arrayList2 = new ArrayList(arrayList);
                Collections.sort(arrayList2);
            }
            this.f31711k = arrayList2;
            this.f31710j = str3;
            this.f31712l = z13;
        }

        public static a d() {
            a aVar = new a();
            aVar.f31728a = false;
            aVar.f31729b = null;
            aVar.f31730c = true;
            return aVar;
        }

        public final boolean equals(Object obj) {
            if (!(obj instanceof GoogleIdTokenRequestOptions)) {
                return false;
            }
            GoogleIdTokenRequestOptions googleIdTokenRequestOptions = (GoogleIdTokenRequestOptions) obj;
            return this.f31706f == googleIdTokenRequestOptions.f31706f && w.k(this.f31707g, googleIdTokenRequestOptions.f31707g) && w.k(this.f31708h, googleIdTokenRequestOptions.f31708h) && this.f31709i == googleIdTokenRequestOptions.f31709i && w.k(this.f31710j, googleIdTokenRequestOptions.f31710j) && w.k(this.f31711k, googleIdTokenRequestOptions.f31711k) && this.f31712l == googleIdTokenRequestOptions.f31712l;
        }

        public final int hashCode() {
            return Arrays.hashCode(new Object[]{Boolean.valueOf(this.f31706f), this.f31707g, this.f31708h, Boolean.valueOf(this.f31709i), this.f31710j, this.f31711k, Boolean.valueOf(this.f31712l)});
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            int iJ0 = fg.a.j0(parcel, 20293);
            fg.a.i0(parcel, 1, 4);
            parcel.writeInt(this.f31706f ? 1 : 0);
            fg.a.c0(parcel, 2, this.f31707g);
            fg.a.c0(parcel, 3, this.f31708h);
            fg.a.i0(parcel, 4, 4);
            parcel.writeInt(this.f31709i ? 1 : 0);
            fg.a.c0(parcel, 5, this.f31710j);
            fg.a.e0(parcel, this.f31711k, 6);
            fg.a.i0(parcel, 7, 4);
            parcel.writeInt(this.f31712l ? 1 : 0);
            fg.a.k0(parcel, iJ0);
        }
    }

    @Deprecated
    public static final class PasskeyJsonRequestOptions extends AbstractSafeParcelable {
        public static final Parcelable.Creator<PasskeyJsonRequestOptions> CREATOR = new d();

        /* renamed from: f, reason: collision with root package name */
        public final boolean f31713f;

        /* renamed from: g, reason: collision with root package name */
        public final String f31714g;

        public PasskeyJsonRequestOptions(boolean z11, String str) {
            if (z11) {
                w.h(str);
            }
            this.f31713f = z11;
            this.f31714g = str;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof PasskeyJsonRequestOptions)) {
                return false;
            }
            PasskeyJsonRequestOptions passkeyJsonRequestOptions = (PasskeyJsonRequestOptions) obj;
            return this.f31713f == passkeyJsonRequestOptions.f31713f && w.k(this.f31714g, passkeyJsonRequestOptions.f31714g);
        }

        public final int hashCode() {
            return Arrays.hashCode(new Object[]{Boolean.valueOf(this.f31713f), this.f31714g});
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            int iJ0 = fg.a.j0(parcel, 20293);
            fg.a.i0(parcel, 1, 4);
            parcel.writeInt(this.f31713f ? 1 : 0);
            fg.a.c0(parcel, 2, this.f31714g);
            fg.a.k0(parcel, iJ0);
        }
    }

    @Deprecated
    public static final class PasskeysRequestOptions extends AbstractSafeParcelable {
        public static final Parcelable.Creator<PasskeysRequestOptions> CREATOR = new e();

        /* renamed from: f, reason: collision with root package name */
        public final boolean f31715f;

        /* renamed from: g, reason: collision with root package name */
        public final byte[] f31716g;

        /* renamed from: h, reason: collision with root package name */
        public final String f31717h;

        public PasskeysRequestOptions(String str, boolean z11, byte[] bArr) {
            if (z11) {
                w.h(bArr);
                w.h(str);
            }
            this.f31715f = z11;
            this.f31716g = bArr;
            this.f31717h = str;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof PasskeysRequestOptions)) {
                return false;
            }
            PasskeysRequestOptions passkeysRequestOptions = (PasskeysRequestOptions) obj;
            return this.f31715f == passkeysRequestOptions.f31715f && Arrays.equals(this.f31716g, passkeysRequestOptions.f31716g) && Objects.equals(this.f31717h, passkeysRequestOptions.f31717h);
        }

        public final int hashCode() {
            return Arrays.hashCode(this.f31716g) + (Objects.hash(Boolean.valueOf(this.f31715f), this.f31717h) * 31);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            int iJ0 = fg.a.j0(parcel, 20293);
            fg.a.i0(parcel, 1, 4);
            parcel.writeInt(this.f31715f ? 1 : 0);
            fg.a.V(parcel, 2, this.f31716g);
            fg.a.c0(parcel, 3, this.f31717h);
            fg.a.k0(parcel, iJ0);
        }
    }

    @Deprecated
    public static final class PasswordRequestOptions extends AbstractSafeParcelable {
        public static final Parcelable.Creator<PasswordRequestOptions> CREATOR = new f();

        /* renamed from: f, reason: collision with root package name */
        public final boolean f31718f;

        public PasswordRequestOptions(boolean z11) {
            this.f31718f = z11;
        }

        public final boolean equals(Object obj) {
            return (obj instanceof PasswordRequestOptions) && this.f31718f == ((PasswordRequestOptions) obj).f31718f;
        }

        public final int hashCode() {
            return Arrays.hashCode(new Object[]{Boolean.valueOf(this.f31718f)});
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            int iJ0 = fg.a.j0(parcel, 20293);
            fg.a.i0(parcel, 1, 4);
            parcel.writeInt(this.f31718f ? 1 : 0);
            fg.a.k0(parcel, iJ0);
        }
    }

    public BeginSignInRequest(PasswordRequestOptions passwordRequestOptions, GoogleIdTokenRequestOptions googleIdTokenRequestOptions, String str, boolean z11, int i5, PasskeysRequestOptions passkeysRequestOptions, PasskeyJsonRequestOptions passkeyJsonRequestOptions, boolean z12) {
        w.h(passwordRequestOptions);
        this.f31698f = passwordRequestOptions;
        w.h(googleIdTokenRequestOptions);
        this.f31699g = googleIdTokenRequestOptions;
        this.f31700h = str;
        this.f31701i = z11;
        this.f31702j = i5;
        this.f31703k = passkeysRequestOptions == null ? new PasskeysRequestOptions(null, false, null) : passkeysRequestOptions;
        this.f31704l = passkeyJsonRequestOptions == null ? new PasskeyJsonRequestOptions(false, null) : passkeyJsonRequestOptions;
        this.f31705m = z12;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof BeginSignInRequest)) {
            return false;
        }
        BeginSignInRequest beginSignInRequest = (BeginSignInRequest) obj;
        return w.k(this.f31698f, beginSignInRequest.f31698f) && w.k(this.f31699g, beginSignInRequest.f31699g) && w.k(this.f31703k, beginSignInRequest.f31703k) && w.k(this.f31704l, beginSignInRequest.f31704l) && w.k(this.f31700h, beginSignInRequest.f31700h) && this.f31701i == beginSignInRequest.f31701i && this.f31702j == beginSignInRequest.f31702j && this.f31705m == beginSignInRequest.f31705m;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f31698f, this.f31699g, this.f31703k, this.f31704l, this.f31700h, Boolean.valueOf(this.f31701i), Integer.valueOf(this.f31702j), Boolean.valueOf(this.f31705m)});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        int iJ0 = fg.a.j0(parcel, 20293);
        fg.a.b0(parcel, 1, this.f31698f, i5);
        fg.a.b0(parcel, 2, this.f31699g, i5);
        fg.a.c0(parcel, 3, this.f31700h);
        fg.a.i0(parcel, 4, 4);
        parcel.writeInt(this.f31701i ? 1 : 0);
        fg.a.i0(parcel, 5, 4);
        parcel.writeInt(this.f31702j);
        fg.a.b0(parcel, 6, this.f31703k, i5);
        fg.a.b0(parcel, 7, this.f31704l, i5);
        fg.a.i0(parcel, 8, 4);
        parcel.writeInt(this.f31705m ? 1 : 0);
        fg.a.k0(parcel, iJ0);
    }
}
