package io.ktor.client.plugins;

import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import l50.b;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lio/ktor/client/plugins/RedirectResponseException;", "Lio/ktor/client/plugins/ResponseException;", "ktor-client-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class RedirectResponseException extends ResponseException {

    /* renamed from: a, reason: collision with root package name */
    public final String f66545a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public RedirectResponseException(b response, String cachedResponseText) {
        super(response, cachedResponseText);
        Intrinsics.g(response, "response");
        Intrinsics.g(cachedResponseText, "cachedResponseText");
        this.f66545a = "Unhandled redirect: " + response.b().c().getMethod().f79588a + ' ' + response.b().c().getUrl() + ". Status: " + response.f() + ". Text: \"" + cachedResponseText + AbstractJsonLexerKt.STRING;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return this.f66545a;
    }
}
