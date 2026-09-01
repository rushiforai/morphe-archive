package com.medium.android.susi.data;

import android.os.Parcel;
import android.os.Parcelable;
import defpackage.g76;
import defpackage.gy2;
import defpackage.ka1;
import defpackage.l3d;
import defpackage.lv8;
import defpackage.tw3;
import defpackage.xkf;
import defpackage.y30;
import gen.model.OnboardingStatus;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0016\n\u0002\u0010\u0000\n\u0002\b\u0014\b\u0087\b\u0018\u00002\u00020\u0001B\u0081\u0001\u0012\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\u0006\u0010\r\u001a\u00020\f\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\b\b\u0002\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u0012\u0010\u0013J\r\u0010\u0015\u001a\u00020\u0014¢\u0006\u0004\b\u0015\u0010\u0016J\u001d\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0019\u001a\u00020\u0014¢\u0006\u0004\b\u001b\u0010\u001cJ\u0012\u0010\u001d\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001eJ\u0012\u0010\u001f\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u001f\u0010\u001eJ\u0012\u0010 \u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b \u0010\u001eJ\u0012\u0010!\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b!\u0010\u001eJ\u0012\u0010\"\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\"\u0010\u001eJ\u0012\u0010#\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b#\u0010\u001eJ\u0012\u0010$\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b$\u0010\u001eJ\u0012\u0010%\u001a\u0004\u0018\u00010\nHÆ\u0003¢\u0006\u0004\b%\u0010&J\u0010\u0010'\u001a\u00020\fHÆ\u0003¢\u0006\u0004\b'\u0010(J\u0010\u0010)\u001a\u00020\u000eHÆ\u0003¢\u0006\u0004\b)\u0010*J\u0010\u0010+\u001a\u00020\u0010HÆ\u0003¢\u0006\u0004\b+\u0010,J\u008e\u0001\u0010-\u001a\u00020\u00002\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\b\b\u0002\u0010\r\u001a\u00020\f2\b\b\u0002\u0010\u000f\u001a\u00020\u000e2\b\b\u0002\u0010\u0011\u001a\u00020\u0010HÆ\u0001¢\u0006\u0004\b-\u0010.J\u0010\u0010/\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b/\u0010\u001eJ\u0010\u00100\u001a\u00020\u0014HÖ\u0001¢\u0006\u0004\b0\u0010\u0016J\u001a\u00103\u001a\u00020\u00102\b\u00102\u001a\u0004\u0018\u000101HÖ\u0003¢\u0006\u0004\b3\u00104R\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u00105\u001a\u0004\b6\u0010\u001eR\u0019\u0010\u0004\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u00105\u001a\u0004\b7\u0010\u001eR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u00105\u001a\u0004\b8\u0010\u001eR\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u00105\u001a\u0004\b9\u0010\u001eR\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0007\u00105\u001a\u0004\b:\u0010\u001eR\u0019\u0010\b\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\b\u00105\u001a\u0004\b;\u0010\u001eR\u0019\u0010\t\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\t\u00105\u001a\u0004\b<\u0010\u001eR\u0019\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006¢\u0006\f\n\u0004\b\u000b\u0010=\u001a\u0004\b>\u0010&R\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010?\u001a\u0004\b@\u0010(R\u0017\u0010\u000f\u001a\u00020\u000e8\u0006¢\u0006\f\n\u0004\b\u000f\u0010A\u001a\u0004\bB\u0010*R\u0017\u0010\u0011\u001a\u00020\u00108\u0006¢\u0006\f\n\u0004\b\u0011\u0010C\u001a\u0004\bD\u0010,¨\u0006E"}, d2 = {"Lcom/medium/android/susi/data/CreateAccountData;", "Landroid/os/Parcelable;", "", "accessToken", "accessTokenSecret", "accountName", "username", "name", "defaultEmail", "email", "Ltw3;", "emailAvailability", "Ll3d;", "susiMethod", "Lgen/model/OnboardingStatus;", "onboardingStatus", "", "rememberMe", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ltw3;Ll3d;Lgen/model/OnboardingStatus;Z)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "()Ltw3;", "component9", "()Ll3d;", "component10", "()Lgen/model/OnboardingStatus;", "component11", "()Z", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ltw3;Ll3d;Lgen/model/OnboardingStatus;Z)Lcom/medium/android/susi/data/CreateAccountData;", "toString", "hashCode", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getAccessToken", "getAccessTokenSecret", "getAccountName", "getUsername", "getName", "getDefaultEmail", "getEmail", "Ltw3;", "getEmailAvailability", "Ll3d;", "getSusiMethod", "Lgen/model/OnboardingStatus;", "getOnboardingStatus", "Z", "getRememberMe", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class CreateAccountData implements Parcelable {
    public static final int $stable = 0;
    public static final Parcelable.Creator<CreateAccountData> CREATOR = new xkf(15);
    private final String accessToken;
    private final String accessTokenSecret;
    private final String accountName;
    private final String defaultEmail;
    private final String email;
    private final tw3 emailAvailability;
    private final String name;
    private final OnboardingStatus onboardingStatus;
    private final boolean rememberMe;
    private final l3d susiMethod;
    private final String username;

    public /* synthetic */ CreateAccountData(String str, String str2, String str3, String str4, String str5, String str6, String str7, tw3 tw3Var, l3d l3dVar, OnboardingStatus onboardingStatus, boolean z, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : str4, (i & 16) != 0 ? null : str5, (i & 32) != 0 ? null : str6, (i & 64) != 0 ? null : str7, (i & 128) != 0 ? null : tw3Var, l3dVar, onboardingStatus, (i & 1024) != 0 ? false : z);
    }

    public static /* synthetic */ CreateAccountData copy$default(CreateAccountData createAccountData, String str, String str2, String str3, String str4, String str5, String str6, String str7, tw3 tw3Var, l3d l3dVar, OnboardingStatus onboardingStatus, boolean z, int i, Object obj) {
        if ((i & 1) != 0) {
            str = createAccountData.accessToken;
        }
        if ((i & 2) != 0) {
            str2 = createAccountData.accessTokenSecret;
        }
        if ((i & 4) != 0) {
            str3 = createAccountData.accountName;
        }
        if ((i & 8) != 0) {
            str4 = createAccountData.username;
        }
        if ((i & 16) != 0) {
            str5 = createAccountData.name;
        }
        if ((i & 32) != 0) {
            str6 = createAccountData.defaultEmail;
        }
        if ((i & 64) != 0) {
            str7 = createAccountData.email;
        }
        if ((i & 128) != 0) {
            tw3Var = createAccountData.emailAvailability;
        }
        if ((i & 256) != 0) {
            l3dVar = createAccountData.susiMethod;
        }
        if ((i & 512) != 0) {
            onboardingStatus = createAccountData.onboardingStatus;
        }
        if ((i & 1024) != 0) {
            z = createAccountData.rememberMe;
        }
        OnboardingStatus onboardingStatus2 = onboardingStatus;
        boolean z2 = z;
        tw3 tw3Var2 = tw3Var;
        l3d l3dVar2 = l3dVar;
        String str8 = str6;
        String str9 = str7;
        String str10 = str5;
        String str11 = str3;
        return createAccountData.copy(str, str2, str11, str4, str10, str8, str9, tw3Var2, l3dVar2, onboardingStatus2, z2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getAccessToken() {
        return this.accessToken;
    }

    /* JADX INFO: renamed from: component10, reason: from getter */
    public final OnboardingStatus getOnboardingStatus() {
        return this.onboardingStatus;
    }

    /* JADX INFO: renamed from: component11, reason: from getter */
    public final boolean getRememberMe() {
        return this.rememberMe;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getAccessTokenSecret() {
        return this.accessTokenSecret;
    }

    /* JADX INFO: renamed from: component3, reason: from getter */
    public final String getAccountName() {
        return this.accountName;
    }

    /* JADX INFO: renamed from: component4, reason: from getter */
    public final String getUsername() {
        return this.username;
    }

    /* JADX INFO: renamed from: component5, reason: from getter */
    public final String getName() {
        return this.name;
    }

    /* JADX INFO: renamed from: component6, reason: from getter */
    public final String getDefaultEmail() {
        return this.defaultEmail;
    }

    /* JADX INFO: renamed from: component7, reason: from getter */
    public final String getEmail() {
        return this.email;
    }

    /* JADX INFO: renamed from: component8, reason: from getter */
    public final tw3 getEmailAvailability() {
        return this.emailAvailability;
    }

    /* JADX INFO: renamed from: component9, reason: from getter */
    public final l3d getSusiMethod() {
        return this.susiMethod;
    }

    public final CreateAccountData copy(String accessToken, String accessTokenSecret, String accountName, String username, String name, String defaultEmail, String email, tw3 emailAvailability, l3d susiMethod, OnboardingStatus onboardingStatus, boolean rememberMe) {
        susiMethod.getClass();
        onboardingStatus.getClass();
        return new CreateAccountData(accessToken, accessTokenSecret, accountName, username, name, defaultEmail, email, emailAvailability, susiMethod, onboardingStatus, rememberMe);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof CreateAccountData)) {
            return false;
        }
        CreateAccountData createAccountData = (CreateAccountData) other;
        return g76.L(this.accessToken, createAccountData.accessToken) && g76.L(this.accessTokenSecret, createAccountData.accessTokenSecret) && g76.L(this.accountName, createAccountData.accountName) && g76.L(this.username, createAccountData.username) && g76.L(this.name, createAccountData.name) && g76.L(this.defaultEmail, createAccountData.defaultEmail) && g76.L(this.email, createAccountData.email) && this.emailAvailability == createAccountData.emailAvailability && this.susiMethod == createAccountData.susiMethod && this.onboardingStatus == createAccountData.onboardingStatus && this.rememberMe == createAccountData.rememberMe;
    }

    public final String getAccessToken() {
        return this.accessToken;
    }

    public final String getAccessTokenSecret() {
        return this.accessTokenSecret;
    }

    public final String getAccountName() {
        return this.accountName;
    }

    public final String getDefaultEmail() {
        return this.defaultEmail;
    }

    public final String getEmail() {
        return this.email;
    }

    public final tw3 getEmailAvailability() {
        return this.emailAvailability;
    }

    public final String getName() {
        return this.name;
    }

    public final OnboardingStatus getOnboardingStatus() {
        return this.onboardingStatus;
    }

    public final boolean getRememberMe() {
        return this.rememberMe;
    }

    public final l3d getSusiMethod() {
        return this.susiMethod;
    }

    public final String getUsername() {
        return this.username;
    }

    public int hashCode() {
        String str = this.accessToken;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.accessTokenSecret;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.accountName;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.username;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.name;
        int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.defaultEmail;
        int iHashCode6 = (iHashCode5 + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.email;
        int iHashCode7 = (iHashCode6 + (str7 == null ? 0 : str7.hashCode())) * 31;
        tw3 tw3Var = this.emailAvailability;
        return ((this.onboardingStatus.hashCode() + ((this.susiMethod.hashCode() + ((iHashCode7 + (tw3Var != null ? tw3Var.hashCode() : 0)) * 31)) * 31)) * 31) + (this.rememberMe ? 1231 : 1237);
    }

    public String toString() {
        String str = this.accessToken;
        String str2 = this.accessTokenSecret;
        String str3 = this.accountName;
        String str4 = this.username;
        String str5 = this.name;
        String str6 = this.defaultEmail;
        String str7 = this.email;
        tw3 tw3Var = this.emailAvailability;
        l3d l3dVar = this.susiMethod;
        OnboardingStatus onboardingStatus = this.onboardingStatus;
        boolean z = this.rememberMe;
        StringBuilder sbU = y30.u("CreateAccountData(accessToken=", str, ", accessTokenSecret=", str2, ", accountName=");
        ka1.C(sbU, str3, ", username=", str4, ", name=");
        ka1.C(sbU, str5, ", defaultEmail=", str6, ", email=");
        sbU.append(str7);
        sbU.append(", emailAvailability=");
        sbU.append(tw3Var);
        sbU.append(", susiMethod=");
        sbU.append(l3dVar);
        sbU.append(", onboardingStatus=");
        sbU.append(onboardingStatus);
        sbU.append(", rememberMe=");
        return lv8.t(sbU, z, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        dest.getClass();
        dest.writeString(this.accessToken);
        dest.writeString(this.accessTokenSecret);
        dest.writeString(this.accountName);
        dest.writeString(this.username);
        dest.writeString(this.name);
        dest.writeString(this.defaultEmail);
        dest.writeString(this.email);
        tw3 tw3Var = this.emailAvailability;
        if (tw3Var == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(tw3Var.name());
        }
        dest.writeString(this.susiMethod.name());
        dest.writeString(this.onboardingStatus.name());
        dest.writeInt(this.rememberMe ? 1 : 0);
    }

    public CreateAccountData(String str, String str2, String str3, String str4, String str5, String str6, String str7, tw3 tw3Var, l3d l3dVar, OnboardingStatus onboardingStatus, boolean z) {
        l3dVar.getClass();
        onboardingStatus.getClass();
        this.accessToken = str;
        this.accessTokenSecret = str2;
        this.accountName = str3;
        this.username = str4;
        this.name = str5;
        this.defaultEmail = str6;
        this.email = str7;
        this.emailAvailability = tw3Var;
        this.susiMethod = l3dVar;
        this.onboardingStatus = onboardingStatus;
        this.rememberMe = z;
    }
}
