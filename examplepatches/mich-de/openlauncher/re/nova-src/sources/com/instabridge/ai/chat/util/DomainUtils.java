package com.instabridge.ai.chat.util;

import android.net.Uri;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import r70.j;
import r70.k;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/ai/chat/util/DomainUtils;", b.f42142b, "<init>", "()V", "extractDomain", b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class DomainUtils {
    public static final int $stable = 0;

    @NotNull
    public static final DomainUtils INSTANCE = new DomainUtils();

    private DomainUtils() {
    }

    @NotNull
    public final String extractDomain(@NotNull String url) {
        Intrinsics.g(url, "url");
        try {
            String host = Uri.parse(url).getHost();
            if (host == null) {
                host = url;
            }
            return j.I0(host, "www.", false) ? k.a1(host, "www.") : host;
        } catch (Exception unused) {
            return url;
        }
    }
}
