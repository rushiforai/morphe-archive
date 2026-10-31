package com.instabridge.mobilesdk.api;

import a5.i;
import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\b\u0002\bæ\u0080\u0001\u0018\u0000 \b2\u00020\u0001:\u0001\bJ&\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0014\u0010\u0006\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0007H&¨\u0006\t"}, d2 = {"Lcom/instabridge/mobilesdk/api/AnalyticsSink;", b.f42142b, "track", b.f42142b, DatabaseConstants.EVENT_FIELD, b.f42142b, "properties", b.f42142b, k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface AnalyticsSink {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = Companion.$$INSTANCE;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/instabridge/mobilesdk/api/AnalyticsSink$Companion;", b.f42142b, "<init>", "()V", "Noop", "Lcom/instabridge/mobilesdk/api/AnalyticsSink;", "getNoop", "()Lcom/instabridge/mobilesdk/api/AnalyticsSink;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        static final /* synthetic */ Companion $$INSTANCE = new Companion();

        @NotNull
        private static final AnalyticsSink Noop = new i(6);

        private Companion() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final void Noop$lambda$0(String str, Map map) {
            Intrinsics.g(str, "<unused var>");
            Intrinsics.g(map, "<unused var>");
        }

        @NotNull
        public final AnalyticsSink getNoop() {
            return Noop;
        }
    }

    void track(@NotNull String event, @NotNull Map<String, ? extends Object> properties);
}
