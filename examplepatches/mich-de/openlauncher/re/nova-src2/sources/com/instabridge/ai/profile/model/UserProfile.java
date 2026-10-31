package com.instabridge.ai.profile.model;

import aq.o;
import aq.s;
import b.c9;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@s(generateAdapter = true)
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0014\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B?\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0001\u0010\u0004\u001a\u00020\u0005\u0012\n\b\u0001\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0001\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0001\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0012\u001a\u00020\u0005HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0014\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0003HÆ\u0003JA\u0010\u0016\u001a\u00020\u00002\b\b\u0003\u0010\u0002\u001a\u00020\u00032\b\b\u0003\u0010\u0004\u001a\u00020\u00052\n\b\u0003\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00052\b\u0010\u0018\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0019\u001a\u00020\u001aHÖ\u0001J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\fR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\fR\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\f¨\u0006\u001c"}, d2 = {"Lcom/instabridge/ai/profile/model/UserProfile;", b.f42142b, "personId", b.f42142b, "isLoggedIn", b.f42142b, ActionCategory.EMAIL, PendingUpgradeStore.KEY_NAME, "picture", "<init>", "(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getPersonId", "()Ljava/lang/String;", "()Z", "getEmail", "getName", "getPicture", "component1", "component2", "component3", "component4", "component5", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class UserProfile {
    public static final int $stable = 0;

    @Nullable
    private final String email;
    private final boolean isLoggedIn;

    @Nullable
    private final String name;

    @NotNull
    private final String personId;

    @Nullable
    private final String picture;

    public UserProfile(@o(name = "person_id") @NotNull String personId, @o(name = "is_logged_in") boolean z11, @o(name = ActionCategory.EMAIL) @Nullable String str, @o(name = PendingUpgradeStore.KEY_NAME) @Nullable String str2, @o(name = "picture") @Nullable String str3) {
        Intrinsics.g(personId, "personId");
        this.personId = personId;
        this.isLoggedIn = z11;
        this.email = str;
        this.name = str2;
        this.picture = str3;
    }

    public static /* synthetic */ UserProfile copy$default(UserProfile userProfile, String str, boolean z11, String str2, String str3, String str4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = userProfile.personId;
        }
        if ((i5 & 2) != 0) {
            z11 = userProfile.isLoggedIn;
        }
        if ((i5 & 4) != 0) {
            str2 = userProfile.email;
        }
        if ((i5 & 8) != 0) {
            str3 = userProfile.name;
        }
        if ((i5 & 16) != 0) {
            str4 = userProfile.picture;
        }
        String str5 = str4;
        String str6 = str2;
        return userProfile.copy(str, z11, str6, str3, str5);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getPersonId() {
        return this.personId;
    }

    /* renamed from: component2, reason: from getter */
    public final boolean getIsLoggedIn() {
        return this.isLoggedIn;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getEmail() {
        return this.email;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getName() {
        return this.name;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getPicture() {
        return this.picture;
    }

    @NotNull
    public final UserProfile copy(@o(name = "person_id") @NotNull String personId, @o(name = "is_logged_in") boolean isLoggedIn, @o(name = ActionCategory.EMAIL) @Nullable String email, @o(name = PendingUpgradeStore.KEY_NAME) @Nullable String name, @o(name = "picture") @Nullable String picture) {
        Intrinsics.g(personId, "personId");
        return new UserProfile(personId, isLoggedIn, email, name, picture);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UserProfile)) {
            return false;
        }
        UserProfile userProfile = (UserProfile) other;
        return Intrinsics.b(this.personId, userProfile.personId) && this.isLoggedIn == userProfile.isLoggedIn && Intrinsics.b(this.email, userProfile.email) && Intrinsics.b(this.name, userProfile.name) && Intrinsics.b(this.picture, userProfile.picture);
    }

    @Nullable
    public final String getEmail() {
        return this.email;
    }

    @Nullable
    public final String getName() {
        return this.name;
    }

    @NotNull
    public final String getPersonId() {
        return this.personId;
    }

    @Nullable
    public final String getPicture() {
        return this.picture;
    }

    public int hashCode() {
        int iF = c9.f(this.personId.hashCode() * 31, 31, this.isLoggedIn);
        String str = this.email;
        int iHashCode = (iF + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.name;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.picture;
        return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
    }

    public final boolean isLoggedIn() {
        return this.isLoggedIn;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("UserProfile(personId=");
        sb2.append(this.personId);
        sb2.append(", isLoggedIn=");
        sb2.append(this.isLoggedIn);
        sb2.append(", email=");
        sb2.append(this.email);
        sb2.append(", name=");
        sb2.append(this.name);
        sb2.append(", picture=");
        return c1.t(sb2, this.picture, ')');
    }
}
