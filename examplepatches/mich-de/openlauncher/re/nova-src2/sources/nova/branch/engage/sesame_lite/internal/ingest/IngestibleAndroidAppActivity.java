package nova.branch.engage.sesame_lite.internal.ingest;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\u0004\b\b\u0010\tR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0017\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000e¨\u0006\u000f"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/ingest/IngestibleAndroidAppActivity;", b.f42142b, "className", b.f42142b, "label", "aliases", b.f42142b, "Lnova/branch/engage/sesame_lite/internal/ingest/IngestibleAlias;", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V", "getClassName", "()Ljava/lang/String;", "getLabel", "getAliases", "()Ljava/util/List;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class IngestibleAndroidAppActivity {

    @NotNull
    private final List<IngestibleAlias> aliases;

    @NotNull
    private final String className;

    @NotNull
    private final String label;

    public IngestibleAndroidAppActivity(@NotNull String className, @NotNull String label, @NotNull List<IngestibleAlias> aliases) {
        Intrinsics.g(className, "className");
        Intrinsics.g(label, "label");
        Intrinsics.g(aliases, "aliases");
        this.className = className;
        this.label = label;
        this.aliases = aliases;
    }

    @NotNull
    public final List<IngestibleAlias> getAliases() {
        return this.aliases;
    }

    @NotNull
    public final String getClassName() {
        return this.className;
    }

    @NotNull
    public final String getLabel() {
        return this.label;
    }

    public IngestibleAndroidAppActivity(String str, String str2, List list, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, (i5 & 4) != 0 ? EmptyList.f71733a : list);
    }
}
