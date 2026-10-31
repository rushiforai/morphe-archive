package io.branch.engage.sesame_lite.internal.ingest;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0007J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u000f\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0010\u001a\u0004\u0018\u00010\u0003HÆ\u0003J5\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001J\t\u0010\u0017\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\tR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\t¨\u0006\u0018"}, d2 = {"Lio/branch/engage/sesame_lite/internal/ingest/IngestibleAlias;", b.f42142b, "packageName", b.f42142b, "match", "className", "displayOverride", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getClassName", "()Ljava/lang/String;", "getDisplayOverride", "getMatch", "getPackageName", "component1", "component2", "component3", "component4", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class IngestibleAlias {

    @Nullable
    private final String className;

    @Nullable
    private final String displayOverride;

    @NotNull
    private final String match;

    @NotNull
    private final String packageName;

    public IngestibleAlias(@NotNull String packageName, @NotNull String match, @Nullable String str, @Nullable String str2) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(match, "match");
        this.packageName = packageName;
        this.match = match;
        this.className = str;
        this.displayOverride = str2;
    }

    public static /* synthetic */ IngestibleAlias copy$default(IngestibleAlias ingestibleAlias, String str, String str2, String str3, String str4, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = ingestibleAlias.packageName;
        }
        if ((i5 & 2) != 0) {
            str2 = ingestibleAlias.match;
        }
        if ((i5 & 4) != 0) {
            str3 = ingestibleAlias.className;
        }
        if ((i5 & 8) != 0) {
            str4 = ingestibleAlias.displayOverride;
        }
        return ingestibleAlias.copy(str, str2, str3, str4);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getPackageName() {
        return this.packageName;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getMatch() {
        return this.match;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getClassName() {
        return this.className;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getDisplayOverride() {
        return this.displayOverride;
    }

    @NotNull
    public final IngestibleAlias copy(@NotNull String packageName, @NotNull String match, @Nullable String className, @Nullable String displayOverride) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(match, "match");
        return new IngestibleAlias(packageName, match, className, displayOverride);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof IngestibleAlias)) {
            return false;
        }
        IngestibleAlias ingestibleAlias = (IngestibleAlias) other;
        return Intrinsics.b(this.packageName, ingestibleAlias.packageName) && Intrinsics.b(this.match, ingestibleAlias.match) && Intrinsics.b(this.className, ingestibleAlias.className) && Intrinsics.b(this.displayOverride, ingestibleAlias.displayOverride);
    }

    @Nullable
    public final String getClassName() {
        return this.className;
    }

    @Nullable
    public final String getDisplayOverride() {
        return this.displayOverride;
    }

    @NotNull
    public final String getMatch() {
        return this.match;
    }

    @NotNull
    public final String getPackageName() {
        return this.packageName;
    }

    public int hashCode() {
        int iE = c0.e(this.packageName.hashCode() * 31, 31, this.match);
        String str = this.className;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.displayOverride;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("IngestibleAlias(packageName=");
        sb2.append(this.packageName);
        sb2.append(", match=");
        sb2.append(this.match);
        sb2.append(", className=");
        sb2.append(this.className);
        sb2.append(", displayOverride=");
        return c1.t(sb2, this.displayOverride, ')');
    }

    public /* synthetic */ IngestibleAlias(String str, String str2, String str3, String str4, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, (i5 & 4) != 0 ? null : str3, (i5 & 8) != 0 ? null : str4);
    }
}
