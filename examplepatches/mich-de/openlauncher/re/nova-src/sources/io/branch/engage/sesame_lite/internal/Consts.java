package io.branch.engage.sesame_lite.internal;

import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\nX\u0086T¢\u0006\u0002\n\u0000¨\u0006\r"}, d2 = {"Lio/branch/engage/sesame_lite/internal/Consts;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()V", "CONDUIT_MAX_AGE_STALE_HISTORY", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "DEACTIVATED_SHORTCUT_LIFETIME", "EXTRA_ID_HASH", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "OAUTH_EXPIRY_BUFFER_TIME", "SHORTCUT_QUERY_MATCH_ALL", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "SHORTCUT_USAGE_LIFETIME", "SHORTCUT_USAGE_MAX_SIZE", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
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
