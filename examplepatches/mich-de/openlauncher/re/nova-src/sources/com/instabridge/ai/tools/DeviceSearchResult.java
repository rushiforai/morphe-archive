package com.instabridge.ai.tools;

import android.content.Intent;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.tiktok.util.TTConst;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B;\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0007HÆ\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0003HÆ\u0003JA\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0018\u001a\u00020\u00192\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001b\u001a\u00020\u001cHÖ\u0001J\t\u0010\u001d\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0013\u0010\b\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\f¨\u0006\u001e"}, d2 = {"Lcom/instabridge/ai/tools/DeviceSearchResult;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "title", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "subtitle", TTConst.TRACK_TYPE, "launchIntent", "Landroid/content/Intent;", "packageName", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;)V", "getTitle", "()Ljava/lang/String;", "getSubtitle", "getType", "getLaunchIntent", "()Landroid/content/Intent;", "getPackageName", "component1", "component2", "component3", "component4", "component5", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class DeviceSearchResult {
    public static final int $stable = 8;

    @Nullable
    private final Intent launchIntent;

    @Nullable
    private final String packageName;

    @Nullable
    private final String subtitle;

    @NotNull
    private final String title;

    @NotNull
    private final String type;

    public DeviceSearchResult(@NotNull String title, @Nullable String str, @NotNull String type, @Nullable Intent intent, @Nullable String str2) {
        Intrinsics.g(title, "title");
        Intrinsics.g(type, "type");
        this.title = title;
        this.subtitle = str;
        this.type = type;
        this.launchIntent = intent;
        this.packageName = str2;
    }

    public static /* synthetic */ DeviceSearchResult copy$default(DeviceSearchResult deviceSearchResult, String str, String str2, String str3, Intent intent, String str4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = deviceSearchResult.title;
        }
        if ((i5 & 2) != 0) {
            str2 = deviceSearchResult.subtitle;
        }
        if ((i5 & 4) != 0) {
            str3 = deviceSearchResult.type;
        }
        if ((i5 & 8) != 0) {
            intent = deviceSearchResult.launchIntent;
        }
        if ((i5 & 16) != 0) {
            str4 = deviceSearchResult.packageName;
        }
        String str5 = str4;
        String str6 = str3;
        return deviceSearchResult.copy(str, str2, str6, intent, str5);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getTitle() {
        return this.title;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getSubtitle() {
        return this.subtitle;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getType() {
        return this.type;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final Intent getLaunchIntent() {
        return this.launchIntent;
    }

    @Nullable
    /* renamed from: component5, reason: from getter */
    public final String getPackageName() {
        return this.packageName;
    }

    @NotNull
    public final DeviceSearchResult copy(@NotNull String title, @Nullable String subtitle, @NotNull String type, @Nullable Intent launchIntent, @Nullable String packageName) {
        Intrinsics.g(title, "title");
        Intrinsics.g(type, "type");
        return new DeviceSearchResult(title, subtitle, type, launchIntent, packageName);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof DeviceSearchResult)) {
            return false;
        }
        DeviceSearchResult deviceSearchResult = (DeviceSearchResult) other;
        return Intrinsics.b(this.title, deviceSearchResult.title) && Intrinsics.b(this.subtitle, deviceSearchResult.subtitle) && Intrinsics.b(this.type, deviceSearchResult.type) && Intrinsics.b(this.launchIntent, deviceSearchResult.launchIntent) && Intrinsics.b(this.packageName, deviceSearchResult.packageName);
    }

    @Nullable
    public final Intent getLaunchIntent() {
        return this.launchIntent;
    }

    @Nullable
    public final String getPackageName() {
        return this.packageName;
    }

    @Nullable
    public final String getSubtitle() {
        return this.subtitle;
    }

    @NotNull
    public final String getTitle() {
        return this.title;
    }

    @NotNull
    public final String getType() {
        return this.type;
    }

    public int hashCode() {
        int iHashCode = this.title.hashCode() * 31;
        String str = this.subtitle;
        int iE = c0.e((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.type);
        Intent intent = this.launchIntent;
        int iHashCode2 = (iE + (intent == null ? 0 : intent.hashCode())) * 31;
        String str2 = this.packageName;
        return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("DeviceSearchResult(title=");
        sb2.append(this.title);
        sb2.append(", subtitle=");
        sb2.append(this.subtitle);
        sb2.append(", type=");
        sb2.append(this.type);
        sb2.append(", launchIntent=");
        sb2.append(this.launchIntent);
        sb2.append(", packageName=");
        return c1.t(sb2, this.packageName, ')');
    }

    public /* synthetic */ DeviceSearchResult(String str, String str2, String str3, Intent intent, String str4, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? null : str2, str3, (i5 & 8) != 0 ? null : intent, (i5 & 16) != 0 ? null : str4);
    }
}
