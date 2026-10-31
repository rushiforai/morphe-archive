package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.PluginExceptionsKt;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0003\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/ConsumerSession;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "VerificationSession", "ft/f", "ft/g", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class ConsumerSession implements StripeModel {

    /* renamed from: a, reason: collision with root package name */
    public final String f43316a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43317b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43318c;

    /* renamed from: d, reason: collision with root package name */
    public final String f43319d;

    /* renamed from: e, reason: collision with root package name */
    public final String f43320e;

    /* renamed from: f, reason: collision with root package name */
    public final String f43321f;

    /* renamed from: g, reason: collision with root package name */
    public final List f43322g;

    /* renamed from: h, reason: collision with root package name */
    public final MobileFallbackWebviewParams f43323h;

    @NotNull
    public static final ft.g Companion = new ft.g();

    @NotNull
    public static final Parcelable.Creator<ConsumerSession> CREATOR = new h0();

    /* renamed from: i, reason: collision with root package name */
    public static final KSerializer[] f43315i = {null, null, null, null, null, null, new ArrayListSerializer(i0.f44039a), null};

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0004\u0003\u0004\u0005\u0006¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/model/ConsumerSession$VerificationSession;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "SessionType", "SessionState", "com/stripe/android/model/i0", "com/stripe/android/model/j0", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable
    public static final /* data */ class VerificationSession implements StripeModel {

        /* renamed from: a, reason: collision with root package name */
        public final SessionType f43325a;

        /* renamed from: b, reason: collision with root package name */
        public final SessionState f43326b;

        @NotNull
        public static final j0 Companion = new j0();

        @NotNull
        public static final Parcelable.Creator<VerificationSession> CREATOR = new k0();

        /* renamed from: c, reason: collision with root package name */
        public static final KSerializer[] f43324c = {EnumsKt.createSimpleEnumSerializer("com.stripe.android.model.ConsumerSession.VerificationSession.SessionType", SessionType.values()), EnumsKt.createSimpleEnumSerializer("com.stripe.android.model.ConsumerSession.VerificationSession.SessionState", SessionState.values())};

        /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
        /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
        @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0002\b\u0087\u0081\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/model/ConsumerSession$VerificationSession$SessionState;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "com/stripe/android/model/l0", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class SessionState implements Parcelable {

            @NotNull
            public static final Parcelable.Creator<SessionState> CREATOR;

            /* renamed from: b, reason: collision with root package name */
            public static final l0 f43327b;

            /* renamed from: c, reason: collision with root package name */
            public static final SessionState f43328c;

            /* renamed from: d, reason: collision with root package name */
            public static final SessionState f43329d;

            /* renamed from: e, reason: collision with root package name */
            public static final SessionState f43330e;

            /* renamed from: f, reason: collision with root package name */
            public static final /* synthetic */ SessionState[] f43331f;

            /* renamed from: g, reason: collision with root package name */
            public static final /* synthetic */ i70.a f43332g;

            /* renamed from: a, reason: collision with root package name */
            public final String f43333a;

            static {
                SessionState sessionState = new SessionState("Unknown", 0, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                f43328c = sessionState;
                SessionState sessionState2 = new SessionState("Started", 1, "started");
                f43329d = sessionState2;
                SessionState sessionState3 = new SessionState("Failed", 2, "failed");
                SessionState sessionState4 = new SessionState("Verified", 3, "verified");
                f43330e = sessionState4;
                SessionState[] sessionStateArr = {sessionState, sessionState2, sessionState3, sessionState4, new SessionState("Canceled", 4, "canceled"), new SessionState("Expired", 5, "expired")};
                f43331f = sessionStateArr;
                f43332g = EnumEntriesKt.a(sessionStateArr);
                f43327b = new l0();
                CREATOR = new m0();
            }

            public SessionState(String str, int i5, String str2) {
                this.f43333a = str2;
            }

            public static SessionState valueOf(String str) {
                return (SessionState) Enum.valueOf(SessionState.class, str);
            }

            public static SessionState[] values() {
                return (SessionState[]) f43331f.clone();
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(name());
            }
        }

        /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
        /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
        @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0002\b\u0087\u0081\u0002\u0018\u00002\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/model/ConsumerSession$VerificationSession$SessionType;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "com/stripe/android/model/n0", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class SessionType implements Parcelable {

            @NotNull
            public static final Parcelable.Creator<SessionType> CREATOR;

            /* renamed from: b, reason: collision with root package name */
            public static final n0 f43334b;

            /* renamed from: c, reason: collision with root package name */
            public static final SessionType f43335c;

            /* renamed from: d, reason: collision with root package name */
            public static final SessionType f43336d;

            /* renamed from: e, reason: collision with root package name */
            public static final SessionType f43337e;

            /* renamed from: f, reason: collision with root package name */
            public static final SessionType f43338f;

            /* renamed from: g, reason: collision with root package name */
            public static final /* synthetic */ SessionType[] f43339g;

            /* renamed from: h, reason: collision with root package name */
            public static final /* synthetic */ i70.a f43340h;

            /* renamed from: a, reason: collision with root package name */
            public final String f43341a;

            static {
                SessionType sessionType = new SessionType("Unknown", 0, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                f43335c = sessionType;
                SessionType sessionType2 = new SessionType("LinkAuthToken", 1, "link_auth_token");
                f43336d = sessionType2;
                SessionType sessionType3 = new SessionType("SignUp", 2, "signup");
                f43337e = sessionType3;
                SessionType sessionType4 = new SessionType("Email", 3, ActionCategory.EMAIL);
                SessionType sessionType5 = new SessionType("Sms", 4, ActionCategory.SMS);
                f43338f = sessionType5;
                SessionType[] sessionTypeArr = {sessionType, sessionType2, sessionType3, sessionType4, sessionType5};
                f43339g = sessionTypeArr;
                f43340h = EnumEntriesKt.a(sessionTypeArr);
                f43334b = new n0();
                CREATOR = new o0();
            }

            public SessionType(String str, int i5, String str2) {
                this.f43341a = str2;
            }

            public static SessionType valueOf(String str) {
                return (SessionType) Enum.valueOf(SessionType.class, str);
            }

            public static SessionType[] values() {
                return (SessionType[]) f43339g.clone();
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(name());
            }
        }

        public /* synthetic */ VerificationSession(int i5, SessionType sessionType, SessionState sessionState) {
            if (3 != (i5 & 3)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 3, i0.f44039a.getDescriptor());
            }
            this.f43325a = sessionType;
            this.f43326b = sessionState;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof VerificationSession)) {
                return false;
            }
            VerificationSession verificationSession = (VerificationSession) obj;
            return this.f43325a == verificationSession.f43325a && this.f43326b == verificationSession.f43326b;
        }

        public final int hashCode() {
            return this.f43326b.hashCode() + (this.f43325a.hashCode() * 31);
        }

        public final String toString() {
            return "VerificationSession(type=" + this.f43325a + ", state=" + this.f43326b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f43325a.writeToParcel(dest, i5);
            this.f43326b.writeToParcel(dest, i5);
        }

        public VerificationSession(SessionType type, SessionState state) {
            Intrinsics.g(type, "type");
            Intrinsics.g(state, "state");
            this.f43325a = type;
            this.f43326b = state;
        }
    }

    public ConsumerSession(int i5, String str, String str2, String str3, String str4, String str5, String str6, List list, MobileFallbackWebviewParams mobileFallbackWebviewParams) {
        if (14 != (i5 & 14)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 14, ft.f.f55941a.getDescriptor());
        }
        this.f43316a = (i5 & 1) == 0 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str;
        this.f43317b = str2;
        this.f43318c = str3;
        this.f43319d = str4;
        if ((i5 & 16) == 0) {
            this.f43320e = null;
        } else {
            this.f43320e = str5;
        }
        if ((i5 & 32) == 0) {
            this.f43321f = null;
        } else {
            this.f43321f = str6;
        }
        if ((i5 & 64) == 0) {
            this.f43322g = EmptyList.f71733a;
        } else {
            this.f43322g = list;
        }
        if ((i5 & 128) == 0) {
            this.f43323h = null;
        } else {
            this.f43323h = mobileFallbackWebviewParams;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ConsumerSession)) {
            return false;
        }
        ConsumerSession consumerSession = (ConsumerSession) obj;
        return Intrinsics.b(this.f43316a, consumerSession.f43316a) && Intrinsics.b(this.f43317b, consumerSession.f43317b) && Intrinsics.b(this.f43318c, consumerSession.f43318c) && Intrinsics.b(this.f43319d, consumerSession.f43319d) && Intrinsics.b(this.f43320e, consumerSession.f43320e) && Intrinsics.b(this.f43321f, consumerSession.f43321f) && Intrinsics.b(this.f43322g, consumerSession.f43322g) && Intrinsics.b(this.f43323h, consumerSession.f43323h);
    }

    public final int hashCode() {
        int iE = b.c0.e(b.c0.e(b.c0.e(this.f43316a.hashCode() * 31, 31, this.f43317b), 31, this.f43318c), 31, this.f43319d);
        String str = this.f43320e;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f43321f;
        int iC = b.u4.c((iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.f43322g);
        MobileFallbackWebviewParams mobileFallbackWebviewParams = this.f43323h;
        return iC + (mobileFallbackWebviewParams != null ? mobileFallbackWebviewParams.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("ConsumerSession(clientSecret=", this.f43316a, ", emailAddress=", this.f43317b, ", redactedFormattedPhoneNumber=");
        b.c0.D(sbW, this.f43318c, ", redactedPhoneNumber=", this.f43319d, ", unredactedPhoneNumber=");
        b.c0.D(sbW, this.f43320e, ", phoneNumberCountry=", this.f43321f, ", verificationSessions=");
        sbW.append(this.f43322g);
        sbW.append(", mobileFallbackWebviewParams=");
        sbW.append(this.f43323h);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43316a);
        dest.writeString(this.f43317b);
        dest.writeString(this.f43318c);
        dest.writeString(this.f43319d);
        dest.writeString(this.f43320e);
        dest.writeString(this.f43321f);
        Iterator itK = fq.c.k(this.f43322g, dest);
        while (itK.hasNext()) {
            ((VerificationSession) itK.next()).writeToParcel(dest, i5);
        }
        MobileFallbackWebviewParams mobileFallbackWebviewParams = this.f43323h;
        if (mobileFallbackWebviewParams == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            mobileFallbackWebviewParams.writeToParcel(dest, i5);
        }
    }

    public ConsumerSession(String clientSecret, String emailAddress, String redactedFormattedPhoneNumber, String redactedPhoneNumber, String str, String str2, List verificationSessions, MobileFallbackWebviewParams mobileFallbackWebviewParams) {
        Intrinsics.g(clientSecret, "clientSecret");
        Intrinsics.g(emailAddress, "emailAddress");
        Intrinsics.g(redactedFormattedPhoneNumber, "redactedFormattedPhoneNumber");
        Intrinsics.g(redactedPhoneNumber, "redactedPhoneNumber");
        Intrinsics.g(verificationSessions, "verificationSessions");
        this.f43316a = clientSecret;
        this.f43317b = emailAddress;
        this.f43318c = redactedFormattedPhoneNumber;
        this.f43319d = redactedPhoneNumber;
        this.f43320e = str;
        this.f43321f = str2;
        this.f43322g = verificationSessions;
        this.f43323h = mobileFallbackWebviewParams;
    }
}
