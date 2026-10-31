package io.branch.search.internal.client.ads;

import android.content.ComponentName;
import android.os.UserHandle;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002B\u001f\u0012\u0006\u0010\f\u001a\u00020\u0003\u0012\u0006\u0010\r\u001a\u00020\u0006\u0012\u0006\u0010\u000e\u001a\u00020\t¢\u0006\u0004\b#\u0010$J\u0010\u0010\u0004\u001a\u00020\u0003HÆ\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0007\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u0007\u0010\bJ\u0010\u0010\n\u001a\u00020\tHÆ\u0003¢\u0006\u0004\b\n\u0010\u000bJ.\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\f\u001a\u00020\u00032\b\b\u0002\u0010\r\u001a\u00020\u00062\b\b\u0002\u0010\u000e\u001a\u00020\tHÆ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u0011\u0010\u0005J\u0010\u0010\u0013\u001a\u00020\u0012HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u0017\u0010\f\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u001a\u0010\u001b\u001a\u0004\b\u001c\u0010\u0005R\u0017\u0010\r\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u001d\u0010\u001e\u001a\u0004\b\u001f\u0010\bR\u0017\u0010\u000e\u001a\u00020\t8\u0006¢\u0006\f\n\u0004\b \u0010!\u001a\u0004\b\"\u0010\u000b¨\u0006%"}, d2 = {"Lio/branch/search/internal/client/ads/LauncherActivity;", "Lio/branch/search/internal/client/ads/Impressable;", "Lio/branch/search/internal/client/ads/Clickable;", b.f42142b, "component1", "()Ljava/lang/String;", "Landroid/content/ComponentName;", "component2", "()Landroid/content/ComponentName;", "Landroid/os/UserHandle;", "component3", "()Landroid/os/UserHandle;", PendingUpgradeStore.KEY_NAME, "componentName", "userHandle", "copy", "(Ljava/lang/String;Landroid/content/ComponentName;Landroid/os/UserHandle;)Lio/branch/search/internal/client/ads/LauncherActivity;", "toString", b.f42142b, "hashCode", "()I", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "equals", "(Ljava/lang/Object;)Z", "a", "Ljava/lang/String;", "getName", "b", "Landroid/content/ComponentName;", "getComponentName", "c", "Landroid/os/UserHandle;", "getUserHandle", "<init>", "(Ljava/lang/String;Landroid/content/ComponentName;Landroid/os/UserHandle;)V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final /* data */ class LauncherActivity implements Impressable, Clickable {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final String name;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final ComponentName componentName;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final UserHandle userHandle;

    public LauncherActivity(@NotNull String name, @NotNull ComponentName componentName, @NotNull UserHandle userHandle) {
        Intrinsics.g(name, "name");
        Intrinsics.g(componentName, "componentName");
        Intrinsics.g(userHandle, "userHandle");
        this.name = name;
        this.componentName = componentName;
        this.userHandle = userHandle;
    }

    public static /* synthetic */ LauncherActivity copy$default(LauncherActivity launcherActivity, String str, ComponentName componentName, UserHandle userHandle, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = launcherActivity.name;
        }
        if ((i5 & 2) != 0) {
            componentName = launcherActivity.componentName;
        }
        if ((i5 & 4) != 0) {
            userHandle = launcherActivity.userHandle;
        }
        return launcherActivity.copy(str, componentName, userHandle);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getName() {
        return this.name;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final ComponentName getComponentName() {
        return this.componentName;
    }

    @NotNull
    /* renamed from: component3, reason: from getter */
    public final UserHandle getUserHandle() {
        return this.userHandle;
    }

    @NotNull
    public final LauncherActivity copy(@NotNull String name, @NotNull ComponentName componentName, @NotNull UserHandle userHandle) {
        Intrinsics.g(name, "name");
        Intrinsics.g(componentName, "componentName");
        Intrinsics.g(userHandle, "userHandle");
        return new LauncherActivity(name, componentName, userHandle);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof LauncherActivity)) {
            return false;
        }
        LauncherActivity launcherActivity = (LauncherActivity) other;
        return Intrinsics.b(this.name, launcherActivity.name) && Intrinsics.b(this.componentName, launcherActivity.componentName) && Intrinsics.b(this.userHandle, launcherActivity.userHandle);
    }

    @NotNull
    public final ComponentName getComponentName() {
        return this.componentName;
    }

    @NotNull
    public final String getName() {
        return this.name;
    }

    @NotNull
    public final UserHandle getUserHandle() {
        return this.userHandle;
    }

    public int hashCode() {
        return this.userHandle.hashCode() + ((this.componentName.hashCode() + (this.name.hashCode() * 31)) * 31);
    }

    @NotNull
    public String toString() {
        return "LauncherActivity(name=" + this.name + ", componentName=" + this.componentName + ", userHandle=" + this.userHandle + ')';
    }
}
