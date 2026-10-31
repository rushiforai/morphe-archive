package com.instabridge.mobilesdk;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J1\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\nR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0019"}, d2 = {"Lcom/instabridge/mobilesdk/MobileSdkFonts;", b.f42142b, "regular", b.f42142b, "medium", "semiBold", "bold", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getRegular", "()Ljava/lang/String;", "getMedium", "getSemiBold", "getBold", "component1", "component2", "component3", "component4", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class MobileSdkFonts {
    public static final int $stable = 0;

    @NotNull
    private final String bold;

    @NotNull
    private final String medium;

    @NotNull
    private final String regular;

    @NotNull
    private final String semiBold;

    public MobileSdkFonts(@NotNull String regular, @NotNull String medium, @NotNull String semiBold, @NotNull String bold) {
        Intrinsics.g(regular, "regular");
        Intrinsics.g(medium, "medium");
        Intrinsics.g(semiBold, "semiBold");
        Intrinsics.g(bold, "bold");
        this.regular = regular;
        this.medium = medium;
        this.semiBold = semiBold;
        this.bold = bold;
    }

    public static /* synthetic */ MobileSdkFonts copy$default(MobileSdkFonts mobileSdkFonts, String str, String str2, String str3, String str4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = mobileSdkFonts.regular;
        }
        if ((i5 & 2) != 0) {
            str2 = mobileSdkFonts.medium;
        }
        if ((i5 & 4) != 0) {
            str3 = mobileSdkFonts.semiBold;
        }
        if ((i5 & 8) != 0) {
            str4 = mobileSdkFonts.bold;
        }
        return mobileSdkFonts.copy(str, str2, str3, str4);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getRegular() {
        return this.regular;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getMedium() {
        return this.medium;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getSemiBold() {
        return this.semiBold;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final String getBold() {
        return this.bold;
    }

    @NotNull
    public final MobileSdkFonts copy(@NotNull String regular, @NotNull String medium, @NotNull String semiBold, @NotNull String bold) {
        Intrinsics.g(regular, "regular");
        Intrinsics.g(medium, "medium");
        Intrinsics.g(semiBold, "semiBold");
        Intrinsics.g(bold, "bold");
        return new MobileSdkFonts(regular, medium, semiBold, bold);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof MobileSdkFonts)) {
            return false;
        }
        MobileSdkFonts mobileSdkFonts = (MobileSdkFonts) other;
        return Intrinsics.b(this.regular, mobileSdkFonts.regular) && Intrinsics.b(this.medium, mobileSdkFonts.medium) && Intrinsics.b(this.semiBold, mobileSdkFonts.semiBold) && Intrinsics.b(this.bold, mobileSdkFonts.bold);
    }

    @NotNull
    public final String getBold() {
        return this.bold;
    }

    @NotNull
    public final String getMedium() {
        return this.medium;
    }

    @NotNull
    public final String getRegular() {
        return this.regular;
    }

    @NotNull
    public final String getSemiBold() {
        return this.semiBold;
    }

    public int hashCode() {
        return this.bold.hashCode() + c0.e(c0.e(this.regular.hashCode() * 31, 31, this.medium), 31, this.semiBold);
    }

    @NotNull
    public String toString() {
        String str = this.regular;
        String str2 = this.medium;
        return c0.s(c0.w("MobileSdkFonts(regular=", str, ", medium=", str2, ", semiBold="), this.semiBold, ", bold=", this.bold, ")");
    }

    public /* synthetic */ MobileSdkFonts(String str, String str2, String str3, String str4, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? str : str2, (i5 & 4) != 0 ? str : str3, (i5 & 8) != 0 ? str : str4);
    }
}
