package com.stripe.android.stripe3ds2.transaction;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.stripe3ds2.transactions.ChallengeRequestData;
import java.io.Serializable;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"com/stripe/android/stripe3ds2/transaction/ChallengeRequestExecutor$Config", "Ljava/io/Serializable;", "Landroid/os/Parcelable;", "Keys", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ChallengeRequestExecutor$Config implements Serializable, Parcelable {

    @NotNull
    public static final Parcelable.Creator<ChallengeRequestExecutor$Config> CREATOR = new h();

    /* renamed from: a, reason: collision with root package name */
    public final uv.e f45075a;

    /* renamed from: b, reason: collision with root package name */
    public final String f45076b;

    /* renamed from: c, reason: collision with root package name */
    public final ChallengeRequestData f45077c;

    /* renamed from: d, reason: collision with root package name */
    public final String f45078d;

    /* renamed from: e, reason: collision with root package name */
    public final Keys f45079e;

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/stripe3ds2/transaction/ChallengeRequestExecutor$Config$Keys;", "Ljava/io/Serializable;", "Landroid/os/Parcelable;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Keys implements Serializable, Parcelable {

        @NotNull
        public static final Parcelable.Creator<Keys> CREATOR = new i();

        /* renamed from: a, reason: collision with root package name */
        public final byte[] f45080a;

        /* renamed from: b, reason: collision with root package name */
        public final byte[] f45081b;

        public Keys(byte[] sdkPrivateKeyEncoded, byte[] acsPublicKeyEncoded) {
            Intrinsics.g(sdkPrivateKeyEncoded, "sdkPrivateKeyEncoded");
            Intrinsics.g(acsPublicKeyEncoded, "acsPublicKeyEncoded");
            this.f45080a = sdkPrivateKeyEncoded;
            this.f45081b = acsPublicKeyEncoded;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj instanceof Keys) {
                Keys keys = (Keys) obj;
                if (Arrays.equals(this.f45080a, keys.f45080a) && Arrays.equals(this.f45081b, keys.f45081b)) {
                    return true;
                }
            }
            return false;
        }

        public final int hashCode() {
            return p50.i.q(this.f45080a, this.f45081b);
        }

        public final String toString() {
            return c0.n("Keys(sdkPrivateKeyEncoded=", Arrays.toString(this.f45080a), ", acsPublicKeyEncoded=", Arrays.toString(this.f45081b), ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeByteArray(this.f45080a);
            dest.writeByteArray(this.f45081b);
        }
    }

    public ChallengeRequestExecutor$Config(uv.e messageTransformer, String sdkReferenceId, ChallengeRequestData creqData, String acsUrl, Keys keys) {
        Intrinsics.g(messageTransformer, "messageTransformer");
        Intrinsics.g(sdkReferenceId, "sdkReferenceId");
        Intrinsics.g(creqData, "creqData");
        Intrinsics.g(acsUrl, "acsUrl");
        Intrinsics.g(keys, "keys");
        this.f45075a = messageTransformer;
        this.f45076b = sdkReferenceId;
        this.f45077c = creqData;
        this.f45078d = acsUrl;
        this.f45079e = keys;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ChallengeRequestExecutor$Config)) {
            return false;
        }
        ChallengeRequestExecutor$Config challengeRequestExecutor$Config = (ChallengeRequestExecutor$Config) obj;
        return Intrinsics.b(this.f45075a, challengeRequestExecutor$Config.f45075a) && Intrinsics.b(this.f45076b, challengeRequestExecutor$Config.f45076b) && Intrinsics.b(this.f45077c, challengeRequestExecutor$Config.f45077c) && Intrinsics.b(this.f45078d, challengeRequestExecutor$Config.f45078d) && Intrinsics.b(this.f45079e, challengeRequestExecutor$Config.f45079e);
    }

    public final int hashCode() {
        return this.f45079e.hashCode() + c0.e((this.f45077c.hashCode() + c0.e(this.f45075a.hashCode() * 31, 31, this.f45076b)) * 31, 31, this.f45078d);
    }

    public final String toString() {
        return "Config(messageTransformer=" + this.f45075a + ", sdkReferenceId=" + this.f45076b + ", creqData=" + this.f45077c + ", acsUrl=" + this.f45078d + ", keys=" + this.f45079e + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeSerializable(this.f45075a);
        dest.writeString(this.f45076b);
        this.f45077c.writeToParcel(dest, i5);
        dest.writeString(this.f45078d);
        this.f45079e.writeToParcel(dest, i5);
    }
}
