package nova.branch.engage.sesame_lite.internal.ingest;

import android.content.ComponentName;
import android.content.pm.ShortcutInfo;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\t\u0018\u0000 \u000f2\u00020\u0001:\u0001\u000fB)\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tR\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000bR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u000e¨\u0006\u0010"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/ingest/IngestibleAndroidAppShortcut;", b.f42142b, "activityClass", b.f42142b, "shortcutId", "label", "isDynamic", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V", "getActivityClass", "()Ljava/lang/String;", "getShortcutId", "getLabel", "()Z", k.O, "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class IngestibleAndroidAppShortcut {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @Nullable
    private final String activityClass;
    private final boolean isDynamic;

    @NotNull
    private final String label;

    @NotNull
    private final String shortcutId;

    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007¨\u0006\b"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/ingest/IngestibleAndroidAppShortcut$Companion;", b.f42142b, "<init>", "()V", "of", "Lnova/branch/engage/sesame_lite/internal/ingest/IngestibleAndroidAppShortcut;", "info", "Landroid/content/pm/ShortcutInfo;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final IngestibleAndroidAppShortcut of(@NotNull ShortcutInfo info) {
            Intrinsics.g(info, "info");
            ComponentName activity = info.getActivity();
            String className = activity != null ? activity.getClassName() : null;
            String id2 = info.getId();
            Intrinsics.f(id2, "getId(...)");
            CharSequence shortLabel = info.getShortLabel();
            if (shortLabel == null) {
                shortLabel = info.getLongLabel();
                Intrinsics.d(shortLabel);
            }
            return new IngestibleAndroidAppShortcut(className, id2, shortLabel.toString(), info.isDynamic());
        }

        private Companion() {
        }
    }

    public IngestibleAndroidAppShortcut(@Nullable String str, @NotNull String shortcutId, @NotNull String label, boolean z11) {
        Intrinsics.g(shortcutId, "shortcutId");
        Intrinsics.g(label, "label");
        this.activityClass = str;
        this.shortcutId = shortcutId;
        this.label = label;
        this.isDynamic = z11;
    }

    @Nullable
    public final String getActivityClass() {
        return this.activityClass;
    }

    @NotNull
    public final String getLabel() {
        return this.label;
    }

    @NotNull
    public final String getShortcutId() {
        return this.shortcutId;
    }

    /* renamed from: isDynamic, reason: from getter */
    public final boolean getIsDynamic() {
        return this.isDynamic;
    }
}
