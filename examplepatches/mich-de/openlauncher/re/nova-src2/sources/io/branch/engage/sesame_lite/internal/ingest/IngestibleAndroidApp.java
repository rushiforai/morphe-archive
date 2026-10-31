package io.branch.engage.sesame_lite.internal.ingest;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\f\u0018\u00002\u00020\u0001B9\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0010\b\u0002\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u0007\u0012\u0010\b\u0002\u0010\t\u001a\n\u0012\u0004\u0012\u00020\n\u0018\u00010\u0007¢\u0006\u0002\u0010\u000bR\"\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\b\u0018\u00010\u0007X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\f\u0010\r\"\u0004\b\u000e\u0010\u000fR\"\u0010\t\u001a\n\u0012\u0004\u0012\u00020\n\u0018\u00010\u0007X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0010\u0010\r\"\u0004\b\u0011\u0010\u000fR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015¨\u0006\u0016"}, d2 = {"Lio/branch/engage/sesame_lite/internal/ingest/IngestibleAndroidApp;", b.f42142b, "packageName", b.f42142b, "userSerial", b.f42142b, "allActivities", b.f42142b, "Lio/branch/engage/sesame_lite/internal/ingest/IngestibleAndroidAppActivity;", "allShortcuts", "Lio/branch/engage/sesame_lite/internal/ingest/IngestibleAndroidAppShortcut;", "(Ljava/lang/String;JLjava/util/List;Ljava/util/List;)V", "getAllActivities", "()Ljava/util/List;", "setAllActivities", "(Ljava/util/List;)V", "getAllShortcuts", "setAllShortcuts", "getPackageName", "()Ljava/lang/String;", "getUserSerial", "()J", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class IngestibleAndroidApp {

    @Nullable
    private List<IngestibleAndroidAppActivity> allActivities;

    @Nullable
    private List<IngestibleAndroidAppShortcut> allShortcuts;

    @NotNull
    private final String packageName;
    private final long userSerial;

    public IngestibleAndroidApp(@NotNull String packageName, long j11, @Nullable List<IngestibleAndroidAppActivity> list, @Nullable List<IngestibleAndroidAppShortcut> list2) {
        Intrinsics.g(packageName, "packageName");
        this.packageName = packageName;
        this.userSerial = j11;
        this.allActivities = list;
        this.allShortcuts = list2;
    }

    @Nullable
    public final List<IngestibleAndroidAppActivity> getAllActivities() {
        return this.allActivities;
    }

    @Nullable
    public final List<IngestibleAndroidAppShortcut> getAllShortcuts() {
        return this.allShortcuts;
    }

    @NotNull
    public final String getPackageName() {
        return this.packageName;
    }

    public final long getUserSerial() {
        return this.userSerial;
    }

    public final void setAllActivities(@Nullable List<IngestibleAndroidAppActivity> list) {
        this.allActivities = list;
    }

    public final void setAllShortcuts(@Nullable List<IngestibleAndroidAppShortcut> list) {
        this.allShortcuts = list;
    }

    public /* synthetic */ IngestibleAndroidApp(String str, long j11, List list, List list2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, j11, (i5 & 4) != 0 ? null : list, (i5 & 8) != 0 ? null : list2);
    }
}
