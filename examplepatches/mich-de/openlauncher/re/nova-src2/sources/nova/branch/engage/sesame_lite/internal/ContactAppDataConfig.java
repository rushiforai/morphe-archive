package nova.branch.engage.sesame_lite.internal;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J1\u0010\u0012\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0013\u001a\u00020\u00142\b\u0010\u0015\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001J\t\u0010\u0018\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\nR\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\n¨\u0006\u0019"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/ContactAppDataConfig;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "packageName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "iconPrefName", "labelPrefName", "mimeType", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getPackageName", "()Ljava/lang/String;", "getIconPrefName", "getLabelPrefName", "getMimeType", "component1", "component2", "component3", "component4", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final /* data */ class ContactAppDataConfig {

    @NotNull
    private final String iconPrefName;

    @NotNull
    private final String labelPrefName;

    @NotNull
    private final String mimeType;

    @NotNull
    private final String packageName;

    public ContactAppDataConfig(@NotNull String packageName, @NotNull String iconPrefName, @NotNull String labelPrefName, @NotNull String mimeType) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(iconPrefName, "iconPrefName");
        Intrinsics.g(labelPrefName, "labelPrefName");
        Intrinsics.g(mimeType, "mimeType");
        this.packageName = packageName;
        this.iconPrefName = iconPrefName;
        this.labelPrefName = labelPrefName;
        this.mimeType = mimeType;
    }

    public static /* synthetic */ ContactAppDataConfig copy$default(ContactAppDataConfig contactAppDataConfig, String str, String str2, String str3, String str4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = contactAppDataConfig.packageName;
        }
        if ((i5 & 2) != 0) {
            str2 = contactAppDataConfig.iconPrefName;
        }
        if ((i5 & 4) != 0) {
            str3 = contactAppDataConfig.labelPrefName;
        }
        if ((i5 & 8) != 0) {
            str4 = contactAppDataConfig.mimeType;
        }
        return contactAppDataConfig.copy(str, str2, str3, str4);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getPackageName() {
        return this.packageName;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getIconPrefName() {
        return this.iconPrefName;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final String getLabelPrefName() {
        return this.labelPrefName;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final String getMimeType() {
        return this.mimeType;
    }

    @NotNull
    public final ContactAppDataConfig copy(@NotNull String packageName, @NotNull String iconPrefName, @NotNull String labelPrefName, @NotNull String mimeType) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(iconPrefName, "iconPrefName");
        Intrinsics.g(labelPrefName, "labelPrefName");
        Intrinsics.g(mimeType, "mimeType");
        return new ContactAppDataConfig(packageName, iconPrefName, labelPrefName, mimeType);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ContactAppDataConfig)) {
            return false;
        }
        ContactAppDataConfig contactAppDataConfig = (ContactAppDataConfig) other;
        return Intrinsics.b(this.packageName, contactAppDataConfig.packageName) && Intrinsics.b(this.iconPrefName, contactAppDataConfig.iconPrefName) && Intrinsics.b(this.labelPrefName, contactAppDataConfig.labelPrefName) && Intrinsics.b(this.mimeType, contactAppDataConfig.mimeType);
    }

    @NotNull
    public final String getIconPrefName() {
        return this.iconPrefName;
    }

    @NotNull
    public final String getLabelPrefName() {
        return this.labelPrefName;
    }

    @NotNull
    public final String getMimeType() {
        return this.mimeType;
    }

    @NotNull
    public final String getPackageName() {
        return this.packageName;
    }

    public int hashCode() {
        return this.mimeType.hashCode() + io.branch.engage.sesame_lite.internal.a.a(this.labelPrefName, io.branch.engage.sesame_lite.internal.a.a(this.iconPrefName, this.packageName.hashCode() * 31, 31), 31);
    }

    @NotNull
    public String toString() {
        String str = this.packageName;
        String str2 = this.iconPrefName;
        return c0.s(c0.w("ContactAppDataConfig(packageName=", str, ", iconPrefName=", str2, ", labelPrefName="), this.labelPrefName, ", mimeType=", this.mimeType, ")");
    }
}
