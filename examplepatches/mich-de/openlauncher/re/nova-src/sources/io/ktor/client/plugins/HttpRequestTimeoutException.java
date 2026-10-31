package io.ktor.client.plugins;

import java.io.IOException;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import t70.y;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00060\u0001j\u0002`\u00022\b\u0012\u0004\u0012\u00020\u00000\u0003¨\u0006\u0004"}, d2 = {"Lio/ktor/client/plugins/HttpRequestTimeoutException;", "Ljava/io/IOException;", "Lkotlinx/io/IOException;", "Lt70/y;", "ktor-client-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class HttpRequestTimeoutException extends IOException implements y {

    /* renamed from: a, reason: collision with root package name */
    public final String f66543a;

    /* renamed from: b, reason: collision with root package name */
    public final Long f66544b;

    public HttpRequestTimeoutException(String url, Long l9, Throwable th2) {
        Intrinsics.g(url, "url");
        StringBuilder sb2 = new StringBuilder("Request timeout has expired [url=");
        sb2.append(url);
        sb2.append(", request_timeout=");
        sb2.append(l9 == null ? "unknown" : l9);
        sb2.append(" ms]");
        super(sb2.toString(), th2);
        this.f66543a = url;
        this.f66544b = l9;
    }

    @Override // t70.y
    public final Throwable a() {
        return new HttpRequestTimeoutException(this.f66543a, this.f66544b, getCause());
    }
}
