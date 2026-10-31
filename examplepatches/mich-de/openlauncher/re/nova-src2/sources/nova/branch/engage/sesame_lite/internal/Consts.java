package nova.branch.engage.sesame_lite.internal;

import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\fX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\bX\u0086T¢\u0006\u0002\n\u0000¨\u0006\u000e"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/Consts;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "DEACTIVATED_SHORTCUT_LIFETIME", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "SHORTCUT_USAGE_LIFETIME", "SHORTCUT_USAGE_MAX_SIZE", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "CONDUIT_MAX_AGE_STALE_HISTORY", "OAUTH_EXPIRY_BUFFER_TIME", "EXTRA_ID_HASH", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "SHORTCUT_QUERY_MATCH_ALL", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class Consts {
    public static final long CONDUIT_MAX_AGE_STALE_HISTORY = 3888000000L;
    public static final long DEACTIVATED_SHORTCUT_LIFETIME = 604800000;

    @NotNull
    public static final String EXTRA_ID_HASH = "__ssml_id_hash";

    @NotNull
    public static final Consts INSTANCE = new Consts();
    public static final long OAUTH_EXPIRY_BUFFER_TIME = 300000;
    public static final int SHORTCUT_QUERY_MATCH_ALL = 11;
    public static final long SHORTCUT_USAGE_LIFETIME = 15552000000L;
    public static final int SHORTCUT_USAGE_MAX_SIZE = 100;

    private Consts() {
    }
}
